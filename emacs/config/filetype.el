;; Filetype configs -*- lexical-binding t; -*-

;; C-lang
(setq c-default-style
      (quote(
             (c-mode . "linux")
             (java-mode . "java")
             (awk-mode . "awk")
             (other . "linux")
             )
            )
      )

(add-hook 'c-mode-hook (lambda() (setq tabs-indent-mode t)) )

;; Javascript
(defun js-config ()
  (setq js-indent-level 2)
  (setq tabs-indent-mode t))

(add-hook 'js-mode-hook (lambda() (js-config)))

(provide 'filetype)
