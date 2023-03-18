require("gruvbox").setup{ transparent_mode = true }

function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

end

ColorMyPencils()

