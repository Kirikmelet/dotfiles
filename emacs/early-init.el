;; -*- lexical-binding: t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Disable package startup
(setq-default package-enable-at-startup nil)

;; Wtf Gentoo
(setenv "HOME" "/home/troyd")

;; I hate this shit so fucking much
(global-unset-key (kbd "C-z"))

;; Electric-pair
(add-hook 'after-init-hook #'electric-pair-mode)

(load-file (expand-file-name (concat "gcmh.el") (substitute-in-file-name "$HOME/.config/emacs/functions")))

;; GC
(gcmh-mode)
(eval-after-load "gcmh" (lambda()
 (setq gcmh-verbose             t
        ;;gcmh-lows-cons-threshold #x800000
        gcmh-high-cons-threshold most-positive-fixnum
        gcmh-idle-delay          3600)
 ))

;; Looks
(load-file (expand-file-name (concat "looks.el") (substitute-in-file-name "$HOME/.config/emacs/config")))

