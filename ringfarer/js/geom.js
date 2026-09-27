// Geometri og små hjelpefunksjoner. Alle polygoner er konvekse og har
// positivt fortegnsareal (shoelace), slik at utovervendt normal for kanten
// a->b er (e.y, -e.x). Enheter i spillet: meter, sekunder, kilo, newton.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = {};

  G.clamp = (v, a, b) => (v < a ? a : v > b ? b : v);
  G.lerp = (a, b, t) => a + (b - a) * t;
  G.rand = (a, b) => a + Math.random() * (b - a);
  G.randInt = (a, b) => Math.floor(G.rand(a, b + 1));
  G.pick = (arr) => arr[Math.floor(Math.random() * arr.length)];
  G.len = (x, y) => Math.sqrt(x * x + y * y);
  G.wrapAngle = (a) => {
    while (a > Math.PI) a -= 2 * Math.PI;
    while (a < -Math.PI) a += 2 * Math.PI;
    return a;
  };
  // Vektet tilfeldig valg: { navn: vekt, ... }
  G.weighted = (table) => {
    let sum = 0;
    for (const k in table) sum += table[k];
    let r = Math.random() * sum;
    for (const k in table) {
      r -= table[k];
      if (r <= 0) return k;
    }
    return Object.keys(table)[0];
  };

  G.polyArea = (v) => {
    let s = 0;
    for (let i = 0, n = v.length; i < n; i++) {
      const a = v[i], b = v[(i + 1) % n];
      s += a.x * b.y - b.x * a.y;
    }
    return s / 2;
  };

  G.polyCentroid = (v) => {
    let cx = 0, cy = 0, A = 0;
    for (let i = 0, n = v.length; i < n; i++) {
      const a = v[i], b = v[(i + 1) % n];
      const c = a.x * b.y - b.x * a.y;
      A += c;
      cx += (a.x + b.x) * c;
      cy += (a.y + b.y) * c;
    }
    A *= 0.5;
    if (Math.abs(A) < 1e-9) return { x: v[0].x, y: v[0].y };
    return { x: cx / (6 * A), y: cy / (6 * A) };
  };

  // Treghetsmoment om origo per enhet flatetetthet.
  G.polyInertia = (v) => {
    let num = 0;
    for (let i = 0, n = v.length; i < n; i++) {
      const a = v[i], b = v[(i + 1) % n];
      const cr = a.x * b.y - b.x * a.y;
      num += cr * (a.x * a.x + a.x * b.x + b.x * b.x + a.y * a.y + a.y * b.y + b.y * b.y);
    }
    return Math.abs(num / 12);
  };

  G.polyRadius = (v) => {
    let r = 0;
    for (const p of v) r = Math.max(r, p.x * p.x + p.y * p.y);
    return Math.sqrt(r);
  };

  // Andrews monotone chain. Gir positivt areal.
  G.convexHull = (pts) => {
    const p = pts.slice().sort((a, b) => a.x - b.x || a.y - b.y);
    if (p.length < 3) return p;
    const cross = (o, a, b) => (a.x - o.x) * (b.y - o.y) - (a.y - o.y) * (b.x - o.x);
    const lower = [], upper = [];
    for (const q of p) {
      while (lower.length >= 2 && cross(lower[lower.length - 2], lower[lower.length - 1], q) <= 0) lower.pop();
      lower.push(q);
    }
    for (let i = p.length - 1; i >= 0; i--) {
      const q = p[i];
      while (upper.length >= 2 && cross(upper[upper.length - 2], upper[upper.length - 1], q) <= 0) upper.pop();
      upper.push(q);
    }
    upper.pop();
    lower.pop();
    return lower.concat(upper);
  };

  // Behold delen av polygonet der dot(n, p) <= d.
  G.clipPoly = (v, nx, ny, d) => {
    const out = [];
    for (let i = 0, n = v.length; i < n; i++) {
      const a = v[i], b = v[(i + 1) % n];
      const da = a.x * nx + a.y * ny - d;
      const db = b.x * nx + b.y * ny - d;
      if (da <= 0) out.push({ x: a.x, y: a.y });
      if ((da < 0 && db > 0) || (da > 0 && db < 0)) {
        const t = da / (da - db);
        out.push({ x: a.x + (b.x - a.x) * t, y: a.y + (b.y - a.y) * t });
      }
    }
    return out;
  };

  // Fjern nesten like punkter og nesten rette hjørner, så gjentatte kutt
  // ikke gir polygoner med hundrevis av punkter.
  G.simplify = (v, eps = 0.15) => {
    let out = v.slice();
    let changed = true;
    while (changed && out.length > 3) {
      changed = false;
      for (let i = 0; i < out.length && out.length > 3; i++) {
        const a = out[(i - 1 + out.length) % out.length], b = out[i], c = out[(i + 1) % out.length];
        const abx = b.x - a.x, aby = b.y - a.y, bcx = c.x - b.x, bcy = c.y - b.y;
        const lab = G.len(abx, aby);
        const cr = abx * bcy - aby * bcx;
        if (lab < eps || Math.abs(cr) < eps * 0.05 * (lab + G.len(bcx, bcy))) {
          out.splice(i, 1);
          changed = true;
          i--;
        }
      }
    }
    return out;
  };

  // Del et konvekst polygon i to langs en linje gjennom punkt p med retning (dx,dy).
  G.splitPoly = (v, px, py, dx, dy) => {
    const nx = -dy, ny = dx;
    const d = nx * px + ny * py;
    return [G.clipPoly(v, nx, ny, d), G.clipPoly(v, -nx, -ny, -d)];
  };

  // Del opp til alle biter har areal <= maxArea. Kutter på tvers av lengste akse.
  G.fragment = (v, maxArea, out, depth = 0) => {
    const A = G.polyArea(v);
    if (A <= maxArea || depth > 8 || v.length < 3) {
      out.push(v);
      return out;
    }
    const c = G.polyCentroid(v);
    let far = v[0], fd = -1;
    for (const p of v) {
      const d = (p.x - c.x) ** 2 + (p.y - c.y) ** 2;
      if (d > fd) { fd = d; far = p; }
    }
    // Kuttlinjen står vinkelrett på lengste retning, med litt tilfeldighet.
    let ax = far.x - c.x, ay = far.y - c.y;
    const ang = Math.atan2(ay, ax) + Math.PI / 2 + G.rand(-0.35, 0.35);
    const off = G.rand(-0.15, 0.15) * Math.sqrt(A);
    const px = c.x + Math.cos(ang - Math.PI / 2) * off, py = c.y + Math.sin(ang - Math.PI / 2) * off;
    const [a, b] = G.splitPoly(v, px, py, Math.cos(ang), Math.sin(ang));
    if (a.length >= 3) G.fragment(a, maxArea, out, depth + 1);
    if (b.length >= 3) G.fragment(b, maxArea, out, depth + 1);
    return out;
  };

  // Tilfeldig konvekst asteroide-omriss rundt origo.
  G.rockShape = (r, n) => {
    const pts = [];
    for (let i = 0; i < n; i++) {
      const a = (i / n) * Math.PI * 2 + G.rand(-0.25, 0.25);
      const rr = r * G.rand(0.72, 1.12);
      pts.push({ x: Math.cos(a) * rr, y: Math.sin(a) * rr * G.rand(0.8, 1.0) });
    }
    return G.convexHull(pts);
  };

  G.box = (x0, y0, x1, y1) => [
    { x: x0, y: y0 }, { x: x1, y: y0 }, { x: x1, y: y1 }, { x: x0, y: y1 },
  ];

  G.regular = (r, n, rot = 0) => {
    const v = [];
    for (let i = 0; i < n; i++) {
      const a = rot + (i / n) * Math.PI * 2;
      v.push({ x: Math.cos(a) * r, y: Math.sin(a) * r });
    }
    return v;
  };

  RF.G = G;
})();
