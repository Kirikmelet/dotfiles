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

;; FOnts
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina")
(set-face-attribute 'variable-pitch nil :font "Noto Sans Display" :weight 'regular)

;; Org-mode Settings
(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode)
                           (variable-pitch-mode)
                           (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-code nil   :inherit 'fixed-pitch)
                           (set-face-attribute 'org-indent nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-verbatim nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-meta-line nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)))
(add-hook 'org-mode-hook (lambda ()
                           (let* ((variable-tuple
                                   (cond ((x-list-fonts "Noto Sans Display")         '(:font "Noto Sans Display"))
                                         ((x-list-fonts "Noto Sans") '(:font "Noto Sans"))
                                         ((x-list-fonts "Liberation San")   '(:font "Liberation Sans"))
                                         ((x-list-fonts "DejaVu Sans")         '(:font "DejaVu Sans"))
                                         ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                                         (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
                                  (base-font-color     (face-foreground 'default nil 'default))
                                  (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
                             
                             (custom-theme-set-faces
                              'user
                              `(org-level-8 ((t (,@headline ,@variable-tuple))))
                              `(org-level-7 ((t (,@headline ,@variable-tuple))))
                              `(org-level-6 ((t (,@headline ,@variable-tuple))))
                              `(org-level-5 ((t (,@headline ,@variable-tuple))))
                              `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                              `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                              `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                              `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                              `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))
          )

(provide 'looks)
