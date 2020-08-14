;; Error checking
(setq debug-on-error t)

;; Paths to load
(defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
(defconst config-dir (concat emacs-dir "/config"))


;; Loads config files
(add-to-list 'load-path config-dir)



;; Loads packages
(require 'package-configfile)

;; better-defaults by Phil Hagelberg 
;; https://git.sr.ht/~technomancy/better-defaults/tree/master/better-defaults.el
(require 'better-defaults)

;; Loads custom config
(require 'custom-fileconfig)

;; For emacs daemon
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
