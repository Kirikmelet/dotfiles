;; -*- lexical-binding: t; -*-
;; (use-package selectrum
;;   :init
;;   (selectrum-mode +1))

;; (use-package selectrum-prescient
;;   :after selectrum
;;   :config
;;   (prescient-persist-mode +1))

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

(use-package orderless
  ;; :after selectrum-prescient
  ;; :defines (
  ;;           selectrum-refine-candidates-function
  ;;           selectrum-highlight-candidates-function)
  ;; :config
  ;; (setq selectrum-refine-candidates-function #'orderless-filter)
  ;; (setq selectrum-highlight-candidates-function #'orderless-highlight-matches))
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package embark
  :ensure t
  :defines (embark-action-indicator
            embark-become-indicator
            embark-active-p)
  :bind
  ("C-S-a" . embark-act)               ; pick some comfortable binding
  :config
  (setq embark-action-indicator
      (lambda (map)
        (which-key--show-keymap "Embark" map nil nil 'no-paging)
        #'which-key--hide-popup-ignore-command)
      embark-become-indicator embark-action-indicator)
  ;; For Selectrum users:
  ;; (defun current-candidate+category ()
  ;;   (when selectrum-active-p
  ;;     (cons (selectrum--get-meta 'category)
  ;;           (selectrum-get-current-candidate))))
  ;; (add-hook 'embark-target-finders #'current-candidate+category)
  ;; (defun current-candidates+category ()
  ;;   (when selectrum-active-p
  ;;     (cons (selectrum--get-meta 'category)
  ;;           (selectrum-get-current-candidates
  ;;            ;; Pass relative file names for dired.
  ;;            minibuffer-completing-file-name))))
  ;; (add-hook 'embark-candidate-collectors #'current-candidates+category)
  ;; (add-hook 'embark-setup-hook 'selectrum-set-selected-candidate))
  )

(use-package marginalia
  :defines marginalia-annotators
  :bind (:map minibuffer-local-map
              ("C-M-a" . marginalia-cycle))
  :init
  (marginalia-mode)
  (advice-add #'marginalia-cycle :after
              (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit))))

  (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
)

(use-package consult
  :defines consult-narrow-key
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (("C-x M-:" . consult-complex-command)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x r x" . consult-register)
         ("C-x r b" . consult-bookmark)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o" . consult-outline)       ;; "M-s o" is a good alternative.
         ("C-s" . consult-line)          ;; "M-s l" is a good alternative.
         ("M-g m" . consult-mark)          ;; I recommend to bind Consult navigation
         ("M-g k" . consult-global-mark)   ;; commands under the "M-g" prefix.
         ("M-g r" . consult-ripgrep)      ;; or consult-grep, consult-ripgrep
         ("M-g f" . consult-find)          ;; or consult-locate, my-fdfind
         ("M-g i" . consult-project-imenu) ;; or consult-imenu
         ("M-g e" . consult-error)
         ("M-s m" . consult-multi-occur)
         ("M-y" . consult-yank-pop)
         ("<help> a" . consult-apropos)
         :map start-maps
         ("r s" . consult-ripgrep)
         )
  :init
  (fset 'multi-occur #'consult-multi-occur)
  :config
  (global-unset-key (kbd "C-r"))
  (setq consult-narrow-key "<")) ;; (kbd "C-+")

;(use-package consult-selectrum
;  :after selectrum
;  :demand t)

(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
         :map minibuffer-local-completion-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))


(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))
