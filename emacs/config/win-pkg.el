;; -*- lexical-binding: t; -*-
;; Only if you are running Windows/NT without git

(defconst pkg-dir (substitute-in-file-name "%APPDATA%/emacs/config/packages"))
(defconst st-dir (substitute-in-file-name "%APPDATA%/emacs/config/packages/settings"))

(require 'use-package)
(dolist (list '(
                "pkg-looks"
                ;;"pkg-lsp"
                "pkg-org"
                "pkg-utils"
                "pkg-mode"))
  (load-file (expand-file-name (concat list ".el") pkg-dir)))

;; For speed loading
(use-package paren
  :defer 6)
(use-package recentf
  :defer 10)

;; End file
