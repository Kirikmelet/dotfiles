;; -*- lexical-binding: t; -*-

(use-package lsp-mode
             :defer 10
             :hook (
                    (c-mode . lsp-deferred)
                    (typescript-mode . lsp-deferred)
                    (python-mode . lsp-deferred)
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

