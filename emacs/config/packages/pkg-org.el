;; -*- lexical-binding: t; -*-
;; Org-mode settings

(use-package org
  :defer 2
  :bind ((:map org-funcs-map
               ("a" . org-agenda)
               ("c" . org-capture)
               ("s" . org-store-link)))
  :config
  (load-file (expand-file-name "st-org.el" st-dir)))

(use-package valign
  :straight (valign :host github :repo "casouri/valign")
  :config
  (add-hook 'org-mode-hook #'valign-mode))



