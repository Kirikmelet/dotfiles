

"{{{Folding
set foldmethod=marker
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"}}}
"{{{Packadd
packloadall
silent! helptags ALL
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

"{{{Colorscheme
colorscheme gruvbox
set termguicolors
let g:gruvbox_italic = 1
"}}}

"{{{Tabs
nmap tn :tabnew<CR>
nmap tc :tabclose
"}}}

"{{{ALE
let g:ale_completion_enabled = 1
"}}}

"{{{Lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
"}}}


