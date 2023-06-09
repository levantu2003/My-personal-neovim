return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local border_char = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        local full_border_chars = {
            { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        }
        require("telescope").setup({
            defaults = {
                layout_strategy = "center",
                layout_config = {
                    preview_cutoff = 1,
                    height = 0.5,
                    prompt_position = "top",
                    width = 0.7,
                },
                sorting_strategy = "ascending",
                prompt_prefix = "   ",
                entry_prefix = "   ",
                multi_icon = "   ",
                selection_caret = "  ",
                border = true,
                borderchars = full_border_chars,
                results_title = false,
                prompt_title = " Prompt ",

                -- Preview
                preview = {
                    color_devicons = true,
                },
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-/>"] = "which_key",
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        borderchars = full_border_chars,
                        previewer = false,
                    }),
                },
                file_browser = {
                    hijack_netrw = true,
                    path = "%:p:h",
                    default_selection_index = 2,
                },
            },
        })

        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("file_browser")
    end,
}
