;; -*- lexical-binding: t; -*-



(use-package undo-tree
  :defer 10
  :init
  (global-undo-tree-mode))


(if (or (executable-find "rg") (executable-find "rg.exe"))
    (with-eval-after-load "grep" (lambda()
                                   (setq grep-find-template "rg -n -H --no-heading --smart-case -e '<R>' <D>")
                                   (grep-apply-setting 'grep-find-command '("rg -n -H --no-heading --smart-case -e '' $(git rev-parse --show-toplevel 2>/dev/null || pwd)" . 40)))))
