;; -*- lexical-binding: t; -*-
;; No Tunnels pls

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :hook (after-init . evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
