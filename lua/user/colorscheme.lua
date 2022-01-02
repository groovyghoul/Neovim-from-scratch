vim.cmd [[
try
  colorscheme landscape 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
