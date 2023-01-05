function ColorMyPencils(color)
	color = color or "vscode"
	vim.cmd.colorscheme(color)

end

ColorMyPencils()

