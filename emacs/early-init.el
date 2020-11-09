;; -*- lexical-binding: t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Disable package startup
(setq package-enable-at-startup nil)

;; Electric-pair
(electric-pair-mode 1)

(load-file (expand-file-name (concat "gcmh.el") (substitute-in-file-name "$HOME/.config/emacs/functions")))

;; GC
(eval-after-load "gcmh" (lambda()
 (setq gcmh-verbose             t
        ;;gcmh-lows-cons-threshold #x800000
        gcmh-high-cons-threshold most-positive-fixnum
        gcmh-idle-delay          3600)
 ))

;; Looks
(load-file (expand-file-name (concat "looks.el") (substitute-in-file-name "$HOME/.config/emacs/config")))

