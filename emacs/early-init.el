;; -*- lexical-binding t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Disable package startup
(setq package-enable-at-startup nil
      package--init-file-ensured t)

;; Electric-pair
(electric-pair-mode 1)


;; Paths to load

(defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
(defconst config-dir (concat emacs-dir "/config"))
(defconst func-dir (concat emacs-dir "/functions"))

(add-to-list 'load-path config-dir)
(add-to-list 'load-path func-dir)

;; GC
(require 'gcmh)
(eval-after-load "gcmh" (lambda()
 (setq gcmh-verbose             t
        gcmh-lows-cons-threshold #x800000
        gcmh-high-cons-threshold most-positive-fixnum
        gcmh-idle-delay          3600)
 ))

;; Looks
(require 'looks)

