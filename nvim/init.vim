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
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/defx.nvim')
  "call dein#add('Shougo/deoplete-lsp', {'on_ft': ['c', 'cpp', 'javascript', 'html', 'rust']})

  " Markdown Preview:
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd', 'vimwiki'],
					\ 'build': 'sh -c "cd app & npm install"' })

  " FUZZY SEARCH:
  " call dein#add('Yggdroot/LeaderF', { 'build': './install.sh', 'on_cmd': 'Leaderf' })

  " Gruvbox:
  call dein#add('shinchu/lightline-gruvbox.vim')
  call dein#add('morhetz/gruvbox')

  " Git:
  call dein#add('tpope/vim-fugitive')

  " CSS Colors:
  call dein#add('ap/vim-css-color', {'on_ft' : ['sxhkdrc', 'javascript', 'css', 'html', 'conf']})
    
  " Statusline:
  call dein#add('itchyny/lightline.vim')

  " FTPlugin Plugin:
  call dein#add('sheerun/vim-polyglot')

  " VimWiki:
  call dein#add('vimwiki/vimwiki', {'on_cmd': 'VimwikiIndex'})

  " File Formatting:
  call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})

  " File Explorer:
  "call dein#add('mcchrish/nnn.vim', {'on_cmd': 'NnnPicker'})

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


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"}}}

" Thats it:
lua require('init')

