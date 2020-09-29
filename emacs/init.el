;;; -*- lexical-binding t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Filename handler
(defvar file-lister-alist file-name-handler-alist)
(setq file-name-handler-alist nil)


;; Load font
(set-face-font 'default "Fira Code Retina 11")


;; Set Prefixes


(dolist (configs '(
                   package-configfile
                   bindings-config
                   custom-configfile
                   filetype-configfile
                   nihongo-config
                   ))
  (require configs))



(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-thresshold 16777216)
            (setq file-name-handler-alist file-lister-alist)
            ))
