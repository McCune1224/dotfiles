local colorscheme = "catppuccin"

local cat_ok, cat_config = pcall(require, "catppuccin")
if not cat_ok then
    return
end

local trans = true
cat_config.setup(
    {
        dim_inactive = {
            enabled = false,
            shade = "light",
            percentage = 0.01,
        },
        transparent_background = trans,
        integrations = {

            nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = trans,
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
