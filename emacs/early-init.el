;; -*- lexical-binding: t; -*-
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Disable package startup
(setq-default package-enable-at-startup nil)


;; I hate this shit so fucking much
(global-unset-key (kbd "C-z"))

;; Electric-pair
(add-hook 'after-init-hook #'electric-pair-mode)

;; ????

(load-file (expand-file-name "functions/gcmh.el" user-emacs-directory))

;; GC
(gcmh-mode)
(eval-after-load "gcmh" (lambda()
 (setq gcmh-verbose             t
        ;;gcmh-lows-cons-threshold #x800000
        gcmh-high-cons-threshold most-positive-fixnum
        gcmh-idle-delay          3600)
 ))

;; Looks
(load-file (expand-file-name "config/looks.el" user-emacs-directory))

