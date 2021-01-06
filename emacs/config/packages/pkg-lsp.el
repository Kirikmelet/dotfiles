;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :hook (
         (c-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (html-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (css-mode .lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :custom
  (with-eval-after-load 'lsp-mode
    setq lsp-modeline-diagnostics-scope :project))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package company
  :hook ((c-mode . company-mode)
         (typescript-mode . company-mode)
         (python-mode . company-mode)
         (css-mode . company-mode)
         (js-mode . company-mode)
         (html-mode . company-mode)
         )
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)) ;; Default is 0.2

