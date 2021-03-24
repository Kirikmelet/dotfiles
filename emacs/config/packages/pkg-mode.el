;; -*- lexical-binding: t; -*-


(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package lua-mode
  :mode ("\\.lua\\'"))

(use-package vimrc-mode
  :mode ("\\.vim\\'"))

(use-package typescript-mode
  :mode ("\\.ts\\'")
  :defines typescript-indent-level
  :config
  )

