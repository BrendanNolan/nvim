# Before Even Opening Nvim
Install up-to-date node
Install ripgrep
Install rust_analyzer with `rustup component add rust-analyzer`
Install treesitter-cli with cargo

Install packer
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
# The First Time You Open Neovim
Go to your packer.lua file and run `:so` followed by `:PackerSync` (later,
you can run `:PackerClean` if you want to remove packages that you no longer need).

Do the one-time copilot initialisation with `Copilot setup` (you could have this done automatically
every time neovim starts but that's probably a waste of time.

# Health checks
`:checkhealth` gives a lot of good diagnostics.

