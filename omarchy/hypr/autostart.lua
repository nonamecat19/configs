-- Extra autostart processes.
-- Ported from autostart.conf after the Omarchy "quattro" .conf -> .lua migration.

-- Keyring for secrets (was an exec-once in hyprland.conf).
o.exec_on_start("gnome-keyring-daemon --start --components=secrets")

-- Was: ~/.config/hypr/scripts/lid-monitor-resync.sh, which reacted to
-- monitoradded by running `omarchy-hyprland-monitor-internal off`. Retired:
--
--   * Redundant. omarchy-hyprland-monitor-watch now handles monitoradded
--     itself (retrying at 1/3/7s) and polls every 2s while docked, which is
--     the gap the script was written to cover.
--   * Harmful. `internal off` writes the sticky toggle flag
--     ~/.local/state/omarchy/toggles/hypr/internal-monitor-disable.lua, which
--     Hyprland sources as config. omarchy-hyprland-monitor-clamshell honors
--     that flag, so the laptop panel stayed dark with the lid open until a
--     re-login cleared it.

-- Accept all inbound traffic (ported as-is from autostart.conf). This disables
-- inbound filtering, and needs a passwordless sudoers rule for iptables or it
-- silently fails at login. Comment out if you no longer want it.
o.exec_on_start("sudo iptables -I INPUT -j ACCEPT")
