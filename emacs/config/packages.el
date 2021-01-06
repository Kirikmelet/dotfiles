;; -*- lexical-binding: t; -*-
;; package-configfile
;; Handles load of packages

;; Bootstrap straight.el
(defconst pkg-dir (substitute-in-file-name "$HOME/.config/emacs/config/packages"))
(defconst st-dir (substitute-in-file-name "$HOME/.config/emacs/config/packages/settings"))
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
                ;;"pkg-vi"
                "pkg-term"
                "pkg-framework"
                "pkg-media"
                "pkg-mode"
                "pkg-git"))
  (load-file (expand-file-name (concat list ".el") pkg-dir)))


(defun straight-update ()
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
