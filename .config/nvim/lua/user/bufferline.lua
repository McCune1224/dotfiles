local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "NvimTree", padding = 1 } },
        separator_style = "slope", -- | "thick" | "thin" | "slope" | "slant" | "padde_slant" { 'any', 'any' },
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
    },
})
