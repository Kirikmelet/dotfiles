"{{{config configuration
let mapleader = "\<Space>"
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

"set autoindent             " Indent according to previous line.
set nonumber
set laststatus=0
set expandtab              " Use spaces instead of tabs.
set softtabstop =4        " Tab key indents by 4 spaces.
set mouse=a
set shiftwidth  =4        " >> indents by 4 spaces.
set ruler
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set smarttab
set smartindent
set autoindent
set updatetime=300

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set noshowmode               " Show current mode in command-line.
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
set inccommand=split

"}}}

"{{{Highlighting
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
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

" Required:
set runtimepath+=/home/troyd/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/troyd/.cache/dein')
  call dein#begin('/home/troyd/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/troyd/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
  "call dein#add('Shougo/denite.nvim')
  call dein#add('shinchu/lightline-gruvbox.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('sbdchd/neoformat')
  call dein#add('tpope/vim-fugitive')
  call dein#add('godlygeek/tabular')
  call dein#add('Shougo/deoplete-lsp', {'on_ft': ['c', 'cpp']})
  call dein#add('ap/vim-css-color')
  call dein#add('itchyny/lightline.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('vimwiki/vimwiki', {'on_cmd': 'VimwikiIndex'})
  call dein#add('neovim/nvim-lsp')
  "call dein#add('nvim-lua/diagnostic-nvim')
  "call dein#add('nvim-lua/completion-nvim')
  call dein#add('Shougo/defx.nvim')

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

"{{{Colorscheme
colorscheme gruvbox
"set termguicolors
let g:gruvbox_italic = 1
"}}}

"{{{Lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

"}}}

"{{{Tabs
nmap tn :tabnew<CR>
nmap tc :tabclose
"}}}

"{{{Deoplete.nvim
let g:deoplete#enable_at_startup = 1
"}}}

"{{{nvim-lsp
lua require'nvim_lsp'.clangd.setup{}
lua require'nvim_lsp'.pyls.setup{}
lua require'nvim_lsp'.html.setup{}
lua require'nvim_lsp'.flow.setup{}
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
	nnoremap <silent><buffer><expr>b defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr>x defx#do_action('remove')
	nnoremap <silent><buffer><expr>m defx#do_action('move')
	nnoremap <silent><buffer><expr>e defx#do_action('open')
	nnoremap <silent><buffer><expr>i defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr>s defx#do_action('open', 'split')
	nnoremap <silent><buffer><expr>t defx#do_action('open', 'tabnew')
endfunction
"}}}

"{{{Denite
""Define mappings
"let s:denite_options = {'default' : {
"\ 'split': 'floating',
"\ 'start_filter': 1,
"\ 'auto_resize': 1,
"\ 'source_names': 'short',
"\ 'prompt': '% ',
"\ 'highlight_matched_char': 'QuickFixLine',
"\ 'highlight_matched_range': 'Visual',
"\ 'highlight_window_background': 'Visual',
"\ 'highlight_filter_background': 'DiffAdd',
"\ 'winrow': 1,
"\ 'vertical_preview': 1,
"\ 'toggle': 1,
"\ }}
"
"call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--glob', '!.clangd'])
"
"nmap <leader>db :Denite buffer<CR>
"nmap <leader>df :Denite file/rec<CR>
"nmap <leader>dp :DeniteProjectDir file<CR>
"nmap <leader>m :Denite menu<CR>
"
"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
"  nnoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action')
"  nnoremap <silent><buffer><expr> d
"  \ denite#do_map('do_action', 'delete')
"  nnoremap <silent><buffer><expr> p
"  \ denite#do_map('do_action', 'preview')
"  nnoremap <silent><buffer><expr> q
"  \ denite#do_map('quit')
"  nnoremap <silent><buffer><expr> f
"  \ denite#do_map('open_filter_buffer')
"  nnoremap <silent><buffer><expr> <Space>
"  \ denite#do_map('toggle_select').'j'
"endfunction
"
"let s:menus = {}
"let s:menus.project = {
"            \ 'description': 'Project Menu'
"            \}
"let s:menus.project.file_candidates = [
"            \ ['360pano', '~/Desktop/360pano/GIAS/vtour'],
"            \ ['nmp', '~/Documents/github/notamusicplayer'],
"            \ ['GIAS', '~/Desktop/GIIAS_04'],
"            \]
"let s:menus.git_commands = {
"            \'description': 'Does git'
"            \}
"let s:menus.git_commands.command_candidates = [
"            \ ['View current status', 'G'],
"            \ ['Add all files in directory (RECURSIVE!)', 'Git add .'],
"            \ ['Git Commit', 'Gcommit'],
"            \ ['Git Push', 'Gpush'],
"            \]
"call denite#custom#var('menu', 'menus', s:menus)
"}}}

