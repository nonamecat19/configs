-- Personal input overrides.
-- Ported from input.conf after the Omarchy "quattro" .conf -> .lua migration.

-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    -- US + Ukrainian layouts, switched with Alt + Space.
    kb_layout = "us,ua",
    kb_options = "grp:alt_space_toggle",

    repeat_rate = 20,
    repeat_delay = 300,

    numlock_by_default = true,

    -- Lower pointer sensitivity (default: 0).
    sensitivity = -0.3,

    touchpad = {
      natural_scroll = true,
      clickfinger_behavior = true,
      scroll_factor = 0.6,
      drag_3fg = 1,
    },
  },
})

-- App-specific touchpad scroll speeds.
o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })
