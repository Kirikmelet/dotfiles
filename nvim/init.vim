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
 let g:deoplete#enable_at_startup = 1
 nmap gw        :InteractiveWindow<CR>   
 nmap  -  :ChooseWin<CR>
 nmap <A-t> :TagbarToggle<CR>
 let g:neosnippet#enable_completed_snippet = 1
set foldmethod=marker   
set foldnestmax=10
set nofoldenable
set foldlevel=2
 "{{{Plugs
 call plug#begin()   
         Plug 'tpope/vim-fugitive'
	 Plug 'neoclide/coc.nvim', {'branch': 'release'}
	 Plug 'vim-airline/vim-airline-themes'
	 Plug 'lervag/vimtex'
	 Plug 'hsanson/vim-android'
	 Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	 Plug 'echuraev/translate-shell.vim'
	 Plug 'tpope/vim-repeat'
	 Plug 'tpope/vim-obsession'
	 Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	 Plug 'azadkuh/vim-cmus'
	 Plug 'greyblake/vim-preview'
	 Plug 'gko/vim-coloresque'
	 Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
         Plug 'tpope/vim-surround'   
	 Plug 'airblade/vim-gitgutter'
	 Plug 't9md/vim-choosewin'
         Plug 'romgrk/winteract.vim'   
	 Plug 'vim-scripts/netrw.vim'
         Plug 'scrooloose/nerdtree'   
         Plug 'vim-airline/vim-airline'   
         Plug 'majutsushi/tagbar'   
         Plug 'pseewald/vim-anyfold'   
	 Plug 'raimondi/delimitmate'
         Plug 'ctrlpvim/ctrlp.vim'   
         Plug 'xuyuanp/nerdtree-git-plugin'   
         Plug 'ryanoasis/vim-devicons'   
         Plug 'vim-airline/vim-airline'   
         Plug 'godlygeek/tabular'   
	 Plug 'rbgrouleff/bclose.vim'
	 Plug 'lucidstack/ctrlp-mpc.vim'
         Plug 'junegunn/fzf'   
	 Plug 'shmargum/vim-sass-colors'
	 Plug 'ap/vim-css-color'
	 Plug 'fenetikm/falcon'
	 Plug 'w0rp/ale'
         Plug 'yggdroot/indentline'   
         Plug 'neomake/neomake'   
         Plug 't9md/vim-choosewin'    
	 Plug 'w0ng/vim-hybrid'	 
	 Plug 'zeis/vim-kolor'
	 Plug 'morhetz/gruvbox'
	 Plug 'sheerun/vim-polyglot'
	 Plug 'nanotech/jellybeans.vim'
	 Plug 'vimwiki/vimwiki'
call plug#end()
"}}}
"{{{Colors
set modeline
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
"{{{vim-latex-live
nmap <A-l> :LLPStartPreview<CR>
let g:livepreview_previewer = 'zathura'
"}}}
"{{{vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
nmap <leader>vwa :VimwikiAll2HTML<CR>
nmap <leader>vi :VimwikiIndex<CR>
"}}}
"{{{vim-cmus
let mapleader=" "
nmap <A-m> :Cmus<CR>
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
"{{{coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"}}}
