(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
 )
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)


(eval-when-compile
	(require 'use-package)
  )


(use-package sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)

(use-package mingus)
(use-package flycheck)
(use-package counsel :ensure t)
(use-package lsp-mode :ensure t )
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
(use-package dap-mode :ensure t)
(setq lsp-keymap-prefix "A-l") 
(use-package mpdel :ensure)
(require 'mpdel)
(mpdel-mode 1)
(lsp-treemacs-sync-mode 1)
(origami-mode 1)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; Optional packages


 
(setq load-prefer-newer t)
(use-package pylint
	:defer t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil)



(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
(defvaralias 'c-basic-offset 'tab-width)
(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "Welcome to GNU EMACS Comrade")
	(setq dashboard-startup-banner "/home/troyd/Pictures/saved_pictures/downloaded/linux_comrade_fixed.png")
	(setq dashboard-set-navigator t)
	(setq dashboard-init-info "Nothing to lose but your OS")
	(setq dashboard-footer-messages '("Comrade Tux Calls Us!"))
	(setq dashboard-items '((recents . 5)
				))
)
(evil-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)



;;; TODO: See if mpd is faster at building the db. Not so important.
;;; TODO: Change face from purple to white?
;;; TODO: emms-all causes some "require"d files to be loaded twice if called after, say, emms-browser was loaded.

;; Theme

(setq-default tab-width 10)
(setq x-select-enable-clipboard t)
(use-package dired)
(use-package evil-surround)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))


(use-package dired-sidebar
  :ensure nil
  :commands (dired-sidebar-toggle-sidebar))


(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))
(setq ccls-executable "/usr/bin/ccls")

(progn
  (define-prefix-command 'app_key)
  (define-key app_key (kbd "d") 'dired-sidebar-toggle-sidebar)
  (define-key app_key (kbd"m") 'mpdel-browser-open)
)

(global-set-key (kbd "C-a") app_key)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "ADBO" :family "Fira Code ")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default)))
 '(font-use-system-font t)
 '(libmpdel-port 23955)
 '(mingus-mpd-port 23955)
 '(package-selected-packages
   (quote
    (sublimity lsp-latex lsp-ivy ivy-xref clang-format origami ivy-mpdel ## mpdel which-key w3m use-package terminal-toggle request pylint navigel mpv mingus memoize lsp-ui lsp-python-ms lsp-dart libmpdel highlight-indentation highlight-escape-sequences highlight gruvbox-theme flycheck-pycheckers evil-surround dired-sidebar dired-icon dashboard company-lsp company-c-headers ccls)))
 '(set-default-font (quote (Fira Code))))
