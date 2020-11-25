;; -*- lexical-binding: t; -*-



(use-package undo-tree
  :defer 10
  :init
  (global-undo-tree-mode))


(if (or (executable-find "rg") (executable-find "rg.exe"))
      (load-file (expand-file-name "st-utils.el" st-dir)))

