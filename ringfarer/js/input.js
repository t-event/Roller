// Tastatur og berøringskontroller samlet i én tilstand.
(function () {
  'use strict';
  const RF = (window.RF = window.RF || {});

  const keys = new Set();
  const pressed = new Set(); // tast trykket ned denne rammen
  const touch = { thrust: 0, retro: 0, left: 0, right: 0, sl: 0, sr: 0, laser: 0 };

  const Input = {
    keys, touch,
    down: (k) => keys.has(k),
    hit: (k) => pressed.has(k),
    endFrame: () => pressed.clear(),
    press: (k) => pressed.add(k), // for berøringsknapper som tilsvarer én tast
    state() {
      const d = (k) => keys.has(k);
      const thrust = (d('KeyW') || d('ArrowUp') || touch.thrust ? 1 : 0) - (d('KeyS') || d('ArrowDown') || touch.retro ? 1 : 0);
      const turn = (d('KeyD') || d('ArrowRight') || touch.right ? 1 : 0) - (d('KeyA') || d('ArrowLeft') || touch.left ? 1 : 0);
      const strafe = (d('KeyE') || touch.sr ? 1 : 0) - (d('KeyQ') || touch.sl ? 1 : 0);
      return { thrust, turn, strafe, laser: d('Space') || !!touch.laser };
    },
  };

  const GAME_KEYS = new Set(['Space', 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight']);

  window.addEventListener('keydown', (e) => {
    if (e.target && (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA')) return;
    if (!keys.has(e.code)) pressed.add(e.code);
    keys.add(e.code);
    if (GAME_KEYS.has(e.code)) e.preventDefault();
  });
  window.addEventListener('keyup', (e) => keys.delete(e.code));
  window.addEventListener('blur', () => {
    keys.clear();
    for (const k in touch) touch[k] = 0;
  });

  // Knapper med data-hold="navn" holdes inne, data-tap="Kode" gir ett trykk.
  Input.bindTouch = (root) => {
    root.querySelectorAll('[data-hold]').forEach((el) => {
      const name = el.dataset.hold;
      const on = (e) => {
        e.preventDefault();
        touch[name] = 1;
        el.classList.add('on');
        if (el.setPointerCapture && e.pointerId != null) {
          try { el.setPointerCapture(e.pointerId); } catch (_) { /* ignorer */ }
        }
      };
      const off = (e) => {
        e.preventDefault();
        touch[name] = 0;
        el.classList.remove('on');
      };
      el.addEventListener('pointerdown', on);
      el.addEventListener('pointerup', off);
      el.addEventListener('pointercancel', off);
      el.addEventListener('lostpointercapture', off);
      el.addEventListener('contextmenu', (e) => e.preventDefault());
    });
    root.querySelectorAll('[data-tap]').forEach((el) => {
      el.addEventListener('pointerdown', (e) => {
        e.preventDefault();
        pressed.add(el.dataset.tap);
      });
      el.addEventListener('contextmenu', (e) => e.preventDefault());
    });
  };

  RF.Input = Input;
})();
