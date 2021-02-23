;;; -*- lexical-binding: t; -*-

;; Set Basic UI
(show-paren-mode 1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tab-bar-mode -1)

;; No splash
(setq inhibit-startup-screen t)

;; Font speedup
(setq frame-inhibit-implied-resize t)

;; Comp speedup
(setq comp-deferred-compilation nil)

;; Saveplaces
(add-hook 'emacs-startup-hook #'save-place-mode)

;; Copied from better-defaults.el
;; Source: https://git.sr.ht/~technomancy/better-defaults/tree/master/better-defaults.el
(setq-default indent-tabs-mode nil)

(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      toggle-truncate-lines t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      custom-file (expand-file-name "custom.el" "~/.config/emacs"))

(unless backup-directory-alist
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))
(defun set-japanese ()
  """Allows you to use the Japanese language"""
  (dolist (charset '(kana han cjk-misc symbol bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Noto Sans CJK JP"))
    )
  )

;; FOnts
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 12)
(set-face-attribute 'variable-pitch nil :font "Noto Sans Display" :weight 'regular)

