;; -*- lexical-binding: t; -*-

;; (use-package gruvbox-theme
;;   :ensure t
;;   :demand t
;;   :init
;;   (load-theme 'gruvbox-dark-medium t))

;; (use-package modus-themes
;;  :ensure
;;  :init
;;  ;; Add all your customizations prior to loading the themes
;;  ;; (setq modus-themes-slanted-constructs t
;;  ;;       modus-themes-bold-constructs t
;;  ;;       modus-themes-syntax "alt-syntax"
;;  ;;       modus-themes-completions "opinionated")
;;  ;; Load the theme files before enabling a theme
;;  (modus-themes-load-themes)
;;  :config
;;  ;; Load the theme of your choice:
;;  ;;(modus-themes-load-operandi))
;;  ;;(modus-themes-load-vivendi))

(use-package moe-theme
 :ensure t
 :demand t
 :config
 (moe-light))

(use-package which-key
  :defer t
  :init
  (add-hook 'after-init-hook 'which-key-mode)
  :custom
  (which-key-use-C-h-commands t))
