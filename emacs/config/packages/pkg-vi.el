;; -*- lexical-binding: t; -*-
;; No Tunnels pls

(use-package evil
  :ensure t
  :defines evil-want-keybinding
  :init
  (setq evil-want-keybinding nil)
  :hook (after-init . evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :functions evil-collection-inithv
  :config
  (evil-collection-init))
