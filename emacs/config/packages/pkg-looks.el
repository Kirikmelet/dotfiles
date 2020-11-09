;; -*- lexical-binding: t; -*-

(use-package gruvbox-theme
  :defer 1
  :init
  (load-theme 'gruvbox-dark-medium t))

(use-package which-key
  :defer 3
  :init
  (which-key-mode)
  :custom
  (which-key-use-C-h-commands t))
