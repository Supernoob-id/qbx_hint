// qbx_hint - NUI
// Author: supernoob indonesia

// Built-in icons (Material Design paths, 24x24)
const ICONS = {
    garage: 'M22 9V20H20V11H4V20H2V9L12 5L22 9M19 12H5V14H19V12M19 18H5V20H19V18M19 15H5V17H19V15Z',
    parking: 'M13 3H6v18h4v-6h3c3.31 0 6-2.69 6-6s-2.69-6-6-6zm.2 8H10V7h3.2c1.1 0 2 .9 2 2s-.9 2-2 2z',
    car: 'M18.92 6.01C18.72 5.42 18.16 5 17.5 5h-11c-.66 0-1.21.42-1.42 1.01L3 12v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.5 16c-.83 0-1.5-.67-1.5-1.5S5.67 13 6.5 13s1.5.67 1.5 1.5S7.33 16 6.5 16zm11 0c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zM5 11l1.5-4.5h11L19 11H5z',
    boat: 'M20 21c-1.39 0-2.78-.47-4-1.32-2.44 1.71-5.56 1.71-8 0C6.78 20.53 5.39 21 4 21H2v2h2c1.38 0 2.74-.35 4-.99 2.52 1.29 5.48 1.29 8 0 1.26.65 2.62.99 4 .99h2v-2h-2zM3.95 19H4c1.6 0 3.02-.88 4-2 .98 1.12 2.4 2 4 2s3.02-.88 4-2c.98 1.12 2.4 2 4 2h.05l1.89-6.68c.08-.26.06-.54-.06-.78s-.34-.42-.6-.5L20 10.62V6c0-1.1-.9-2-2-2h-3V1H9v3H6c-1.1 0-2 .9-2 2v4.62l-1.29.42c-.26.08-.48.26-.6.5s-.15.52-.06.78L3.95 19zM6 6h12v3.97L12 8 6 9.97V6z',
    plane: 'M21 16v-2l-8-5V3.5c0-.83-.67-1.5-1.5-1.5S10 2.67 10 3.5V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z',
    key: 'M12.65 10C11.83 7.67 9.61 6 7 6c-3.31 0-6 2.69-6 6s2.69 6 6 6c2.61 0 4.83-1.67 5.65-4H17v4h4v-4h2v-4H12.65zM7 14c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z',
    wrench: 'M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4z',
    shop: 'M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49A1.003 1.003 0 0 0 20 4H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z',
    money: 'M11.8 10.9c-2.27-.59-3-1.2-3-2.15 0-1.09 1.01-1.85 2.7-1.85 1.78 0 2.44.85 2.5 2.1h2.21c-.07-1.72-1.12-3.3-3.21-3.81V3h-3v2.16c-1.94.42-3.5 1.68-3.5 3.61 0 2.31 1.91 3.46 4.7 4.13 2.5.6 3 1.48 3 2.41 0 .69-.49 1.79-2.7 1.79-2.06 0-2.87-.92-2.98-2.1h-2.2c.12 2.19 1.76 3.42 3.68 3.83V21h3v-2.15c1.95-.37 3.5-1.5 3.5-3.55 0-2.84-2.43-3.81-4.7-4.4z',
    food: 'M11 9H9V2H7v7H5V2H3v7c0 2.12 1.66 3.84 3.75 3.97V22h2.5v-9.03C11.34 12.84 13 11.12 13 9V2h-2v7zm5-3v8h2.5v8H21V2c-2.76 0-5 2.24-5 4z',
    medical: 'M19 3H5c-1.1 0-1.99.9-1.99 2L3 19c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1 11h-4v4h-4v-4H6v-4h4V6h4v4h4v4z',
    police: 'M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4z',
    laptop: 'M20 18c1.1 0 1.99-.9 1.99-2L22 6c0-1.1-.9-2-2-2H4c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2H0v2h24v-2h-4zM4 6h16v10H4V6z',
    box: 'M20 2H4c-1 0-2 .9-2 2v3.01c0 .72.43 1.34 1 1.69V20c0 1.1 1.1 2 2 2h14c.9 0 2-.9 2-2V8.7c.57-.35 1-.97 1-1.69V4c0-1.1-1-2-2-2zm-5 12H9v-2h6v2zm5-7H4V4l16-.02V7z',
    info: 'M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z',
};

// Aliases so Material icon names / codepoints used in config also work
ICONS.attach_money = ICONS.money;
ICONS.e8d1 = ICONS.laptop;

const tpl = document.getElementById('markerTpl');
const hint = document.getElementById('hint');
const hintIcon = document.getElementById('hintIcon');
const el = {
    title: document.getElementById('title'),
    text: document.getElementById('text'),
    key: document.getElementById('key'),
    subtext: document.getElementById('subtext'),
};

const markers = {};   // id -> { el, pin, dist, iconKey }
let hintOwner = null; // id of the point that owns the hint panel
let hintWorld = false;
let hintIconKey = null;
let themeKey = null;

const THEME_VARS = {
    background: '--bg',
    text: '--text',
    subtext: '--subtext',
    border: '--border',
    accent: '--accent',
    accent2: '--accent2',
    iconBg: '--icon-bg',
    keyBg: '--key-bg',
    keyBorder: '--key-border',
    keyText: '--key-text',
    glow: '--glow',
};

function iconHtml(icon, size) {
    if (typeof icon === 'string' && icon.startsWith('img:')) {
        const file = icon.slice(4).replace(/[^\w.\-]/g, '');
        return `<img src="icons/${file}" alt="">`;
    }
    const path = ICONS[icon] || ICONS.info;
    return `<svg viewBox="0 0 24 24" width="${size}" height="${size}" fill="currentColor"><path d="${path}"/></svg>`;
}

function applyTheme(theme) {
    if (!theme) return;
    const key = JSON.stringify(theme);
    if (key === themeKey) return;
    themeKey = key;
    const root = document.documentElement.style;
    for (const [name, cssVar] of Object.entries(THEME_VARS)) {
        if (theme[name]) root.setProperty(cssVar, theme[name]);
        else if (cssVar === '--key-text') root.setProperty(cssVar, 'var(--text)');
        else if (cssVar === '--accent2') root.setProperty(cssVar, 'var(--accent)');
    }
}

// Per-point colors override the theme accents on that element only.
// With two-tone off, the second tone simply follows the first.
function setAccent(node, d) {
    const s = node.style;
    if (d.color) s.setProperty('--accent', d.color);
    else s.removeProperty('--accent');

    if (!d.twoTone) s.setProperty('--tone2', 'var(--accent)');
    else if (d.color2) s.setProperty('--tone2', d.color2);
    else s.removeProperty('--tone2');

    node.classList.toggle('two-tone', !!d.twoTone);
}

function getMarker(id) {
    if (!markers[id]) {
        const node = tpl.content.firstElementChild.cloneNode(true);
        document.body.appendChild(node);
        markers[id] = {
            el: node,
            pin: node.querySelector('.marker-pin'),
            dist: node.querySelector('.marker-dist'),
            iconKey: null,
        };
    }
    return markers[id];
}

function hideHint() {
    hint.classList.remove('show');
    hintOwner = null;
}

function targetOf(id) {
    if (hintOwner === id) return hintWorld ? hint : null;
    return markers[id] ? markers[id].el : null;
}

window.addEventListener('message', (e) => {
    const d = e.data;
    if (!d || !d.action) return;

    switch (d.action) {
        case 'set': {
            applyTheme(d.theme);
            const m = getMarker(d.id);

            if (d.state === 'none') {
                m.el.classList.remove('show');
                if (hintOwner === d.id) hideHint();
                break;
            }

            if (d.state === 'marker') {
                if (hintOwner === d.id) hideHint();
                const key = d.icon + '';
                if (m.iconKey !== key) {
                    m.iconKey = key;
                    m.pin.innerHTML = iconHtml(d.icon, 18);
                }
                setAccent(m.el, d);
                m.dist.textContent = '';
                m.el.classList.add('show', 'off'); // wait for first position
                break;
            }

            if (d.state === 'hint') {
                m.el.classList.remove('show');
                hintOwner = d.id;
                hintWorld = d.mode === '3d';

                if (hintIconKey !== d.icon) {
                    hintIconKey = d.icon;
                    hintIcon.innerHTML = iconHtml(d.icon, 20);
                }
                setAccent(hint, d);
                el.title.textContent = d.title || '';
                el.text.textContent = d.text || '';
                el.key.textContent = d.key || '';
                el.subtext.textContent = d.subtext || '';

                hint.classList.remove('fixed', 'world', 'off');
                hint.classList.add(hintWorld ? 'world' : 'fixed');
                if (hintWorld) hint.classList.add('off'); // wait for first position
                hint.classList.add('show');
            }
            break;
        }

        case 'pos': {
            const t = targetOf(d.id);
            if (!t) return;
            t.style.left = (d.x * 100) + '%';
            t.style.top = (d.y * 100) + '%';
            t.classList.remove('off');
            break;
        }

        case 'dist':
            if (markers[d.id]) markers[d.id].dist.textContent = d.value + 'm';
            break;

        case 'visibility': {
            const t = targetOf(d.id);
            if (t) t.classList.toggle('off', d.hidden);
            break;
        }
    }
});