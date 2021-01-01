;; -*- lexical-binding: t; -*-

(use-package undo-tree
  :defer 10
  :init
  (global-undo-tree-mode))

(use-package vterm
  :defer 2
  :bind (:map start-commands
              ("t" . vterm)))

(if (executable-find "rg")
      (load-file (expand-file-name "st-utils.el" st-dir)))

