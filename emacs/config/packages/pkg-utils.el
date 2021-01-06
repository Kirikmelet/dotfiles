;; -*- lexical-binding: t; -*-

(use-package undo-fu
  :defer 10
  :bind (
         ("C-z" . undo-fu-only-undo )
         ("C-S-z" . undo-fu-only-redo )))

(use-package undo-fu-session
  :after undo-fu
  :init
  (global-undo-fu-session-mode)
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'")))

(use-package vterm
  :defer 2
  :bind (:map start-commands
              ("t" . vterm)))




(if (executable-find "rg")
      (load-file (expand-file-name "st-utils.el" st-dir)))

