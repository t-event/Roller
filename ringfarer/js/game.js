// Spillets kjerne: løkke, kamera, skade, gruvedrift, porter, dokking og lagring.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;
  const Input = RF.Input;
  const Audio = RF.Audio;

  RF.KAWOOSH_TIME = 1.3;
  RF.KAWOOSH_LEN = 36;
  const STEP = 1 / 120;
  const SAVE_KEY = 'ringfarer.lagring.v1';
  const DIAL_RANGE = 450;
  const DOCK_RANGE = 22;
  const DOCK_SPEED = 3.5;
  const TOW_COST = 400;

  const game = {
    state: 'title',
    time: 0,
    credits: 600,
    missions: [],
    boards: {},
    priceMod: {},
    systems: {},
    sys: null,
    ship: null,
    cam: { x: 0, y: 0, zoom: 3 },
    shake: 0,
    particles: new RF.Particles(),
    messages: [],
    prompt: '',
    action: null,
    dockReady: false,
    dead: false,
    deadT: 0,
    lastStation: 'midgard',
    touchUI: false,
    paused: false,
    flash: 0,
  };
  RF.game = game;

  game.msg = (text, color) => {
    game.messages.push({ text, color, t: 3.5 });
    if (game.messages.length > 4) game.messages.shift();
  };

  // --- Systemer ---
  game.getSystem = (id) => {
    if (!game.systems[id]) {
      const st = RF.createSystemState(RF.systemById(id));
      st.world.onImpact = onImpact;
      st.world.shouldCollide = (A, B) => !(A.kind === 'gate' && B.kind === 'gate');
      game.systems[id] = st;
    }
    return game.systems[id];
  };

  function enterSystem(id) {
    game.sys = game.getSystem(id);
    const ws = game.sys.world;
    if (!ws.bodies.includes(game.ship.body)) ws.add(game.ship.body);
    game.ship.body.dead = false;
  }

  function removeShipFromWorld() {
    const ws = game.sys.world;
    ws.bodies = ws.bodies.filter((b) => b !== game.ship.body);
  }

  // --- Priser ---
  game.sellPrice = (stationId, prod) => {
    const def = RF.stationById(stationId);
    const mod = (game.priceMod[stationId] && game.priceMod[stationId][prod]) || 1;
    return Math.round(RF.PRODUCTS[prod].price * def.station.prices[prod] * mod);
  };
  game.buyPrice = (stationId, prod) => Math.round(game.sellPrice(stationId, prod) * 1.2);

  function refreshPrices(stationId) {
    const m = {};
    for (const k in RF.PRODUCTS) m[k] = G.rand(0.92, 1.08);
    game.priceMod[stationId] = m;
  }

  function refreshBoard(stationId) {
    const b = (game.boards[stationId] = (game.boards[stationId] || []).filter((m) => m.status === 'tilbud'));
    while (b.length < 4) b.push(RF.genMission(stationId));
  }

  // --- Ny karriere / lagring ---
  game.newCareer = () => {
    game.credits = 600;
    game.missions = [];
    game.boards = {};
    game.systems = {};
    game.priceMod = {};
    game.lastStation = 'midgard';
    game.ship = new RF.Ship(RF.newShipState());
    spawnDocked('midgard');
    game.msg('Velkommen om bord i Hoppeskip MK-I', RF.HUD_COLORS.gate);
    game.save();
  };

  game.save = () => {
    const s = game.ship.s;
    const data = {
      v: 1, credits: game.credits, ship: s, missions: game.missions.filter((m) => m.status === 'aktiv'),
      lastStation: game.lastStation, fa: game.ship.fa,
    };
    try { localStorage.setItem(SAVE_KEY, JSON.stringify(data)); } catch (_) { /* lagring utilgjengelig */ }
  };

  game.hasSave = () => {
    try { return !!localStorage.getItem(SAVE_KEY); } catch (_) { return false; }
  };

  game.load = () => {
    let data = null;
    try { data = JSON.parse(localStorage.getItem(SAVE_KEY)); } catch (_) { data = null; }
    if (!data) return game.newCareer();
    const base = RF.newShipState();
    const s = Object.assign(base, data.ship);
    s.up = Object.assign(RF.newShipState().up, data.ship.up);
    s.sys = Object.assign(RF.newShipState().sys, data.ship.sys);
    s.cargo = Object.assign(RF.newShipState().cargo, data.ship.cargo);
    game.credits = data.credits;
    game.missions = data.missions || [];
    RF.setMissionIdBase(game.missions.reduce((a, m) => Math.max(a, m.id), 0));
    game.lastStation = data.lastStation || 'midgard';
    game.boards = {};
    game.systems = {};
    game.priceMod = {};
    game.ship = new RF.Ship(s);
    game.ship.fa = data.fa != null ? data.fa : 1;
    spawnDocked(game.lastStation);
    game.msg('Karrieren er lastet inn', RF.HUD_COLORS.gate);
  };

  function spawnDocked(stationId) {
    const def = RF.stationById(stationId);
    game.sys = game.getSystem(def.id);
    const st = game.sys.station;
    const dp = RF.dockPoint(st);
    const b = game.ship.body;
    b.x = dp.x; b.y = dp.y; b.a = dp.a; b.vx = b.vy = b.w = 0;
    game.cam.x = b.x; game.cam.y = b.y;
    game.dead = false;
    dock(true);
  }

  // --- Dokking ---
  function dock(silent) {
    const ship = game.ship, st = game.sys.station;
    removeShipFromWorld();
    ship.docked = st;
    ship.tractor.on = false;
    const dp = RF.dockPoint(st);
    Object.assign(ship.body, { x: dp.x, y: dp.y, a: dp.a, vx: 0, vy: 0, w: 0 });
    game.lastStation = st.id;
    refreshPrices(st.id);
    refreshBoard(st.id);
    // Fraktoppdrag leveres automatisk.
    for (const m of game.missions) {
      if (m.status === 'aktiv' && m.type === 'frakt' && m.to === st.id) {
        m.status = 'fullført';
        ship.s.missionCargo = ship.s.missionCargo.filter((c) => c.missionId !== m.id);
        game.credits += m.reward;
        game.msg(`Levert: ${m.goods} (+${m.reward} kr)`, RF.HUD_COLORS.ok);
        Audio.blip(660, 0.15, 'triangle', 0.12);
        Audio.blip(880, 0.2, 'triangle', 0.1);
      }
    }
    game.missions = game.missions.filter((m) => m.status === 'aktiv');
    ship.updateMass();
    game.save();
    if (!silent) Audio.thud(0.3);
    RF.UI.openStation();
  }

  game.undock = () => {
    const ship = game.ship, st = ship.docked;
    if (!st) return;
    ship.docked = null;
    const dp = RF.dockPoint(st);
    const out = { x: Math.cos(st.a), y: Math.sin(st.a) };
    const b = ship.body;
    b.x = dp.x + out.x * 8; b.y = dp.y + out.y * 8;
    b.vx = out.x * 2; b.vy = out.y * 2; b.w = 0;
    enterSystem(game.sys.def.id);
    RF.UI.closeAll();
    game.save();
  };

  // --- Skade og støt ---
  function onImpact(c, J, vn0) {
    const ship = game.ship, sb = ship && ship.body;
    const p = c.points[0];
    if (sb && (c.A === sb || c.B === sb)) {
      const other = c.A === sb ? c.B : c.A;
      const dv = J * sb.invMass;
      if (dv < 0.5) return;
      const dmg = ship.takeImpact(dv, p.x, p.y, game);
      // Skjør last tåler bare små støt.
      for (const m of game.missions) {
        if (m.status === 'aktiv' && m.type === 'frakt' && m.fragile && dv > m.maxDv) {
          m.status = 'feilet';
          ship.s.missionCargo = ship.s.missionCargo.filter((x) => x.missionId !== m.id);
          ship.updateMass();
          game.msg(`${m.goods} ble ødelagt i støtet (${dv.toFixed(1)} m/s)`, RF.HUD_COLORS.danger);
        }
      }
      game.missions = game.missions.filter((m) => m.status !== 'feilet');
      if (dv > 1.2) {
        const n = Math.min(40, Math.floor(dv * 3));
        game.particles.burst(p.x, p.y, n, { sMin: 3, sMax: 8 + dv * 2, color: '#ffd28a', zMin: 0.15, zMax: 0.4 });
        game.particles.burst(p.x, p.y, Math.floor(n / 3), { type: 'smoke', sMin: 0.5, sMax: 3, color: '#7d8490', zMin: 0.8, zMax: 1.6, grow: 2, lMin: 0.6, lMax: 1.4 });
        Audio.thud(Math.min(1, dv / 10));
        game.shake = Math.min(1, game.shake + dv / 10);
      }
      if (dmg > 0.5) game.msg(`Skrogskade −${Math.ceil(dmg)} (${dv.toFixed(1)} m/s)`, RF.HUD_COLORS.danger);
      else if (dv > 2 && ship.shield > 0) game.msg(`Skjoldet tok støtet (${dv.toFixed(1)} m/s)`, RF.HUD_COLORS.gate);
      if (other.kind === 'ore' && dv < 1) return;
      return;
    }
    // Stein mot stein: støv hvis det er nær nok til å se.
    const rel = -vn0;
    if (rel > 1.5 && sb && G.len(p.x - sb.x, p.y - sb.y) < 500) {
      const M = RF.MATERIALS[c.A.mat || c.B.mat || 'kondritt'];
      game.particles.burst(p.x, p.y, Math.min(20, Math.floor(rel * 2)),
        { type: 'smoke', sMin: 0.5, sMax: rel, color: M ? M.light : '#888', zMin: 0.5, zMax: 1.5, grow: 1.5, lMin: 0.6, lMax: 1.5 });
      const d = G.len(p.x - sb.x, p.y - sb.y);
      Audio.thud(Math.min(0.6, rel / 12) * Math.max(0, 1 - d / 500));
    }
  }

  // --- Gruvedrift ---
  function copyMarks(from, to) {
    const map = (c) => to.toLocal(from.toWorld(c.x, c.y).x, from.toWorld(c.x, c.y).y);
    to.craters = from.craters.map((c) => Object.assign(map(c), { r: c.r })).filter((c) => G.len(c.x, c.y) < to.radius + c.r);
    to.veins = from.veins.map((v) => v.map(map));
  }

  function spawnPieces(parentPose, pieces, mat, kickDir, parent) {
    const out = [];
    for (const pv of pieces) {
      if (pv.length < 3) continue;
      const area = G.polyArea(pv);
      const cx = G.polyCentroid(pv);
      const w = parentPose.toWorld(cx.x, cx.y);
      if (area < RF.DUST_AREA) {
        game.particles.burst(w.x, w.y, 4, { type: 'debris', sMin: 1, sMax: 5, color: RF.MATERIALS[mat].light, zMin: 0.2, zMax: 0.5, lMin: 0.6, lMax: 1.4, vx: parentPose.vx, vy: parentPose.vy });
        continue;
      }
      const b = RF.makeRock(G.simplify(pv, 0.05), mat, { x: parentPose.x, y: parentPose.y, a: parentPose.a, vx: parentPose.vx, vy: parentPose.vy, w: parentPose.w });
      if (parent && b.kind === 'rock') copyMarks(parent, b);
      if (kickDir) {
        const k = G.rand(1, 3.2);
        const sx = kickDir.x * k + G.rand(-1.2, 1.2), sy = kickDir.y * k + G.rand(-1.2, 1.2);
        b.vx += sx; b.vy += sy;
        b.w += G.rand(-1.2, 1.2) / (1 + b.radius);
      }
      game.sys.world.add(b);
      out.push(b);
    }
    return out;
  }

  function poseOf(b) {
    const p = { x: b.x, y: b.y, a: b.a, vx: b.vx, vy: b.vy, w: b.w };
    p.toWorld = RF.Body.prototype.toWorld;
    return p;
  }

  // Skjærer av en tynn skive der laseren treffer og deler den i malmbiter.
  game.chipRock = (t, hit, d) => {
    const cs = Math.cos(-t.a), sn = Math.sin(-t.a);
    const dl = { x: d.x * cs - d.y * sn, y: d.x * sn + d.y * cs };
    const hl = t.toLocal(hit.x, hit.y);
    const depth = 0.75;
    const cut = dl.x * hl.x + dl.y * hl.y + depth;
    const slice = G.clipPoly(t.verts, dl.x, dl.y, cut);
    const rest = G.clipPoly(t.verts, -dl.x, -dl.y, -cut);
    if (rest.length < 3 || G.polyArea(rest) < RF.ORE_MAX_AREA * 1.3) {
      game.crackRock(t, hit, d);
      return;
    }
    if (slice.length < 3 || G.polyArea(slice) < 0.05) return;
    const pose = poseOf(t);
    const pieces = G.fragment(slice, RF.ORE_MAX_AREA * 0.8, []);
    const c = t.setShape(G.simplify(rest, 0.08));
    for (const cr of t.craters) { cr.x -= c.x; cr.y -= c.y; }
    for (const v of t.veins) for (const p of v) { p.x -= c.x; p.y -= c.y; }
    RF.classifyRock(t);
    t.stress = Math.min(t.stress, t.integrity * 0.9);
    const back = { x: -d.x, y: -d.y };
    const made = spawnPieces(pose, pieces, t.mat, back);
    // Bevar bevegelsesmengde: steinen får motsatt dytt av bitene.
    let px = 0, py = 0;
    for (const b of made) { px += (b.vx - pose.vx) * b.mass; py += (b.vy - pose.vy) * b.mass; }
    t.vx -= px / t.mass; t.vy -= py / t.mass;
    game.particles.burst(hit.x, hit.y, 14, { sMin: 4, sMax: 16, dir: Math.atan2(-d.y, -d.x), spread: 1.1, color: '#ffc070', zMin: 0.15, zMax: 0.35, lMin: 0.2, lMax: 0.6 });
    game.particles.burst(hit.x, hit.y, 5, { type: 'smoke', sMin: 1, sMax: 4, dir: Math.atan2(-d.y, -d.x), spread: 0.9, color: RF.MATERIALS[t.mat].light, zMin: 0.6, zMax: 1.2, grow: 2, lMin: 0.6, lMax: 1.3 });
    Audio.thud(0.18, true);
  };

  // Steinen sprekker i to langs laserens retning.
  game.crackRock = (t, hit, d) => {
    const hl = t.toLocal(hit.x, hit.y);
    const cs = Math.cos(-t.a), sn = Math.sin(-t.a);
    const dl = { x: d.x * cs - d.y * sn, y: d.x * sn + d.y * cs };
    const ang = Math.atan2(dl.y, dl.x) + G.rand(-0.3, 0.3);
    let [a, b] = G.splitPoly(t.verts, hl.x, hl.y, Math.cos(ang), Math.sin(ang));
    if (a.length < 3 || b.length < 3 || Math.min(G.polyArea(a), G.polyArea(b)) < t.area * 0.12) {
      [a, b] = G.splitPoly(t.verts, 0, 0, Math.cos(ang), Math.sin(ang));
    }
    const pose = poseOf(t);
    t.dead = true;
    const parts = [];
    for (const pv of [a, b]) {
      if (pv.length < 3) continue;
      // Små halvdeler knuses videre til malmbiter.
      if (G.polyArea(pv) < RF.ORE_MAX_AREA * 3) G.fragment(pv, RF.ORE_MAX_AREA * 0.8, parts);
      else parts.push(pv);
    }
    const made = spawnPieces(pose, parts, t.mat, null, t);
    // Skill bitene fra hverandre vinkelrett på sprekken, med bevart bevegelsesmengde.
    const nx = -Math.sin(ang), ny = Math.cos(ang);
    const wn = { x: nx * Math.cos(t.a) - ny * Math.sin(t.a), y: nx * Math.sin(t.a) + ny * Math.cos(t.a) };
    let tot = 0;
    for (const m of made) tot += m.mass;
    const kick = G.rand(0.6, 1.4);
    for (const m of made) {
      const side = (m.x - pose.x) * wn.x + (m.y - pose.y) * wn.y >= 0 ? 1 : -1;
      const share = (tot - m.mass) / tot;
      m.vx += wn.x * side * kick * share;
      m.vy += wn.y * side * kick * share;
    }
    game.particles.burst(hit.x, hit.y, 30, { sMin: 5, sMax: 22, color: '#ffd08a', zMin: 0.2, zMax: 0.5, lMin: 0.3, lMax: 0.9 });
    game.particles.burst(pose.x, pose.y, 16, { type: 'smoke', sMin: 1, sMax: 5, color: RF.MATERIALS[t.mat].light, zMin: 1, zMax: 3, grow: 3, lMin: 0.8, lMax: 2 });
    Audio.thud(0.7);
    if (t.area > 60) game.msg('Asteroiden sprakk', RF.HUD_COLORS.amber);
  };

  game.tryIntake = (o) => {
    const ship = game.ship;
    if (ship.holdFree() <= 0.02) {
      if (!game._fullWarn || game.time - game._fullWarn > 4) {
        game._fullWarn = game.time;
        game.msg('Lasterommet er fullt', RF.HUD_COLORS.amber);
      }
      return;
    }
    if (ship.procMass() > 25000) return;
    o.dead = true;
    ship.processing.push({ mat: o.mat, mass: o.mass });
    ship.updateMass();
    const ip = ship.body.toWorld(RF.SHIP_NOSE.x + 1, 0);
    game.particles.burst(ip.x, ip.y, 8, { type: 'glow', sMin: 1, sMax: 4, color: '#7dffd2', zMin: 0.15, zMax: 0.3, lMin: 0.2, lMax: 0.5, vx: ship.body.vx, vy: ship.body.vy });
    Audio.blip(520, 0.06, 'sine', 0.08);
  };

  game.onProcessed = (p) => {
    const M = RF.MATERIALS[p.mat];
    if (p.made > 0.005) game.msg(`+${p.made.toFixed(2).replace('.', ',')} t ${RF.PRODUCTS[M.product].name}`, RF.PRODUCTS[M.product].color);
    game.ship.updateMass();
  };

  // --- Porten ---
  game.dial = (destId) => {
    const g = game.sys.gate;
    if (g.state !== 'idle') return;
    g.state = 'dialing';
    g.t = 0;
    g.chevrons = 0;
    g.dest = destId;
    g.incoming = false;
    RF.UI.closeAll();
    game.msg(`Ringer ${RF.systemById(destId).name} …`, RF.HUD_COLORS.gate);
  };

  function updateGate(dt) {
    const g = game.sys.gate;
    const R = RF.GATE_R;
    g.t += dt;
    if (g.state === 'dialing') {
      const ch = Math.min(7, Math.floor(g.t / 0.62));
      if (ch > g.chevrons) { g.chevrons = ch; Audio.chevron(ch); }
      if (g.chevrons >= 7 && g.t > 7 * 0.62 + 0.4) { g.state = 'kawoosh'; g.t = 0; Audio.kawoosh(); }
    } else if (g.state === 'kawoosh') {
      // Alt som er foran porten i virvelen blir fordampet.
      const k = Math.sin(Math.min(1, g.t / RF.KAWOOSH_TIME) * Math.PI);
      const L = RF.KAWOOSH_LEN * k;
      const cs = Math.cos(g.a), sn = Math.sin(g.a);
      for (const b of game.sys.world.bodies) {
        if (b.isStatic || b.dead) continue;
        const dx = b.x - g.x, dy = b.y - g.y;
        const lx = dx * cs + dy * sn, ly = -dx * sn + dy * cs;
        const ex = (lx - L * 0.45) / (L * 0.55 + 2), ey = ly / (R * 0.85);
        if (lx > 0 && ex * ex + ey * ey < 1) {
          if (b === game.ship.body) {
            if (!game._kawooshHit) {
              game._kawooshHit = true;
              const dmg = 45;
              game.ship.shield = 0;
              game.ship.s.hull = Math.max(0, game.ship.s.hull - dmg);
              b.vx += cs * 12; b.vy += sn * 12;
              game.msg('Truffet av virvelen fra porten!', RF.HUD_COLORS.danger);
              game.shake = 1;
              Audio.thud(1);
            }
          } else {
            b.dead = true;
            game.particles.burst(b.x, b.y, 10, { type: 'glow', sMin: 2, sMax: 8, color: '#9fd8ff', zMin: 0.2, zMax: 0.5 });
          }
        }
      }
      if (g.t >= RF.KAWOOSH_TIME) { g.state = 'open'; g.t = 0; game._kawooshHit = false; }
    } else if (g.state === 'open') {
      if (g.t > (g.incoming ? 5 : 38)) { g.state = 'closing'; g.t = 0; }
    } else if (g.state === 'closing') {
      if (g.t > 0.6) { g.state = 'idle'; g.chevrons = 0; g.t = 0; g.incoming = false; }
    }

    // Reise gjennom horisonten, bare forfra og bare utgående.
    const b = game.ship.body;
    const cs = Math.cos(g.a), sn = Math.sin(g.a);
    const dx = b.x - g.x, dy = b.y - g.y;
    const lx = dx * cs + dy * sn, ly = -dx * sn + dy * cs;
    if (g.state === 'open' && !g.incoming && game._gatePrevLx > 0 && lx <= 0 && Math.abs(ly) < R - 2) {
      transit(g, lx, ly);
      game._gatePrevLx = undefined;
      return;
    }
    game._gatePrevLx = lx;
  }

  function transit(g, lx, ly) {
    const ship = game.ship, b = ship.body;
    const cs = Math.cos(g.a), sn = Math.sin(g.a);
    const vlx = b.vx * cs + b.vy * sn, vly = -b.vx * sn + b.vy * cs;
    const al = b.a - g.a;
    removeShipFromWorld();
    g.state = 'closing';
    g.t = 0;
    const dest = game.getSystem(g.dest);
    const dg = dest.gate;
    dg.state = 'open'; dg.t = 0; dg.incoming = true; dg.chevrons = 7;
    // Rotasjon 180° i portens ramme: inn forfra her, ut forfra der.
    const nlx = 3 - lx, nly = -ly;
    const dcs = Math.cos(dg.a), dsn = Math.sin(dg.a);
    b.x = dg.x + nlx * dcs - nly * dsn;
    b.y = dg.y + nlx * dsn + nly * dcs;
    const nvx = -vlx, nvy = -vly;
    b.vx = nvx * dcs - nvy * dsn;
    b.vy = nvx * dsn + nvy * dcs;
    b.a = dg.a + al + Math.PI;
    enterSystem(dest.def.id);
    game.cam.x = b.x; game.cam.y = b.y;
    game.flash = 1;
    game.particles.list = [];
    ship.tractor.targets = [];
    Audio.kawoosh();
    game.msg(`Ankommet ${dest.def.name}`, RF.HUD_COLORS.gate);
    game.msg(dest.def.blurb, RF.HUD_COLORS.muted || '#8398b3');
    game._gatePrevLx = undefined;
  }

  // --- Død og nødslep ---
  function destroyShip() {
    const b = game.ship.body;
    game.dead = true;
    game.deadT = 0;
    removeShipFromWorld();
    game.particles.burst(b.x, b.y, 80, { sMin: 5, sMax: 40, color: '#ffcf80', zMin: 0.2, zMax: 0.6, lMin: 0.5, lMax: 1.6, vx: b.vx, vy: b.vy });
    game.particles.burst(b.x, b.y, 40, { type: 'glow', sMin: 2, sMax: 18, color: '#ff8a3a', zMin: 0.4, zMax: 1, lMin: 0.4, lMax: 1.2, vx: b.vx, vy: b.vy });
    game.particles.burst(b.x, b.y, 40, { type: 'smoke', sMin: 1, sMax: 10, color: '#6d6f78', zMin: 1.5, zMax: 3, grow: 4, lMin: 1.2, lMax: 3, vx: b.vx, vy: b.vy });
    game.particles.burst(b.x, b.y, 30, { type: 'debris', sMin: 3, sMax: 20, color: '#8e9aab', zMin: 0.4, zMax: 1.2, lMin: 2, lMax: 5, vx: b.vx, vy: b.vy });
    Audio.thud(1);
    Audio.thud(0.8, true);
    game.shake = 1;
  }

  game.respawn = () => {
    const s = game.ship.s;
    const fee = Math.min(game.credits, 300 + Math.round(game.credits * 0.1));
    game.credits -= fee;
    for (const k in s.cargo) s.cargo[k] = 0;
    s.missionCargo = [];
    game.missions = game.missions.filter((m) => m.type !== 'frakt');
    const fa = game.ship.fa;
    const up = s.up;
    const ns = RF.newShipState();
    ns.up = up;
    ns.cargo = s.cargo;
    ns.fuel = Math.max(60, s.fuel);
    game.ship = new RF.Ship(ns);
    game.ship.fa = fa;
    game.ship.s.hull = game.ship.stats.hullMax;
    RF.UI.closeAll();
    spawnDocked(game.lastStation);
    game.msg(`Nytt skrog fra forsikringen. Egenandel ${fee} kr`, RF.HUD_COLORS.amber);
    return fee;
  };

  function towHome() {
    if (game.credits < TOW_COST) { game.msg('Du har ikke råd til slep', RF.HUD_COLORS.danger); return; }
    game.credits -= TOW_COST;
    const st = game.sys.station;
    game.msg(`Slept til ${st.name} (−${TOW_COST} kr)`, RF.HUD_COLORS.amber);
    game.ship.s.fuel = Math.max(game.ship.s.fuel, 5);
    dock();
  }

  // --- Oppdatering ---
  function updateCamera(dt) {
    const b = game.ship.body, cam = game.cam;
    const look = Math.min(RF.renderer.w, RF.renderer.h) * 0.22 / cam.zoom;
    let tx = b.x + b.vx * 0.9, ty = b.y + b.vy * 0.9;
    const dx = tx - b.x, dy = ty - b.y, dl = G.len(dx, dy);
    if (dl > look) { tx = b.x + (dx / dl) * look; ty = b.y + (dy / dl) * look; }
    const k = 1 - Math.exp(-dt * 4);
    cam.x += (tx - cam.x) * k;
    cam.y += (ty - cam.y) * k;
    if (game.shake > 0) {
      const s = game.shake * 6 / cam.zoom;
      cam.x += G.rand(-s, s);
      cam.y += G.rand(-s, s);
      game.shake = Math.max(0, game.shake - dt * 2.5);
    }
  }

  function cleanupWorld() {
    const sys = game.sys, ws = sys.world;
    let comets = 0, ore = 0;
    for (const b of ws.bodies) {
      if (b.isStatic || b.kind === 'ship' || b.dead) continue;
      const d = G.len(b.x, b.y);
      if (b.comet) comets++;
      if (b.kind === 'ore') ore++;
      if (d > 3600) {
        if (b.comet || b.kind === 'ore') { b.dead = true; continue; }
        // Steiner som driver ut kommer inn igjen på motsatt side.
        b.x = -b.x * 0.95; b.y = -b.y * 0.95;
      }
      if (b.heat > 0) b.heat = Math.max(0, b.heat - 0.02);
    }
    if (comets < sys.def.comets) sys.respawnComet(false);
    // Hold antallet løse malmbiter nede.
    if (ore > 260) {
      const sb = game.ship.body;
      const list = ws.bodies.filter((b) => b.kind === 'ore').sort((a, c) => G.len(c.x - sb.x, c.y - sb.y) - G.len(a.x - sb.x, a.y - sb.y));
      for (let i = 0; i < ore - 240; i++) list[i].dead = true;
    }
  }

  function updateFlight(dt, inp) {
    const ship = game.ship;
    ship.fly(inp, dt, game);
    ship.updateLaser(inp.laser, dt, game);
    ship.updateTractor(dt, game);
    ship.updateProcessing(dt, game);
    ship.updateShield(dt);
    if (ship.processing.length || game._massDirty) ship.updateMass();
  }

  function updatePrompts() {
    const ship = game.ship, b = ship.body, sys = game.sys;
    game.prompt = '';
    game.action = null;
    game.dockReady = false;
    if (ship.docked || game.dead) return;
    const dp = RF.dockPoint(sys.station);
    const dd = G.len(b.x - dp.x, b.y - dp.y);
    const spd = G.len(b.vx, b.vy);
    if (dd < DOCK_RANGE) {
      if (spd < DOCK_SPEED) {
        game.dockReady = true;
        game.prompt = `[T] Dokk ved ${sys.station.name}`;
        game.action = 'dock';
      } else {
        game.prompt = `Senk farten for å dokke (${spd.toFixed(1)} > ${DOCK_SPEED} m/s)`;
      }
      return;
    }
    if (dd < 180) {
      game.prompt = 'Fly inn i den stiplede ringen ved enden av dokkingsarmen';
      return;
    }
    const g = sys.gate;
    const gd = G.len(b.x - g.x, b.y - g.y);
    if (gd < DIAL_RANGE) {
      if (g.state === 'idle') { game.prompt = '[G] Ring porten'; game.action = 'dial'; }
      else if (g.state === 'dialing') game.prompt = `Låser chevron ${g.chevrons + 1} av 7 …`;
      else if (g.state === 'kawoosh') game.prompt = 'Hold avstand foran porten!';
      else if (g.state === 'open' && !g.incoming) game.prompt = `Porten er åpen til ${RF.systemById(g.dest).name}: fly inn forfra`;
      return;
    }
    if (ship.s.fuel <= 0) { game.prompt = `[R] Nødslep til ${sys.station.name} (${TOW_COST} kr)`; game.action = 'tow'; }
  }

  function handleKeys() {
    if (Input.hit('KeyM')) {
      Audio.setMuted(!Audio.muted);
      game.msg(Audio.muted ? 'Lyd av' : 'Lyd på');
    }
    if (Input.hit('Escape') || Input.hit('KeyP')) {
      if (RF.UI.isOpen()) {
        if (!game.ship.docked && !game.dead) RF.UI.closeAll();
      } else if (!game.dead) RF.UI.openPause();
      return;
    }
    if (Input.hit('KeyH')) { RF.UI.openHelp(); return; }
    if (RF.UI.isOpen() || game.dead) return;
    const ship = game.ship;
    if (Input.hit('KeyZ')) {
      ship.fa = (ship.fa + 1) % 3;
      game.msg('Flygeassistent: ' + ['av (ren Newton)', 'demper rotasjon', 'full (bremser også fart)'][ship.fa], RF.HUD_COLORS.gate);
    }
    if (Input.hit('KeyF')) {
      ship.tractor.on = !ship.tractor.on;
      Audio.blip(ship.tractor.on ? 300 : 200, 0.08, 'sine', 0.1);
    }
    if (Input.hit('Equal') || Input.hit('NumpadAdd')) game.cam.zoom = Math.min(9, game.cam.zoom * 1.25);
    if (Input.hit('Minus') || Input.hit('NumpadSubtract')) game.cam.zoom = Math.max(0.35, game.cam.zoom / 1.25);
    const act = Input.hit('Interact') || Input.hit('Enter');
    if ((Input.hit('KeyT') || act) && game.action === 'dock') dock();
    else if ((Input.hit('KeyG') || act) && game.action === 'dial') RF.UI.openDial();
    else if ((Input.hit('KeyR') || act) && game.action === 'tow') towHome();
  }

  function update(dt) {
    game.time += dt;
    const ship = game.ship;
    const inp = RF.UI.isOpen() || game.dead || ship.docked ? { thrust: 0, turn: 0, strafe: 0, laser: false } : Input.state();
    if (!ship.docked && !game.dead) updateFlight(dt, inp);
    else if (ship.docked) ship.updateShield(dt);
    updateGate(dt);
    game.sys.world.step(dt);
    if (!ship.docked && !game.dead && ship.s.hull <= 0) destroyShip();
  }

  let last = 0, acc = 0, frameN = 0;
  function frame(ts) {
    requestAnimationFrame(frame);
    if (game.state !== 'play') { last = ts; return; }
    let dt = Math.min(0.05, (ts - last) / 1000 || 0);
    last = ts;
    handleKeys();
    if (!game.paused) {
      acc += dt;
      while (acc >= STEP) { update(STEP); acc -= STEP; }
      game.particles.update(dt);
      if (++frameN % 30 === 0) cleanupWorld();
      const ship = game.ship;
      // Røyk og gnister fra et skadet skip.
      if (!game.dead && !ship.docked) {
        const hf = ship.s.hull / ship.stats.hullMax;
        const b = ship.body;
        if (hf < 0.5 && Math.random() < (0.5 - hf) * 0.8) {
          const p = b.toWorld(G.rand(-6, 4), G.rand(-3, 3));
          game.particles.add({ type: 'smoke', x: p.x, y: p.y, vx: b.vx + G.rand(-1, 1), vy: b.vy + G.rand(-1, 1), life: G.rand(0.8, 1.6), size: 0.8, grow: 2.2, color: '#5d626c' });
        }
        if (hf < 0.25 && Math.random() < 0.15) {
          const p = b.toWorld(G.rand(-6, 6), G.rand(-4, 4));
          game.particles.burst(p.x, p.y, 4, { sMin: 2, sMax: 8, color: '#ffd28a', zMin: 0.1, zMax: 0.25, lMin: 0.1, lMax: 0.4, vx: b.vx, vy: b.vy });
        }
        // Dråper av motorplasma.
        if (ship.fx.main > 0.1 && Math.random() < ship.fx.main) {
          for (const s of [-1, 1]) {
            const p = b.toWorld(-9, s * 2.9), d = b.dirWorld(-1, 0);
            game.particles.add({ type: 'glow', x: p.x, y: p.y, vx: b.vx + d.x * 30 + G.rand(-2, 2), vy: b.vy + d.y * 30 + G.rand(-2, 2), life: 0.25, size: 0.25, color: '#7fb8ff' });
          }
        }
        if (ship.laser.hit && Math.random() < 0.6) {
          const h = ship.laser.hit;
          game.particles.burst(h.x, h.y, 1, { sMin: 3, sMax: 12, dir: Math.atan2(h.ny, h.nx), spread: 1.2, color: '#ffb060', zMin: 0.12, zMax: 0.3, lMin: 0.15, lMax: 0.45 });
        }
        // Halen til kometene peker bort fra sola.
        const sd = game.sys.def.sky.starDir + Math.PI;
        for (const c of game.sys.world.bodies) {
          if (!c.comet || G.len(c.x - game.cam.x, c.y - game.cam.y) > 900) continue;
          if (Math.random() < 0.7) {
            const a = Math.random() * 6.28, r = c.radius * 0.8;
            game.particles.add({ type: 'smoke', x: c.x + Math.cos(a) * r, y: c.y + Math.sin(a) * r, vx: c.vx * 0.3 + Math.cos(sd) * 14 + G.rand(-2, 2), vy: c.vy * 0.3 + Math.sin(sd) * 14 + G.rand(-2, 2), life: G.rand(1.5, 3), size: c.radius * 0.4, grow: 4, color: '#bfe6ff' });
          }
        }
      }
      if (game.dead) {
        game.deadT += dt;
        if (game.deadT > 1.6 && !RF.UI.isOpen()) RF.UI.openDead();
      }
      updatePrompts();
      if (!game.dead) updateCamera(dt);
      for (const m of game.messages) m.t -= dt;
      game.messages = game.messages.filter((m) => m.t > 0);
      game.flash = Math.max(0, game.flash - dt * 1.5);
      Audio.update(ship.docked || game.dead ? 0 : Math.max(ship.fx.main, ship.fx.retro * 0.6, (ship.fx.left + ship.fx.right) * 0.4),
        ship.laser.on && !game.dead, ship.tractor.on && !ship.docked && !game.dead, !!ship.laser.hit);
    }
    Input.endFrame();
    RF.renderer.draw(game);
    if (!game.dead) RF.drawHUD(RF.renderer, game);
    if (game.flash > 0) {
      const c = RF.renderer.ctx;
      c.setTransform(1, 0, 0, 1, 0, 0);
      c.fillStyle = `rgba(200,235,255,${game.flash})`;
      c.fillRect(0, 0, RF.renderer.canvas.width, RF.renderer.canvas.height);
    }
    RF.UI.tick();
  }

  game.start = (cont) => {
    Audio.start();
    if (cont) game.load(); else game.newCareer();
    game.state = 'play';
  };

  game.boot = () => {
    const canvas = document.getElementById('game');
    RF.renderer = new RF.Renderer(canvas);
    window.addEventListener('resize', () => RF.renderer.resize());
    canvas.addEventListener('wheel', (e) => {
      e.preventDefault();
      const f = Math.exp(-e.deltaY * 0.0015);
      game.cam.zoom = G.clamp(game.cam.zoom * f, 0.35, 9);
    }, { passive: false });
    game.touchUI = window.matchMedia('(pointer: coarse)').matches || 'ontouchstart' in window;
    if (game.touchUI) game.cam.zoom = 2;
    RF.UI.init(game);
    // Et levende bakgrunnsbilde bak tittelskjermen.
    game.ship = new RF.Ship(RF.newShipState());
    game.sys = game.getSystem('midgard');
    const b = game.ship.body;
    b.x = 420; b.y = 260; b.a = 0.4;
    game.cam.x = b.x; game.cam.y = b.y;
    RF.renderer.draw(game);
    requestAnimationFrame((ts) => { last = ts; frame(ts); });
    // Tegn tittelbakgrunnen jevnlig så asteroidene beveger seg.
    const idle = () => {
      if (game.state === 'play') return;
      game.time += 1 / 60;
      game.sys.world.step(1 / 60);
      game.cam.x += 0.15;
      RF.renderer.draw(game);
      requestAnimationFrame(idle);
    };
    requestAnimationFrame(idle);
  };
})();
