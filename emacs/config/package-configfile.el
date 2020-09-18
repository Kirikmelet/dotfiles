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
               lua-mode
               vimrc-mode

               ;; Tools
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

               ;; Undo-Tree
               undo-tree
               
               ))
  (unless (package-installed-p pkg)
    (package-install pkg))  
  )



;; Dashboard config NOTE: SHOULD BE ABSOLUTE TOP!
(use-package dashboard
             :init
             (dashboard-setup-startup-hook)
             :custom
             (dashboard-banner-logo-title "Welcome to EMACS comrade!")
             (dashboard-startup-banner "/home/troyd/Pictures/saved_pictures/downloaded/political/opensource_commie.png")
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


;; which-key config
(use-package which-key
             :ensure t
             :defer 3
             :init
             (which-key-mode)
             :config
             (setq which-key-use-C-h-commands nil)
             )

;; Electric-Pair mode
(use-package electric-pair
             :defer 5
             :init
             (electric-pair-mode))

;; ivy-mode config
(use-package ivy
             :ensure t
             :defer 3
             :init
             (ivy-mode 1)
             :custom
             (ivy-use-virtual-buffers t)
             (enable-recursive-minibuffers t)
             ;; For swiper
             (search-default-mode #'char-fold-to-regexp)
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
             :defer 3
             )

;; Python-mode config

;; LSP config
(use-package lsp-mode
             :defer 2
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
             :defer 2
             :commands lsp-ui-mode)
(use-package lsp-ivy
             :defer 2
             :commands lsp-ivy-workspace-symbol)
(use-package company
             :defer 2
             :hook (after-init-hook . global-company-mode)
             :custom
             (company-minimum-prefix-length 1)
             (company-idle-delay 0.0) ;; Default is 0.2
             )
(use-package company-box
             :defer 2
             :hook (company-mode . company-box-mode)
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
             :init
             (projectile-mode 1)
             :bind (
                    :map projectile-mode-map
                    ("s-p" . projectile-command-map)
                    ("C-c p" . projectile-command-map)
                    )
             :custom
             (projectile-completion-system 'ivy)
             )


;; Music player
(use-package simple-mpc
             :defer 4
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
             :defer 3
             :init
             (pdf-loader-install)
             )

;; EVIL

;;(use-package evil
;;             :ensure t
;;             :defer 1
;;             :init
;;             (setq evil-want-integration t)
;;             (setq evil-want-keybinding nil)
;;             :config
;;             (evil-mode 1)
;;             )
;;(use-package evil-collection
;;             :after evil
;;             :ensure t
;;             :defer 1
;;             :config
;;             (evil-collection-init)
;;             :custom
;;             (evil-collection-setup-minibuffer t)
;;             )

;; Modes

(use-package markdown-mode
  :ensure t
  :defer 5
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  )

(use-package lua-mode
  :ensure t
  :defer 5
  :mode ("\\.lua\\'")
  )

(use-package vimrc-mode
  :ensure t
  :defer 5
  :mode ("\\.vim\\'")
  )


;; Org-mode
(use-package org
  :ensure t
  :defer 2
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
         ("C-x C-a e" . eshell))
  )

(use-package undo-tree
  :defer 4
  :init
  (global-undo-tree-mode))

;; End file
(provide 'package-configfile)
