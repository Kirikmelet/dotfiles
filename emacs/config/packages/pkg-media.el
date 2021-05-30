;; -*- lexical-binding: t; -*-

(use-package simple-mpc
  :defer 10)

(use-package pdf-tools
  :mode ("\\.pdf\\'"))

(use-package elcord
  :defer 20
  :config
  (elcord-mode))
