## .nvim setup
```
brew install nvim

mkdir -p ~/.config/nvim

ln -s ~/Documents/dotfiles/init.lua ~/.config/nvim/init.lua

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p ~/.config/nvim/undodir
```

Then in `nvim`:
```
:PackerSync
```
