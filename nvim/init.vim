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

set omnifunc=v:lua.vim.lsp.omnifunc

"}}}

"{{{Vim apps
" 0 - Disable
" 1 - Enable
let g:loaded_gzip = 0
let g:loaded_tar = 0
let g:loaded_tarPlugin = 0
let g:loaded_zip = 0
let g:loaded_zipPlugin = 0

let g:loaded_getscript = 0
let g:loaded_getscriptPlugin = 0
let g:loaded_vimball = 0
let g:loaded_vimballPlugin = 0

let g:loaded_matchit = 0
let g:loaded_matchparen = 0
let g:loaded_2html_plugin = 0
let g:loaded_logiPat = 0
let g:loaded_rrhelper = 0

let g:loaded_netrw = 0
let g:loaded_netrwPlugin = 0
let g:loaded_netrwSettings = 0
let g:loaded_netrwFileHandlers = 0
"}}}

"{{{Sudo write
command! Suwrite :w !sudo tee %  <CR>
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

  " Shougo Plugins:
  "call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
  "call dein#add('deoplete-plugins/deoplete-jedi', {'on_ft': 'python'}) " Because I couldn't get native LSP to work...
  "call dein#add('Shougo/denite.nvim')
  "call dein#add('Shougo/defx.nvim')
  "call dein#add('Shougo/deoplete-lsp', {'on_ft': ['c', 'cpp', 'javascript', 'html', 'rust']})

  " Markdown Preview:
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd', 'vimwiki'],
					\ 'build': 'sh -c "cd app & npm install"' })

  " FUZZY SEARCH:
  call dein#add('Yggdroot/LeaderF', { 'build': './install.sh', 'on_cmd': 'Leaderf' })

  " Gruvbox:
  call dein#add('shinchu/lightline-gruvbox.vim')
  call dein#add('morhetz/gruvbox')

  " Git:
  call dein#add('tpope/vim-fugitive')

  " CSS Colors:
  call dein#add('ap/vim-css-color')
    
  " Statusline:
  call dein#add('itchyny/lightline.vim')

  " FTPlugin Plugin:
  call dein#add('sheerun/vim-polyglot')

  " VimWiki:
  call dein#add('vimwiki/vimwiki', {'on_cmd': 'VimwikiIndex'})

  " File Formatting:
  call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})

  " File Explorer:
  call dein#add('mcchrish/nnn.vim', {'on_cmd': 'NnnPicker'})

  " ORG MODE:
  call dein#add('jceb/vim-orgmode')
  call dein#add('tpope/vim-speeddating', {'on_ft': 'org'})
  call dein#add('tpope/vim-repeat', {'on_ft': 'org'})
  call dein#add('itchyny/calendar.vim', {'on_cmd': 'Calendar'})

  " Lsp:
  call dein#add('neovim/nvim-lsp')
  call dein#add('nvim-lua/diagnostic-nvim')
  call dein#add('nvim-lua/completion-nvim')

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

"{{{Splits
nmap <leader>sv :vsplit<CR>
nmap <leader>sh :split<CR>
"}}}

"{{{Tabs
nmap <leader>tn :tabnew<CR>
nmap <leader>tc :tabclose
"}}}

"{{{Completion-nvim / Diagnostic-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:diagnostic_enable_virtual_text = 1
"}}}

"{{{nvim-lsp
lua << EOF
local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
  require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.html.setup{on_attach=on_attach_vim}
end
EOF
lua require'nvim_lsp'.clangd.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.html.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}

" Config

  nnoremap <silent> <leader>lge    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <leader>lgd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <leader>lh     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <leader>lgD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <leader>ltd   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> <leader>lgr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> <leader>lff    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> <leader>lgW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

"}}}

"{{{Defx
"call defx#custom#option('_', {
"      \ 'split': 'vertical',
"      \ 'winwidth': 30,
"      \ 'show_ignored_files': 1,
"      \ 'buffer_name': 'defxplorer',
"      \ 'toggle': 1,
"      \ 'resume': 1,
"      \ 'direction': 'topleft',
"      \ 'ignored_files':
"      \ '.git,.clangd',
"      \ 'root_marker': '',
"      \ })
"call defx#custom#column('git', {
"            \ 'indicators': {
"            \ 'Modified' : 'g!m',
"            \ 'Staged' : 'g!s',
"            \ 'Untracked': '',
"            \ 'Renamed': 'g!r',
"            \ 'Ignored' :'g!i',
"            \ 'Deleted' : 'g!d',
"            \ 'Unknown' : 'g!u'}
"            \})
"
"augroup checkdefx
"    autocmd!
"    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
"    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
"augroup END
"autocmd FileType defx call s:defxset()
"function! s:defxset() abort
"        setlocal signcolumn=no expandtab
"	nnoremap <silent><buffer><expr><CR> defx#do_action('drop')
"	nnoremap <silent><buffer><expr>c defx#do_action('copy')
"	nnoremap <silent><buffer><expr>b defx#do_action('cd', ['..'])
"	nnoremap <silent><buffer><expr>x defx#do_action('remove')
"	nnoremap <silent><buffer><expr>m defx#do_action('move')
"	nnoremap <silent><buffer><expr>i defx#do_action('open', 'vsplit')
"	nnoremap <silent><buffer><expr>v defx#do_action('open', 'split')
"	nnoremap <silent><buffer><expr>t defx#do_action('open', 'tabnew')
"        nnoremap <silent><buffer><expr>q defx#do_action('quit')
"        nnoremap <silent><buffer><expr>s defx#do_action('save_session')
"        nnoremap <silent><buffer><expr>r defx#do_action('rename')
"        nnoremap <silent><buffer><expr>p defx#do_action('paste')
"        nnoremap <silent><buffer><expr>E defx#do_action('execute_system')
"        nnoremap <silent><buffer><expr>y defx#do_action('yank_path')
"        nnoremap <silent><buffer><expr>nf defx#do_action('new_file')
"        nnoremap <silent><buffer><expr>nd defx#do_action('new_directory')
"        nnoremap <silent><buffer><expr>nF defx#do_action('new_multiple_files')
"endfunction
"}}}

"{{{Denite
"Define mappings
"call denite#custom#option('_', {
"\ 'split': 'horizontal',
"\ 'winheight': 5,
"\ 'start_filter': v:false,
"\ 'smartcase': v:true,
"\ 'source_names': 'short',
"\ 'filter_split_direction': 'horizontal',
"\ 'highlight_filter_background': 'NormalFloat',
"\ 'prompt': '>$ ',
"\ 'floating_preview': v:true,
"\ 'statusline': v:false,
"\ })
"
"
"call denite#custom#var('grep', {
"			\ 'command': ['rg'],
"		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
"		\ 'recursive_opts': [],
"		\ 'pattern_opt': ['--regexp'],
"		\ 'separator': ['--'],
"		\ 'final_opts': [],
"		\ })
"call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--glob', '!.clangd'])
"
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
"  nnoremap <silent><buffer><expr> /
"  \ denite#do_map('open_filter_buffer')
"  nnoremap <silent><buffer><expr> <Space>
"  \ denite#do_map('toggle_select').'j'
"  nnoremap <silent><buffer><expr> i
"    \ denite#do_map('do_action', 'vsplit')
"  nnoremap <silent><buffer><expr> v
"    \ denite#do_map('do_action', 'split')
"  nnoremap <silent><buffer><expr> t
"    \ denite#do_map('do_action', 'tabopen')
"  nnoremap <silent><buffer><expr> s
"    \ denite#do_map('do_action', 'preview')
"endfunction
"
"let s:menus = {}
"let s:menus.project = {
"            \ 'description': 'Project Menu'
"            \}
"let s:menus.project.file_candidates = [
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

"{{{LeaderF
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_DefaultMode = 'Regex'

let g:Lf_WindowHeight = 0.15
"}}}

"{{{Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nnoremap <leader>wi :VimwikiIndex<CR>
"}}}

"{{{ Org-mode
let g:org_agenda_files=['~/org/global_agenda/work.org', '~/org/global_agenda/school.org', '~/org/global_agenda/projects.org']
"}}}

"{{{File hotkeys
nnoremap  <leader>fs :Leaderf! rg --current-buffer -e 
"nnoremap <silent> <leader>ff <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ff :Neoformat<CR>
"nnoremap <silent> <leader>ff gggqG
nnoremap <silent> <leader>fm :make<CR>
nnoremap <silent> <leader>fts :Leaderf tag<CR>
nnoremap <silent> <leader>ftg <cmd>!ctags %<CR>
"}}}

"{{{Buffer hotkeys
nnoremap <silent> <leader>bf :Leaderf file<CR>
"nnoremap <silent> <leader>bd :Defx<CR>
nnoremap <silent> <leader>bd :NnnPicker<CR>
nnoremap <silent> <leader>bb :Leaderf buffer<CR>
nnoremap <silent> <leader>bso zo
nnoremap <silent> <leader>bsc zc
nnoremap <silent> <leader>bst za
nnoremap <silent> <leader>bsC zM
nnoremap <silent> <leader>bsO zR
nnoremap <silent> <leader>bps :mksession!<CR>
nnoremap <silent> <leader>bpo :source Session.vim<CR>
"}}}

"{{{Application Hotkeys
nnoremap <leader>aw :VimwikiIndex<CR>
nnoremap <leader>ao :NnnPicker ~/org<CR>
nnoremap <leader>ac :Calendar<CR>
nnoremap <leader>ad :NnnPicker<CR>
"}}}

