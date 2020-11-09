;; -*- lexical-binding: t; -*-

(use-package pdf-tools
  :defer 3
  :init
  (pdf-loader-install))

(use-package simple-mpc
  :defer 4
  :bind(:map app-funcs-map
             ("m". simple-mpc)))

