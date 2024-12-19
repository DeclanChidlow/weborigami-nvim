" Frontmatter region
syntax region origamiMarkdownFrontMatter start="^---$" end="^---$" contains=ALL

" Embedded Origami expressions
syntax region origamiMarkdownInline start="\${" end="}" contains=ALL

" Link to default highlight groups
highlight default link origamiMarkdownFrontMatter Special
highlight default link origamiMarkdownInline Special

" Include default Markdown syntax
runtime! syntax/markdown.vim
