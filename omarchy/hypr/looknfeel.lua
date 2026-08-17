-- Personal look'n'feel overrides.
-- Ported from ~/.config/omarchist/hyprland/hyprland.conf, which Hyprland no
-- longer sources after the Omarchy "quattro" .conf -> .lua migration.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    -- Rounded window corners.
    rounding = 12,

    -- Slightly fade unfocused windows.
    inactive_opacity = 0.95,
  },
})
