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
(save-place-mode 1)

;; Copied from better-defaults.el
;; Source: https://git.sr.ht/~technomancy/better-defaults/tree/master/better-defaults.el
(setq-default indent-tabs-mode nil)
(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      custom-file (expand-file-name "~/.emacs.d/custom.el"))

(unless backup-directory-alist
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))
(defun set-japanese ()
  (dolist (charset '(kana han cjk-misc symbol bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Noto Sans CJK JP"))
    )
  )


;; Org-mode Settings
(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode)
                           (set-japanese)
                           (set-face-attribute 'variable-pitch nil :font "Noto Sans 12" :foreground "#ebddb2")
                           (set-face-attribute 'org-level-1 nil :font "Noto Sans 13" :foreground "#b8bb26")
                           (set-face-attribute 'org-level-2 nil :font "Noto Sans 13" :foreground "#fabd2f")
                           (set-face-attribute 'org-level-3 nil :font "Noto Sans 13" :foreground "#8ec07c")
                           (set-face-attribute 'org-level-4 nil :font "Noto Sans 13" :foreground "#fb4934")
                           (set-face-attribute 'org-document-title nil :font "Noto Sans 13" :bold 1 :foreground "#fe8019")
                           (set-face-attribute 'org-document-info nil :font "Noto Sans 11" :foreground "#a89984")
                           (set-face-attribute 'org-document-info-keyword nil :font "Noto Sans 11")
                           (set-face-attribute 'org-done nil :font "Noto Sans 12" :italic 1 :strike-through 1)
                           (set-face-attribute 'org-todo nil :font "Noto Sans 12" :italic 1)
                           (set-face-attribute 'org-link nil :font "Noto Sans 12" :foreground  "#458588")
                           (variable-pitch-mode t)
                           )
          )

(provide 'looks)
