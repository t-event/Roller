// Spillerens skip: motorer, flygeassistent, borelaser, traktorstråle,
// prosessering av malm, drivstoff, last og skademodell.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  // Kollisjonsskrog (konvekst). Lokale akser: +x er fremover, +y er styrbord.
  RF.SHIP_HULL = [
    { x: 8.6, y: 0 }, { x: 4.6, y: 3.3 }, { x: -4.4, y: 4.5 }, { x: -7.2, y: 3.1 },
    { x: -7.2, y: -3.1 }, { x: -4.4, y: -4.5 }, { x: 4.6, y: -3.3 },
  ];
  RF.SHIP_NOSE = { x: 9.2, y: 0 };

  RF.SHIP_DRY_MASS = 24000; // kg
  RF.FUEL_MASS = 4000; // kg ved full tank

  // Oppgraderingsnivåer. Nivå 0 er startskipet "Hoppeskip MK-I".
  RF.UPGRADES = {
    motor: { name: 'Hovedmotor', unit: 'kN', levels: [420, 560, 720], cost: [0, 2200, 5200], fmt: (v) => v },
    skjold: { name: 'Skjoldgenerator', unit: 'MJ', levels: [100, 160, 240], cost: [0, 1800, 4600], fmt: (v) => v },
    skrog: { name: 'Skrogplating', unit: 'HP', levels: [100, 140, 190], cost: [0, 1600, 4200], fmt: (v) => v, mass: [0, 1500, 3200] },
    laser: { name: 'Borelaser', unit: 'MW', levels: [1, 1.6, 2.4], cost: [0, 1500, 4000], fmt: (v) => (v * 4).toFixed(1) },
    last: { name: 'Lasterom', unit: 't', levels: [12, 20, 32], cost: [0, 1400, 3800], fmt: (v) => v },
    traktor: { name: 'Traktorstråle', unit: 'kN', levels: [60, 100, 160], cost: [0, 900, 2600], fmt: (v) => v },
  };

  RF.newShipState = () => ({
    up: { motor: 0, skjold: 0, skrog: 0, laser: 0, last: 0, traktor: 0 },
    hull: 100,
    sys: { motor: 100, rcs: 100, laser: 100, traktor: 100 },
    fuel: 100,
    cargo: { jern: 0, nikkel: 0, vann: 0, naquadah: 0 },
    missionCargo: [],
  });

  RF.shipStats = (s) => {
    const U = RF.UPGRADES, u = s.up;
    return {
      thrust: U.motor.levels[u.motor] * 1000,
      retro: U.motor.levels[u.motor] * 1000 * 0.4,
      strafe: U.motor.levels[u.motor] * 1000 * 0.3,
      torque: 2.2e6,
      maxW: 1.9,
      shieldMax: U.skjold.levels[u.skjold],
      hullMax: U.skrog.levels[u.skrog],
      extraMass: U.skrog.mass[u.skrog],
      laser: U.laser.levels[u.laser],
      hold: U.last.levels[u.last],
      tractor: U.traktor.levels[u.traktor] * 1000,
    };
  };

  RF.cargoMass = (s) => {
    let t = 0;
    for (const k in s.cargo) t += s.cargo[k];
    for (const m of s.missionCargo) t += m.mass;
    return t; // tonn
  };

  class Ship {
    constructor(state) {
      this.s = state;
      this.body = new RF.Body(G.convexHull(RF.SHIP_HULL), 1, { kind: 'ship', restitution: 0.18, friction: 0.45 });
      this.refreshStats();
      this.body.baseMass = this.body.mass;
      this.shield = this.stats.shieldMax;
      this.shieldDelay = 0;
      this.fa = 1; // 0 = av, 1 = rotasjon, 2 = full
      this.fx = { main: 0, retro: 0, left: 0, right: 0, rotL: 0, rotR: 0 };
      this.laser = { on: false, hit: null, chipT: 0, len: 0 };
      this.tractor = { on: false, targets: [] };
      this.processing = []; // { mat, mass (kg) }
      this.scars = [];
      this.shieldFlash = 0;
      this.shieldHitDir = 0;
      this.impactLog = [];
      this.docked = null;
      this.updateMass();
    }

    refreshStats() {
      this.stats = RF.shipStats(this.s);
      if (this.s.hull > this.stats.hullMax) this.s.hull = this.stats.hullMax;
    }

    procMass() {
      let m = 0;
      for (const p of this.processing) m += p.mass;
      return m;
    }

    totalMass() {
      return RF.SHIP_DRY_MASS + this.stats.extraMass + (this.s.fuel / 100) * RF.FUEL_MASS +
        RF.cargoMass(this.s) * 1000 + this.procMass();
    }

    updateMass() {
      this.body.setMass(this.totalMass());
    }

    holdFree() {
      return this.stats.hold - RF.cargoMass(this.s);
    }

    // input: { thrust: -1..1, turn: -1..1, strafe: -1..1 }
    fly(input, dt, game) {
      const b = this.body, s = this.s, st = this.stats;
      const fwd = b.dirWorld(1, 0), right = b.dirWorld(0, 1);
      const hasFuel = s.fuel > 0;
      const motorEff = 0.25 + 0.75 * (s.sys.motor / 100);
      const rcsEff = 0.3 + 0.7 * (s.sys.rcs / 100);

      let main = 0, retro = 0, strafe = 0, torque = 0;

      if (input.thrust > 0) main = input.thrust;
      else if (input.thrust < 0) retro = -input.thrust;
      strafe = input.strafe;

      // Flygeassistent: demper rotasjon (ROT) og også fart (FULL).
      const maxT = st.torque * rcsEff;
      if (input.turn !== 0) {
        if (this.fa > 0) {
          const target = input.turn * st.maxW;
          torque = G.clamp((target - b.w) * b.I * 6, -maxT, maxT);
        } else torque = input.turn * maxT;
      } else if (this.fa > 0) {
        torque = G.clamp(-b.w * b.I * 5, -maxT, maxT);
        if (Math.abs(b.w) < 0.002) torque = 0;
      }

      if (this.fa === 2 && input.thrust === 0 && input.strafe === 0) {
        const sp = G.len(b.vx, b.vy);
        if (sp > 0.03) {
          // Ønsket akselerasjon motsatt av farten, fordelt på skipets akser.
          const ax = -b.vx * 0.9, ay = -b.vy * 0.9;
          const af = ax * fwd.x + ay * fwd.y, ar = ax * right.x + ay * right.y;
          const m = b.mass;
          if (af > 0) main = Math.min(1, (af * m) / (st.thrust * motorEff));
          else retro = Math.min(1, (-af * m) / (st.retro * motorEff));
          strafe = G.clamp((ar * m) / (st.strafe * rcsEff), -1, 1);
        }
      }

      if (!hasFuel) { main = 0; retro = 0; strafe *= 0.2; }

      const F = main * st.thrust * motorEff - retro * st.retro * motorEff;
      const Fs = strafe * st.strafe * rcsEff;
      b.vx += ((fwd.x * F + right.x * Fs) / b.mass) * dt;
      b.vy += ((fwd.y * F + right.y * Fs) / b.mass) * dt;
      b.w += torque * b.invI * dt;

      // Drivstofforbruk i prosent per sekund.
      const burn = main * 0.42 + retro * 0.18 + Math.abs(strafe) * 0.12 + (Math.abs(torque) / st.torque) * 0.04;
      s.fuel = Math.max(0, s.fuel - burn * dt);

      const fx = this.fx;
      fx.main = G.lerp(fx.main, main * (s.sys.motor < 30 && Math.random() < 0.3 ? 0.2 : 1), 0.3);
      fx.retro = G.lerp(fx.retro, retro, 0.3);
      fx.left = G.lerp(fx.left, strafe < 0 ? -strafe : 0, 0.3);
      fx.right = G.lerp(fx.right, strafe > 0 ? strafe : 0, 0.3);
      fx.rotL = G.lerp(fx.rotL, torque < 0 ? -torque / st.torque : 0, 0.3);
      fx.rotR = G.lerp(fx.rotR, torque > 0 ? torque / st.torque : 0, 0.3);
    }

    // Borelaser. Varmer opp steinen, skjærer av biter og får den til å sprekke.
    updateLaser(on, dt, game) {
      const L = this.laser, b = this.body, s = this.s;
      L.on = on && s.sys.laser > 5;
      L.hit = null;
      if (!L.on) { L.chipT = 0; return; }
      const nose = b.toWorld(RF.SHIP_NOSE.x, 0);
      const d = b.dirWorld(1, 0);
      const range = 240;
      const hit = game.sys.world.raycast(nose.x, nose.y, d.x, d.y, range, (o) => o !== b && !o.ghost);
      L.len = hit ? hit.t : range;
      if (!hit) return;
      L.hit = hit;
      const t = hit.body;
      if (t.kind !== 'rock' && t.kind !== 'ore') return;
      const power = this.stats.laser * (0.35 + 0.65 * s.sys.laser / 100);
      // Litt strålingstrykk.
      t.applyImpulse(d.x * 900 * power * dt, d.y * 900 * power * dt, hit.x, hit.y);
      t.heat = Math.min(1, (t.heat || 0) + dt * 2);
      t.hitX = hit.x; t.hitY = hit.y;
      if (t.kind !== 'rock') return;
      t.stress += dt * power;
      L.chipT += dt * power;
      if (t.stress >= t.integrity) {
        game.crackRock(t, hit, d);
      } else if (L.chipT >= 0.45) {
        L.chipT = 0;
        game.chipRock(t, hit, d);
      }
    }

    // Traktorstråle: trekker malmbiter mot inntaket i nesen. Kraften virker
    // like mye tilbake på skipet (Newtons tredje lov).
    updateTractor(dt, game) {
      const T = this.tractor, b = this.body, s = this.s;
      T.targets = [];
      if (!T.on || s.sys.traktor <= 5) return;
      const eff = 0.3 + 0.7 * s.sys.traktor / 100;
      const maxF = this.stats.tractor * eff;
      const intake = b.toWorld(RF.SHIP_NOSE.x + 1.2, 0);
      const fwd = b.dirWorld(1, 0);
      const range = 150;
      const cands = [];
      for (const o of game.sys.world.bodies) {
        if (o.kind !== 'ore' || o.dead || o.ghost) continue;
        const dx = o.x - intake.x, dy = o.y - intake.y;
        const dist = G.len(dx, dy);
        if (dist > range) continue;
        const cosA = (dx * fwd.x + dy * fwd.y) / (dist || 1);
        if (dist > 30 && cosA < 0.6) continue;
        cands.push({ o, dist });
      }
      cands.sort((p, q) => p.dist - q.dist);
      const n = Math.min(4, cands.length);
      for (let i = 0; i < n; i++) {
        const { o, dist } = cands[i];
        const dx = intake.x - o.x, dy = intake.y - o.y;
        const ux = dx / (dist || 1), uy = dy / (dist || 1);
        // Ønsket fart mot inntaket relativt til skipet, rolig nær nesen.
        const want = Math.min(14, dist * 0.45 + 0.5);
        const rv = b.pointVel(o.x, o.y);
        const tvx = rv.x + ux * want, tvy = rv.y + uy * want;
        let fx = (tvx - o.vx) * o.mass * 2.5, fy = (tvy - o.vy) * o.mass * 2.5;
        const fl = G.len(fx, fy), cap = maxF / n;
        if (fl > cap) { fx *= cap / fl; fy *= cap / fl; }
        o.applyForce(fx, fy, o.x, o.y, dt);
        b.applyForce(-fx, -fy, intake.x, intake.y, dt);
        // Demp spinn på biten så den ikke spretter.
        o.w *= 1 - Math.min(1, dt * 2);
        T.targets.push(o);

        if (dist < 4.5 + Math.sqrt(o.area)) {
          const rvx = o.vx - rv.x, rvy = o.vy - rv.y;
          if (G.len(rvx, rvy) < 5) game.tryIntake(o);
        }
      }
    }

    updateProcessing(dt, game) {
      if (!this.processing.length) return;
      const p = this.processing[0];
      const rate = 1600 * dt; // kg råmasse per sekund
      const take = Math.min(rate, p.mass);
      p.mass -= take;
      const M = RF.MATERIALS[p.mat];
      const out = (take * M.grade) / 1000; // tonn ferdig vare
      const free = this.holdFree();
      const add = Math.min(out, Math.max(0, free));
      this.s.cargo[M.product] += add;
      p.made = (p.made || 0) + add;
      if (p.mass <= 0.01) {
        this.processing.shift();
        game.onProcessed(p);
      }
    }

    updateShield(dt) {
      if (this.shieldDelay > 0) this.shieldDelay -= dt;
      else this.shield = Math.min(this.stats.shieldMax, this.shield + dt * this.stats.shieldMax * 0.07);
      this.shieldFlash = Math.max(0, this.shieldFlash - dt * 2.5);
    }

    // dv er fartsendringen skipet fikk i støtet (m/s). Returnerer skade på skrog.
    takeImpact(dv, px, py, game) {
      const b = this.body;
      const loc = b.toLocal(px, py);
      this.shieldHitDir = Math.atan2(loc.y, loc.x);
      if (dv < 1.6) return 0;
      let dmg = Math.pow(dv - 1.6, 1.55) * 2.3;
      if (this.shield > 0) {
        const absorbed = Math.min(this.shield, dmg);
        this.shield -= absorbed;
        dmg -= absorbed;
        this.shieldFlash = Math.min(1, 0.4 + absorbed / 30);
      }
      this.shieldDelay = 3;
      if (dmg <= 0) return 0;
      this.s.hull = Math.max(0, this.s.hull - dmg);
      // Hvilken del av skipet ble truffet?
      const sys = this.s.sys;
      if (loc.x > 3) {
        sys.laser = Math.max(0, sys.laser - dmg * 0.9);
        sys.traktor = Math.max(0, sys.traktor - dmg * 0.6);
      } else if (loc.x < -3.5) {
        sys.motor = Math.max(0, sys.motor - dmg * 1.0);
      } else {
        sys.rcs = Math.max(0, sys.rcs - dmg * 0.9);
      }
      if (this.scars.length > 24) this.scars.shift();
      this.scars.push({ x: G.clamp(loc.x, -7, 8), y: G.clamp(loc.y, -4.2, 4.2), r: Math.min(2.2, 0.6 + dmg / 20) });
      return dmg;
    }
  }

  RF.Ship = Ship;
})();
