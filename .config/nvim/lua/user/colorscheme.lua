local colorscheme = "catppuccin"

local cat_ok, cat_config = pcall(require, "catppuccin")
if not cat_ok then
    return
end

local transparentcy = false
cat_config.setup(
    {
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.01,
        },
        transparent_background = transparentcy,
        integrations = {

            nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = transparentcy,
            },
        },
    }
)

local gruv_ok, gruv_config = pcall(require, "gruvbox")
if not gruv_ok then
    return
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    return
end
