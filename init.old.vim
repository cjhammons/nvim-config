:set number

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
endif

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Airline themes
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CT+N
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" go stuff
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' 

Plug 'kdheepak/lazygit.nvim'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'scottmckendry/cyberdream.nvim'
call plug#end()

" Define terminal toggle function
function! ToggleTerminal()
  if exists("g:term_buf") && bufexists(g:term_buf)
    " If buffer exists, check if it's visible in a window
    let term_winid = bufwinid(g:term_buf)
    if term_winid > 0
      " If visible, hide it
      execute "close " . term_winid
    else
      " If not visible, show it
      botright 15split
      execute "buffer " . g:term_buf
      startinsert
    endif
  else
    " Open new terminal
    botright 15split
    terminal
    let g:term_buf = bufnr("%")
    startinsert
  endif
endfunction

" Map F12 to toggle terminal
nnoremap <F12> :call ToggleTerminal()<CR>
tnoremap <F12> <C-\><C-n>:call ToggleTerminal()<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

" Set airline theme
let g:airline_theme='dark'



" Add this to your init.vim
function! OverrideAllBackgrounds()
    " Get a list of all highlight groups
    redir => highlight_groups
    silent! highlight
    redir END
    
    " Process each line
    for line in split(highlight_groups, '\n')
        " Extract the highlight group name
        let group = matchstr(line, '^\w\+')
        if !empty(group)
            " Set the background to match Normal
            execute 'hi ' . group . ' guibg=#181615 ctermbg=234'
        endif
    endfor
endfunction

" Add this after your colorscheme line
:colorscheme synthwave
call OverrideAllBackgrounds()

" Override comment highlighting to match normal background
highlight Comment guibg=#181615 ctermbg=234

" Also set up the autocmd for future colorscheme changes
autocmd ColorScheme synthwave highlight Comment guibg=#181615 ctermbg=234

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
