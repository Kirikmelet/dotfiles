;; -*- lexical-binding: t; -*-

(dolist (list '(
                (start-maps . "M-c")
                (start-commands . "M-v")
                (org-funcs-map . "M-c o")
                (app-funcs-map . "M-c a")
                (org-files-map . "M-c o f")
                (org-agenda-file-map . "M-c o f a")
                (config-files-map . "M-c c")
                (eval-map . "M-c e")
                (regex-funcs . "M-v r")
                (flymake-funcs . "M-v f")))
    (define-prefix-command (car list))
    (global-set-key (kbd (cdr list)) (car list))
  )

