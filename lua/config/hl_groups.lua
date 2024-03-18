local colors = require("catppuccin.palettes.mocha")

return {
    {"MiniStatuslineModeInsert", { fg=colors.green, bg=colors.surface2 }},
    {"MiniStatuslineModeNormal", { fg=colors.base, bg=colors.blue }},
    {"MiniStatuslineModeVisual", { fg=colors.flamingo, bg=colors.surface0 }},
    {"MiniStatuslineDevinfo",    { fg=colors.blue, bg=colors.mantle }},
    {"MiniStatuslineFileinfo",    { fg=colors.blue, bg=colors.mantle }},
}
