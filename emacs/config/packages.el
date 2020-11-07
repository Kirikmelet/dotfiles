;; -*- lexical-binding: t; -*-
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

;; Which-key config
(use-package which-key
             :defer 3
             :init
             (which-key-mode)
             :custom
             (which-key-use-C-h-commands t)
             )


;; Magit config
(use-package magit
             :functions magit-mode
             :hook ((after-init-hook . magit-mode))
             :defer 10
             )


;; LSP config
(use-package lsp-mode
             :defer 10
             :hook (
                    (c-mode . lsp-deferred)
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
             :bind(:map app-funcs-map
                        ("m". simple-mpc)))


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
;;             :init
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

(use-package graphviz-dot-mode
             :defer 5
             :mode ("\\.gv\\'"))


;; Org-mode
(use-package org
             :defer 2
             :bind ((:map org-funcs-map
                          ("a" . org-agenda)
                          ("c" . org-capture)
                          ("s" . org-store-link)
                          ))
             :config
             (setq org-hide-emphasis-markers t
                   org-display-inline-images t
                   org-redisplay-inline-images t)
             (setq org-startup-with-inline-images "inlineimages")
             (setq org-agenda-files (list "~/org/global_agenda/work.org"
                                          "~/org/global_agenda/projects.org"
                                          "~/org/global_agenda/school.org"
                                          "~/org/global_agenda/general.org"))
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
             (setq org-latex-toc-command "\\tableofcontents \\clearpage")
             (setq org-odt-convert-capabilities
                   '(("Text"
                      ("odt" "ott" "doc" "rtf" "docx")
                      (("pdf" "pdf" nil)
                       ("odt" "odt" nil)
                       ("rtf" "rtf" nil)
                       ("ott" "ott" nil)
                       ("doc" "doc" ":\"MS Word 97\"")
                       ("docx" "docx" nil)
                       ("html" "html" nil)))
                     ("Web"
                      ("html")
                      (("pdf" "pdf" nil)
                       ("odt" "odt" nil)
                       ("html" "html" nil)))
                     ("Spreadsheet"
                      ("ods" "ots" "xls" "csv" "xlsx")
                      (("pdf" "pdf" nil)
                       ("ots" "ots" nil)
                       ("html" "html" nil)
                       ("csv" "csv" nil)
                       ("ods" "ods" nil)
                       ("xls" "xls" nil)
                       ("xlsx" "xlsx" nil)))
                     ("Presentation"
                      ("odp" "otp" "ppt" "pptx")
                      (("pdf" "pdf" nil)
                       ("swf" "swf" nil)
                       ("odp" "odp" nil)
                       ("otp" "otp" nil)
                       ("ppt" "ppt" nil)
                       ("pptx" "pptx" nil)
                       ("odg" "odg" nil)))))
             (setq org-export-backends '(ascii beamer html icalendar latex man md odt org texinfo))
             (setq org-html-doctype "xhtml5"
                   org-latex-compile "xetex")
             )

;; Eshell

(use-package eshell
             :defer 10
             :bind ((:map app-funcs-map
                          ("e" . eshell)))
             )

(use-package undo-tree
             :defer 10
             :init
             (global-undo-tree-mode))


(use-package valign
             :straight (valign :host github :repo "casouri/valign")
             :config
             (add-hook 'org-mode-hook #'valign-mode)
             )

;; Ripgrep
(if (executable-find "rg")
  (use-package rg
               :defer 8
               :bind (:map regex-funcs
                           ("f" . rg-thisbuffer)
                           ("r" . rg))
               :config
               (rg-define-search rg-thisbuffer
                                 "Search this buffer"
                                 :dir default-directory
                                 :files current
                                 :menu ("Search" "C" "Current")))
  )

(use-package paren
             :defer 6)
(use-package recentf
             :defer 10)

;; End file
(provide 'packages)
