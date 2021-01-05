;; -*- lexical-binding: t; -*-

(use-package undo-fu
  :defer 10
  :bind (
         ("C-z" . undo-fu-only-undo )
         ("C-S-z" . undo-fu-only-redo )
         )
  )

(use-package vterm
  :defer 2
  :bind (:map start-commands
              ("t" . vterm)))

(if (executable-find "rg")
      (load-file (expand-file-name "st-utils.el" st-dir)))

