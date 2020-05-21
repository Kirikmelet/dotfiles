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


(use-package flycheck)
(use-package lsp-mode :ensure t)


;; Optional packages


 
(setq load-prefer-newer t)
(use-package pylint
	:defer t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil)


(use-package eaf
  :load-path "~/.emacs.d/git_pkg/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "k" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "j" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))

(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
(defvaralias 'c-basic-offset 'tab-width)
(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "Welcome to fucking EMACS!")
	(setq dashboard-startup-banner "/home/troyd/Pictures/character_art/hello_world.png")
	(setq dashboard-set-navigator t)
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)
	(setq dashboard-init-info "A decent OS with a shitty editor")
	(setq dashboard-footer-messages '("The Motherland Calls Us!"))
	(setq dashboard-items '((recents . 5)
				))
)
(evil-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)


(use-package emms
  :config
  (emms-all)
  (require 'emms-setup)
  (setq emms-player-list (list emms-player-mpv)
	emms-add-directory-tree "~/music"
	emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find
	emms-browser-covers 'emms-browser-cache-thumbnail)
  (add-to-list 'emms-player-mpv-parameters "--no-audio-display")
  (add-to-list 'emms-info-functions 'emms-info-cueinfo)
  (if (executable-find "emms-print-metadata")
    (progn
      (require 'emms-info-libtag)
      (add-to-list 'emms-info-functions 'emms-info-libtag)
      (delete 'emms-info-ogginfo emms-info-functions)
      (delete 'emms-info-mp3info emms-info-functions))
  (add-to-list 'emms-info-functions 'emms-info-ogginfo)
  (add-to-list 'emms-info-functions 'emms-info-mp3info))
  (setq emms-info-functions '(emms-info-libtag)) ;;; make sure libtag is the only thing delivering metadata
  (require 'emms-mode-line)
  (emms-mode-line 1)
  (require 'emms-playing-time)
  (emms-playing-time 1))
;;; Emms

;;; TODO: See if mpd is faster at building the db. Not so important.
;;; TODO: Change face from purple to white?
;;; TODO: emms-all causes some "require"d files to be loaded twice if called after, say, emms-browser was loaded.
(emms-all)
(emms-history-load)


(setq-default tab-width 10)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
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
  (define-key app_key (kbd "m") 'emms)
  (define-key app_key (kbd "d") 'dired-sidebar-toggle-sidebar)
)

(global-set-key (kbd "C-a") app_key)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" default)))
 '(eaf-find-alternate-file-in-dired t t)
 '(nil nil t)
 '(package-selected-packages
   (quote
    (gruvbox-theme lsp-dart pylint flycheck-pycheckers lsp-python-ms w3m highlight-indentation highlight-escape-sequences highlight mpv all-the-icons-gnus all-the-icons-dired all-the-icons terminal-toggle ## dashboard molokai-theme dired-sidebar which-key evil-surround use-package soundklaus lsp-ui evil emms-state emms-soundcloud emms-player-mpv-jp-radios emms-mode-line-cycle dired-icon company-lsp company-c-headers ccls)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#282828"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
