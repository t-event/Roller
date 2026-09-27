// Instrumentpanel tegnet rett på lerretet i skjermkoordinater.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  const C = {
    text: '#d9e4f2', muted: '#8398b3', line: 'rgba(120,160,210,0.28)', panel: 'rgba(8,13,24,0.72)',
    gate: '#62d0ff', amber: '#ffb44a', danger: '#ff5b4f', ok: '#6fe3a0', naq: '#5dffc8',
  };
  const F = {
    label: '600 11px "Chakra Petch", ui-sans-serif, system-ui, sans-serif',
    title: '700 14px "Chakra Petch", ui-sans-serif, system-ui, sans-serif',
    big: '600 22px "JetBrains Mono", ui-monospace, Menlo, monospace',
    num: '500 12px "JetBrains Mono", ui-monospace, Menlo, monospace',
  };
  RF.HUD_COLORS = C;

  const fmtDist = (m) => (m >= 1000 ? (m / 1000).toFixed(2) + ' km' : Math.round(m) + ' m');

  function panel(ctx, x, y, w, h) {
    ctx.fillStyle = C.panel;
    ctx.strokeStyle = C.line;
    ctx.lineWidth = 1;
    ctx.beginPath();
    // Avskåret hjørne oppe til venstre, som på et instrumentpanel.
    ctx.moveTo(x + 8, y); ctx.lineTo(x + w, y); ctx.lineTo(x + w, y + h); ctx.lineTo(x, y + h); ctx.lineTo(x, y + 8);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
  }

  function bar(ctx, x, y, w, label, frac, color, valueText) {
    ctx.font = F.label;
    ctx.fillStyle = C.muted;
    ctx.textAlign = 'left';
    ctx.fillText(label.toUpperCase(), x, y);
    ctx.font = F.num;
    ctx.fillStyle = C.text;
    ctx.textAlign = 'right';
    ctx.fillText(valueText, x + w, y);
    ctx.textAlign = 'left';
    const by = y + 5;
    ctx.fillStyle = 'rgba(255,255,255,0.08)';
    ctx.fillRect(x, by, w, 5);
    ctx.fillStyle = color;
    ctx.fillRect(x, by, w * G.clamp(frac, 0, 1), 5);
    // Segmentstreker.
    ctx.fillStyle = 'rgba(8,13,24,0.8)';
    for (let i = 1; i < 10; i++) ctx.fillRect(x + (w * i) / 10 - 0.5, by, 1, 5);
  }

  const sysColor = (v) => (v > 66 ? C.ok : v > 33 ? C.amber : C.danger);

  function shipSchematic(ctx, x, y, s, sys, hull, hullMax) {
    ctx.save();
    ctx.translate(x, y);
    ctx.rotate(-Math.PI / 2);
    ctx.scale(s, s);
    const seg = (pts, col) => {
      ctx.beginPath();
      pts.forEach((p, i) => (i ? ctx.lineTo(p[0], p[1]) : ctx.moveTo(p[0], p[1])));
      ctx.closePath();
      ctx.fillStyle = col + '55';
      ctx.fill();
      ctx.strokeStyle = col;
      ctx.lineWidth = 1 / s;
      ctx.stroke();
    };
    seg([[8.6, 0], [4.6, 3.3], [3, 3.5], [3, -3.5], [4.6, -3.3]], sysColor(Math.min(sys.laser, sys.traktor)));
    seg([[3, 3.5], [-3.5, 4.3], [-3.5, -4.3], [3, -3.5]], sysColor(Math.min(sys.rcs, (hull / hullMax) * 100)));
    seg([[-3.5, 4.3], [-4.4, 4.5], [-7.2, 3.1], [-7.2, -3.1], [-4.4, -4.5], [-3.5, -4.3]], sysColor(sys.motor));
    ctx.restore();
  }

  function edgeMarker(ctx, game, R, wx, wy, label, color, size = 0) {
    const s = R.toScreen(game.cam, wx, wy);
    const m = 34;
    const inside = s.x > m && s.x < R.w - m && s.y > m && s.y < R.h - m;
    const ship = game.ship.body;
    const dist = G.len(wx - ship.x, wy - ship.y);
    ctx.font = F.label;
    ctx.fillStyle = color;
    ctx.strokeStyle = color;
    if (inside) {
      const oy = size * game.cam.zoom + 10;
      ctx.textAlign = 'center';
      ctx.fillText(label.toUpperCase(), s.x, s.y - oy - 14);
      ctx.font = F.num;
      ctx.fillStyle = C.text;
      ctx.fillText(fmtDist(dist), s.x, s.y - oy);
      ctx.textAlign = 'left';
      return;
    }
    // Pilen holdes innenfor et rektangel som unngår berøringsknappene.
    const ml = m, mr = game.touchUI ? 76 : m, mt = m, mb = game.touchUI ? 170 : m;
    const cx = R.w / 2, cy = R.h / 2;
    const dx = s.x - cx, dy = s.y - cy;
    const kx = dx > 0 ? (R.w - mr - cx) / dx : dx < 0 ? (ml - cx) / dx : Infinity;
    const ky = dy > 0 ? (R.h - mb - cy) / dy : dy < 0 ? (mt - cy) / dy : Infinity;
    const k = Math.min(kx, ky);
    const ex = cx + dx * k;
    let ey = cy + dy * k;
    // Ikke tegn oppå radaren oppe til høyre.
    const rb = game._radarBox;
    if (rb && ex > rb.x0 - 20 && ey < rb.y1 + 34) ey = rb.y1 + 34;
    const a = Math.atan2(dy, dx);
    ctx.save();
    ctx.translate(ex, ey);
    ctx.rotate(a);
    ctx.beginPath(); ctx.moveTo(10, 0); ctx.lineTo(-4, -6); ctx.lineTo(-4, 6); ctx.closePath(); ctx.fill();
    ctx.restore();
    const tx = ex - Math.cos(a) * 18, ty = ey - Math.sin(a) * 18;
    ctx.textAlign = Math.cos(a) > 0.3 ? 'right' : Math.cos(a) < -0.3 ? 'left' : 'center';
    ctx.fillText(label.toUpperCase(), tx, ty - 2);
    ctx.font = F.num;
    ctx.fillStyle = C.text;
    ctx.fillText(fmtDist(dist), tx, ty + 12);
    ctx.textAlign = 'left';
  }

  function radar(ctx, game, x, y, r) {
    const ship = game.ship.body, range = 1500;
    ctx.save();
    ctx.beginPath(); ctx.arc(x, y, r, 0, Math.PI * 2);
    ctx.fillStyle = 'rgba(6,12,22,0.78)';
    ctx.fill();
    ctx.strokeStyle = C.line;
    ctx.stroke();
    ctx.clip();
    ctx.strokeStyle = 'rgba(120,160,210,0.12)';
    for (const f of [0.33, 0.66]) { ctx.beginPath(); ctx.arc(x, y, r * f, 0, Math.PI * 2); ctx.stroke(); }
    ctx.beginPath(); ctx.moveTo(x - r, y); ctx.lineTo(x + r, y); ctx.moveTo(x, y - r); ctx.lineTo(x, y + r); ctx.stroke();
    // Sveip.
    const sw = (game.time * 1.4) % (Math.PI * 2);
    const sg = ctx.createConicGradient ? ctx.createConicGradient(sw, x, y) : null;
    if (sg) {
      sg.addColorStop(0, 'rgba(98,208,255,0.18)');
      sg.addColorStop(0.08, 'rgba(98,208,255,0)');
      sg.addColorStop(1, 'rgba(98,208,255,0)');
      ctx.fillStyle = sg;
      ctx.fillRect(x - r, y - r, r * 2, r * 2);
    }
    const k = r / range;
    for (const b of game.sys.world.bodies) {
      const dx = (b.x - ship.x) * k, dy = (b.y - ship.y) * k;
      if (dx * dx + dy * dy > r * r) continue;
      if (b.kind === 'rock') {
        const M = RF.MATERIALS[b.mat];
        ctx.fillStyle = M.vein || M.light;
        const s = G.clamp(b.radius * k * 1.6, 1.2, 4);
        ctx.fillRect(x + dx - s / 2, y + dy - s / 2, s, s);
      } else if (b.kind === 'ore') {
        ctx.fillStyle = C.naq;
        ctx.fillRect(x + dx, y + dy, 1, 1);
      }
    }
    const st = game.sys.station;
    ctx.fillStyle = C.ok;
    ctx.fillRect(x + (st.x - ship.x) * k - 3, y + (st.y - ship.y) * k - 3, 6, 6);
    const g = game.sys.gate;
    ctx.strokeStyle = C.gate;
    ctx.lineWidth = 1.5;
    ctx.beginPath(); ctx.arc(x + (g.x - ship.x) * k, y + (g.y - ship.y) * k, 4, 0, Math.PI * 2); ctx.stroke();
    // Skipet og fartsvektor.
    ctx.strokeStyle = C.amber;
    ctx.beginPath(); ctx.moveTo(x, y); ctx.lineTo(x + ship.vx * k * 20, y + ship.vy * k * 20); ctx.stroke();
    ctx.save();
    ctx.translate(x, y); ctx.rotate(ship.a);
    ctx.fillStyle = '#fff';
    ctx.beginPath(); ctx.moveTo(5, 0); ctx.lineTo(-3, 3); ctx.lineTo(-3, -3); ctx.closePath(); ctx.fill();
    ctx.restore();
    ctx.restore();
    ctx.font = F.label;
    ctx.fillStyle = C.muted;
    ctx.textAlign = 'center';
    ctx.fillText('RADAR 1,5 KM', x, y + r + 14);
    ctx.textAlign = 'left';
  }

  RF.drawHUD = (R, game) => {
    const ctx = R.ctx, w = R.w, h = R.h, dpr = R.dpr;
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    ctx.textBaseline = 'alphabetic';
    const ship = game.ship, b = ship.body, s = ship.s, st = ship.stats;
    const compact = w < 720;
    const touch = game.touchUI;
    const top = 12;

    const rr = compact ? 62 : 84;
    const rx = w - rr - 14, ry = top + rr + 4;
    game._radarBox = { x0: rx - rr, y1: ry + rr + 16 };

    // Fartsvektor og kurs rundt skipet.
    if (!game.dead && !ship.docked) {
      const sp = R.toScreen(game.cam, b.x, b.y);
      const vx = b.vx, vy = b.vy, spd = G.len(vx, vy);
      if (spd > 0.4) {
        const L = Math.min(140, 26 + spd * 3);
        ctx.strokeStyle = 'rgba(255,180,74,0.7)';
        ctx.lineWidth = 1.5;
        ctx.setLineDash([4, 4]);
        ctx.beginPath();
        ctx.moveTo(sp.x + (vx / spd) * 26, sp.y + (vy / spd) * 26);
        ctx.lineTo(sp.x + (vx / spd) * L, sp.y + (vy / spd) * L);
        ctx.stroke();
        ctx.setLineDash([]);
        const mx = sp.x + (vx / spd) * L, my = sp.y + (vy / spd) * L;
        ctx.beginPath(); ctx.arc(mx, my, 5, 0, Math.PI * 2); ctx.stroke();
        ctx.beginPath(); ctx.moveTo(mx, my - 5); ctx.lineTo(mx, my - 9); ctx.moveTo(mx - 5, my); ctx.lineTo(mx - 9, my); ctx.moveTo(mx + 5, my); ctx.lineTo(mx + 9, my); ctx.stroke();
      }
      edgeMarker(ctx, game, R, game.sys.station.x, game.sys.station.y, game.sys.station.name, C.ok, 115);
      edgeMarker(ctx, game, R, game.sys.gate.x, game.sys.gate.y, 'Porten', C.gate, RF.GATE_R + 4);
      if (game.navTarget) edgeMarker(ctx, game, R, game.navTarget.x, game.navTarget.y, game.navTarget.label, C.amber);
    }

    // Øverst til venstre: system, kreditter, oppdrag.
    const pw = compact ? 210 : 260;
    const missions = game.missions.filter((m) => m.status === 'aktiv');
    const ph = 58 + missions.length * 16;
    panel(ctx, 12, top, pw, ph);
    ctx.font = F.title;
    ctx.fillStyle = C.text;
    ctx.fillText(game.sys.def.name.toUpperCase(), 24, top + 20);
    ctx.font = F.label;
    ctx.fillStyle = C.muted;
    ctx.fillText('SYSTEM', 24 + ctx.measureText(game.sys.def.name.toUpperCase()).width + 30, top + 20);
    ctx.font = F.big;
    ctx.fillStyle = C.amber;
    ctx.fillText(Math.floor(game.credits).toLocaleString('nb-NO'), 24, top + 46);
    const cw = ctx.measureText(Math.floor(game.credits).toLocaleString('nb-NO')).width;
    ctx.font = F.label;
    ctx.fillStyle = C.muted;
    ctx.fillText('KREDITTER', 30 + cw, top + 46);
    ctx.font = F.label;
    missions.forEach((m, i) => {
      ctx.fillStyle = m.fragile ? C.amber : C.text;
      let txt = RF.missionShort(m);
      while (txt.length > 8 && ctx.measureText(txt).width > pw - 24) txt = txt.slice(0, -2) + '…';
      ctx.fillText(txt, 24, top + 66 + i * 16);
    });

    // Statuspanel.
    const sw = compact ? 200 : 240;
    const sh = 150;
    const sx = 12;
    const sy = touch ? top + ph + 10 : h - sh - 12;
    panel(ctx, sx, sy, sw, sh);
    shipSchematic(ctx, sx + 32, sy + 58, 3.2, s.sys, s.hull, st.hullMax);
    const bx = sx + 64, bw = sw - 76;
    bar(ctx, bx, sy + 20, bw, 'Skrog', s.hull / st.hullMax, sysColor((s.hull / st.hullMax) * 100), Math.ceil(s.hull) + '/' + st.hullMax);
    bar(ctx, bx, sy + 48, bw, 'Skjold', ship.shield / st.shieldMax, C.gate, Math.floor(ship.shield) + '');
    bar(ctx, bx, sy + 76, bw, 'Drivstoff', s.fuel / 100, s.fuel < 15 ? C.danger : C.amber, s.fuel.toFixed(0) + '%');
    const cm = RF.cargoMass(s);
    bar(ctx, bx, sy + 104, bw, 'Last', cm / st.hold, C.naq, cm.toFixed(1) + '/' + st.hold + ' t');
    ctx.font = F.label;
    ctx.fillStyle = C.muted;
    const spd = G.len(b.vx, b.vy);
    const fa = ['AV', 'ROTASJON', 'FULL'][ship.fa];
    let proc = ship.processing.length ? 'PROSESSERER ' + (ship.procMass() / 1000).toFixed(1) + ' T' : 'MASSE ' + (b.mass / 1000).toFixed(1) + ' T';
    if (touch) proc = spd.toFixed(1) + ' M/S · ASSIST ' + ['AV', 'ROT', 'FULL'][ship.fa];
    ctx.fillText(proc, sx + 12, sy + 138);
    if (!touch) {
      ctx.textAlign = 'right';
      ctx.fillStyle = ship.tractor.on ? C.naq : C.muted;
      ctx.fillText(ship.tractor.on ? 'TRAKTOR PÅ' : 'TRAKTOR AV', sx + sw - 12, sy + 138);
      ctx.textAlign = 'left';
    }

    // Fart og flygeassistent (på berøringsskjerm står farten i statuspanelet).
    if (!touch) {
      const cx = w / 2, cy = h - 30;
      ctx.textAlign = 'center';
      ctx.font = F.big;
      ctx.fillStyle = C.text;
      ctx.fillText(spd.toFixed(1) + ' m/s', cx, cy);
      ctx.font = F.label;
      ctx.fillStyle = ship.fa ? C.gate : C.amber;
      ctx.fillText('FLYGEASSISTENT ' + fa + '  [Z]', cx, cy + 16);
      ctx.fillStyle = C.muted;
      ctx.fillText('ROT ' + (b.w * 57.3).toFixed(0) + '°/s', cx, cy - 26);
      ctx.textAlign = 'left';
    }

    // Radar.
    radar(ctx, game, rx, ry, rr);

    // Handlingshint.
    if (game.prompt) {
      ctx.font = F.title;
      ctx.textAlign = 'center';
      const py = touch ? h - 170 : h - 96;
      const tw = ctx.measureText(game.prompt).width + 28;
      ctx.fillStyle = 'rgba(8,13,24,0.8)';
      ctx.fillRect(w / 2 - tw / 2, py - 18, tw, 28);
      ctx.strokeStyle = C.gate;
      ctx.strokeRect(w / 2 - tw / 2 + 0.5, py - 17.5, tw - 1, 27);
      ctx.fillStyle = C.text;
      ctx.fillText(game.prompt, w / 2, py + 1);
      ctx.textAlign = 'left';
    }

    // Meldinger.
    ctx.textAlign = 'center';
    game.messages.forEach((m, i) => {
      const a = Math.min(1, m.t);
      ctx.globalAlpha = a;
      ctx.font = F.title;
      ctx.fillStyle = m.color || C.text;
      ctx.fillText(m.text, w / 2, (touch ? sy + sh + 28 : 36) + i * 22);
    });
    ctx.globalAlpha = 1;
    ctx.textAlign = 'left';

    // Rød kant når skroget er kritisk.
    if (s.hull / st.hullMax < 0.3 && !game.dead) {
      const a = 0.25 + 0.2 * Math.sin(game.time * 6);
      const g = ctx.createRadialGradient(w / 2, h / 2, Math.min(w, h) * 0.35, w / 2, h / 2, Math.max(w, h) * 0.75);
      g.addColorStop(0, 'rgba(255,40,30,0)');
      g.addColorStop(1, `rgba(255,40,30,${a})`);
      ctx.fillStyle = g;
      ctx.fillRect(0, 0, w, h);
    }
  };
})();
