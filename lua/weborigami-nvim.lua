local M = {}

local function setup_filetype()
	vim.filetype.add({
		extension = {
			ori = 'origami',
		},
	})
end

function M.setup()
	setup_filetype()
end

return M
