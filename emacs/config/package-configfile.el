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

               ;; Theme
               gruvbox-theme
               dashboard
               all-the-icons
               all-the-icons-ivy
               all-the-icons-ivy-rich
               all-the-icons-dired
               
               ;; Modes
               markdown-mode

               ;; Handles keybind popup
               which-key

               ;; Ivy
               ivy
               ivy-rich
               ivy-dired-history
               swiper
               
               
               ;; LSP
               lsp-mode
               lsp-ui
               lsp-treemacs
               lsp-ivy
               dap-mode
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
             :ensure t
             )

;; Python-mode config

;; LSP config
(use-package lsp-mode
             :hook (
                    (python-mode . lsp)
                    (js-mode . lsp)
                    (lsp-mode . lsp-enable-which-key-integration))
             :commands (lsp lsp-deferred)
             )
(use-package lsp-ui
             :commands lsp-ui-mode)
(use-package lsp-ivy
             :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)
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
  (projectile-mode +1)
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
  (setq dashboard-footer-messages '("Comrade Tux Calls Us"
                                    "Long Live the Eternal Revolution!"
                                    "Power to the workers!"))
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-items '(
                          (recents . 5)
                          (projects . 5)
                          (registers . 5)
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
;; End file
(provide 'package-configfile)
