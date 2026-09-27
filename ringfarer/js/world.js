// Materialer, varer, stjernesystemer, stasjoner og porter.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  // density er flatetetthet i kg/m² (2D-verden), grade er andelen av råmassen
  // som blir ferdig vare etter prosessering om bord.
  RF.MATERIALS = {
    kondritt: { name: 'Kondritt', product: 'jern', density: 1500, grade: 0.35,
      base: '#6f655b', dark: '#3a332d', light: '#a09282' },
    metall: { name: 'Metallisk', product: 'nikkel', density: 2600, grade: 0.6,
      base: '#5f6873', dark: '#2a3038', light: '#b7c2cf' },
    is: { name: 'Is', product: 'vann', density: 750, grade: 0.85,
      base: '#a9c9dd', dark: '#5f7f98', light: '#effaff' },
    naquadah: { name: 'Naquadah-malm', product: 'naquadah', density: 3400, grade: 0.25,
      base: '#2c323d', dark: '#141820', light: '#4a5465', vein: '#5dffc8' },
  };

  RF.PRODUCTS = {
    jern: { name: 'Jern', price: 42, color: '#c79a6b' },
    nikkel: { name: 'Nikkel-jern', price: 96, color: '#b7c2cf' },
    vann: { name: 'Vannis', price: 30, color: '#9fd8ff' },
    naquadah: { name: 'Naquadah', price: 1150, color: '#5dffc8' },
  };

  // Største bit (m²) som får plass i inntaket og kan prosesseres.
  RF.ORE_MAX_AREA = 4.5;
  // Biter under dette blir bare støv.
  RF.DUST_AREA = 0.22;

  RF.SYSTEMS = [
    {
      id: 'midgard',
      name: 'Midgard',
      blurb: 'Hjemsystemet. Rolig asteroidebelte med jern og nikkel.',
      sky: { deep: '#060a14', neb: ['#1c3358', '#3a2150', '#123a4a'], star: '#ffd9a0', starDir: -2.3 },
      planet: { color: '#3f6fa8', band: '#6aa0d8', r: 0.26, x: 0.82, y: 0.78, ring: false },
      station: { id: 'midgard', name: 'Midgard Verft', x: 0, y: 0, a: 0,
        prices: { jern: 1.0, nikkel: 1.05, vann: 1.1, naquadah: 1.15 } },
      gate: { x: 900, y: -1100, a: Math.PI * 0.6 },
      glyphs: [0, 3, 5, 1, 6, 2, 4],
      fields: [
        { cx: 700, cy: 650, rx: 900, ry: 420, rot: 0.3, count: 62, rMin: 3, rMax: 26, drift: 1.2,
          mats: { kondritt: 0.66, metall: 0.32, naquadah: 0.02 } },
        { cx: -900, cy: -500, rx: 450, ry: 300, rot: -0.6, count: 22, rMin: 2.5, rMax: 16, drift: 1.0,
          mats: { kondritt: 0.8, metall: 0.2 } },
      ],
      comets: 0,
    },
    {
      id: 'vanaheim',
      name: 'Vanaheim',
      blurb: 'Handelspost. Kometer med rent is suser gjennom systemet.',
      sky: { deep: '#07100f', neb: ['#12433d', '#1e3a5c', '#0f2a2a'], star: '#cfe8ff', starDir: 0.7 },
      planet: { color: '#b58a52', band: '#e0c08a', r: 0.42, x: 0.18, y: 0.2, ring: true },
      station: { id: 'vanaheim', name: 'Vanaheim Handelspost', x: 0, y: 0, a: Math.PI,
        prices: { jern: 1.25, nikkel: 1.2, vann: 0.7, naquadah: 1.0 } },
      gate: { x: -1200, y: 700, a: -0.4 },
      glyphs: [2, 6, 1, 4, 0, 5, 3],
      fields: [
        { cx: 1100, cy: -300, rx: 700, ry: 500, rot: 0.9, count: 38, rMin: 3, rMax: 20, drift: 1.6,
          mats: { metall: 0.55, is: 0.35, kondritt: 0.1 } },
      ],
      comets: 7,
    },
    {
      id: 'muspel',
      name: 'Muspelheim',
      blurb: 'Farlig. Tett felt i rask bevegelse, men rikt på naquadah.',
      sky: { deep: '#120607', neb: ['#5a1a10', '#3a0f22', '#6a3a10'], star: '#ff9a5a', starDir: 1.9 },
      planet: { color: '#7a2a1a', band: '#d8642a', r: 0.3, x: 0.75, y: 0.22, ring: false },
      station: { id: 'muspel', name: 'Surtr Borestasjon', x: 0, y: 0, a: -Math.PI / 2,
        prices: { jern: 1.3, nikkel: 1.35, vann: 2.6, naquadah: 0.9 } },
      gate: { x: 700, y: 1100, a: -Math.PI * 0.35 },
      glyphs: [5, 1, 4, 6, 3, 0, 2],
      fields: [
        { cx: 1300, cy: -200, rx: 800, ry: 700, rot: 0.2, count: 70, rMin: 2.5, rMax: 22, drift: 7,
          stream: { x: -1, y: 0.35 }, mats: { naquadah: 0.28, metall: 0.42, kondritt: 0.3 } },
        { cx: -700, cy: -900, rx: 500, ry: 400, rot: 0.2, count: 26, rMin: 2.5, rMax: 18, drift: 3,
          mats: { naquadah: 0.15, metall: 0.5, kondritt: 0.35 } },
      ],
      comets: 0,
    },
  ];

  RF.systemById = (id) => RF.SYSTEMS.find((s) => s.id === id);
  RF.stationById = (id) => RF.SYSTEMS.find((s) => s.station.id === id);

  RF.GATE_R = 16;

  // Lager en asteroide (eller en malmbit hvis den er liten nok).
  RF.makeRock = (verts, mat, o) => {
    const M = RF.MATERIALS[mat];
    const b = new RF.Body(verts, M.density, Object.assign({ restitution: mat === 'is' ? 0.12 : 0.22, friction: 0.6 }, o));
    b.mat = mat;
    RF.classifyRock(b);
    b.stress = 0;
    b.heat = 0;
    b.seed = Math.random() * 1000;
    // Kratre og årer i lokale koordinater (relativt til origo før sentrering
    // flytter seg lite, og tegnes med klipping uansett).
    const r = b.radius;
    b.craters = [];
    const nc = b.kind === 'ore' ? 0 : G.randInt(1, Math.min(6, 1 + Math.floor(r / 4)));
    for (let i = 0; i < nc; i++) {
      const a = Math.random() * Math.PI * 2, d = Math.random() * r * 0.6;
      b.craters.push({ x: Math.cos(a) * d, y: Math.sin(a) * d, r: r * G.rand(0.08, 0.22) });
    }
    b.veins = [];
    if (M.vein) {
      const nv = Math.max(2, Math.floor(r / 3));
      for (let i = 0; i < nv; i++) {
        const pts = [];
        let x = G.rand(-r, r) * 0.6, y = G.rand(-r, r) * 0.6, a = Math.random() * 6.28;
        for (let k = 0; k < 5; k++) {
          pts.push({ x, y });
          a += G.rand(-0.8, 0.8);
          x += Math.cos(a) * r * 0.25; y += Math.sin(a) * r * 0.25;
        }
        b.veins.push(pts);
      }
    }
    return b;
  };

  RF.classifyRock = (b) => {
    b.kind = b.area <= RF.ORE_MAX_AREA ? 'ore' : 'rock';
    // Hvor mange sekunder laseren må varme før steinen sprekker.
    b.integrity = 0.8 + 0.12 * Math.sqrt(b.area);
  };

  function makeGateBodies(g) {
    const R = RF.GATE_R;
    const out = [];
    for (const s of [-1, 1]) {
      const b = new RF.Body(G.box(-3, s * R - 2.6, 3, s * R + 2.6), 0,
        { x: g.x, y: g.y, a: g.a, kind: 'gate', restitution: 0.3 });
      out.push(b);
    }
    return out;
  }

  function makeStationBodies(st) {
    // Nav, dokkingsarm, to solpanel-master med paneler, og antennemast.
    const parts = [
      G.regular(38, 8, Math.PI / 8),
      G.box(36, -8, 96, 8),
      G.box(-5, 30, 5, 44),
      G.box(-40, 44, 40, 110),
      G.box(-5, -44, 5, -30),
      G.box(-40, -110, 40, -44),
      G.box(-74, -4, -36, 4),
    ];
    return parts.map((v) => new RF.Body(v, 0, { x: st.x, y: st.y, a: st.a, kind: 'station', restitution: 0.3, friction: 0.7 }));
  }

  // Dokkingspunktet ligger ute ved enden av dokkingsarmen.
  RF.dockPoint = (st) => {
    const cs = Math.cos(st.a), sn = Math.sin(st.a);
    const lx = 116, ly = 0;
    return { x: st.x + lx * cs - ly * sn, y: st.y + lx * sn + ly * cs, a: st.a + Math.PI };
  };

  function spawnField(world, f, avoid) {
    const cs = Math.cos(f.rot), sn = Math.sin(f.rot);
    const placed = avoid.slice();
    for (let i = 0; i < f.count; i++) {
      let tries = 0, x, y, r;
      do {
        const t = Math.random() * Math.PI * 2, d = Math.sqrt(Math.random());
        const lx = Math.cos(t) * d * f.rx, ly = Math.sin(t) * d * f.ry;
        x = f.cx + lx * cs - ly * sn;
        y = f.cy + lx * sn + ly * cs;
        // Mange små, få store.
        r = f.rMin + (f.rMax - f.rMin) * Math.pow(Math.random(), 2.4);
        tries++;
      } while (tries < 20 && placed.some((p) => G.len(p.x - x, p.y - y) < p.r + r + 6));
      placed.push({ x, y, r });
      const mat = G.weighted(f.mats);
      let vx = G.rand(-f.drift, f.drift), vy = G.rand(-f.drift, f.drift);
      if (f.stream) { vx += f.stream.x * f.drift * 1.4; vy += f.stream.y * f.drift * 1.4; }
      const rock = RF.makeRock(G.rockShape(r, G.randInt(8, 13)), mat,
        { x, y, a: Math.random() * 6.28, vx, vy, w: G.rand(-0.25, 0.25) * (6 / (r + 3)) });
      world.add(rock);
    }
  }

  function spawnComet(world, sys, near) {
    const ang = Math.random() * Math.PI * 2;
    const dist = near ? G.rand(900, 1600) : G.rand(1800, 2600);
    const x = Math.cos(ang) * dist, y = Math.sin(ang) * dist;
    // Fart på tvers av systemet, omtrent mot sentrum med avvik.
    const dir = ang + Math.PI + G.rand(-0.5, 0.5);
    const sp = G.rand(12, 24);
    const r = G.rand(9, 20);
    const c = RF.makeRock(G.rockShape(r, 12), 'is',
      { x, y, a: Math.random() * 6.28, vx: Math.cos(dir) * sp, vy: Math.sin(dir) * sp, w: G.rand(-0.1, 0.1) });
    c.comet = true;
    world.add(c);
    return c;
  }

  // Et levende stjernesystem med egen fysikkverden. Tilstanden beholdes når
  // spilleren reiser videre, så asteroider man har knust er fortsatt knust.
  RF.createSystemState = (def) => {
    const world = new RF.PhysicsWorld();
    const station = Object.assign({}, def.station);
    station.bodies = makeStationBodies(station);
    station.bodies.forEach((b) => world.add(b));
    const gate = Object.assign({ state: 'idle', t: 0, chevrons: 0, dest: null, incoming: false }, def.gate);
    gate.bodies = makeGateBodies(gate);
    gate.bodies.forEach((b) => world.add(b));
    // Hold stasjonen og porten fri for stein ved start.
    const avoid = [{ x: station.x, y: station.y, r: 260 }, { x: gate.x, y: gate.y, r: 140 }];
    for (const f of def.fields) spawnField(world, f, avoid);
    const st = { def, world, station, gate, time: 0 };
    for (let i = 0; i < def.comets; i++) spawnComet(world, def, i < 2);
    st.respawnComet = (near) => spawnComet(world, def, near);
    return st;
  };
})();
