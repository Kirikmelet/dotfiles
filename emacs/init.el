;;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Filename handler
(defvar file-lister-alist file-name-handler-alist)
(setq file-name-handler-alist nil)


;; Load font
(set-face-font 'default "Fira Code Retina 10")


;; Load config files

(if (not (eq system-type 'windows-nt))
    (defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
  (defconst emacs-dir (substitue-in-file-name "%APPDATA%/emacs")))
(defconst cfg-dir (concat emacs-dir "/config"))

(dolist (config
          '(
            "prefixes"
            "customs"
            "packages"
            "functions"
            ;;"win-pkg" ;; For Windows w/o GIT
            "bindings"
            "filetype"
            )
          )
  (load-file (expand-file-name (concat config ".el") cfg-dir))
  )

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216)
            (setq file-name-handler-alist file-lister-alist)
            (if (eq window-system t)
                (set-japanese)
                )
            ))
