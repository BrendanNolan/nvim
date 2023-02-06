require('material').setup{}

function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
    if color == "material" then
        vim.g.material_style = "darker"
    end
end

ColorMyPencils()

