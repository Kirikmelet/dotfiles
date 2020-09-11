(setq gc-cons-threshold (* 50 1000 1000))
;; Error checking
(setq debug-on-error t)

;;Garbage man

;; Paths to load
(defconst emacs-dir (substitute-in-file-name "$HOME/.config/emacs/"))
(defconst config-dir (concat emacs-dir "/config"))
(defconst func-dir (concat emacs-dir "/functions"))


;; Loads config files
(add-to-list 'load-path config-dir)
(add-to-list 'load-path func-dir)


;; Autopair
(electric-pair-mode)

(require 'basicfunc)

;; Loads packages
(require 'package-configfile)

(setq gc-cons-threshold (* 10 1000 1000))

;; better-defaults by Phil Hagelberg 
;; https://git.sr.ht/~technomancy/better-defaults/tree/master/better-defaults.el
(require 'better-defaults)

;; Fonts
(require 'looks)

;; Loads custom config
(require 'custom-fileconfig)

;; Loads custom bindings
(require 'bindings-config)

;; Loads Japanese Language config
(require 'nihongo-config)

;; Javascript config
(require 'javascript-ftconf)

;; Clang config
(require 'c-ftconf)

;; For emacs daemon
;;(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
