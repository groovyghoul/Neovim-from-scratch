vim.cmd [[
try
  colorscheme landscape
  
  " the colorscheme landscape seems to throw off the color of whichkey
  " this command darkens the background of the popup
  highlight Pmenu guibg=#3A3A3A

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
