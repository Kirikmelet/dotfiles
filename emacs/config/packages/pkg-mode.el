;; -*- lexical-binding: t; -*-


(use-package markdown-mode
  :defer 5
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package lua-mode
  :defer 5
  :mode ("\\.lua\\'"))

(use-package vimrc-mode
  :defer 5
  :mode ("\\.vim\\'"))

(use-package typescript-mode
  :defer 5
  :mode ("\\.ts\\'"))

