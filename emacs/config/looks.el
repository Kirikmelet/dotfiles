;;; -*- lexical-binding: t; -*-

;; Set Basic UI
(show-paren-mode 1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tab-bar-mode -1)

;; Saveplaces
(add-hook 'emacs-startup-hook #'save-place-mode)

(setq save-interprogram-paste-before-kill t
      inhibit-startup-screen t
      use-dialog-box nil
      frame-inhibit-implied-resize t
      comp-deferred-compilation nil
      indent-tabs-mode nil
      apropos-do-all t
      toggle-truncate-lines t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      custom-file (expand-file-name "custom.el" user-emacs-directory))

(unless backup-directory-alist
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

(fset 'yes-or-no-p 'y-or-n-p)

(defun set-japanese ()
  """Allows you to use the Japanese language"""
  (dolist (charset '(kana han cjk-misc symbol bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Noto Sans CJK JP"))
    )
  )
