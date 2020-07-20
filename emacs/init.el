
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
(scroll-bar-mode -1)

(eval-when-compile
	(require 'use-package)
  )
(use-package evil)
(add-hook 'prog-mode-hook
	(if (fboundp 'display-line-numbers-mode)
            (fboundp 'evil-mode)
	    #'display-line-numbers-mode
	  #'linum-mode))
(use-package doom-modeline

:ensure t

:defer t

:hook (after-init . doom-modeline-init))
(use-package all-the-icons :ensure t)
(use-package sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)


;(use-package ivy-emms)
;(use-package emms
;  :ensure t
;  :config
;  (emms-all)
;  (emms-history-load)
;  (emms-default-players);
;  (setq emms-player-mpv-debug t)
;  (setq emms-source-file-default-directory "~/Music/")
				;  )
(use-package ivy-mpdel)
(use-package mpdel)
(mpdel-mode)
(use-package magit)
(use-package mingus)
(use-package flycheck)
(use-package counsel :ensure t)
(use-package lsp-mode :ensure t )
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
(use-package dap-mode :ensure t)
(setq lsp-keymap-prefix "A-l") 
(lsp-treemacs-sync-mode 1)
(origami-mode 1)
(use-package treemacs-projectile)
(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/Desktop/360pano/" "~/Documents/projects/" "~/Documents/github/")))
(projectile-mode)
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




(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
(defvaralias 'c-basic-offset 'tab-width)
(use-package dashboard
  :ensure t
  :defer nil
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to GNU EMACS Comrade")
  (setq dashboard-startup-banner "/home/troyd/Pictures/saved_pictures/downloaded/political/opensource_commie.png")
  ;(setq dashboard-startup-banner 3)
  (setq dashboard-set-navigator t)
  (setq dashboard-init-info "Nothing to lose but your OS")
  (setq dashboard-footer-messages '("Comrade Tux Calls Us!"))
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents . 5)
		      ))
  (setq dashboard-set-init-info t)
  (setq dashboard-navigator-buttons
        `(;;Line 1
	((,nil
	  "Github"
	  "Open your github"
	  (lambda (&rest _) (browse-url "https://github.com/Kirikmelet"))
	  'default)
	 (nil
	  "PT. AVK"
	  "Open corporate website"
	  (lambda (&rest _) (browse-url "https://avk.co.id"))
	  'default))))
)
;(evil-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)



;;; TODO: See if mpd is faster at building the db. Not so important.
;;; TODO: Change face from purple to white?
;;; TODO: emms-all causes some "require"d files to be loaded twice if called after, say, emms-browser was loaded.

;; Theme

(setq-default tab-width 10)
(setq x-select-enable-clipboard t)
(use-package dired)
;(use-package evil-surround)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
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
  (define-key app_key (kbd "m") 'mpdel-browser-open)
  (define-key app_key (kbd "s") 'eshell)
)

(global-set-key (kbd "M-`") app_key)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant italic :weight normal :height 98 :width normal :foundry "urw" :family "Fira Code")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default)))
 '(emms-player-mpv
   (quote
    (*player*
     (start . emms-player-mpv-start)
     (stop . emms-player-mpv-stop)
     (playablep . emms-player-mpv-playable-p)
     (regex . "\\.\\([Oo][Gg][Gg]\\|[Mm][Pp]3\\|[Ww][Aa][Vv]\\|[Mm][Pp][Gg]\\|[Mm][Pp][Ee][Gg]\\|[Ww][Mm][Vv]\\|[Ww][Mm][Aa]\\|[Mm][Oo][Vv]\\|[Aa][Vv][Ii]\\|[Dd][Ii][Vv][Xx]\\|[Oo][Gg][Mm]\\|[Oo][Gg][Vv]\\|[Aa][Ss][Ff]\\|[Mm][Kk][Vv]\\|[Rr][Mm]\\|[Rr][Mm][Vv][Bb]\\|[Mm][Pp]4\\|[Ff][Ll][Aa][Cc]\\|[Vv][Oo][Bb]\\|[Mm]4[Aa]\\|[Aa][Pp][Ee]\\|[Ff][Ll][Vv]\\|[Ww][Ee][Bb][Mm]\\|[Aa][Ii][Ff]\\)\\'")
     (pause . emms-player-mpv-pause)
     (resume . emms-player-mpv-resume)
     (seek . emms-player-mpv-seek)
     (seek-to . emms-player-mpv-seek-to))))
 '(emms-player-mpv-parameters
   (quote
    ("--quiet" "--really-quiet" "--no-audio-display" "--input-ipc-server=/home/troyd/.emacs.d/emms/mpv-ipc.sock" "--idle" "--no-video")))
 '(font-use-system-font t)
 '(libmpdel-port 23955)
 '(mingus-mpd-port 23955)
 '(package-selected-packages
   (quote
    (autopair language-id format-all eshell-toggle ivy-mpdel mpdel ivy-emms emms-state treemacs-projectile emms doom-modeline evil all-the-icons-ivy image-dired+ mozc-im pdf-tools mozc evil-magit magit sublimity lsp-latex lsp-ivy ivy-xref clang-format origami ## which-key w3m use-package terminal-toggle request pylint navigel mpv mingus memoize lsp-ui lsp-python-ms lsp-dart highlight-indentation highlight-escape-sequences highlight gruvbox-theme flycheck-pycheckers dired-sidebar dired-icon dashboard company-lsp company-c-headers ccls language-id)))
 '(set-default-font (quote (Fira Code))))
