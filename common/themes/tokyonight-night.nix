# Tokyo Night (Night) as a base16 scheme.
#
# Hand-authored because the upstream `tokyo-night-dark.yaml` in base16-schemes
# assigns colors to the wrong base16 slots — most visibly base08 (the ANSI red
# slot) holds a light lavender (#c0caf5), so red terminal text renders as white.
#
# Every value below is 1:1 with folke/tokyonight.nvim's own `colors.terminal`
# table (lua/tokyonight/colors/{storm,init}.lua), mapped onto the base16 slots
# stylix uses for the 16 ANSI colors:
#
#   base00 → ANSI 0 (black/bg)      base08 → ANSI 1  (red)
#   base03 → ANSI 8 (bright black)  base0B → ANSI 2  (green)
#   base05 → ANSI 7 (white/fg)      base0A → ANSI 3  (yellow)
#   base07 → ANSI 15 (bright white) base0D → ANSI 4  (blue)
#                                   base0E → ANSI 5  (magenta)
#                                   base0C → ANSI 6  (cyan)
#
# Note: base16 has no separate "bright accent" concept, so ANSI 9-14 reuse the
# normal colors. tokyonight brightens them (Util.brighten) — that nuance can't
# be expressed in a base16 scheme and would require setting ghostty's palette
# directly. In practice the difference is negligible.
{
  base00 = "#1a1b26"; # bg
  base01 = "#16161e"; # bg_dark
  base02 = "#2f3549"; # selection bg
  base03 = "#414868"; # bright black  (terminal_black)
  base04 = "#787c99"; # dim fg
  base05 = "#a9b1d6"; # fg            (fg_dark → ANSI white)
  base06 = "#cbccd1"; # light fg
  base07 = "#c0caf5"; # bright white  (fg)
  base08 = "#f7768e"; # red
  base09 = "#ff9e64"; # orange
  base0A = "#e0af68"; # yellow
  base0B = "#9ece6a"; # green
  base0C = "#7dcfff"; # cyan
  base0D = "#7aa2f7"; # blue
  base0E = "#bb9af7"; # magenta / purple
  base0F = "#db4b4b"; # deep red      (red1)
}
