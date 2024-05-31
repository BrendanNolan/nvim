# Installing Parsers

In your treesiter config file, you can specify parsers to be installed with the `ensure_installed`
field; these will be installed automatically when you open neovim (if they are not installed
already).

# Updating Parsers

Sometimes the parsers may need to be updated (often a good idea if you find yourself with treesitter
errors). Currently I don't know a way to do this automatically but you can do it manually by running
`:TSUpdate`.
