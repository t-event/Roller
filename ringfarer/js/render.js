// All tegning: bakgrunn, verden, skip, partikler. HUD ligger i hud.js.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  // --- Partikler ---
  class Particles {
    constructor(max = 1400) { this.list = []; this.max = max; }
    add(p) {
      if (this.list.length >= this.max) this.list.shift();
      p.life = p.max = p.life || 1;
      this.list.push(p);
    }
    burst(x, y, n, o) {
      for (let i = 0; i < n; i++) {
        const a = (o.dir != null ? o.dir + G.rand(-o.spread, o.spread) : Math.random() * 6.283);
        const sp = G.rand(o.sMin || 2, o.sMax || 10);
        this.add({
          type: o.type || 'spark', x, y,
          vx: Math.cos(a) * sp + (o.vx || 0), vy: Math.sin(a) * sp + (o.vy || 0),
          life: G.rand(o.lMin || 0.3, o.lMax || 0.9), size: G.rand(o.zMin || 0.2, o.zMax || 0.6),
          color: o.color || '#ffcf80', grow: o.grow || 0,
        });
      }
    }
    update(dt) {
      for (const p of this.list) {
        p.x += p.vx * dt; p.y += p.vy * dt;
        p.life -= dt;
        p.size += p.grow * dt;
        if (p.type === 'smoke') { p.vx *= 1 - dt * 0.4; p.vy *= 1 - dt * 0.4; }
      }
      if (this.list.length && this.list[0].life <= 0) this.list = this.list.filter((p) => p.life > 0);
      else if (this.list.some((p) => p.life <= 0)) this.list = this.list.filter((p) => p.life > 0);
    }
  }
  RF.Particles = Particles;

  // --- Bakgrunn ---
  function makeStars(n, seed) {
    let s = seed;
    const rnd = () => ((s = (s * 16807) % 2147483647) / 2147483647);
    const out = [];
    for (let i = 0; i < n; i++) {
      const t = rnd();
      out.push({ x: rnd() * 2048, y: rnd() * 2048, r: 0.4 + rnd() * 1.1, a: 0.3 + rnd() * 0.7,
        c: t < 0.1 ? '#ffd6a8' : t < 0.2 ? '#bcd8ff' : '#ffffff' });
    }
    return out;
  }

  function makeNebula(sky) {
    const c = document.createElement('canvas');
    c.width = c.height = 512;
    const x = c.getContext('2d');
    x.fillStyle = sky.deep;
    x.fillRect(0, 0, 512, 512);
    let seed = sky.neb.join('').length * 7919;
    const rnd = () => ((seed = (seed * 16807) % 2147483647) / 2147483647);
    x.globalCompositeOperation = 'lighter';
    for (let i = 0; i < 26; i++) {
      const cx = rnd() * 512, cy = rnd() * 512, r = 60 + rnd() * 200;
      const col = sky.neb[i % sky.neb.length];
      const g = x.createRadialGradient(cx, cy, 0, cx, cy, r);
      g.addColorStop(0, col + '55');
      g.addColorStop(1, col + '00');
      x.fillStyle = g;
      x.fillRect(0, 0, 512, 512);
    }
    return c;
  }

  class Renderer {
    constructor(canvas) {
      this.canvas = canvas;
      this.ctx = canvas.getContext('2d');
      this.layers = [
        { stars: makeStars(260, 11), par: 0.04 },
        { stars: makeStars(160, 23), par: 0.1 },
        { stars: makeStars(70, 37), par: 0.22 },
      ];
      this.nebulae = {};
      this.resize();
    }

    resize() {
      const dpr = Math.min(window.devicePixelRatio || 1, 2);
      this.dpr = dpr;
      this.w = window.innerWidth;
      this.h = window.innerHeight;
      this.canvas.width = Math.floor(this.w * dpr);
      this.canvas.height = Math.floor(this.h * dpr);
      this.canvas.style.width = this.w + 'px';
      this.canvas.style.height = this.h + 'px';
    }

    toScreen(cam, x, y) {
      return { x: (x - cam.x) * cam.zoom + this.w / 2, y: (y - cam.y) * cam.zoom + this.h / 2 };
    }

    drawBackground(game) {
      const { ctx, w, h, dpr } = this;
      const cam = game.cam, def = game.sys.def, sky = def.sky;
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      ctx.fillStyle = sky.deep;
      ctx.fillRect(0, 0, w, h);

      let neb = this.nebulae[def.id];
      if (!neb) neb = this.nebulae[def.id] = makeNebula(sky);
      const size = Math.max(w, h) * 1.6;
      const nx = -((cam.x * 0.01) % size) - size * 0.3, ny = -((cam.y * 0.01) % size) - size * 0.3;
      ctx.globalAlpha = 0.9;
      ctx.drawImage(neb, nx, ny, size, size);
      ctx.drawImage(neb, nx + size, ny, size, size);
      ctx.drawImage(neb, nx, ny + size, size, size);
      ctx.drawImage(neb, nx + size, ny + size, size, size);
      ctx.globalAlpha = 1;

      // Solen ligger uendelig langt unna i retning starDir.
      const sd = sky.starDir;
      const sx = w / 2 + Math.cos(sd) * Math.max(w, h) * 0.62, sy = h / 2 + Math.sin(sd) * Math.max(w, h) * 0.62;
      const sg = ctx.createRadialGradient(sx, sy, 0, sx, sy, Math.max(w, h) * 0.5);
      sg.addColorStop(0, sky.star + 'cc');
      sg.addColorStop(0.05, sky.star + '55');
      sg.addColorStop(0.3, sky.star + '14');
      sg.addColorStop(1, sky.star + '00');
      ctx.globalCompositeOperation = 'lighter';
      ctx.fillStyle = sg;
      ctx.fillRect(0, 0, w, h);
      ctx.globalCompositeOperation = 'source-over';

      // Planet i bakgrunnen.
      const pl = def.planet;
      const pr = Math.min(w, h) * pl.r;
      const px = pl.x * w - cam.x * 0.02, py = pl.y * h - cam.y * 0.02;
      const lx = Math.cos(sd), ly = Math.sin(sd);
      if (pl.ring) {
        ctx.save();
        ctx.translate(px, py); ctx.rotate(-0.35); ctx.scale(1, 0.28);
        ctx.strokeStyle = pl.band + '55'; ctx.lineWidth = pr * 0.35;
        ctx.beginPath(); ctx.arc(0, 0, pr * 1.75, Math.PI, Math.PI * 2); ctx.stroke();
        ctx.restore();
      }
      const pg = ctx.createRadialGradient(px + lx * pr * 0.5, py + ly * pr * 0.5, pr * 0.1, px, py, pr);
      pg.addColorStop(0, pl.band);
      pg.addColorStop(0.55, pl.color);
      pg.addColorStop(1, '#05070c');
      ctx.fillStyle = pg;
      ctx.beginPath(); ctx.arc(px, py, pr, 0, Math.PI * 2); ctx.fill();
      ctx.save();
      ctx.beginPath(); ctx.arc(px, py, pr, 0, Math.PI * 2); ctx.clip();
      ctx.globalAlpha = 0.18; ctx.strokeStyle = pl.band; ctx.lineWidth = pr * 0.06;
      for (let i = -3; i <= 3; i++) {
        ctx.beginPath(); ctx.ellipse(px, py + i * pr * 0.26, pr * 1.1, pr * 0.06, -0.1, 0, Math.PI * 2); ctx.stroke();
      }
      ctx.globalAlpha = 1;
      const shade = ctx.createLinearGradient(px + lx * pr, py + ly * pr, px - lx * pr, py - ly * pr);
      shade.addColorStop(0, 'rgba(0,0,0,0)');
      shade.addColorStop(0.55, 'rgba(0,0,0,0.25)');
      shade.addColorStop(1, 'rgba(0,0,0,0.85)');
      ctx.fillStyle = shade; ctx.fillRect(px - pr, py - pr, pr * 2, pr * 2);
      ctx.restore();
      if (pl.ring) {
        ctx.save();
        ctx.translate(px, py); ctx.rotate(-0.35); ctx.scale(1, 0.28);
        ctx.strokeStyle = pl.band + '77'; ctx.lineWidth = pr * 0.35;
        ctx.beginPath(); ctx.arc(0, 0, pr * 1.75, 0, Math.PI); ctx.stroke();
        ctx.restore();
      }

      // Stjerner i tre parallaks-lag.
      for (const L of this.layers) {
        const ox = -cam.x * L.par, oy = -cam.y * L.par;
        for (const s of L.stars) {
          let x = (s.x + ox) % 2048, y = (s.y + oy) % 2048;
          if (x < 0) x += 2048;
          if (y < 0) y += 2048;
          for (let tx = x; tx < w; tx += 2048) {
            for (let ty = y; ty < h; ty += 2048) {
              ctx.globalAlpha = s.a;
              ctx.fillStyle = s.c;
              ctx.fillRect(tx, ty, s.r, s.r);
            }
          }
        }
      }
      ctx.globalAlpha = 1;
    }

    draw(game) {
      const { ctx, w, h, dpr } = this;
      const cam = game.cam;
      this.drawBackground(game);
      const z = cam.zoom;
      ctx.setTransform(dpr * z, 0, 0, dpr * z, dpr * (w / 2 - cam.x * z), dpr * (h / 2 - cam.y * z));
      this.px = 1 / z; // én skjermpiksel i meter
      const view = { x0: cam.x - w / 2 / z - 80, x1: cam.x + w / 2 / z + 80, y0: cam.y - h / 2 / z - 80, y1: cam.y + h / 2 / z + 80 };
      const vis = (x, y, r) => x + r > view.x0 && x - r < view.x1 && y + r > view.y0 && y - r < view.y1;
      const sys = game.sys;
      const sunDir = sys.def.sky.starDir;

      this.drawGate(sys.gate, game.time, vis);
      this.drawStation(sys.station, game, vis);

      for (const b of sys.world.bodies) {
        if ((b.kind === 'rock' || b.kind === 'ore') && vis(b.x, b.y, b.radius)) this.drawRock(b, sunDir);
      }

      // Traktorstråler.
      const ship = game.ship;
      if (ship && !game.dead) {
        const T = ship.tractor;
        if (T.on) {
          const ip = ship.body.toWorld(RF.SHIP_NOSE.x + 1.2, 0);
          ctx.globalCompositeOperation = 'lighter';
          for (const o of T.targets) {
            const gr = ctx.createLinearGradient(ip.x, ip.y, o.x, o.y);
            gr.addColorStop(0, 'rgba(120,255,210,0.55)');
            gr.addColorStop(1, 'rgba(120,255,210,0.05)');
            ctx.strokeStyle = gr;
            ctx.lineWidth = Math.max(0.8, Math.sqrt(o.area) * 1.2);
            ctx.setLineDash([1.2, 1.4]);
            ctx.lineDashOffset = -game.time * 10;
            ctx.beginPath(); ctx.moveTo(ip.x, ip.y); ctx.lineTo(o.x, o.y); ctx.stroke();
          }
          ctx.setLineDash([]);
          ctx.globalCompositeOperation = 'source-over';
        }
        this.drawShip(ship, game.time, sunDir);
        this.drawLaser(ship, game.time);
      }

      this.drawParticles(game.particles, vis);
    }

    drawRock(b, sunDir) {
      const ctx = this.ctx, M = RF.MATERIALS[b.mat];
      ctx.save();
      ctx.translate(b.x, b.y);
      ctx.rotate(b.a);
      const v = b.verts;
      ctx.beginPath();
      ctx.moveTo(v[0].x, v[0].y);
      for (let i = 1; i < v.length; i++) ctx.lineTo(v[i].x, v[i].y);
      ctx.closePath();
      ctx.fillStyle = M.base;
      ctx.fill();
      const r = b.radius;
      const la = sunDir - b.a, lx = Math.cos(la), ly = Math.sin(la);
      const g = ctx.createLinearGradient(lx * r, ly * r, -lx * r, -ly * r);
      g.addColorStop(0, M.light + 'dd');
      g.addColorStop(0.45, M.light + '00');
      g.addColorStop(0.6, M.dark + '00');
      g.addColorStop(1, M.dark + 'ee');
      ctx.fillStyle = g;
      ctx.fill();
      if (b.craters.length || b.veins.length) {
        ctx.save();
        ctx.clip();
        for (const c of b.craters) {
          ctx.fillStyle = M.dark + '99';
          ctx.beginPath(); ctx.arc(c.x, c.y, c.r, 0, Math.PI * 2); ctx.fill();
          ctx.fillStyle = M.light + '44';
          ctx.beginPath(); ctx.arc(c.x - lx * c.r * 0.25, c.y - ly * c.r * 0.25, c.r * 0.75, 0, Math.PI * 2); ctx.fill();
          ctx.fillStyle = M.dark + '88';
          ctx.beginPath(); ctx.arc(c.x - lx * c.r * 0.12, c.y - ly * c.r * 0.12, c.r * 0.7, 0, Math.PI * 2); ctx.fill();
        }
        if (b.veins.length) {
          ctx.globalCompositeOperation = 'lighter';
          ctx.strokeStyle = M.vein + '88';
          ctx.lineWidth = Math.max(0.35, r * 0.05);
          ctx.lineJoin = 'round';
          for (const vn of b.veins) {
            ctx.beginPath();
            ctx.moveTo(vn[0].x, vn[0].y);
            for (let i = 1; i < vn.length; i++) ctx.lineTo(vn[i].x, vn[i].y);
            ctx.stroke();
          }
          ctx.globalCompositeOperation = 'source-over';
        }
        ctx.restore();
      }
      ctx.strokeStyle = b.kind === 'ore' ? M.light + 'cc' : M.dark;
      ctx.lineWidth = this.px * (b.kind === 'ore' ? 1.4 : 1.2);
      ctx.stroke();
      if (b.kind === 'ore' && M.vein) {
        ctx.fillStyle = M.vein + '55';
        ctx.fill();
      }
      ctx.restore();

      // Små malmbiter får en markør så de synes når man zoomer ut.
      if (b.kind === 'ore' && b.radius < this.px * 3) {
        ctx.fillStyle = (M.vein || M.light) + 'aa';
        ctx.beginPath(); ctx.arc(b.x, b.y, this.px * 1.8, 0, Math.PI * 2); ctx.fill();
      }
      // Glød der laseren har varmet opp steinen.
      if (b.heat > 0.02 && b.hitX != null) {
        const hr = 1.5 + b.heat * 3.5;
        const hg = ctx.createRadialGradient(b.hitX, b.hitY, 0, b.hitX, b.hitY, hr);
        hg.addColorStop(0, `rgba(255,240,200,${0.9 * b.heat})`);
        hg.addColorStop(0.35, `rgba(255,140,40,${0.6 * b.heat})`);
        hg.addColorStop(1, 'rgba(255,60,0,0)');
        ctx.globalCompositeOperation = 'lighter';
        ctx.fillStyle = hg;
        ctx.beginPath(); ctx.arc(b.hitX, b.hitY, hr, 0, Math.PI * 2); ctx.fill();
        ctx.globalCompositeOperation = 'source-over';
      }
    }

    drawShip(ship, time, sunDir) {
      const ctx = this.ctx, b = ship.body, fx = ship.fx;
      ctx.save();
      ctx.translate(b.x, b.y);
      ctx.rotate(b.a);

      // Motorflammer (bak skroget).
      ctx.globalCompositeOperation = 'lighter';
      const flame = (x, y, dx, dy, len, wid, hot) => {
        if (len < 0.15) return;
        const ex = x + dx * len, ey = y + dy * len;
        const g = ctx.createLinearGradient(x, y, ex, ey);
        g.addColorStop(0, hot ? 'rgba(220,245,255,0.95)' : 'rgba(210,235,255,0.8)');
        g.addColorStop(0.25, hot ? 'rgba(90,180,255,0.75)' : 'rgba(150,200,255,0.5)');
        g.addColorStop(1, 'rgba(40,80,255,0)');
        ctx.fillStyle = g;
        ctx.beginPath();
        ctx.moveTo(x - dy * wid, y + dx * wid);
        ctx.quadraticCurveTo(ex - dy * wid * 0.4, ey + dx * wid * 0.4, ex, ey);
        ctx.quadraticCurveTo(ex + dy * wid * 0.4, ey - dx * wid * 0.4, x + dy * wid, y - dx * wid);
        ctx.closePath();
        ctx.fill();
      };
      const fl = fx.main * (0.85 + Math.random() * 0.3);
      for (const s of [-1, 1]) {
        flame(-8.1, s * 2.9, -1, 0, 3 + fl * 11, 1.0, true);
        if (fl > 0.05) {
          const hg = ctx.createRadialGradient(-8.3, s * 2.9, 0, -8.3, s * 2.9, 3 + fl * 3);
          hg.addColorStop(0, `rgba(120,190,255,${0.5 * fl})`);
          hg.addColorStop(1, 'rgba(60,120,255,0)');
          ctx.fillStyle = hg;
          ctx.beginPath(); ctx.arc(-8.3, s * 2.9, 3 + fl * 3, 0, Math.PI * 2); ctx.fill();
        }
        flame(5.2, s * 3.1, 0.6, s * 0.35, fx.retro * 4.5, 0.45, false);
      }
      flame(1, 4.0, 0, 1, fx.left * 3, 0.35, false);
      flame(1, -4.0, 0, -1, fx.right * 3, 0.35, false);
      flame(6.2, -2.4, 0, -1, fx.rotR * 2.6, 0.3, false);
      flame(-5.8, 4.2, 0, 1, fx.rotR * 2.6, 0.3, false);
      flame(6.2, 2.4, 0, 1, fx.rotL * 2.6, 0.3, false);
      flame(-5.8, -4.2, 0, -1, fx.rotL * 2.6, 0.3, false);
      ctx.globalCompositeOperation = 'source-over';

      // Motorgondoler.
      for (const s of [-1, 1]) {
        const y0 = s * 1.7, y1 = s * 4.1;
        ctx.fillStyle = '#2b323c';
        ctx.fillRect(-8.2, Math.min(y0, y1), 6.8, Math.abs(y1 - y0));
        ctx.fillStyle = '#56606d';
        ctx.fillRect(-8.2, Math.min(y0, y1), 1.1, Math.abs(y1 - y0));
        ctx.fillStyle = '#9fb3c8';
        ctx.fillRect(-8.4, s * 2.9 - 0.8, 0.5, 1.6);
      }

      // Hovedskrog.
      const hull = [[8.6, 0], [6.6, 1.5], [4.6, 3.3], [0, 3.9], [-4.4, 4.5], [-7.2, 3.1], [-7.2, -3.1], [-4.4, -4.5], [0, -3.9], [4.6, -3.3], [6.6, -1.5]];
      const path = () => {
        ctx.beginPath();
        ctx.moveTo(hull[0][0], hull[0][1]);
        for (let i = 1; i < hull.length; i++) ctx.lineTo(hull[i][0], hull[i][1]);
        ctx.closePath();
      };
      path();
      const la = sunDir - b.a;
      const hg = ctx.createLinearGradient(Math.cos(la) * 7, Math.sin(la) * 7, -Math.cos(la) * 7, -Math.sin(la) * 7);
      hg.addColorStop(0, '#b9c4d2');
      hg.addColorStop(0.5, '#7d8a9b');
      hg.addColorStop(1, '#3a424e');
      ctx.fillStyle = hg;
      ctx.fill();

      ctx.save();
      ctx.clip();
      // Rygg og panellinjer.
      ctx.fillStyle = 'rgba(30,36,46,0.55)';
      ctx.beginPath();
      ctx.moveTo(6.2, 0.9); ctx.lineTo(-6.6, 1.5); ctx.lineTo(-6.6, -1.5); ctx.lineTo(6.2, -0.9);
      ctx.closePath(); ctx.fill();
      ctx.strokeStyle = 'rgba(20,24,30,0.6)';
      ctx.lineWidth = 0.12;
      for (const x of [2.4, -0.8, -3.6]) {
        ctx.beginPath(); ctx.moveTo(x, -4.6); ctx.lineTo(x - 0.4, 4.6); ctx.stroke();
      }
      ctx.beginPath(); ctx.moveTo(4.5, 2.2); ctx.lineTo(-5.5, 3.1); ctx.moveTo(4.5, -2.2); ctx.lineTo(-5.5, -3.1); ctx.stroke();
      // Varselstriper.
      ctx.fillStyle = '#e0a63a';
      for (const s of [-1, 1]) {
        for (let i = 0; i < 4; i++) {
          ctx.beginPath();
          const x = -1.8 + i * 0.9;
          ctx.moveTo(x, s * 3.35); ctx.lineTo(x + 0.45, s * 3.35); ctx.lineTo(x + 0.9, s * 4.3); ctx.lineTo(x + 0.45, s * 4.3);
          ctx.closePath(); ctx.fill();
        }
      }
      // Arr etter støt.
      for (const sc of ship.scars) {
        const g = ctx.createRadialGradient(sc.x, sc.y, 0, sc.x, sc.y, sc.r);
        g.addColorStop(0, 'rgba(15,12,10,0.9)');
        g.addColorStop(0.6, 'rgba(40,30,25,0.5)');
        g.addColorStop(1, 'rgba(40,30,25,0)');
        ctx.fillStyle = g;
        ctx.beginPath(); ctx.arc(sc.x, sc.y, sc.r, 0, Math.PI * 2); ctx.fill();
      }
      ctx.restore();

      path();
      ctx.strokeStyle = '#161b22';
      ctx.lineWidth = Math.max(0.12, this.px * 1.2);
      ctx.stroke();

      // Cockpit.
      ctx.beginPath();
      ctx.moveTo(7.4, 0); ctx.lineTo(5.7, 1.25); ctx.lineTo(3.3, 1.35); ctx.lineTo(3.3, -1.35); ctx.lineTo(5.7, -1.25);
      ctx.closePath();
      const cg = ctx.createLinearGradient(7.4, -1.3, 3.3, 1.3);
      cg.addColorStop(0, '#b8f4ff');
      cg.addColorStop(0.4, '#3fb4de');
      cg.addColorStop(1, '#0f3550');
      ctx.fillStyle = cg;
      ctx.fill();
      ctx.strokeStyle = '#0b1117';
      ctx.lineWidth = 0.15;
      ctx.stroke();
      ctx.strokeStyle = 'rgba(255,255,255,0.7)';
      ctx.lineWidth = 0.12;
      ctx.beginPath(); ctx.moveTo(6.6, -0.4); ctx.lineTo(4.4, -0.9); ctx.stroke();

      // Laseremitter.
      ctx.fillStyle = ship.laser.on ? '#ffd9a0' : '#20262e';
      ctx.beginPath(); ctx.arc(8.2, 0, 0.45, 0, Math.PI * 2); ctx.fill();

      // Navigasjonslys: rødt babord, grønt styrbord, blinkende hvitt akter.
      const blink = (time * 1.2) % 1 < 0.12;
      ctx.globalCompositeOperation = 'lighter';
      const light = (x, y, col, r) => {
        const g = ctx.createRadialGradient(x, y, 0, x, y, r);
        g.addColorStop(0, col);
        g.addColorStop(1, 'rgba(0,0,0,0)');
        ctx.fillStyle = g;
        ctx.beginPath(); ctx.arc(x, y, r, 0, Math.PI * 2); ctx.fill();
      };
      light(-4.2, -4.4, 'rgba(255,60,60,0.9)', 1.2);
      light(-4.2, 4.4, 'rgba(60,255,120,0.9)', 1.2);
      if (blink) light(-7.3, 0, 'rgba(255,255,255,1)', 2.2);

      // Skjold som blusser opp ved treff.
      if (ship.shieldFlash > 0.01) {
        const a = ship.shieldFlash;
        ctx.save();
        ctx.scale(1, 0.68);
        const sg = ctx.createRadialGradient(0, 0, 8, 0, 0, 12.5);
        sg.addColorStop(0, 'rgba(90,200,255,0)');
        sg.addColorStop(0.8, `rgba(90,200,255,${0.25 * a})`);
        sg.addColorStop(1, `rgba(170,230,255,${0.7 * a})`);
        ctx.fillStyle = sg;
        ctx.beginPath(); ctx.arc(0, 0, 12.5, 0, Math.PI * 2); ctx.fill();
        const hd = ship.shieldHitDir;
        ctx.strokeStyle = `rgba(200,240,255,${a})`;
        ctx.lineWidth = 0.6;
        ctx.beginPath(); ctx.arc(0, 0, 12.2, hd - 0.6, hd + 0.6); ctx.stroke();
        ctx.restore();
      }
      ctx.globalCompositeOperation = 'source-over';
      ctx.restore();
    }

    drawLaser(ship, time) {
      const L = ship.laser;
      if (!L.on) return;
      const ctx = this.ctx, b = ship.body;
      const p0 = b.toWorld(RF.SHIP_NOSE.x - 0.8, 0);
      const d = b.dirWorld(1, 0);
      const p1 = { x: p0.x + d.x * (L.len + 0.8), y: p0.y + d.y * (L.len + 0.8) };
      ctx.globalCompositeOperation = 'lighter';
      const flick = 0.75 + Math.random() * 0.25;
      ctx.lineCap = 'round';
      ctx.strokeStyle = `rgba(255,120,40,${0.35 * flick})`;
      ctx.lineWidth = 1.6;
      ctx.beginPath(); ctx.moveTo(p0.x, p0.y); ctx.lineTo(p1.x, p1.y); ctx.stroke();
      ctx.strokeStyle = `rgba(255,230,180,${0.9 * flick})`;
      ctx.lineWidth = 0.45;
      ctx.beginPath(); ctx.moveTo(p0.x, p0.y); ctx.lineTo(p1.x, p1.y); ctx.stroke();
      if (L.hit) {
        const r = 3 + Math.random() * 1.5;
        const g = ctx.createRadialGradient(L.hit.x, L.hit.y, 0, L.hit.x, L.hit.y, r);
        g.addColorStop(0, 'rgba(255,255,230,1)');
        g.addColorStop(0.3, 'rgba(255,170,60,0.7)');
        g.addColorStop(1, 'rgba(255,80,0,0)');
        ctx.fillStyle = g;
        ctx.beginPath(); ctx.arc(L.hit.x, L.hit.y, r, 0, Math.PI * 2); ctx.fill();
      }
      ctx.lineCap = 'butt';
      ctx.globalCompositeOperation = 'source-over';
    }

    drawStation(st, game, vis) {
      if (!vis(st.x, st.y, 130)) return;
      const ctx = this.ctx, t = game.time;
      ctx.save();
      ctx.translate(st.x, st.y);
      ctx.rotate(st.a);
      const px = this.px;

      // Solpanel-master og paneler.
      for (const s of [-1, 1]) {
        ctx.fillStyle = '#3a4250';
        ctx.fillRect(-5, s > 0 ? 30 : -44, 10, 14);
        const y0 = s > 0 ? 44 : -110;
        ctx.fillStyle = '#12233f';
        ctx.fillRect(-40, y0, 80, 66);
        ctx.strokeStyle = '#3a6cae';
        ctx.lineWidth = Math.max(0.25, px);
        for (let x = -40; x <= 40; x += 8) { ctx.beginPath(); ctx.moveTo(x, y0); ctx.lineTo(x, y0 + 66); ctx.stroke(); }
        for (let y = 0; y <= 66; y += 11) { ctx.beginPath(); ctx.moveTo(-40, y0 + y); ctx.lineTo(40, y0 + y); ctx.stroke(); }
        ctx.fillStyle = 'rgba(160,200,255,0.08)';
        ctx.fillRect(-40, y0, 40, 66);
        ctx.fillStyle = '#4c5563';
        ctx.fillRect(-3, y0, 6, 66);
      }
      // Antennemast med parabol.
      ctx.fillStyle = '#4a5260';
      ctx.fillRect(-74, -4, 38, 8);
      ctx.fillStyle = '#8894a4';
      ctx.beginPath(); ctx.ellipse(-78, 0, 5, 12, 0, 0, Math.PI * 2); ctx.fill();
      ctx.strokeStyle = '#2a3038'; ctx.lineWidth = Math.max(0.3, px); ctx.stroke();

      // Dokkingsarm.
      ctx.fillStyle = '#5a6474';
      ctx.fillRect(36, -8, 60, 16);
      ctx.fillStyle = '#39414d';
      for (let x = 42; x < 94; x += 9) ctx.fillRect(x, -8, 3, 16);
      // Dokkingsbukt: U-ramme.
      ctx.fillStyle = '#6c7888';
      ctx.fillRect(94, -14, 6, 28);
      ctx.fillRect(94, -14, 14, 4);
      ctx.fillRect(94, 10, 14, 4);
      const dockOk = game.dockReady;
      const lc = dockOk ? '80,255,150' : '255,190,80';
      ctx.globalCompositeOperation = 'lighter';
      for (let i = 0; i < 5; i++) {
        const on = ((t * 3 - i * 0.4) % 2) < 0.6;
        const a = on ? 0.95 : 0.25;
        ctx.fillStyle = `rgba(${lc},${a})`;
        ctx.beginPath(); ctx.arc(100 + i * 4, -12, 0.9, 0, Math.PI * 2); ctx.arc(100 + i * 4, 12, 0.9, 0, Math.PI * 2); ctx.fill();
      }
      ctx.globalCompositeOperation = 'source-over';
      // Landingsmål.
      ctx.strokeStyle = `rgba(${lc},0.5)`;
      ctx.lineWidth = Math.max(0.3, px * 1.2);
      ctx.setLineDash([2, 2]);
      ctx.beginPath(); ctx.arc(116, 0, 11, 0, Math.PI * 2); ctx.stroke();
      ctx.setLineDash([]);

      // Nav.
      const hub = G.regular(38, 8, Math.PI / 8);
      ctx.beginPath();
      hub.forEach((p, i) => (i ? ctx.lineTo(p.x, p.y) : ctx.moveTo(p.x, p.y)));
      ctx.closePath();
      const hg = ctx.createRadialGradient(-10, -10, 4, 0, 0, 40);
      hg.addColorStop(0, '#a8b3c2');
      hg.addColorStop(0.7, '#5e6878');
      hg.addColorStop(1, '#343b47');
      ctx.fillStyle = hg;
      ctx.fill();
      ctx.strokeStyle = '#1b2029';
      ctx.lineWidth = Math.max(0.4, px * 1.5);
      ctx.stroke();
      // Roterende habitatring (visuell).
      ctx.save();
      ctx.rotate(t * 0.05);
      ctx.strokeStyle = '#2d3440';
      ctx.lineWidth = 5;
      ctx.beginPath(); ctx.arc(0, 0, 25, 0, Math.PI * 2); ctx.stroke();
      ctx.fillStyle = 'rgba(255,214,140,0.85)';
      for (let i = 0; i < 24; i++) {
        const a = (i / 24) * Math.PI * 2;
        if ((i * 7) % 5 === 0) continue;
        ctx.fillRect(Math.cos(a) * 25 - 0.6, Math.sin(a) * 25 - 0.6, 1.2, 1.2);
      }
      ctx.restore();
      ctx.fillStyle = '#20262f';
      ctx.beginPath(); ctx.arc(0, 0, 14, 0, Math.PI * 2); ctx.fill();
      const dg = ctx.createRadialGradient(-3, -3, 1, 0, 0, 12);
      dg.addColorStop(0, '#d6f4ff');
      dg.addColorStop(0.5, '#4aa6cf');
      dg.addColorStop(1, '#123448');
      ctx.fillStyle = dg;
      ctx.beginPath(); ctx.arc(0, 0, 11, 0, Math.PI * 2); ctx.fill();
      // Varsellys på hjørnene.
      ctx.globalCompositeOperation = 'lighter';
      if ((t % 1.6) < 0.2) {
        ctx.fillStyle = 'rgba(255,80,80,0.95)';
        for (const p of hub) { ctx.beginPath(); ctx.arc(p.x, p.y, 1.4, 0, Math.PI * 2); ctx.fill(); }
      }
      ctx.globalCompositeOperation = 'source-over';
      ctx.restore();
    }

    drawGate(g, time, vis) {
      if (!vis(g.x, g.y, 60)) return;
      const ctx = this.ctx, R = RF.GATE_R, depth = R * 0.34;
      ctx.save();
      ctx.translate(g.x, g.y);
      ctx.rotate(g.a);

      const open = g.state === 'open' || g.state === 'kawoosh' || g.state === 'closing';
      if (open) {
        let a = 1;
        if (g.state === 'closing') a = Math.max(0, 1 - g.t / 0.6);
        // Hendelseshorisont: blått, krusende vann.
        const hg = ctx.createRadialGradient(0, 0, 0, 0, 0, R);
        hg.addColorStop(0, `rgba(210,245,255,${0.95 * a})`);
        hg.addColorStop(0.5, `rgba(80,170,255,${0.85 * a})`);
        hg.addColorStop(1, `rgba(20,70,200,${0.8 * a})`);
        ctx.save();
        ctx.scale(depth / R, 1);
        ctx.fillStyle = hg;
        ctx.beginPath(); ctx.arc(0, 0, R - 1.2, 0, Math.PI * 2); ctx.fill();
        ctx.globalCompositeOperation = 'lighter';
        for (let i = 0; i < 5; i++) {
          const rr = ((time * 4 + i * 3.2) % 16) / 16;
          ctx.strokeStyle = `rgba(200,240,255,${0.35 * (1 - rr) * a})`;
          ctx.lineWidth = 0.8;
          ctx.beginPath(); ctx.arc(Math.sin(time * 1.3 + i) * 0.8, 0, rr * (R - 1.5), 0, Math.PI * 2); ctx.stroke();
        }
        ctx.restore();
        ctx.globalCompositeOperation = 'lighter';
        const glow = ctx.createRadialGradient(0, 0, 0, 0, 0, R * 1.8);
        glow.addColorStop(0, `rgba(90,180,255,${0.35 * a})`);
        glow.addColorStop(1, 'rgba(90,180,255,0)');
        ctx.fillStyle = glow;
        ctx.beginPath(); ctx.arc(0, 0, R * 1.8, 0, Math.PI * 2); ctx.fill();
        ctx.globalCompositeOperation = 'source-over';
      }

      // Kawoosh: ustabil virvel som skyter ut foran porten.
      if (g.state === 'kawoosh') {
        const k = Math.sin(Math.min(1, g.t / RF.KAWOOSH_TIME) * Math.PI);
        const L = RF.KAWOOSH_LEN * k;
        ctx.globalCompositeOperation = 'lighter';
        const kg = ctx.createRadialGradient(L * 0.35, 0, 0, L * 0.35, 0, L * 0.7 + 4);
        kg.addColorStop(0, 'rgba(255,255,255,0.95)');
        kg.addColorStop(0.4, 'rgba(120,200,255,0.8)');
        kg.addColorStop(1, 'rgba(40,110,255,0)');
        ctx.fillStyle = kg;
        ctx.beginPath(); ctx.ellipse(L * 0.45, 0, L * 0.55 + 2, R * 0.85, 0, 0, Math.PI * 2); ctx.fill();
        ctx.globalCompositeOperation = 'source-over';
      }

      // Selve ringen, sett på skrå.
      ctx.save();
      ctx.scale(depth / R, 1);
      ctx.lineWidth = 4.6;
      ctx.strokeStyle = '#3d4452';
      ctx.beginPath(); ctx.arc(0, 0, R, 0, Math.PI * 2); ctx.stroke();
      ctx.lineWidth = 1.2;
      ctx.strokeStyle = '#7d889a';
      ctx.beginPath(); ctx.arc(0, 0, R - 1.6, 0, Math.PI * 2); ctx.stroke();
      ctx.strokeStyle = '#262b35';
      ctx.lineWidth = 0.5;
      for (let i = 0; i < 39; i++) {
        const a = (i / 39) * Math.PI * 2;
        ctx.beginPath();
        ctx.moveTo(Math.cos(a) * (R - 1.8), Math.sin(a) * (R - 1.8));
        ctx.lineTo(Math.cos(a) * (R + 1.8), Math.sin(a) * (R + 1.8));
        ctx.stroke();
      }
      ctx.restore();
      // Chevroner.
      for (let i = 0; i < 9; i++) {
        const a = -Math.PI / 2 + (i / 9) * Math.PI * 2;
        const cx = Math.cos(a) * depth, cy = Math.sin(a) * R;
        const lit = i < 7 && (g.chevrons > i || open);
        ctx.save();
        ctx.translate(cx, cy);
        ctx.fillStyle = lit ? '#ffb04a' : '#6a4a2a';
        ctx.beginPath();
        ctx.moveTo(-1.6, -1.2); ctx.lineTo(1.6, -1.2); ctx.lineTo(0, 1.4); ctx.closePath();
        ctx.rotate(0);
        ctx.fill();
        if (lit) {
          ctx.globalCompositeOperation = 'lighter';
          const lg = ctx.createRadialGradient(0, 0, 0, 0, 0, 4);
          lg.addColorStop(0, 'rgba(255,170,60,0.8)');
          lg.addColorStop(1, 'rgba(255,120,20,0)');
          ctx.fillStyle = lg;
          ctx.beginPath(); ctx.arc(0, 0, 4, 0, Math.PI * 2); ctx.fill();
          ctx.globalCompositeOperation = 'source-over';
        }
        ctx.restore();
      }
      // Pil som viser hvilken side som er forsiden.
      ctx.strokeStyle = 'rgba(120,200,255,0.35)';
      ctx.lineWidth = Math.max(0.3, this.px);
      ctx.setLineDash([2, 3]);
      ctx.beginPath(); ctx.moveTo(depth + 4, 0); ctx.lineTo(depth + 40, 0); ctx.stroke();
      ctx.setLineDash([]);
      ctx.restore();
    }

    drawParticles(P, vis) {
      const ctx = this.ctx;
      for (const p of P.list) {
        if (!vis(p.x, p.y, 10)) continue;
        const k = Math.max(0, p.life / p.max);
        if (p.type === 'smoke') {
          ctx.globalCompositeOperation = 'source-over';
          ctx.fillStyle = p.color;
          ctx.globalAlpha = k * 0.45;
          ctx.beginPath(); ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2); ctx.fill();
        } else if (p.type === 'debris') {
          ctx.globalCompositeOperation = 'source-over';
          ctx.globalAlpha = Math.min(1, k * 2);
          ctx.fillStyle = p.color;
          ctx.fillRect(p.x - p.size / 2, p.y - p.size / 2, p.size, p.size);
        } else {
          ctx.globalCompositeOperation = 'lighter';
          ctx.globalAlpha = k;
          ctx.strokeStyle = p.color;
          ctx.lineWidth = p.size;
          ctx.beginPath();
          ctx.moveTo(p.x, p.y);
          ctx.lineTo(p.x - p.vx * 0.05, p.y - p.vy * 0.05);
          ctx.stroke();
          if (p.type === 'glow') {
            ctx.fillStyle = p.color;
            ctx.beginPath(); ctx.arc(p.x, p.y, p.size * 2, 0, Math.PI * 2); ctx.fill();
          }
        }
      }
      ctx.globalAlpha = 1;
      ctx.globalCompositeOperation = 'source-over';
    }
  }

  RF.Renderer = Renderer;
})();
