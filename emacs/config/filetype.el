;; Filetype configs -*- lexical-binding t; -*-

(eval-when-compile
  (defvar c-default-style)
  (defvar c-basic-offset)
  (defvar js-indent-level))

;; C-lang
(defun c-config ()
  (setq c-default-style "linux"
        c-basic-offset 8))

(defun ts-config ()
  (setq typescript-indent-level 2)
  )

;; Javascript
(defun js-config ()
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'js-config)
(add-hook 'c-mode-hook 'c-config)
(add-hook 'typescript-mode-hook 'ts-config)
