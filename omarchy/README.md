# Omarchy config

Hand-written config only. Anything Omarchy ships as a default, generates, or
clones from elsewhere is left out — it comes back on its own after a reinstall.

## Layout

| Path | Goes to |
|---|---|
| `hypr/` | `~/.config/hypr/` |
| `omarchy/` | `~/.config/omarchy/` |

## What's here

- `hypr/monitors.lua` — HDMI-A-1 at 2560x1440@144, eDP-1 at 320x1440
- `hypr/bindings.lua` — keybind overrides, plus the `switch:on:Lid Switch`
  override that skips Omarchy's immediate lock on lid close
- `hypr/autostart.lua`, `input.lua`, `looknfeel.lua`, `hyprland.lua`
- `hypr/hypridle.conf`, `hyprlock.conf`
- `hypr/scripts/` — the two workspace-move scripts `bindings.lua` calls
- `omarchy/shell.json` — bar layout, idle timers
- `omarchy/plugins/nnc.power/` — custom bar widget
- `omarchy/extensions/menu.sh`, `omarchy/branding/`, `omarchy/defaults/agent`

## Deliberately excluded

- `hyprsunset.conf`, `xdph.conf`, `extensions/omarchy-menu.jsonc` — identical to
  the shipped defaults
- `hooks/*.sample` — shipped samples; `hooks/post-update.d/setup-agent.hook`
  comes from `/usr/share/omarchy/install/user/first-run/`
- `~/.config/hypr/.pre-quattro-backup/` and every `*.bak.*` — migration leftovers
- `hypr/lid-monitor.sh` and `hypr/scripts/lid-monitor-resync.sh` — both retired.
  `omarchy-hyprland-monitor-watch` covers the lid/dock reconciliation now, and
  the resync script wrote a sticky `internal-monitor-disable.lua` toggle that
  left the laptop panel dark with the lid open.
- `themes/coppernight` — an upstream clone with its own `.git`:
  `git clone https://github.com/hembramnishant50-glitch/omarchy-coppernight-theme ~/.config/omarchy/themes/coppernight`
- `themes/aether` — empty directory
