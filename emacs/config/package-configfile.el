;; package-configfile
;; Handles load of packages


(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ))
(package-initialize)


;; Ensures use-package 
;; Source: https://github.com/m32-y/emacs.d/blob/master/modules/basic-optimize-module.el
(unless (package-installed-p 'use-package)
  (progn (package-refresh-contents)
         (package-install 'use-package)))
(eval-when-compile
  (require 'use-package))



;; Checks if package is installed
(dolist (pkg '(
               ;; Inset package here;

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
               all-the-icons-ivy
               all-the-icons-dired

               ;; Modes
               markdown-mode
               pdf-tools

               ;; Handles keybind popup
               which-key
               ;;evil
               ;;evil-collection

               ;; Ivy
               ivy
               ivy-dired-history
               swiper


               ;; LSP
               lsp-mode
               lsp-ui
               lsp-ivy
               company
               company-box
               format-all

               ;; Git / Projects
               magit
               projectile


               ))
  (unless (package-installed-p pkg)
    (package-install pkg))  
  )

;; which-key config
(use-package which-key
             :ensure t
             :init
             (which-key-mode)
             (setq which-key-use-C-h-commands nil) 
             )

;; ivy-mode config
(use-package ivy
             :ensure t
             :init
             (ivy-mode 1)
             :config
             (setq ivy-use-virtual-buffers t)
             (setq enable-recursive-minibuffers t)
             ;; enable this if you want `swiper' to use it
             (setq search-default-mode #'char-fold-to-regexp)
             :bind
             (("\C-s" . swiper)
              ("C-c C-r" . ivy-resume)
              ("<f6>" . ivy-resume)
              ("C-x C-f" . counsel-find-file)
              ("<f1> f" . counsel-describe-function)
              ("<f1> v" . counsel-describe-variable)
              ("<f1> o" . counsel-describe-symbol)
              ("<f1> l" . counsel-find-library)
              ("<f2> i" . counsel-info-lookup-symbol)
              ("<f2> u" . counsel-unicode-char)
              ("C-c g" . counsel-git)
              ("C-c j" . counsel-git-grep)
              ("C-c k" . counsel-rg)
              ("C-c l" . counsel-locate)
              ("C-S-o" . counsel-rhythmbox)
              :map minibuffer-local-map
              ("C-r" . counsel-minibuffer-history)
              )
             )

;; Magit config
(use-package magit
             :hook ((after-init-hook . magit-mode))
             :ensure t
             )

;; Python-mode config

;; LSP config
(use-package lsp-mode
             :hook (
                    (python-mode . lsp-deferred)
                    (c-mode . lsp-deferred)
                    ;;(js-mode . lsp-deferred) ; To slow
                    (lsp-mode . lsp-enable-which-key-integration))
             :commands (lsp lsp-deferred)
             :custom
             (with-eval-after-load 'lsp-mode
                                   setq lsp-modeline-diagnostics-scope :project)
             )
(use-package lsp-ui
             :commands lsp-ui-mode)
(use-package lsp-ivy
             :commands lsp-ivy-workspace-symbol)
(use-package company
             :hook (after-init-hook . global-company-mode)
             :config
             (setq company-minimum-prefix-length 1
                   company-idle-delay 0.0) ;; default is 0.2
             )
(use-package company-box
             :hook (company-mode . company-box-mode)
             )

;; Theme
(use-package gruvbox-theme
             :init
             (load-theme 'gruvbox-dark-medium t)
             )

(use-package projectile
             :init
             (projectile-mode 1)
             :bind (
                    :map projectile-mode-map
                    ("s-p" . projectile-command-map)
                    ("C-c p" . projectile-command-map)
                    )
             :config
             (setq projectile-completion-system 'ivy) 
             )
;; Dashboard config
(use-package dashboard
             :config
             (dashboard-setup-startup-hook)
             (setq dashboard-banner-logo-title "Welcome to EMACS comrade!")
             (setq dashboard-startup-banner "/home/troyd/Pictures/saved_pictures/downloaded/political/opensource_commie.png")
             ;;(setq dashboard-startup-banner 'logo)
             (setq dashboard-init-info "Nothing to lose but your OS!")
             ;;(setq dashboard-init-time t)
             (setq dashboard-footer-messages '("Comrade Tux Calls Us!"
                                               "Long Live the Permanent Revolution!"
                                               "Power to the workers!"
                                               "There is worth in a union!"
                                               ))
             (setq dashboard-center-content t)
             (setq dashboard-show-shortcuts t)
             (setq dashboard-items '(
                                     (recents . 5)
                                     (projects . 5)
                                     (agenda . 5)
                                     ))
             (setq dashboard-set-heading-icons t)
             (setq show-week-agenda-p t)
             (setq dashboard-set-file-icons t)
             (setq dashboard-set-navigator t)
             (setq dashboard-navigator-buttons
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

;; Music player
(use-package simple-mpc
  :bind(
        ("C-x C-a m" . simple-mpc)))
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
             :init
             (pdf-loader-install)
             )

;; EVIL

;;(use-package evil
;;             :ensure t
;;             :init
;;             (setq evil-want-integration t)
;;             (setq evil-want-keybinding nil)
;;             :config
;;             (evil-mode 1)
;;             )
;;(use-package evil-collection
;;             :after evil
;;             :ensure t
;;             :config
;;             (evil-collection-init)
;;             :custom
;;             (evil-collection-setup-minibuffer t)
;;             )

;; Markdown

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  )

;; Org-mode
(use-package org
  :ensure t
  :bind (
         ("C-x C-a o a" . org-agenda)
         ("C-x C-a o c" . org-capture)
         ("C-x C-a o s" . org-store-link)
         )
  :config
  (global-set-key (kbd "C-x C-a C-f ") (lambda () (interactive) (dired "~/org/")))
  (setq org-agenda-files (list "~/org/global_agenda/work.org"
                               "~/org/global_agenda/projects.org"
                               "~/org/global_agenda/school.org"))
  (setq agenda-skip-scheduled-if-done t
        org-directory "~/org"
        org-bullets-bullet-list '("")
        org-tags-column -80
        org-todo-keywords '((sequence "TODO(t)" "CURRENT(c)" "HOLD(h)" "|" "FINISHED(f)" "CANCELLED(x)" "FAIL(F)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#b8bb26" :weight normal :underline t)
          ("CURRENT" :foreground "#fabd2f" :weight normal :underline t)
          ("HOLD" :foreground "#fe8019" :weight italic :underline t)
          ("FINISHED" :foreground "#83a598" :weight normal :underline t)
          ("CANCELLED" :foreground "#fb4934" :weight bold :underline t)
          ("FAIL" :foreground "#cc241d" :weight bold :underline t)
          
          )
        org-log-done 'time
        )
  )

;; Eshell

(use-package eshell
  :bind (
         ("C-x C-a e" . eshell))
  )

;; End file
(provide 'package-configfile)
