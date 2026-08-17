-- Personal keybinding overrides.
-- Ported from bindings.conf after the Omarchy "quattro" .conf -> .lua migration.
--
-- See current bindings: omarchy menu keybindings --print

-- Persistent workspaces 1-5, with 1 as the default.
hl.workspace_rule({ workspace = "1", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })

-- Applications --------------------------------------------------------------

-- Extra terminal binding alongside Omarchy's SUPER + RETURN.
o.bind("CTRL + ALT + T", "Terminal (ghostty)", { launch = "ghostty" })

-- Was: Omawrite (Omarchy default).
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })

-- Second binding for btop; Omarchy also keeps it on SUPER + CTRL + T.
o.bind("SUPER + SHIFT + T", "Activity", { tui = "btop" })

-- Menus ---------------------------------------------------------------------

-- Was: Full screen (Omarchy default).
hl.unbind("SUPER + F")
o.bind("SUPER + F", "Apps menu", "omarchy-menu toggle apps")

-- Was: File manager (Omarchy default).
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "Omarchy menu", "omarchy-menu")

-- Workspace navigation ------------------------------------------------------

o.bind("SUPER + Page_Up", "Next workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + Page_Down", "Previous workspace", hl.dsp.focus({ workspace = "e+1" }))

o.bind(
  "SUPER + SHIFT + Page_Up",
  "Move window to previous workspace",
  "~/.config/hypr/scripts/move_to_previous_workspace.sh"
)
o.bind(
  "SUPER + SHIFT + Page_Down",
  "Move window to next workspace",
  "~/.config/hypr/scripts/move_to_next_workspace.sh"
)

-- Lid ------------------------------------------------------------------------

-- Was: omarchy-system-lid-close, which locks the session the instant an
-- undocked lid closes (it front-runs logind's suspend inhibitor). The old
-- pre-quattro bind never locked on lid close at all -- it only reconciled the
-- monitors, and the lock came later from hypridle's before_sleep_cmd when
-- logind actually suspended. Restore that by calling the monitor reconciler
-- directly: it still disables the internal display only when the lid is shut
-- AND an external monitor is active.
hl.unbind("switch:on:Lid Switch")
o.bind("switch:on:Lid Switch", nil, "omarchy-hyprland-monitor-clamshell", { locked = true })

-- Disabled defaults ---------------------------------------------------------

-- Was: Next/Previous workspace.
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")

-- Was: Toggle scratchpad / Google Maps.
hl.unbind("SUPER + S")
hl.unbind("SUPER + SHIFT + S")
