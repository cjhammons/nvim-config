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

" LSP and autocompletion
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" go stuff
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

Plug 'kdheepak/lazygit.nvim'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'supermaven-inc/supermaven-nvim'

call plug#end()

" Enable 256 color support
set t_Co=256

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


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set airline theme
"let g:airline_theme='dark'

if $TERM_PROGRAM ==# 'Apple_Terminal'
  set notermguicolors
  let g:cyberdream_saturation = 0.7
endif

set termguicolors
"colorscheme cyberdream
colorscheme tokyonight
lua << EOF
require("tokyonight").setup({
    transparent = true,  -- Enable transparency
    terminal_colors = true,
})
vim.cmd("colorscheme tokyonight-night")

-- Setup nvim-cmp
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Setup LSP servers
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Go language server
lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- Python language server (pyright)
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
})

-- SQL language server
lspconfig.sqlls.setup({
  capabilities = capabilities,
})

-- Markdown language server
lspconfig.marksman.setup({
  capabilities = capabilities,
})

-- Bash language server
lspconfig.bashls.setup({
  capabilities = capabilities,
})

-- YAML language server
lspconfig.yamlls.setup({
  capabilities = capabilities,
})

-- Go.nvim setup
require('go').setup()

-- Supermaven setup
require("supermaven-nvim").setup({})

-- Add supermaven to cmp sources
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'supermaven' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})
EOF


" Set the colorscheme
" colorscheme bisexual-dark
"colorscheme synthwave

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
