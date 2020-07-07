"{{{Preconfig configuration
let mapleader = "\<Space>"
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set number

"set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =8        " Tab key indents by 4 spaces.
set shiftwidth  =8        " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

"}}}


"{{{Auto pair closing
" Jiangmiao's plugin didn't work to well
inoremap ( ()<Esc>hli
inoremap [ []<Esc>hli
inoremap { {}<Esc>hli
"}}}


"{{{vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"}}}

"{{{Folding
set foldmethod=marker
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"}}}

"{{{Dein
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/troyd/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/troyd/.cache/dein')
  call dein#begin('/home/troyd/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/troyd/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('godlygeek/tabular')
  call dein#add('itchyny/lightline.vim')
  call dein#add('shinchu/lightline-gruvbox.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('vimwiki/vimwiki', {'on_cmd': 'VimwikiIndex'})
  call dein#add('dense-analysis/ale', {'on_ft': ['c','cpp','cc']})
  call dein#add('Shougo/deoplete.nvim',
      \{'on_i': 1})
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('automizu/LanguageClient-neovim', {'on_ft': ['c','cpp','cc','javascript','html','css']})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"}}}

"{{{C Language coding
"Follows Linux kernel guidelines 
augroup clang
autocmd!
autocmd FileType c set noexpandtab tabstop=8 shiftwidth=8 textwidth=78 smarttab backspace=eol,start,indent
autocmd FileType c filetype plugin indent on
autocmd FileType c syntax on
autocmd FileType c syn keyword ctype uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
autocmd FileType c syn keyword cOperator likely unlikely
augroup END
"}}}
"
"{{{Lightline
"Move above colorscheme else won't work

let g:lightline = {'colorscheme':'gruvbox'}
set noshowmode

"}}}

"{{{Colorscheme
colorscheme gruvbox
set termguicolors
let g:gruvbox_italic = 1
"}}}

"{{{Tabs
nmap tn :tabnew<CR>
nmap tc :tabclose
"}}}

"{{{Deoplete.nvim
let g:deoplete#enable_at_startup = 1
"}}}

"{{{ALE
let g:ale_completion_enabled = 0
"}}}

"{{{LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'c': ['clangd', '-background-index'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <silent> <leader>lcd :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>ldd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>ldr :call LanguageClient#textDocument_rename()<CR>
"}}}

"{{{Defx
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ })
nmap <A-d> :Defx<CR>
autocmd FileType defx call s:defxset()
function! s:defxset() abort
	nnoremap <silent><buffer><expr><CR> defx#do_action('drop')
	nnoremap <silent><buffer><expr>c defx#do_action('copy')
	nnoremap <silent><buffer><expr>x defx#do_action('remove')
	nnoremap <silent><buffer><expr>m defx#do_action('move')
	nnoremap <silent><buffer><expr>e defx#do_action('open')
	nnoremap <silent><buffer><expr>i defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr>s defx#do_action('open', 'split')
endfunction
"}}}

"{{{Denite
" Define mappings
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': '% ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1,
\ 'toggle': 1,
\ }}

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--glob', '!.clangd'])

nmap <leader>db :Denite buffer<CR>
nmap <leader>df :Denite file/rec<CR>
nmap <leader>dp :DeniteProjectDir file<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> f
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
"}}}

