;; -*- lexical-binding: t; -*-

(use-package company
  :config
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2
  :hook (
         (c++-mode . company-mode)
         (c-mode . company-mode)
         (typescript-mode . company-mode)
         (js-mode . company-mode)
         (python-mode . company-mode)
         (css-mode . company-mode)
         (html-mode . company-mode)))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-headerline-breadcrumb-enable nil)
  :config
  ;; (setq
  ;;  lsp-enable-snippet nil)
  :commands (lsp lsp-deferred)
  :hook (
         (c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (css-mode . lsp-deferred)
         (html-mode . lsp-deferred)))

(use-package lsp-ui :commands lsp-ui-mode)

(use-package consult-lsp
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'consult-lsp-symbols))

(use-package flymake
  :bind(:map flymake-funcs
             ("n" . flymake-goto-next-error)
             ("p" . flymake-goto-prev-error)
             ("b" . flymake-show-diagnostics-buffer)))

(use-package tree-sitter
  :hook (
         (c++-mode . tree-sitter-mode)
         (c-mode . tree-sitter-mode)
         (js-mode . tree-sitter-mode)
         (typescript-mode . tree-sitter-mode))
  :config
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs)
