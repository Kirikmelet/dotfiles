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
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/defx.nvim')
  "call dein#add('Shougo/deoplete-lsp', {'on_ft': ['c', 'cpp', 'javascript', 'html', 'rust']})

  " Markdown Preview:
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'sh -c "cd app & npm install"' })

 
  " Gruvbox:
  call dein#add('morhetz/gruvbox')

  " Git:
  call dein#add('tpope/vim-fugitive')

  " CSS Colors:
    

  " FTPlugin Plugin:
  call dein#add('sheerun/vim-polyglot')

  " File Formatting:
  call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})

  " File Explorer:
  "call dein#add('mcchrish/nnn.vim', {'on_cmd': 'NnnPicker'})

  " ORG MODE:
  call dein#add('jceb/vim-orgmode')

  " Lsp:
  call dein#add('neovim/nvim-lsp')
  call dein#add('nvim-lua/diagnostic-nvim')
  call dein#add('nvim-lua/completion-nvim')



  " Required:
  call dein#end()
  call dein#save_state()
endif


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
