# Before Even Opening Nvim
Install up-to-date node
Install ripgrep
Install rust_analyzer with rustup
Install treesitter-cli with cargo

Install packer
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
After installing packer, go to your packer.lua file and run `:so` followed by `:PackerSync` (later,
        you can run `:PackerClean` if you want to remove packages that you no longer need).

Install clangd with Mason

# Health checks
`:checkhealth` gives a lot of good diagnostics.

