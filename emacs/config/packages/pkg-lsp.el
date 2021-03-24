;; -*- lexical-binding: t; -*-

;;(use-package company
;;  :hook ((c-mode . company-mode)
;;         (typescript-mode . company-mode)
;;         (python-mode . company-mode)
;;         (css-mode . company-mode)
;;         (js-mode . company-mode)
;;         (html-mode . company-mode)
;;        )
;;  :custom
;;  (company-minimum-prefix-length 1)
;;  (company-idle-delay 0.0)) ;; Default is 0.2

(use-package eglot
  :hook (
         (c-mode . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (js-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  )

(use-package flymake
  :bind(:map flymake-funcs
                            ("n" . flymake-goto-next-error)
                            ("p" . flymake-goto-prev-error)
                            ("b" . flymake-show-diagnostics-buffer)))
