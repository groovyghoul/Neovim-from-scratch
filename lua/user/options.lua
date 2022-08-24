local options = {
  backup = false,                          -- creates a backup file
  --clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                        -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = [[Consolas:h12,JetbrainsMono\ NF]],   -- the font used in graphical neovim applications
}

-- disable the "built in" features
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
-- end disable the "built in" features
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

if (vim.loop.os_uname().sysname == 'Windows_NT') then
  vim.g.python3_host_prog = "python"
else
  -- IMPROVE NEOVIM STARTUP
  -- https://github.com/editorconfig/editorconfig-vim/issues/50
  vim.g.loaded_python_provier=1
  vim.g.python_host_skip_check = 1
  vim.g.python_host_prog='/bin/python2'
  vim.g.python3_host_skip_check = 1
  vim.g.python3_host_prog='/bin/python3'
  vim.opt.pyxversion=3
  -- if vim.fn.executable("editorconfig") then
  --  vim.g.EditorConfig_exec_path = '/bin/editorconfig'
  -- end
  vim.g.EditorConfig_core_mode = 'external'
end

-- Copilot wouldn't work with tab, so the following configuration is used instead to map completion to ctrl-shift-j
vim.g.copilot_no_tab_map = true
--vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.vimspector_enable_mappings = "HUMAN"

-- lua config
-- https://stackoverflow.com/questions/36108950/setting-up-powershell-as-vims-shell-command-does-not-seem-to-be-passed-correct
-- https://githubhot.com/repo/akinsho/nvim-toggleterm.lua/issues/90
if (vim.loop.os_uname().sysname == 'Windows_NT') then
  vim.cmd([[
    set shell=pwsh
    set shellcmdflag=-command
    set shellquote=\"
    set shellxquote=
  ]])
end

		-- let &shell = has('win32') ? 'powershell' : 'pwsh'
		-- let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
		-- let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		-- let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		-- set shellquote= shellxquote=

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
-- if this becomes obnoxious and I just want the line level diags back, set config.virtual_text = true in lua/handlers.lua
-- if this is turned off, to show the diagnostics, type "gl"
-- vim.o.updatetime = 500    -- 250 was too in-my-face, trying 500 for a bit
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- https://github.com/OmniSharp/omnisharp-vim/issues/677
--vim.g.Omnisharp_highlighting = false
vim.cmd "let g:OmniSharp_highlighting = 0"

-- vim.cmd([[
-- let g:OmniSharp_highlight_groups = {
-- \ 'ExcludedCode': 'NonText',
-- \ 'ClassName': 'Typedef',
-- \ 'StructName': 'Typedef',
-- \ 'DelegateName': 'Structure',
-- \ 'EnumName': 'Structure',
-- \ 'InterfaceName': 'Structure',
-- \ 'ModuleName': 'Structure',
-- \ 'NamespaceName': 'Include',
-- \ 'RegexComment': 'Comment',
-- \ 'RegexCharacterClass': 'Character',
-- \ 'RegexAnchor': 'Type',
-- \ 'RegexQuantifier': 'Number',
-- \ 'RegexGrouping': 'Macro',
-- \ 'RegexAlternation': 'Identifier',
-- \ 'RegexText': 'String',
-- \ 'RegexSelfEscapedCharacter': 'Delimiter',
-- \ 'RegexOtherEscape': 'Delimiter'
-- \}
-- ]])
