"{{{Basic Configs
syntax on   
set cursorline
 set nocompatible
 filetype plugin on
 set number
 set encoding=UTF-8   
 set shiftwidth=4
nmap <space> <leader>
autocmd FileType *  setlocal foldmethod=marker
map <A-d> :NERDTreeToggle<CR>   
set noshowmode
 "}}} 
"{{{Filetype
autocmd FileType c setlocal shiftwidth=8 tabstop=8 sts=0 smarttab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 sts=0 expandtab
"}}}
"{{{Folding
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"}}}
 let g:airline_powerline_fonts = 0
 let g:airline#extensions#tabline#enabled = 0
 let g:airline#extensions#tabline#show_splits = 1
 let g:deoplete#enable_at_startup = 1
 nmap <A-t> :TagbarToggle<CR>
 let g:neosnippet#enable_completed_snippet = 1
set foldmethod=marker   
set foldnestmax=10
set nofoldenable
set foldlevel=2
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
 "{{{Plugs
 call plug#begin()   
	 Plug 'lervag/vimtex'
	 Plug 'ludovicchabant/vim-gutentags'
	 Plug 'neovim/nvim-lsp'
	 Plug 'shinchu/lightline-gruvbox.vim'
	 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
         Plug 'roxma/nvim-yarp'
	 Plug 'roxma/vim-hug-neovim-rpc'
	 Plug 'tpope/vim-fugitive'
	 Plug 'hsanson/vim-android'
	 Plug 'echuraev/translate-shell.vim'
	 Plug 'tpope/vim-repeat'
	 Plug 'tpope/vim-obsession'
	 Plug 'greyblake/vim-preview'
	 Plug 'gko/vim-coloresque'
         Plug 'tpope/vim-surround'   
	 Plug 'airblade/vim-gitgutter'
         Plug 'scrooloose/nerdtree'   
	 Plug 'itchyny/lightline.vim'	
         Plug 'majutsushi/tagbar'   
	 Plug 'raimondi/delimitmate'
         Plug 'ryanoasis/vim-devicons'   
         Plug 'godlygeek/tabular'   
         Plug 'junegunn/fzf'   
	 Plug 'lilydjwg/colorizer'
	 Plug 'w0rp/ale'
         Plug 'neomake/neomake'   
         Plug 't9md/vim-choosewin'    
	 Plug 'w0ng/vim-hybrid'	 
	 Plug 'morhetz/gruvbox'
	 Plug 'sheerun/vim-polyglot'
	 Plug 'vimwiki/vimwiki'
call plug#end()
"}}}
"{{{Colors
"set modeline
colorscheme gruvbox
set termguicolors
"}}}
"{{{COMMAND
command! VShell vs<bar>term
command! HShell split<bar>term
"}}}
"{{{TERMINAL
tnoremap <Esc>e <C-\><C-n>
"}}}
"{{{lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
set showtabline=2
"}}}
"{{{coc-nvim Plugins
 let g:coc_global_extensions = ['coc-tslint-plugin',  'coc-vimtex', 'coc-word',  'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-python']
 "}}}
"{{{coc-explorer
"nnoremap <A-d> :CocCommand explorer<CR>
"}}}
"{{{vim-android
let g:android_sdk_path = "/home/troyd/Android/Sdk"
"}}}
"{{{translate-shell.vim
inoremap <silent> <leader>t <ESC>:Trans<CR>
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :Trans<CR>
nnoremap <silent> <leader>td :TransSelectDirection<CR>
vnoremap <silent> <leader>td :TransSelectDirection<CR>
"}}}
"{{{vim-fugitive
nmap <leader>g :G<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>ggr :Ggrep  
nmap <leader>gd :Gdelete<CR>
nmap <leader>gdd :GDelete<CR>
nmap <leader>gcd :Gcd
nmap <leader>gw :GWrite<CR>
"}}}
"{{{vim-obsession
nnoremap <Leader>rec :Obsess<CR>
nnoremap <Leader>res :Obsess!<CR>
"}}}
"{{{vim-mail
let g:VimMailClient="/usr/bin/neomutt"
nnoremap <Leader>m :! mutt -a %
"}}}
"{{{ HTML-PREVIEW
nmap <A-h> :silent !surf "file://%:p" &<CR>
"}}}
"{{{ ctrl-p 
let g:ctrlp_extensions = ['mpc']
nnoremap <Leader>mpc :CtrlPMpc<CR>
"}}}
"{{{mpc
let g:ctrlp_mpc_cmd = 'mpc --port 23955'
"}}}
"{{{vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
nmap <leader>vwa :VimwikiAll2HTML<CR>
nmap <leader>vi :VimwikiIndex<CR>
"}}}
"{{{vimtex
let g:vimtex_compiler_progname = 'nvr'
"}}}
"{{{git-fugitive
nmap Gc :Gcommit <CR>
nmap Gs :Gstatus <CR>
nmap Gw :Gwrite <CR>
nmap Gp :Gpush <CR>
"}}}
"{{{FZF
nmap <A-f> :FZF <CR>
"}}}
"{{{Tabs
nmap tn :tabnew <CR>
nmap tc :tabclose
nmap te :tabedit
nmap to :tabonly <CR>
"}}}
"{{{ChooseWin
let g:choosewin_overlay_enable = 1
"}}}
"{{{nvim-lsp
autocmd FileType c lua require'nvim_lsp'.clangd.setup{}
autocmd Filetype html lua require'nvim_lsp'.html.setup{}
autocmd Filetype css lua require'nvim_lsp'.css.setup{}
"}}}
