;; -*- lexical-binding: t; -*-
(use-package magit
  :functions magit-mode
  :hook ((after-init-hook . magit-mode))
  :defer 10)

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
              ))

