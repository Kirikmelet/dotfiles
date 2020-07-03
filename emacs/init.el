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

(use-package mingus)
(use-package flycheck)
(use-package lsp-mode :ensure )
(use-package mpdel :ensure)
(require 'mpdel)
(mpdel-mode)


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
    (origami ivy-mpdel ## mpdel which-key w3m use-package terminal-toggle request pylint navigel mpv mingus memoize lsp-ui lsp-python-ms lsp-dart libmpdel highlight-indentation highlight-escape-sequences highlight gruvbox-theme flycheck-pycheckers evil-surround dired-sidebar dired-icon dashboard company-lsp company-c-headers ccls)))
 '(set-default-font (quote (Fira Code))))
