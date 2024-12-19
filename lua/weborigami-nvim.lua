local M = {}

local function setup_filetype()
	vim.filetype.add({
		extension = {
			ori = 'origami',
		},
		pattern = {
			['.*%.ori%.md'] = 'origamimarkdown',
			['.*%.ori%.html'] = 'origamihtml',
		},
	})
end

function M.setup()
	setup_filetype()
end

return M
