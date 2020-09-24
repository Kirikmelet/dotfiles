;;; -*- lexical-binding t; -*-
;; package-configfile
;; Handles load of packages

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Checks if package is installed
(dolist (pkg '(
               ;; Inset package here;
               
               ;; Grep
               rg
               
               ;; Selectrum
               selectrum
               selectrum-prescient
               prescient
               ctrlf

               ;;Music ?
               simple-mpc

               ;; Org-mode
               org
               org-projectile
               htmlize

               ;; Theme
               gruvbox-theme
               dashboard
               all-the-icons
               all-the-icons-dired

               ;; Modes
               markdown-mode
               lua-mode
               vimrc-mode

               ;; Tools
               pdf-tools

               ;; Handles keybind popup
               which-key
               ;;evil
               ;;evil-collection



               ;; LSP
               lsp-mode
               lsp-ui
               company
               company-box
               format-all

               ;; Git / Projects
               magit
               projectile

               ;; Undo-Tree
               undo-tree
               
               ))
    (straight-use-package pkg))
  

;; Dashboard config NOTE: SHOULD BE ABSOLUTE TOP!
(use-package dashboard
  :if (< (length command-line-args) 2)
  :init
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-banner-logo-title "Welcome to EMACS comrade!")
  (dashboard-startup-banner "/home/troyd/Pictures/saved_pictures/emacs/output/anarchism2.png")
  ;;(dashboard-startup-banner 'logo)
  ;;(dashboard-init-info "Nothing to lose but your OS!")
  (dashboard-init-time t)
  (dashboard-footer-messages '("Comrade Tux Calls Us!"
                               "Long Live the Permanent Revolution!"
                               "Power to the workers!"
                               "There is worth in a union!"
                               ))
  (dashboard-center-content t)
  (dashboard-show-shortcuts t)
  (dashboard-items '(
                     (recents . 5)
                     (projects . 5)
                     (agenda . 5)
                     ))
  (dashboard-set-heading-icons t)
  (show-week-agenda-p t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  (dashboard-navigator-buttons
   `(;; Line 1
     ((,nil
       "GitHub"
       "Go to my GitHub"
       (lambda (&rest _) (browse-url "https://github.com/Kirikmelet"))
       'default)
      (nil
       "PT. AVK"
       "Open corporate website"
       (lambda (&rest _) (browse-url "https://avk.co.id"))
       'default))))
  )

;; Selectrum
(use-package selectrum
  :defer 3
  :init
  (selectrum-mode 1))

(use-package prescient
  :defer 3
  :config
  (prescient-persist-mode +1)
  )

(use-package selectrum-prescient
  :defer 3
  :init
  (selectrum-prescient-mode 1)
  )

(use-package ctrlf
  :defer 6
  :init
  (ctrlf-mode 1)
  :custom
   (ctrlf-mode-bindings
   '(("C-s" . ctrlf-forward-regexp)
     ("C-r" . ctrlf-backward-regexp)
     ("C-M-s" . ctrlf-forward-literal)
     ("C-M-r" . ctrlf-backward-literal)
     ("M-s _" . ctrlf-forward-symbol)
     ("M-s ." . ctrlf-forward-symbol-at-point))))


;; Which-key config
(use-package which-key
  :defer 3
  :init
  (which-key-mode)
  :config
  (setq which-key-use-C-h-commands nil)
  )


;; Magit config
(use-package magit
  :hook ((after-init-hook . magit-mode))
  :defer 3
  )

;; Python-mode config

;; LSP config
(use-package lsp-mode
  :defer 10
  :hook (
         (python-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (js-mode . lsp-deferred) ; To slow
         (html-mode . lsp-deferred) ; To slow
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :custom
             (with-eval-after-load 'lsp-mode
               setq lsp-modeline-diagnostics-scope :project)
             )
(use-package lsp-ui
  :defer 10
  :commands lsp-ui-mode)
(use-package company
  :defer 10
  :hook (after-init-hook . global-company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0) ;; Default is 0.2
  )
(use-package company-box
  :defer 10
  :hook (company-mode . company-box-mode)
  :custom
  (company-box-enable-icon t)
  (company-box-ghlight-prefix t)
  (company-box-scrollbar nil)
  (company-box-icons-alist 'company-box-icons-all-the-icons)
  )


;; Theme
(use-package gruvbox-theme
             :defer 1
             :init
             (load-theme 'gruvbox-dark-medium t)
             )


;; Projects
(use-package projectile
  :defer 3
  :custom
  (projectile-completion-system 'default)
             :init
             (projectile-mode 1)
             :bind (
                    :map projectile-mode-map
                    ("s-p" . projectile-command-map)
                    ("C-c p" . projectile-command-map)
                    )
             )


;; Music player
(use-package simple-mpc
             :defer 4
  :bind(
        ("<C-f1> a m". simple-mpc)))
;;(use-package emms
;;             :commands emms
;;             :config
;;             (emms-all)
;;             (emms-history-load)
;;             ;;(setq emms-player-list '(emms-player-mpd))
;;             ;;(setq emms-info-functions '(emms-info-mpd))
;;             ;;(setq emms-player-mpd-server-name "localhost")
;;             ;;(setq emms-player-mpd-server-port "23955")
;;             ;;(setq mpc-host "localhost:23955")
;;
;;             ;; The only way for mpv to play opus & flac
;;             (define-emms-simple-player mpvsimp
;;               '(file)
;;               (regexp-opt '(".opus" ".flac"))
;;               "mpv" "--no-audio-display" "--no-video" "--quiet" "--really-quiet")
;;
;;             (add-to-list 'emms-player-list 'emms-player-mpvsimp)
;;
;;
;;             (setq emms-source-file-default-directory (expand-file-name "~/Music")
;;                   emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find
;;                   emms-browser-covers 'emms-browser-cache-thumbnail)
;;             (add-to-list 'emms-info-functions 'emms-info-cueinfo)
;;             )




;; PDF-Reader
(use-package pdf-tools
             :defer 3
             :init
             (pdf-loader-install)
             )

;; EVIL

;;(use-package evil
;;             :defer 1
;;             :init
;;             (setq evil-want-integration t)
;;             (setq evil-want-keybinding nil)
;;             :config
;;             (evil-mode 1)
;;             )
;;(use-package evil-collection
;;             :after evil
;;             :defer 1
;;             :config
;;             (evil-collection-init)
;;             :custom
;;             (evil-collection-setup-minibuffer t)
;;             )

;; Modes

(use-package markdown-mode
  :defer 5
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  )

(use-package lua-mode
  :defer 5
  :mode ("\\.lua\\'")
  )

(use-package vimrc-mode
  :defer 5
  :mode ("\\.vim\\'")
  )


;; Org-mode
(use-package org
  :defer 2
  :bind (
         ("<C-f1> o a" . org-agenda)
         ("<C-f1> o c" . org-capture)
         ("<C-f1> o s" . org-store-link)
         )
  :config
  (setq org-hide-emphasis-markers t
        org-display-inline-images t
        org-redisplay-inline-images t)
  (setq org-startup-with-inline-images "inlineimages")
  (global-set-key (kbd "<C-f1>  C-f ") (lambda () (interactive) (dired "~/org/")))
  (setq org-agenda-files (list "~/org/global_agenda/work.org"
                          "~/org/global_agenda/projects.org"
                          "~/org/global_agenda/school.org"))
  (setq agenda-skip-scheduled-if-done t
        org-directory "~/org"
        org-bullets-bullet-list '("")
        org-tags-column -80
        org-todo-keywords '((sequence "TODO(t)" "CURRENT(c)" "HOLD(h)" "POSTPONED(p)" "|" "FINISHED(f)" "CANCELLED(x)" "FAIL(F)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#b8bb26" :weight normal :underline t)
          ("CURRENT" :foreground "#fabd2f" :weight normal :underline t)
          ("HOLD" :foreground "#fe8019" :weight italic :underline t)
          ("POSTPONED" :foreground "#fabd2f" :weight italic :underline t)
          ("FINISHED" :foreground "#83a598" :weight normal :underline t)
          ("CANCELLED" :foreground "#fb4934" :weight bold :underline t)
          ("FAIL" :foreground "#cc241d" :weight bold :underline t)
          
          )
        org-log-done 'time
        )
  )

;; Eshell

(use-package eshell
  :defer 3
  :bind (
         ("<C-f1> a e" . eshell))
  )

(use-package undo-tree
  :defer 10
  :init
  (global-undo-tree-mode))


(use-package valign
  :straight (valign :host github :repo "casouri/valign")
  :defer 6
  :config
  (add-hook 'org-mode-hook #'valign-mode)
  )

(use-package rg
  :defer 8
  :bind (
         ("<C-f2> s f" . rg-thisbuffer))
  :config
  (rg-define-search rg-thisbuffer
    "Search this buffer"
    :dir default-directory
    :files current
    :menu ("Search" "C" "Current")))

(use-package all-the-icons-dired
  :defer 8
  :hook((dired-mode . all-the-icons-dired-mode)))

;; End file
(provide 'package-configfile)
