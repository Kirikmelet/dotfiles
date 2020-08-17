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
               emms

               ;; Org-mode
               org
               org-projectile

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
               evil
               evil-collection

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
               eldoc-eval
               eldoc-overlay

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
                    (js-mode . lsp-deferred)
                    (lsp-mode . lsp-enable-which-key-integration))
             :commands (lsp lsp-deferred)
             )
(use-package lsp-ui
             :commands lsp-ui-mode)
(use-package lsp-ivy
             :commands lsp-ivy-workspace-symbol)
(use-package company
             :hook (after-init-hook . global-company-mode)
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
             )
;; Dashboard config
(use-package dashboard
             :config
             (dashboard-setup-startup-hook)
             (setq dashboard-banner-logo-title "Welcome to EMACS comrade!")
             (setq dashboard-startup-banner "/home/troyd/Pictures/saved_pictures/downloaded/political/opensource_commie.png")
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
(use-package emms
             :commands emms
             :config
             (emms-all)
             (emms-history-load)
             (setq emms-player-list '(emms-player-mpd))
             (setq emms-info-functions '(emms-info-mpd))
             (setq emms-player-mpd-server-name "localhost")
             (setq emms-player-mpd-server-port "23955")
             (setq mpc-host "localhost:23955")
             )

(use-package pdf-tools
             :init
             (pdf-loader-install)
             )

;; EVIL

(use-package evil
             :ensure t
             :init
             (setq evil-want-integration t)
             (setq evil-want-keybinding nil)
             :config
             (evil-mode 1)
             )
(use-package evil-collection
             :after evil
             :ensure t
             :config
             (evil-collection-init)
             :custom
             (evil-collection-setup-minibuffer t)
             )

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
         ("s-o o a" . org-agenda)
         ("s-o o c" . org-capture)
         ("s-o o s" . org-store-link)
         )
  :config
  (global-set-key (kbd "s-o C-f ") (lambda () (interactive) (dired "~/org/")))
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

;; End file
(provide 'package-configfile)