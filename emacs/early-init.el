;;; -*- lexical-binding t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Just in case
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Disable package startup
(setq package-enable-at-startup nil
      package--init-file-ensured t)

;; Electric-pai
(electric-pair-mode 1)


;; Paths to load
(defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
(defconst config-dir (concat emacs-dir "/config"))
(defconst func-dir (concat emacs-dir "/functions"))

(add-to-list 'load-path config-dir)
(add-to-list 'load-path func-dir)

;; better-defaults by Phil Hagelberg
;; https://git.sr.ht/~technomancy/better-defaults/tree/master/better-defaults.el
;;(require 'better-defaults)

(require 'basicfunc)

;; GC
(require 'gcmh)

;; Looks
(require 'looks)
