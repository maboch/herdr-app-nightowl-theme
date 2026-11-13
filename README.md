# Night Owl for Herdr

A dark skin for [Herdr](https://herdr.dev) (`herdr-app`) built to match the
`nightowl` theme shipped with opencode 2.

Tested with `herdr-app` 0.1.15 and `opencode` 2.2.5.

## Install

The skin is a single theme file. Copy this folder to the other machine and run:

```sh
./install.sh            # install only
./install.sh --apply    # install and switch the running window to it
```

The script writes `themes/nightowl.json` into
`${HERDR_APP_HOME:-$HOME/.config/herdr-app}` and respects a custom
`HERDR_APP_HOME`.

Manual install: copy `themes/nightowl.json` to
`~/.config/herdr-app/themes/nightowl.json`, then pick **nightowl** in
Settings → Appearance. To make it the default for layouts that do not pick
their own theme, add to `settings.json`:

```json
{ "theme": "nightowl" }
```

Moving to another machine with Herdr:

```sh
scp -r herdr-nightowl-theme you@other-machine:~/
ssh you@other-machine '~/herdr-nightowl-theme/install.sh --apply'
```

This is a **dark** theme: the picker offers it for dark appearance, and
`settings.json` should pair it with `"appearance": "dark"`.

Uninstall: delete `themes/nightowl.json` and pick another theme. A layout
that still points at `nightowl` falls back to Herdr's default.

## Palette

The UI colors come from opencode's built-in `nightowl` theme:

| Role | Color |
| --- | --- |
| Background / terminals | `#011627` |
| Panels, sidebar, cards (`chrome`, `surface`, `popover`) | `#0b253a` |
| Foreground | `#d6deeb` |
| Primary / accent | `#82aaff` |
| Secondary / links | `#7fdbca` |
| Accent purple | `#c792ea` |
| Warning / working | `#ecc48d` |
| Error / blocked | `#ef5350` |
| Success / done | `#c5e478` |
| Muted text | `#5f7e97` |
| Dim text / comments | `#637777` |
| Selection | `#1d3b53` |

Terminal ANSI colors extend the same palette with Night Owl's bright
variants (for example bright yellow `#ffeb95`). Black and bright black are
lifted to `#0b253a` and `#637777` so they stay readable on the `#011627`
background.

## Notes

- Only one (dark) color set is defined; Herdr's light appearance keeps
  its normal light theme.
- Colors use Herdr's semantic names (`chrome`, `canvas`, `solid`, `working`,
  ...), so panel buttons, status dots, diffs and terminals all follow the
  same Night Owl palette.
- Borders and hover states use alpha colors (`#rrggbbaa`), which Herdr
  0.1.15 supports.

## Credits

Palette based on [Night Owl](https://github.com/sdras/night-owl-vscode-theme)
by Sarah Drasner (MIT), as adapted in opencode 2's built-in `nightowl` theme.
