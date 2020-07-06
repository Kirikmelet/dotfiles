#!/bin/sh
DIR=~/.config/nvim/pack

cd $DIR/schemes/start/gruvbox && git fetch  
cd $DIR/syntax/start/vim-polyglot && git fetch 
cd $DIR/lsp/start/ale && git fetch 
cd $DIR/lightline/start/lightline && git fetch
cd $DIR/lightline/start/lightline-gruvbox && git fetch
