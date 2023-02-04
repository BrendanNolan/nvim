# The Neovim `:make` Command
Running the `:make` command in neovim will run the system `make` command (or whichever other
system command you have set with `:compiler` e.g. `:compiler cargo`). 
Errors will be placed in the quickfix list the quickfix list: open this list with `:copen` and
navigate through it with `:cnext` and `:cprev` (I have keybindings for these).

# Using `:make` With C++
Use `:make` in neovim like you would use `make` in the terminal. Usually, you will open neovim in
the root of a cpp dir, so make sure to run `:make -C build` so that `make` knows where to find the
`Makefile`.

# Using `:make` With Rust
Cargo seems to be supported by neovim, so that you can run `:compiler cargo` when you open your
rust project in neovim, then run `:make <whatever>` where you would run `cargo <whatever>` in the
terminal.

