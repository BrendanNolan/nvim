require("gruvbox").setup{ transparent_mode = true }
require("monokai-pro").setup{ transparent_background = true }
require('monokai').setup { palette = require('monokai').ristretto }

function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
	if color == "monokai-pro" then
		vim.cmd [[MonokaiPro ristretto]]
	end
end

ColorMyPencils()

