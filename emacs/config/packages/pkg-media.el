;; -*- lexical-binding: t; -*-

(use-package simple-mpc
  :defer 10)

(use-package pdf-tools
  :mode ("\\.pdf\\'")
  :config
  (pdf-loader-install)
  )

(use-package elcord
  :defer 20
  :config
  (elcord-mode))
