;;; -*- lexical-binding t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Filename handler
(defvar file-lister-alist file-name-handler-alist)
(setq file-name-handler-alist nil)


;; Load font
(set-face-font 'default "Fira Code Retina 11")


;; Load config files


(dolist (config
         '(
           prefixes
           customs
           packages
           bindings
           filetype
;;           nihongo
           )
         )
  (require config)
  )

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-thresshold 16777216)
            (setq file-name-handler-alist file-lister-alist)
            ))
