;;; -*- lexical-binding t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Filename handler
(defvar file-lister-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Paths to load
(defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
(defconst config-dir (concat emacs-dir "/config"))
(defconst func-dir (concat emacs-dir "/functions"))

;; Loads config files
(add-to-list 'load-path config-dir)

;; Load font
(set-face-font 'default "Fira Code Medium 11")


;; Loads packages
(require 'package-configfile)


;; better-defaults by Phil Hagelberg 
;; https://git.sr.ht/~technomancy/better-defaults/tree/master/better-defaults.el
;;(require 'better-defaults)

;; Loads custom config
(require 'custom-fileconfig)

;; Loads custom bindings
(require 'bindings-config)

;; Loads Japanese Language config
(require 'nihongo-config)

;; Javascript config
(require 'javascript-ftconf)

;; Clang config
(require 'c-ftconf)

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-thresshold 16777216)
            (setq file-name-handler-alist file-handler-alist)
            ))
