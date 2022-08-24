vim.g.copilot_filetypes = { xml = false }

vim.g.copilot_no_tab_map = true
--vim.keymap.set.keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", { silent = true })

vim.api.nvim_set_keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", { silent = true, expr = true })
