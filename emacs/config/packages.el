;; -*- lexical-binding: t; -*-
;; package-configfile
;; Handles load of packages

;; Bootstrap straight.el
(defconst pkg-dir (expand-file-name "config/packages" user-emacs-directory))
(defconst st-dir (expand-file-name "config/packages/settings" user-emacs-directory))
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

(dolist (list '(
                "pkg-looks"
                "pkg-lsp"
                "pkg-org"
                "pkg-utils"
                "pkg-term"
                "pkg-framework"
                "pkg-media"
                "pkg-mode"
                "pkg-git"))
  (load-file (expand-file-name (concat list ".el") pkg-dir)))

(defun straight-update ()
  "Update straight-x repo"
  (interactive)
  (load-library "straight-x")
  (straight-x-clean-unused-repos)
  (straight-pull-all)
  (straight-rebuild-all))

;; For speed loading
(use-package paren
  :defer 6)
(use-package recentf
  :defer 10)


;; End file
