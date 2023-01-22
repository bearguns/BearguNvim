local noirbuddy_colors = { "minimal", "miami-nights", "kiwi", "slate", "crt-green", "crt-amber" }
function ColorADinosaur(color)
    color = color or "rose-pine"
    if color == "rose-pine" then
        require("rose-pine").setup({
            dark_variant = "moon",
            bold_vert_split = true,
            disable_italics = true,
            highlight_groups = {
                ColorColumn = { bg = "rose" }
            }
        })
    end
    for _, theme in pairs(noirbuddy_colors) do
        if theme == color then
            require("noirbuddy").setup({ preset = theme })
            return
        end
    end
    vim.cmd.colorscheme(color)
end

ColorADinosaur("rose-pine")
