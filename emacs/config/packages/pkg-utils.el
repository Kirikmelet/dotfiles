;; -*- lexical-binding: t; -*-



(use-package undo-tree
  :defer 10
  :init
  (global-undo-tree-mode))

(if (or (executable-find "rg") (executable-find "rg.exe"))
    (use-package rg
      :defer 8
      :bind (:map regex-funcs
                  ("f" . rg-thisbuffer)
                  ("r" . rg))
      :config
      (rg-define-search rg-thisbuffer
        "Search this buffer"
        :dir default-directory
        :files current
        :menu ("Search" "C" "Current"))))


