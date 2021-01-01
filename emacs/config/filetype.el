;; Filetype configs -*- lexical-binding t; -*-

;; C-lang
(defun c-config ()
  (setq c-default-style "linux"
        c-basic-offset 8))

(defun ts-config ()
  (message "HI TYPESCRIPT :D")
  )

;; Javascript
(defun js-config ()
  (setq js-indent-level 2))

(add-hook 'js-mode-hook '(lambda () js-config))
(add-hook 'c-mode-hook '(lambda () c-config))
(add-hook 'typescript-mode-hook '(lambda () ts-config))

