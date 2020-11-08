;;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Filename handler
(defvar file-lister-alist file-name-handler-alist)
(setq file-name-handler-alist nil)


;; Load font
(set-face-font 'default "Fira Code Retina 10")


;; Load config files


(defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
(defconst config-dir (concat emacs-dir "/config"))
(defconst func-dir (concat emacs-dir "/functions"))

(add-to-list 'load-path config-dir)
(add-to-list 'load-path func-dir)
(dolist (config
          '(
            prefixes
            customs
            packages
            bindings
            filetype
            )
          )
  (require config)
  )

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216)
            (setq file-name-handler-alist file-lister-alist)
            (set-japanese)
            ))
