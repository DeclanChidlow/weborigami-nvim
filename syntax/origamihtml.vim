" Frontmatter region
syntax region origamiHtmlFrontMatter start="^---$" end="^---$" contains=ALL

" Embedded Origami expressions
syntax region origamiHtmlInline start="\${" end="}" contains=ALL

" Link to default highlight groups
highlight default link origamiHtmlFrontMatter Special
highlight default link origamiHtmlInline Special

" Include default HTML syntax
runtime! syntax/html.vim
