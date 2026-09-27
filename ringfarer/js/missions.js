// Oppdrag: frakt (last fra A til B, noen ganger skjør) og levering av råvarer.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  const GOODS = [
    { name: 'Medisinsk forsyning', fragile: 0.7 },
    { name: 'Reservedeler', fragile: 0.1 },
    { name: 'Forskningsprøver', fragile: 0.8 },
    { name: 'Hydrokultur-moduler', fragile: 0.4 },
    { name: 'Post og pakker', fragile: 0.2 },
    { name: 'Reaktorstaver', fragile: 0.9, bonus: 1.4 },
    { name: 'Kryolagrede embryoer', fragile: 1, bonus: 1.6 },
  ];

  let nextId = 1;

  RF.stationName = (id) => RF.stationById(id).station.name;

  RF.genMission = (fromId) => {
    const others = RF.SYSTEMS.filter((s) => s.station.id !== fromId).map((s) => s.station.id);
    const risky = (id) => (id === 'muspel' ? 1.45 : 1);
    if (Math.random() < 0.55) {
      const g = G.pick(GOODS);
      const to = G.pick(others);
      const mass = G.randInt(2, 8);
      const fragile = Math.random() < g.fragile;
      const maxDv = fragile ? G.pick([3, 4, 5]) : 0;
      let reward = (260 + mass * 48) * risky(to) * risky(fromId) * (g.bonus || 1) * (fragile ? 1.4 + (5 - maxDv) * 0.15 : 1);
      reward = Math.round(reward / 10) * 10;
      return { id: nextId++, type: 'frakt', from: fromId, to, goods: g.name, mass, fragile, maxDv, reward, status: 'tilbud' };
    }
    const prod = G.weighted({ jern: 0.3, nikkel: 0.35, vann: 0.25, naquadah: 0.1 });
    const amount = prod === 'naquadah' ? G.pick([0.5, 1, 1.5]) : G.randInt(3, 9);
    const to = Math.random() < 0.6 ? fromId : G.pick(others);
    const P = RF.PRODUCTS[prod];
    const reward = Math.round((P.price * amount * 1.7 * risky(to) + 120) / 10) * 10;
    return { id: nextId++, type: 'levering', from: fromId, to, product: prod, amount, reward, status: 'tilbud' };
  };

  RF.missionTitle = (m) => {
    if (m.type === 'frakt') return `Frakt ${m.mass} t ${m.goods.toLowerCase()}`;
    return `Lever ${String(m.amount).replace('.', ',')} t ${RF.PRODUCTS[m.product].name.toLowerCase()}`;
  };

  RF.missionShort = (m) => `${RF.missionTitle(m)} → ${RF.stationName(m.to)}`;

  RF.missionDetail = (m) => {
    const to = RF.stationById(m.to);
    const where = `${to.station.name} (${to.name})`;
    if (m.type === 'frakt') {
      let s = `Lastes om bord nå, leveres automatisk når du dokker ved ${where}.`;
      if (m.fragile) s += ` Skjør last: ett støt over ${m.maxDv} m/s ødelegger den.`;
      return s;
    }
    return `Bor ut og prosesser råvaren selv, eller kjøp den billig et annet sted. Leveres ved ${where}.`;
  };

  RF.setMissionIdBase = (n) => { nextId = Math.max(nextId, n + 1); };
})();
