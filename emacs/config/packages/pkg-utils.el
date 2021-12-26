;; -*- lexical-binding: t; -*-

(use-package undo-fu
  :defer 10
  :bind (
         ("C-_" . undo-fu-only-undo )
         ("C-x u" . undo-fu-only-redo )))

(use-package undo-fu-session
  :after undo-fu
  :defines undo-fu-session-incompatible-files
  :functions global-undo-fu-session-mode
  :init
  (global-undo-fu-session-mode)
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'")))

(use-package vterm
  :defer 2
  :no-require t
  :bind (:map start-maps
              ("a t" . vterm)))

;; Dired
(with-eval-after-load "dired"
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (require 'dired-x)
  (add-hook 'dired-mode-hook 'dired-omit-mode)
  (setq dired-dwim-target 1)
  (setq dired-omit-files "^\\.$\\|^\\.\\.$\\|^\\..*$"))


(if (executable-find "rg")
      (load-file (expand-file-name "st-utils.el" st-dir)))

