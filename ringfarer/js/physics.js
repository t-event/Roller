// Stiv-legeme-fysikk for konvekse polygoner: SAT-kollisjon med
// kontaktpunkt-klipping, sekvensielle impulser med restitusjon og friksjon,
// og posisjonskorreksjon. Kraft påføres utenfra som impuls (F*dt) før step().
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  let nextId = 1;

  class Body {
    constructor(verts, density, o = {}) {
      this.id = nextId++;
      this.x = o.x || 0;
      this.y = o.y || 0;
      this.a = o.a || 0;
      this.vx = o.vx || 0;
      this.vy = o.vy || 0;
      this.w = o.w || 0;
      this.restitution = o.restitution != null ? o.restitution : 0.25;
      this.friction = o.friction != null ? o.friction : 0.5;
      this.kind = o.kind || 'rock';
      this.density = density;
      this.isStatic = !(density > 0);
      this.dead = false;
      this.wv = [];
      this.wn = [];
      this.setShape(verts);
    }

    // verts er i kroppens lokale koordinater. Flytter origo til tyngdepunktet
    // uten at noe hopper i verden, og regner ut masse og treghetsmoment.
    setShape(verts) {
      if (G.polyArea(verts) < 0) verts = verts.slice().reverse();
      const c = G.polyCentroid(verts);
      const cs = Math.cos(this.a), sn = Math.sin(this.a);
      const ox = c.x * cs - c.y * sn, oy = c.x * sn + c.y * cs;
      this.x += ox;
      this.y += oy;
      this.vx += -this.w * oy;
      this.vy += this.w * ox;
      this.verts = verts.map((p) => ({ x: p.x - c.x, y: p.y - c.y }));
      this.area = G.polyArea(this.verts);
      this.radius = G.polyRadius(this.verts);
      this.normals = [];
      for (let i = 0, n = this.verts.length; i < n; i++) {
        const a = this.verts[i], b = this.verts[(i + 1) % n];
        const ex = b.x - a.x, ey = b.y - a.y;
        const l = G.len(ex, ey) || 1;
        this.normals.push({ x: ey / l, y: -ex / l });
      }
      if (this.isStatic) {
        this.mass = Infinity; this.invMass = 0; this.I = Infinity; this.invI = 0;
      } else {
        this.mass = this.area * this.density;
        this.I = G.polyInertia(this.verts) * this.density;
        this.invMass = 1 / this.mass;
        this.invI = 1 / this.I;
      }
      this.baseMass = this.mass;
      this.baseI = this.I;
      return { x: c.x, y: c.y };
    }

    // Brukes av skipet når last og drivstoff endrer massen.
    setMass(m) {
      if (this.isStatic) return;
      this.I = this.baseI * (m / this.baseMass);
      this.mass = m;
      this.invMass = 1 / m;
      this.invI = 1 / this.I;
    }

    updateWorld() {
      const cs = Math.cos(this.a), sn = Math.sin(this.a);
      const n = this.verts.length;
      if (this.wv.length !== n) {
        this.wv = this.verts.map(() => ({ x: 0, y: 0 }));
        this.wn = this.verts.map(() => ({ x: 0, y: 0 }));
      }
      for (let i = 0; i < n; i++) {
        const p = this.verts[i], q = this.normals[i];
        this.wv[i].x = this.x + p.x * cs - p.y * sn;
        this.wv[i].y = this.y + p.x * sn + p.y * cs;
        this.wn[i].x = q.x * cs - q.y * sn;
        this.wn[i].y = q.x * sn + q.y * cs;
      }
    }

    toWorld(lx, ly) {
      const cs = Math.cos(this.a), sn = Math.sin(this.a);
      return { x: this.x + lx * cs - ly * sn, y: this.y + lx * sn + ly * cs };
    }

    toLocal(px, py) {
      const cs = Math.cos(this.a), sn = Math.sin(this.a);
      const dx = px - this.x, dy = py - this.y;
      return { x: dx * cs + dy * sn, y: -dx * sn + dy * cs };
    }

    // Retning i lokale akser -> verden (uten translasjon).
    dirWorld(lx, ly) {
      const cs = Math.cos(this.a), sn = Math.sin(this.a);
      return { x: lx * cs - ly * sn, y: lx * sn + ly * cs };
    }

    pointVel(px, py) {
      return { x: this.vx - this.w * (py - this.y), y: this.vy + this.w * (px - this.x) };
    }

    applyImpulse(jx, jy, px, py) {
      if (this.isStatic) return;
      this.vx += jx * this.invMass;
      this.vy += jy * this.invMass;
      this.w += this.invI * ((px - this.x) * jy - (py - this.y) * jx);
    }

    applyForce(fx, fy, px, py, dt) {
      this.applyImpulse(fx * dt, fy * dt, px, py);
    }

    containsPoint(px, py) {
      const l = this.toLocal(px, py);
      for (let i = 0; i < this.verts.length; i++) {
        const v = this.verts[i], n = this.normals[i];
        if ((l.x - v.x) * n.x + (l.y - v.y) * n.y > 0) return false;
      }
      return true;
    }
  }

  // --- Kollisjon (SAT + klipping, som i Box2D Lite) ---

  function maxSeparation(A, B) {
    let best = -Infinity, bi = 0;
    for (let i = 0; i < A.wv.length; i++) {
      const n = A.wn[i], v = A.wv[i];
      let si = Infinity;
      for (let j = 0; j < B.wv.length; j++) {
        const d = n.x * (B.wv[j].x - v.x) + n.y * (B.wv[j].y - v.y);
        if (d < si) si = d;
      }
      if (si > best) { best = si; bi = i; }
    }
    return [best, bi];
  }

  function clipSegment(pts, nx, ny, off) {
    const out = [];
    const d0 = nx * pts[0].x + ny * pts[0].y - off;
    const d1 = nx * pts[1].x + ny * pts[1].y - off;
    if (d0 <= 0) out.push(pts[0]);
    if (d1 <= 0) out.push(pts[1]);
    if (d0 * d1 < 0) {
      const t = d0 / (d0 - d1);
      out.push({ x: pts[0].x + (pts[1].x - pts[0].x) * t, y: pts[0].y + (pts[1].y - pts[0].y) * t });
    }
    return out;
  }

  function collide(A, B) {
    const [sepA, eA] = maxSeparation(A, B);
    if (sepA > 0) return null;
    const [sepB, eB] = maxSeparation(B, A);
    if (sepB > 0) return null;

    let ref, inc, ri, flip;
    if (sepB > sepA * 0.95 + 0.01) { ref = B; inc = A; ri = eB; flip = true; }
    else { ref = A; inc = B; ri = eA; flip = false; }

    const n = ref.wn[ri];
    let ii = 0, md = Infinity;
    for (let i = 0; i < inc.wn.length; i++) {
      const d = n.x * inc.wn[i].x + n.y * inc.wn[i].y;
      if (d < md) { md = d; ii = i; }
    }
    const i2 = (ii + 1) % inc.wv.length;
    let seg = [{ x: inc.wv[ii].x, y: inc.wv[ii].y }, { x: inc.wv[i2].x, y: inc.wv[i2].y }];

    const v1 = ref.wv[ri], v2 = ref.wv[(ri + 1) % ref.wv.length];
    let tx = v2.x - v1.x, ty = v2.y - v1.y;
    const tl = G.len(tx, ty) || 1;
    tx /= tl; ty /= tl;

    seg = clipSegment(seg, -tx, -ty, -(tx * v1.x + ty * v1.y));
    if (seg.length < 2) return null;
    seg = clipSegment(seg, tx, ty, tx * v2.x + ty * v2.y);
    if (seg.length < 2) return null;

    const points = [];
    for (const p of seg) {
      const s = n.x * (p.x - v1.x) + n.y * (p.y - v1.y);
      if (s <= 0) points.push({ x: p.x - n.x * s * 0.5, y: p.y - n.y * s * 0.5, depth: -s });
    }
    if (!points.length) return null;
    return { A, B, nx: flip ? -n.x : n.x, ny: flip ? -n.y : n.y, points };
  }

  class World {
    constructor() {
      this.bodies = [];
      this.contacts = [];
      this.iterations = 8;
      this.onImpact = null; // (contact, J, vn0) => void
      this.shouldCollide = null; // (A, B) => bool
    }

    add(b) { this.bodies.push(b); return b; }

    remove(b) { b.dead = true; }

    step(dt) {
      const bodies = this.bodies;
      for (const b of bodies) b.updateWorld();

      // Bred fase: sorter og feie langs x (nesten sortert fra forrige steg).
      for (let i = 1; i < bodies.length; i++) {
        const b = bodies[i], k = b.x - b.radius;
        let j = i - 1;
        while (j >= 0 && bodies[j].x - bodies[j].radius > k) { bodies[j + 1] = bodies[j]; j--; }
        bodies[j + 1] = b;
      }
      const contacts = (this.contacts = []);
      for (let i = 0; i < bodies.length; i++) {
        const A = bodies[i];
        if (A.dead || A.ghost) continue;
        const maxX = A.x + A.radius;
        for (let j = i + 1; j < bodies.length; j++) {
          const B = bodies[j];
          if (B.x - B.radius > maxX) break;
          if (B.dead || B.ghost || (A.isStatic && B.isStatic)) continue;
          const rr = A.radius + B.radius;
          const dx = B.x - A.x, dy = B.y - A.y;
          if (dx * dx + dy * dy > rr * rr) continue;
          if (this.shouldCollide && !this.shouldCollide(A, B)) continue;
          const c = collide(A, B);
          if (c) contacts.push(c);
        }
      }

      // Forbered kontakter.
      for (const c of contacts) {
        const { A, B, nx, ny } = c;
        const tx = -ny, ty = nx;
        const e = (A.restitution + B.restitution) * 0.5;
        const mu = Math.sqrt(A.friction * B.friction);
        c.mu = mu;
        c.vn0 = 0;
        for (const p of c.points) {
          p.rAx = p.x - A.x; p.rAy = p.y - A.y;
          p.rBx = p.x - B.x; p.rBy = p.y - B.y;
          const rnA = p.rAx * ny - p.rAy * nx, rnB = p.rBx * ny - p.rBy * nx;
          const rtA = p.rAx * ty - p.rAy * tx, rtB = p.rBx * ty - p.rBy * tx;
          p.mN = 1 / (A.invMass + B.invMass + A.invI * rnA * rnA + B.invI * rnB * rnB);
          p.mT = 1 / (A.invMass + B.invMass + A.invI * rtA * rtA + B.invI * rtB * rtB);
          const dvx = B.vx - B.w * p.rBy - A.vx + A.w * p.rAy;
          const dvy = B.vy + B.w * p.rBx - A.vy - A.w * p.rAx;
          const vn = dvx * nx + dvy * ny;
          p.bias = vn < -0.6 ? -e * vn : 0;
          p.jn = 0; p.jt = 0;
          if (vn < c.vn0) c.vn0 = vn;
        }
      }

      // Sekvensielle impulser.
      for (let it = 0; it < this.iterations; it++) {
        for (const c of contacts) {
          const { A, B, nx, ny } = c;
          const tx = -ny, ty = nx;
          for (const p of c.points) {
            let dvx = B.vx - B.w * p.rBy - A.vx + A.w * p.rAy;
            let dvy = B.vy + B.w * p.rBx - A.vy - A.w * p.rAx;
            const vn = dvx * nx + dvy * ny;
            let dj = p.mN * (-vn + p.bias);
            const j0 = p.jn;
            p.jn = Math.max(j0 + dj, 0);
            dj = p.jn - j0;
            let Px = dj * nx, Py = dj * ny;
            A.vx -= Px * A.invMass; A.vy -= Py * A.invMass;
            A.w -= A.invI * (p.rAx * Py - p.rAy * Px);
            B.vx += Px * B.invMass; B.vy += Py * B.invMass;
            B.w += B.invI * (p.rBx * Py - p.rBy * Px);

            dvx = B.vx - B.w * p.rBy - A.vx + A.w * p.rAy;
            dvy = B.vy + B.w * p.rBx - A.vy - A.w * p.rAx;
            const vt = dvx * tx + dvy * ty;
            let djt = p.mT * -vt;
            const maxF = c.mu * p.jn;
            const t0 = p.jt;
            p.jt = G.clamp(t0 + djt, -maxF, maxF);
            djt = p.jt - t0;
            Px = djt * tx; Py = djt * ty;
            A.vx -= Px * A.invMass; A.vy -= Py * A.invMass;
            A.w -= A.invI * (p.rAx * Py - p.rAy * Px);
            B.vx += Px * B.invMass; B.vy += Py * B.invMass;
            B.w += B.invI * (p.rBx * Py - p.rBy * Px);
          }
        }
      }

      if (this.onImpact) {
        for (const c of contacts) {
          let J = 0;
          for (const p of c.points) J += p.jn;
          if (J > 0) this.onImpact(c, J, c.vn0);
        }
      }

      // Posisjonskorreksjon mot inntrengning.
      for (const c of contacts) {
        const { A, B, nx, ny } = c;
        const im = A.invMass + B.invMass;
        if (im <= 0) continue;
        let depth = 0;
        for (const p of c.points) depth = Math.max(depth, p.depth);
        const corr = (Math.max(depth - 0.03, 0) * 0.45) / im;
        A.x -= nx * corr * A.invMass; A.y -= ny * corr * A.invMass;
        B.x += nx * corr * B.invMass; B.y += ny * corr * B.invMass;
      }

      // Integrer posisjon.
      for (const b of bodies) {
        if (b.isStatic) continue;
        b.x += b.vx * dt;
        b.y += b.vy * dt;
        b.a += b.w * dt;
      }

      if (bodies.some((b) => b.dead)) this.bodies = bodies.filter((b) => !b.dead);
    }

    // Stråle fra (ox,oy) i retning (dx,dy) (normalisert). Returnerer nærmeste treff.
    raycast(ox, oy, dx, dy, maxLen, filter) {
      let best = null;
      for (const b of this.bodies) {
        if (b.dead || (filter && !filter(b))) continue;
        const cx = b.x - ox, cy = b.y - oy;
        const along = cx * dx + cy * dy;
        if (along < -b.radius || along > maxLen + b.radius) continue;
        const perp = Math.abs(cx * dy - cy * dx);
        if (perp > b.radius) continue;
        b.updateWorld();
        let tIn = 0, tOut = maxLen, ni = -1;
        let miss = false;
        for (let i = 0; i < b.wv.length; i++) {
          const n = b.wn[i], v = b.wv[i];
          const denom = n.x * dx + n.y * dy;
          const num = n.x * (v.x - ox) + n.y * (v.y - oy);
          if (Math.abs(denom) < 1e-9) {
            if (num < 0) { miss = true; break; }
            continue;
          }
          const t = num / denom;
          if (denom < 0) { if (t > tIn) { tIn = t; ni = i; } }
          else if (t < tOut) tOut = t;
          if (tIn > tOut) { miss = true; break; }
        }
        if (miss || ni < 0) continue;
        if (!best || tIn < best.t) {
          best = { body: b, t: tIn, x: ox + dx * tIn, y: oy + dy * tIn, nx: b.wn[ni].x, ny: b.wn[ni].y };
        }
      }
      return best;
    }
  }

  RF.Body = Body;
  RF.PhysicsWorld = World;
})();
