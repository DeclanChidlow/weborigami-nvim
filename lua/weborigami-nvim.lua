local M = {}

local function setup_filetype()
	vim.filetype.add({
		extension = {
			ori = 'origami',
		},
	})
end

local function setup_syntax()
	local syntax_dir = vim.fn.stdpath('config') .. '/syntax'
	if vim.fn.isdirectory(syntax_dir) == 0 then
		vim.fn.mkdir(syntax_dir, 'p')
	end

	local syntax_commands = [[
    if exists("b:current_syntax")
      finish
    endif

    " Comments
    syntax match origamiComment "//.*$"
    syntax region origamiBlockComment start="/\*" end="\*/"

    " File extensions
    syntax match origamiExtension "\.html\>" contained
    syntax match origamiExtension "\.js\>" contained
    syntax match origamiExtension "\.md\>" contained
    syntax match origamiExtension "\.ori\>" contained
    syntax match origamiExtension "\.xml\>" contained
    syntax match origamiExtension "\.yaml\>" contained
    syntax match origamiExtension "\.json\>" contained

    " Variables and paths
    syntax match origamiVariable "\<\h\w*\>"
    syntax match origamiPath "\<pages/[a-zA-Z0-9/_-]\+\>" contains=origamiExtension
    syntax match origamiPath "\<functions/[a-zA-Z0-9/_-]\+\>" contains=origamiExtension

    " Special identifiers
    syntax match origamiSpecialId "\<\(index\|posts\|portfolio\)\>" contained
    syntax match origamiErrorPage "\<404\>"

    " Functions and methods
    syntax match origamiFunction "\<\(map\|json\|rss\)\>\ze\s*("
    syntax match origamiMethod "\.\w\+\ze\>"

    " String literals
    syntax region origamiString start=/"/ skip=/\\"/ end=/"/ contains=origamiPath,origamiExtension
    syntax region origamiString start=/'/ skip=/\\'/ end=/'/ contains=origamiPath,origamiExtension
    syntax region origamiTemplate start=/`/ skip=/\\\`/ end=/`/ contains=origamiTemplateExpr
    syntax region origamiTemplateExpr start="${" end="}" contained contains=ALL

    " Arrays and objects
    syntax region origamiArray start="\[" end="\]" contains=ALL
    syntax region origamiObject start="{" end="}" contains=ALL fold

    " Numbers
    syntax match origamiNumber "\<\d\+\>"
    syntax match origamiNumber "\<\d\+\.\d\+\>"

    " Operators
    syntax match origamiOperator "[+\-*/%=<>!&|^~?:]"
    syntax match origamiOperator "\.\ze\w"
    syntax match origamiArrow "=>"

    " Link to default highlight groups
    highlight default link origamiComment Comment
    highlight default link origamiBlockComment Comment
    highlight default link origamiErrorPage ErrorMsg
    highlight default link origamiExtension Type
    highlight default link origamiFunction Function
    highlight default link origamiMethod Function
    highlight default link origamiNumber Number
    highlight default link origamiOperator Operator
    highlight default link origamiPath Directory
    highlight default link origamiSpecialId Identifier
    highlight default link origamiString String
    highlight default link origamiTemplate String
    highlight default link origamiTemplateExpr Special
    highlight default link origamiVariable Identifier

    let b:current_syntax = "origami"
	]]

	local syntax_file = syntax_dir .. '/origami.vim'
	local file = io.open(syntax_file, 'w')
	if file then
		file:write(syntax_commands)
		file:close()
	end
end

function M.setup()
	setup_filetype()
	setup_syntax()
end

return M
