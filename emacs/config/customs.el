;;; -*- lexical-binding t; -*-
;; custom-fileconfig
;; Custom settings

;; Changes yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;(icomplete-mode 1)
;;(fido-mode 1)
;; Icomplete
;;(with-eval-after-load "icomplete"
;; (setq completion-styles '(flex partial-completion substring)
;;      completion-category-overrides '((file (styles flex substring)))
;;      read-file-name-completion-ignore-case t
;;      read-buffer-completion-ignore-case t
;;      icomplete-compute-delay 0.1
;;      completion-ignore-case t))

;;Isearch
(setq search-default-mode t)

;; Dired
(with-eval-after-load "dired"
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (require 'dired-x)
  (add-hook 'dired-mode-hook 'dired-omit-mode)
  (setq dired-dwim-target 1)
  (setq dired-omit-files "^\\.$\\|^\\.\\.$\\|^\\..*$"))

(setq-default mpc-host "127.0.0.1:23955")
