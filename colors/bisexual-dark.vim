" Bisexual Dark - A Neovim theme
" Converted from VSCode Bisexual Dark Theme
" Author: Converted by Claude

" Setup
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bisexual-dark"

" Define colors
let s:bg = "#1e1e1e"
let s:fg = "#eeffff"
let s:pink = "#ff228c"
let s:red = "#FF5370"
let s:deep_pink = "#d6006f"
let s:light_pink = "#ff4eaa"
let s:purple = "#C792EA"
let s:violet = "#bc84f2"
let s:blue = "#2b71ff"
let s:light_blue = "#528cff"
let s:bright_blue = "#6497ff"
let s:cyan = "#89DDFF"
let s:dark_bg = "#1A1A1A"
let s:comment_blue = "#2b71ff"

" Helper function for highlight groups
function! s:hi(group, fg, bg, attr)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg
  endif
  if !empty(a:attr)
    exec "hi " . a:group . " gui=" . a:attr
  endif
endfunc

" Editor colors
call s:hi("Normal", s:fg, s:bg, "")
call s:hi("LineNr", s:violet, "", "")
call s:hi("CursorLine", "", s:bg, "NONE")
call s:hi("CursorLineNr", s:violet, "", "")
call s:hi("Cursor", s:bg, s:fg, "")
call s:hi("CursorColumn", "", s:bg, "")
call s:hi("ColorColumn", "", s:dark_bg, "")
call s:hi("SignColumn", "", s:bg, "")
call s:hi("VertSplit", s:dark_bg, s:dark_bg, "")
call s:hi("Folded", s:comment_blue, s:bg, "italic")
call s:hi("FoldColumn", s:comment_blue, s:bg, "")
call s:hi("MatchParen", s:fg, s:violet, "bold")
call s:hi("StatusLine", s:pink, s:dark_bg, "bold")
call s:hi("StatusLineNC", s:blue, s:dark_bg, "NONE")
call s:hi("WildMenu", s:fg, s:blue, "")
call s:hi("Directory", s:blue, "", "")
call s:hi("Title", s:fg, "", "bold")
call s:hi("Visual", "", "#530060", "")
call s:hi("WarningMsg", s:fg, s:red, "")
call s:hi("ErrorMsg", s:fg, s:red, "bold")
call s:hi("SpecialKey", s:comment_blue, "", "")
call s:hi("Search", s:bg, s:violet, "")
call s:hi("IncSearch", s:bg, s:light_pink, "")
call s:hi("Question", s:blue, "", "")
call s:hi("ModeMsg", s:fg, "", "")
call s:hi("MoreMsg", s:blue, "", "")
call s:hi("NonText", s:comment_blue, "", "")

" Popup menu
call s:hi("Pmenu", s:fg, s:dark_bg, "")
call s:hi("PmenuSel", s:bg, s:pink, "")
call s:hi("PmenuSbar", s:fg, s:dark_bg, "")
call s:hi("PmenuThumb", s:fg, s:blue, "")

" Syntax highlighting
call s:hi("Comment", s:comment_blue, "", "italic")
call s:hi("Constant", s:light_pink, "", "")
call s:hi("String", s:light_pink, "", "")
call s:hi("Character", s:light_pink, "", "")
call s:hi("Number", s:violet, "", "")
call s:hi("Boolean", s:violet, "", "")
call s:hi("Float", s:violet, "", "")
call s:hi("Identifier", s:fg, "", "")
call s:hi("Function", s:violet, "", "")
call s:hi("Statement", s:blue, "", "")
call s:hi("Conditional", s:deep_pink, "", "bold")
call s:hi("Repeat", s:deep_pink, "", "bold")
call s:hi("Label", s:deep_pink, "", "")
call s:hi("Operator", s:violet, "", "")
call s:hi("Keyword", s:deep_pink, "", "")
call s:hi("Exception", s:deep_pink, "", "bold")
call s:hi("PreProc", s:bright_blue, "", "")
call s:hi("Include", s:deep_pink, "", "")
call s:hi("Define", s:deep_pink, "", "")
call s:hi("Macro", s:deep_pink, "", "")
call s:hi("PreCondit", s:bright_blue, "", "")
call s:hi("Type", s:light_blue, "", "")
call s:hi("StorageClass", s:deep_pink, "", "bold")
call s:hi("Structure", s:deep_pink, "", "")
call s:hi("Typedef", s:light_blue, "", "")
call s:hi("Special", s:violet, "", "")
call s:hi("SpecialChar", s:violet, "", "")
call s:hi("Tag", s:violet, "", "")
call s:hi("Delimiter", s:fg, "", "")
call s:hi("SpecialComment", s:comment_blue, "", "italic")
call s:hi("Debug", s:fg, "", "")
call s:hi("Underlined", s:blue, "", "underline")
call s:hi("Error", s:fg, s:red, "")
call s:hi("Todo", s:fg, s:blue, "italic")

" Diff highlighting
call s:hi("DiffAdd", s:bg, s:blue, "")
call s:hi("DiffChange", s:bg, s:deep_pink, "")
call s:hi("DiffDelete", s:bg, s:red, "")
call s:hi("DiffText", s:bg, s:bright_blue, "")

" Git highlighting
call s:hi("gitcommitOverflow", s:red, "", "")
call s:hi("gitcommitSummary", s:light_pink, "", "")
call s:hi("gitcommitComment", s:comment_blue, "", "italic")
call s:hi("gitcommitUntracked", s:comment_blue, "", "italic")
call s:hi("gitcommitDiscarded", s:comment_blue, "", "italic")
call s:hi("gitcommitSelected", s:comment_blue, "", "italic")
call s:hi("gitcommitHeader", s:deep_pink, "", "")
call s:hi("gitcommitSelectedType", s:blue, "", "")
call s:hi("gitcommitUnmergedType", s:blue, "", "")
call s:hi("gitcommitDiscardedType", s:blue, "", "")
call s:hi("gitcommitBranch", s:violet, "", "bold")
call s:hi("gitcommitUntrackedFile", s:light_blue, "", "")
call s:hi("gitcommitUnmergedFile", s:red, "", "bold")
call s:hi("gitcommitDiscardedFile", s:red, "", "bold")
call s:hi("gitcommitSelectedFile", s:light_pink, "", "bold")

" Links to match original VSCode theme
hi! link Boolean Number
hi! link Character String
hi! link Conditional Statement
hi! link Debug Special
hi! link Define PreProc
hi! link Exception Statement
hi! link Float Number
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link Structure Type
hi! link Tag Special

" TreeSitter support
if exists("&termguicolors") && &termguicolors
  " Tree-sitter groups
  call s:hi("TSAttribute", s:blue, "", "")
  call s:hi("TSBoolean", s:violet, "", "")
  call s:hi("TSCharacter", s:light_pink, "", "")
  call s:hi("TSComment", s:comment_blue, "", "italic")
  call s:hi("TSConditional", s:deep_pink, "", "")
  call s:hi("TSConstant", s:violet, "", "")
  call s:hi("TSConstBuiltin", s:violet, "", "")
  call s:hi("TSConstMacro", s:violet, "", "")
  call s:hi("TSError", s:red, "", "")
  call s:hi("TSException", s:deep_pink, "", "")
  call s:hi("TSField", s:fg, "", "")
  call s:hi("TSFloat", s:violet, "", "")
  call s:hi("TSFunction", s:violet, "", "")
  call s:hi("TSFuncBuiltin", s:violet, "", "")
  call s:hi("TSFuncMacro", s:violet, "", "")
  call s:hi("TSInclude", s:deep_pink, "", "")
  call s:hi("TSKeyword", s:deep_pink, "", "")
  call s:hi("TSKeywordFunction", s:deep_pink, "", "")
  call s:hi("TSKeywordOperator", s:deep_pink, "", "")
  call s:hi("TSLabel", s:deep_pink, "", "")
  call s:hi("TSMethod", s:violet, "", "")
  call s:hi("TSNamespace", s:light_blue, "", "")
  call s:hi("TSNone", s:fg, "", "")
  call s:hi("TSNumber", s:violet, "", "")
  call s:hi("TSOperator", s:violet, "", "")
  call s:hi("TSParameter", s:fg, "", "")
  call s:hi("TSParameterReference", s:fg, "", "")
  call s:hi("TSProperty", s:fg, "", "")
  call s:hi("TSPunctDelimiter", s:fg, "", "")
  call s:hi("TSPunctBracket", s:fg, "", "")
  call s:hi("TSPunctSpecial", s:fg, "", "")
  call s:hi("TSRepeat", s:deep_pink, "", "")
  call s:hi("TSString", s:light_pink, "", "")
  call s:hi("TSStringRegex", s:light_pink, "", "")
  call s:hi("TSStringEscape", s:violet, "", "")
  call s:hi("TSSymbol", s:light_pink, "", "")
  call s:hi("TSTag", s:violet, "", "")
  call s:hi("TSTagDelimiter", s:fg, "", "")
  call s:hi("TSText", s:fg, "", "")
  call s:hi("TSStrong", s:fg, "", "bold")
  call s:hi("TSEmphasis", s:fg, "", "italic")
  call s:hi("TSUnderline", s:fg, "", "underline")
  call s:hi("TSStrike", s:fg, "", "strikethrough")
  call s:hi("TSTitle", s:light_pink, "", "")
  call s:hi("TSLiteral", s:light_pink, "", "")
  call s:hi("TSURI", s:blue, "", "underline")
  call s:hi("TSType", s:light_blue, "", "")
  call s:hi("TSTypeBuiltin", s:deep_pink, "", "")
  call s:hi("TSVariable", s:fg, "", "")
  call s:hi("TSVariableBuiltin", s:red, "", "")
endif

" LSP highlights
if has('nvim-0.5')
  call s:hi("LspDiagnosticsDefaultError", s:red, "", "")
  call s:hi("LspDiagnosticsDefaultWarning", s:blue, "", "")
  call s:hi("LspDiagnosticsDefaultInformation", s:bright_blue, "", "")
  call s:hi("LspDiagnosticsDefaultHint", s:comment_blue, "", "")
  call s:hi("LspDiagnosticsUnderlineError", s:red, "", "underline")
  call s:hi("LspDiagnosticsUnderlineWarning", s:blue, "", "underline")
  call s:hi("LspDiagnosticsUnderlineInformation", s:bright_blue, "", "underline")
  call s:hi("LspDiagnosticsUnderlineHint", s:comment_blue, "", "underline")
endif

" Terminal colors
if has('nvim')
  let g:terminal_color_0 = s:bg
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:light_blue
  let g:terminal_color_3 = s:violet
  let g:terminal_color_4 = s:blue
  let g:terminal_color_5 = s:deep_pink
  let g:terminal_color_6 = s:cyan
  let g:terminal_color_7 = s:fg
  let g:terminal_color_8 = s:dark_bg
  let g:terminal_color_9 = s:red
  let g:terminal_color_10 = s:light_blue
  let g:terminal_color_11 = s:violet
  let g:terminal_color_12 = s:blue
  let g:terminal_color_13 = s:pink
  let g:terminal_color_14 = s:cyan
  let g:terminal_color_15 = s:fg
endif

" NERDTree highlighting
call s:hi("NERDTreeFile", s:fg, "", "")
call s:hi("NERDTreeDir", s:blue, "", "bold")
call s:hi("NERDTreeDirSlash", s:pink, "", "")
call s:hi("NERDTreeOpenable", s:violet, "", "")
call s:hi("NERDTreeClosable", s:violet, "", "")
call s:hi("NERDTreeExecFile", s:light_pink, "", "")
call s:hi("NERDTreeLinkFile", s:cyan, "", "")
call s:hi("NERDTreeLinkTarget", s:light_blue, "", "")

" Ensure all backgrounds are transparent/NONE if you want a transparent terminal
" Uncomment the lines below if you want transparent backgrounds
" call s:hi("Normal", s:fg, "NONE", "")
" call s:hi("LineNr", s:violet, "NONE", "")
" call s:hi("SignColumn", "", "NONE", "")
" call s:hi("EndOfBuffer", s:bg, "NONE", "")

" Remove background for vertical split
call s:hi("VertSplit", s:dark_bg, "NONE", "")
