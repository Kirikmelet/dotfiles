;;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Filename handler
(defvar file-lister-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Load font
(set-face-font 'default "Source Code Pro 16")

;; Load config files

(defconst cfg-dir (expand-file-name "config/" user-emacs-directory))

(dolist (config
         '(
           "bindings"
           "packages"
           "functions"
           "filetype"
           )
         )
  (load-file (expand-file-name (concat config ".el") cfg-dir)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216)
            (setq file-name-handler-alist file-lister-alist)
            (set-japanese)))
