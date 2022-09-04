# Neovim dotfiles

Make sure to remove or move your current `nvim` directory

**IMPORTANT** Requires [0.7+](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-download). 

Linux or WSL
```
git clone git@github.com:groovyghoul/neovim-dotfiles.git ~/.config/nvim
```

Windows
```
git clone git@github.com:groovyghoul/neovim-dotfiles.git ~/AppData/Local/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed. Also, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

