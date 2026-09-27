// DOM-paneler: tittel, stasjon (marked, verksted, oppdrag, oppgradering),
// oppringing av porten, pause, hjelp og vrakskjerm.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});
  const G = RF.G;

  let game, root, touchRoot;
  let open = null; // navnet på åpent panel
  let tab = 'marked';

  const $ = (sel) => document.querySelector(sel);
  const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));
  const kr = (n) => Math.round(n).toLocaleString('nb-NO') + ' kr';
  const t = (n, d = 1) => n.toFixed(d).replace('.', ',') + ' t';

  // Syv portsymboler tegnet som enkle SVG-streker.
  const GLYPHS = [
    'M4 20 L12 4 L20 20 Z', 'M4 12 H20 M12 4 V20', 'M5 5 L19 19 M19 5 L5 19 M12 3 V8',
    'M12 3 A9 9 0 1 1 11.9 3 M12 8 V16', 'M4 6 H20 L4 18 H20', 'M6 4 V20 M6 12 L18 4 M6 12 L18 20',
    'M12 3 L20 12 L12 21 L4 12 Z M12 9 V15',
  ];
  const glyph = (i) => `<svg viewBox="0 0 24 24" class="glyph" aria-hidden="true"><path d="${GLYPHS[i]}"/></svg>`;

  function show(name, html) {
    open = name;
    root.innerHTML = html;
    root.hidden = false;
    root.dataset.panel = name;
    game.paused = game.state === 'play' && !game.ship.docked && (name === 'pause' || name === 'help');
    const first = root.querySelector('[data-autofocus]');
    if (first) first.focus({ preventScroll: true });
  }

  const UI = {
    isOpen: () => open !== null,
    closeAll() {
      open = null;
      game.paused = false;
      root.hidden = true;
      root.innerHTML = '';
    },

    init(g) {
      game = g;
      root = $('#panel');
      touchRoot = $('#touch');
      root.addEventListener('click', onClick);
      if (game.touchUI) {
        touchRoot.hidden = false;
        RF.Input.bindTouch(touchRoot);
        document.body.classList.add('touch');
      }
      UI.openTitle();
    },

    tick() {
      if (game.touchUI) {
        const ctx = $('#tc-ctx');
        const act = game.action;
        ctx.textContent = act === 'dock' ? 'DOKK' : act === 'dial' ? 'RING PORT' : act === 'tow' ? 'SLEP' : '—';
        ctx.classList.toggle('ready', !!act);
        $('#tc-tractor').classList.toggle('on', game.ship && game.ship.tractor.on);
        touchRoot.hidden = game.state !== 'play' || UI.isOpen();
      }
    },

    openTitle() {
      const cont = game.hasSave();
      show('title', `
        <div class="card title-card">
          <p class="eyebrow">Hoppeskip MK-I · én pilot · 24 tonn tørrvekt</p>
          <h1>Ringfarer</h1>
          <p class="lede">Bor ut asteroider, fang bitene med traktorstrålen og prosesser dem om bord.
          Ta fraktoppdrag mellom stasjonene og reis gjennom den eldgamle ringporten.
          Alt følger ekte fysikk: masse, treghet og støt. Skipet tåler en trøkk, men ikke alt.</p>
          <div class="row">
            ${cont ? '<button class="btn primary" data-act="continue" data-autofocus>Fortsett karrieren</button>' : ''}
            <button class="btn ${cont ? '' : 'primary'}" data-act="new" ${cont ? '' : 'data-autofocus'}>Ny karriere</button>
            <button class="btn ghost" data-act="help">Kontroller</button>
          </div>
          ${keyList()}
        </div>`);
    },

    openHelp() {
      const back = game.state === 'play' ? 'close' : 'title';
      show('help', `
        <div class="card">
          <h2>Kontroller og tips</h2>
          ${keyList()}
          <h3>Slik tjener du penger</h3>
          <ul class="tips">
            <li><b>Utvinning:</b> hold laseren på en asteroide. Den skjærer av biter og sprekker til slutt. Slå på traktorstrålen og fly rolig mot bitene, så suges de inn i nesen og prosesseres.</li>
            <li><b>Frakt:</b> ta oppdrag på stasjonen. Skjør last tåler bare små støt, så fly pent.</li>
            <li><b>Handel:</b> is er billig i Vanaheim og dyrt på Surtr Borestasjon i Muspelheim.</li>
            <li><b>Porten:</b> ring den med G, vent på virvelen (ikke stå foran!) og fly inn i horisonten forfra.</li>
            <li><b>Fysikk:</b> jo mer last, jo tyngre skip. Større masse betyr lengre bremselengde og hardere støt. Et støt over ca. 1,6 m/s gir skade når skjoldet er tomt.</li>
          </ul>
          <div class="row"><button class="btn primary" data-act="${back}" data-autofocus>Tilbake</button></div>
        </div>`);
    },

    openPause() {
      show('pause', `
        <div class="card narrow">
          <h2>Pause</h2>
          <div class="col">
            <button class="btn primary" data-act="close" data-autofocus>Fortsett</button>
            <button class="btn" data-act="help">Kontroller</button>
            <button class="btn" data-act="mute">${RF.Audio.muted ? 'Slå på lyd' : 'Slå av lyd'}</button>
            <button class="btn ghost" data-act="quit">Til tittelskjermen</button>
          </div>
        </div>`);
    },

    openDead() {
      const fee = Math.min(game.credits, 300 + Math.round(game.credits * 0.1));
      show('dead', `
        <div class="card narrow danger">
          <p class="eyebrow">Skroget brøt sammen</p>
          <h2>Skipet er tapt</h2>
          <p>Redningskapselen din ble plukket opp. Forsikringen gir deg et nytt skrog ved
          ${esc(RF.stationName(game.lastStation))}, med oppgraderingene i behold.</p>
          <p class="muted">Egenandel ${kr(fee)}. Last og fraktoppdrag er tapt.</p>
          <div class="row"><button class="btn primary" data-act="respawn" data-autofocus>Ta over nytt skrog</button></div>
        </div>`);
    },

    openDial() {
      const here = game.sys.def.id;
      const rows = RF.SYSTEMS.filter((s) => s.id !== here).map((s) => `
        <button class="dest" data-act="dial" data-id="${s.id}">
          <span class="glyphs">${s.glyphs.map(glyph).join('')}</span>
          <span class="dest-name">${esc(s.name)}</span>
          <span class="muted">${esc(s.blurb)}</span>
        </button>`).join('');
      show('dial', `
        <div class="card">
          <p class="eyebrow">Oppringingsenhet · ${esc(game.sys.def.name)}</p>
          <h2>Velg adresse</h2>
          <div class="dests">${rows}</div>
          <p class="muted small">Når sju chevroner er låst skyter en virvel ut foran porten. Hold deg unna den, og fly så inn forfra.</p>
          <div class="row"><button class="btn ghost" data-act="close">Avbryt</button></div>
        </div>`);
    },

    openStation() {
      if (open !== 'station') tab = 'marked';
      renderStation();
    },
  };

  function keyList() {
    const k = (keys, what) => `<div class="k"><span>${keys.map((x) => `<kbd>${x}</kbd>`).join('')}</span><span>${what}</span></div>`;
    return `<div class="keys">
      ${k(['W', 'S'], 'Hovedmotor / bremsemotor')}
      ${k(['A', 'D'], 'Drei skipet')}
      ${k(['Q', 'E'], 'Sidestyring')}
      ${k(['Mellomrom'], 'Borelaser (hold)')}
      ${k(['F'], 'Traktorstråle av/på')}
      ${k(['Z'], 'Flygeassistent: av, rotasjon, full')}
      ${k(['T'], 'Dokk ved stasjon')}
      ${k(['G'], 'Ring porten')}
      ${k(['+', '−'], 'Zoom (eller musehjul)')}
      ${k(['M'], 'Lyd av/på')}
      ${k(['Esc'], 'Pause')}
    </div>`;
  }

  function renderStation() {
    const ship = game.ship, s = ship.s, st = ship.docked;
    if (!st) return;
    const tabs = [['marked', 'Marked'], ['verksted', 'Verksted'], ['oppdrag', 'Oppdrag'], ['oppgradering', 'Oppgradering']];
    let body = '';
    if (tab === 'marked') body = marketTab(st);
    else if (tab === 'verksted') body = repairTab();
    else if (tab === 'oppdrag') body = missionsTab(st);
    else body = upgradeTab();
    const scroll = root.querySelector('.tab-body');
    const y = scroll ? scroll.scrollTop : 0;
    show('station', `
      <div class="card station">
        <header class="st-head">
          <div>
            <p class="eyebrow">Dokket · ${esc(game.sys.def.name)}</p>
            <h2>${esc(st.name)}</h2>
          </div>
          <div class="wallet"><span class="num">${Math.floor(game.credits).toLocaleString('nb-NO')}</span><span class="muted">kreditter</span></div>
        </header>
        <div class="hold-line">
          <span>Lasterom ${t(RF.cargoMass(s))} / ${ship.stats.hold} t</span>
          <span>Skrog ${Math.ceil(s.hull)}/${ship.stats.hullMax}</span>
          <span>Drivstoff ${Math.floor(s.fuel)} %</span>
        </div>
        <nav class="tabs" role="tablist">
          ${tabs.map(([id, name]) => `<button role="tab" class="tab ${tab === id ? 'on' : ''}" data-act="tab" data-id="${id}" aria-selected="${tab === id}">${name}</button>`).join('')}
        </nav>
        <div class="tab-body">${body}</div>
        <footer class="row end"><button class="btn primary" data-act="undock" data-autofocus>Forlat stasjonen</button></footer>
      </div>`);
    const nb = root.querySelector('.tab-body');
    if (nb) nb.scrollTop = y;
  }

  function marketTab(st) {
    const s = game.ship.s;
    const free = game.ship.holdFree();
    const rows = Object.keys(RF.PRODUCTS).map((k) => {
      const P = RF.PRODUCTS[k];
      const sell = game.sellPrice(st.id, k), buy = game.buyPrice(st.id, k);
      const have = s.cargo[k];
      const canBuy = Math.min(free, game.credits / buy);
      return `<tr>
        <td><span class="dot" style="background:${P.color}"></span>${esc(P.name)}</td>
        <td class="num">${t(have)}</td>
        <td class="num">${sell}</td>
        <td class="num">${buy}</td>
        <td class="acts">
          <button class="btn sm" data-act="sell" data-id="${k}" ${have < 0.005 ? 'disabled' : ''}>Selg alt</button>
          <button class="btn sm ghost" data-act="buy" data-id="${k}" ${canBuy < 1 ? 'disabled' : ''}>Kjøp 1 t</button>
        </td></tr>`;
    }).join('');
    const mc = s.missionCargo.length
      ? `<p class="muted small">Oppdragslast om bord: ${s.missionCargo.map((c) => `${esc(c.name)} (${c.mass} t)`).join(', ')}</p>` : '';
    let total = 0;
    for (const k in s.cargo) total += s.cargo[k] * game.sellPrice(st.id, k);
    return `<div class="table-wrap"><table>
      <thead><tr><th>Vare</th><th class="num">Om bord</th><th class="num">Selg kr/t</th><th class="num">Kjøp kr/t</th><th></th></tr></thead>
      <tbody>${rows}</tbody></table></div>
      ${mc}
      <div class="row"><button class="btn" data-act="sellall" ${total < 1 ? 'disabled' : ''}>Selg hele lasten (${kr(total)})</button></div>`;
  }

  function repairCosts() {
    const ship = game.ship, s = ship.s;
    const hull = Math.ceil((ship.stats.hullMax - s.hull) * 11);
    const sys = {};
    for (const k in s.sys) sys[k] = Math.ceil((100 - s.sys[k]) * 6);
    const fuel = Math.ceil((100 - s.fuel) * 3);
    return { hull, sys, fuel };
  }

  const SYS_NAMES = { motor: 'Motorer (akter)', rcs: 'Styredyser (sider)', laser: 'Borelaser (nese)', traktor: 'Traktorstråle (nese)' };

  function repairTab() {
    const ship = game.ship, s = ship.s;
    const c = repairCosts();
    const row = (label, val, cost, act) => `<tr><td>${label}</td><td class="num">${val}</td>
      <td class="acts"><button class="btn sm" data-act="${act}" ${cost <= 0 || game.credits < 1 ? 'disabled' : ''}>${cost > 0 ? 'Fiks · ' + kr(cost) : 'OK'}</button></td></tr>`;
    let all = c.hull + c.fuel;
    for (const k in c.sys) all += c.sys[k];
    return `<div class="table-wrap"><table><tbody>
      ${row('Skrog', Math.ceil(s.hull) + ' / ' + ship.stats.hullMax, c.hull, 'rep-hull')}
      ${Object.keys(s.sys).map((k) => row(SYS_NAMES[k], Math.floor(s.sys[k]) + ' %', c.sys[k], 'rep-' + k)).join('')}
      ${row('Drivstoff', Math.floor(s.fuel) + ' %', c.fuel, 'rep-fuel')}
      </tbody></table></div>
      <p class="muted small">Skader treffer der støtet kom: nesen tar laser og traktor, siden tar styredysene, akterenden tar motorene. Skjoldet lades gratis.</p>
      <div class="row"><button class="btn" data-act="rep-all" ${all <= 0 ? 'disabled' : ''}>Fiks alt (${kr(all)})</button></div>`;
  }

  function missionsTab(st) {
    const active = game.missions.filter((m) => m.status === 'aktiv');
    const offers = game.boards[st.id] || [];
    const s = game.ship.s;
    const activeHtml = active.length ? active.map((m) => {
      let btn = '';
      if (m.type === 'levering' && m.to === st.id) {
        const ok = s.cargo[m.product] >= m.amount - 1e-6;
        btn = `<button class="btn sm primary" data-act="deliver" data-id="${m.id}" ${ok ? '' : 'disabled'}>${ok ? 'Lever' : 'Mangler ' + t(m.amount - s.cargo[m.product])}</button>`;
      }
      return `<li class="mission"><div><b>${esc(RF.missionShort(m))}</b><span class="muted">${esc(RF.missionDetail(m))}</span></div>
        <div class="m-side"><span class="num reward">${kr(m.reward)}</span>${btn}
        <button class="btn sm ghost" data-act="abandon" data-id="${m.id}">Avbryt</button></div></li>`;
    }).join('') : '<li class="muted">Ingen aktive oppdrag.</li>';
    const free = game.ship.holdFree();
    const offerHtml = offers.map((m) => {
      const needs = m.type === 'frakt' ? m.mass : 0;
      const block = active.length >= 3 ? 'Maks 3 aktive' : needs > free + 1e-6 ? 'For lite plass' : '';
      const tag = m.type === 'frakt' ? (m.fragile ? `<span class="tag warn">Skjør · maks ${m.maxDv} m/s</span>` : '<span class="tag">Frakt</span>') : '<span class="tag ok">Levering</span>';
      return `<li class="mission"><div>${tag}<b>${esc(RF.missionShort(m))}</b><span class="muted">${esc(RF.missionDetail(m))}</span></div>
        <div class="m-side"><span class="num reward">${kr(m.reward)}</span>
        <button class="btn sm" data-act="accept" data-id="${m.id}" ${block ? 'disabled' : ''}>${block || 'Ta oppdraget'}</button></div></li>`;
    }).join('');
    return `<h3>Aktive</h3><ul class="missions">${activeHtml}</ul><h3>Oppslagstavla</h3><ul class="missions">${offerHtml}</ul>`;
  }

  function upgradeTab() {
    const ship = game.ship, s = ship.s;
    return `<ul class="upgrades">${Object.keys(RF.UPGRADES).map((k) => {
      const U = RF.UPGRADES[k], lv = s.up[k], max = U.levels.length - 1;
      const cur = U.fmt(U.levels[lv]) + ' ' + U.unit;
      const next = lv < max ? U.fmt(U.levels[lv + 1]) + ' ' + U.unit : null;
      const cost = lv < max ? U.cost[lv + 1] : 0;
      const pips = U.levels.map((_, i) => `<i class="${i <= lv ? 'on' : ''}"></i>`).join('');
      return `<li><div><b>${U.name}</b><span class="pips">${pips}</span>
        <span class="muted">${cur}${next ? ' → ' + next : ' · maks'}</span></div>
        ${next ? `<button class="btn sm" data-act="upgrade" data-id="${k}" ${game.credits < cost ? 'disabled' : ''}>Kjøp · ${kr(cost)}</button>` : ''}</li>`;
    }).join('')}</ul>
    <p class="muted small">Tyngre skrogplating gir mer masse. Større lasterom betyr også tyngre skip når det er fullt.</p>`;
  }

  function onClick(e) {
    const el = e.target.closest('[data-act]');
    if (!el || el.disabled) return;
    RF.Audio.start();
    const act = el.dataset.act, id = el.dataset.id;
    const ship = game.ship;
    const s = ship && ship.s;
    const st = ship && ship.docked;
    switch (act) {
      case 'new': game.start(false); UI.openStation(); break;
      case 'continue': game.start(true); UI.openStation(); break;
      case 'help': UI.openHelp(); break;
      case 'title': UI.openTitle(); break;
      case 'close':
        if (ship && ship.docked) UI.openStation(); else UI.closeAll();
        break;
      case 'mute': RF.Audio.setMuted(!RF.Audio.muted); UI.openPause(); break;
      case 'quit': game.save(); game.state = 'title'; location.reload(); break;
      case 'respawn': game.respawn(); break;
      case 'dial': game.dial(id); break;
      case 'undock': game.undock(); break;
      case 'tab': tab = id; renderStation(); break;
      case 'sell': {
        const amt = s.cargo[id];
        const got = amt * game.sellPrice(st.id, id);
        game.credits += got;
        s.cargo[id] = 0;
        game.msg(`Solgte ${t(amt)} ${RF.PRODUCTS[id].name.toLowerCase()} for ${kr(got)}`, RF.HUD_COLORS.ok);
        after();
        break;
      }
      case 'sellall': {
        let got = 0;
        for (const k in s.cargo) { got += s.cargo[k] * game.sellPrice(st.id, k); s.cargo[k] = 0; }
        game.credits += got;
        game.msg(`Solgte hele lasten for ${kr(got)}`, RF.HUD_COLORS.ok);
        after();
        break;
      }
      case 'buy': {
        const p = game.buyPrice(st.id, id);
        if (game.credits >= p && ship.holdFree() >= 1) { game.credits -= p; s.cargo[id] += 1; }
        after();
        break;
      }
      case 'rep-hull': case 'rep-motor': case 'rep-rcs': case 'rep-laser': case 'rep-traktor': case 'rep-fuel': case 'rep-all':
        repair(act.slice(4));
        after();
        break;
      case 'accept': {
        const board = game.boards[st.id];
        const m = board.find((x) => x.id === Number(id));
        if (!m) break;
        m.status = 'aktiv';
        game.boards[st.id] = board.filter((x) => x !== m);
        game.missions.push(m);
        if (m.type === 'frakt') s.missionCargo.push({ missionId: m.id, name: m.goods, mass: m.mass });
        game.msg('Oppdrag tatt: ' + RF.missionTitle(m), RF.HUD_COLORS.gate);
        after();
        break;
      }
      case 'deliver': {
        const m = game.missions.find((x) => x.id === Number(id));
        if (!m || s.cargo[m.product] < m.amount - 1e-6) break;
        s.cargo[m.product] = Math.max(0, s.cargo[m.product] - m.amount);
        game.credits += m.reward;
        m.status = 'fullført';
        game.missions = game.missions.filter((x) => x.status === 'aktiv');
        game.msg(`Oppdrag fullført (+${kr(m.reward)})`, RF.HUD_COLORS.ok);
        after();
        break;
      }
      case 'abandon': {
        const m = game.missions.find((x) => x.id === Number(id));
        if (!m) break;
        game.missions = game.missions.filter((x) => x !== m);
        s.missionCargo = s.missionCargo.filter((c) => c.missionId !== m.id);
        game.msg('Oppdraget ble avbrutt', RF.HUD_COLORS.amber);
        after();
        break;
      }
      case 'upgrade': {
        const U = RF.UPGRADES[id], lv = s.up[id];
        const cost = U.cost[lv + 1];
        if (lv + 1 >= U.levels.length || game.credits < cost) break;
        game.credits -= cost;
        const hullFrac = s.hull / ship.stats.hullMax;
        s.up[id] = lv + 1;
        ship.refreshStats();
        if (id === 'skrog') s.hull = hullFrac * ship.stats.hullMax;
        if (id === 'skjold') ship.shield = ship.stats.shieldMax;
        game.msg(`${U.name} oppgradert`, RF.HUD_COLORS.ok);
        RF.Audio.blip(740, 0.18, 'triangle', 0.12);
        after();
        break;
      }
    }
  }

  function after() {
    game.ship.updateMass();
    game.save();
    renderStation();
  }

  // Betal for så mye reparasjon som man har råd til.
  function repair(what) {
    const ship = game.ship, s = ship.s;
    const items = what === 'all' ? ['hull', 'motor', 'rcs', 'laser', 'traktor', 'fuel'] : [what];
    for (const it of items) {
      if (it === 'hull') {
        const pts = Math.min(ship.stats.hullMax - s.hull, game.credits / 11);
        s.hull += pts; game.credits -= pts * 11;
      } else if (it === 'fuel') {
        const pts = Math.min(100 - s.fuel, game.credits / 3);
        s.fuel += pts; game.credits -= pts * 3;
      } else {
        const pts = Math.min(100 - s.sys[it], game.credits / 6);
        s.sys[it] += pts; game.credits -= pts * 6;
      }
    }
    game.credits = Math.max(0, game.credits);
    RF.Audio.blip(440, 0.1, 'triangle', 0.1);
  }

  RF.UI = UI;
})();
