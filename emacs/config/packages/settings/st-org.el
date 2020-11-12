;; -*- lexical-binding: t; -*-

(setq org-hide-emphasis-markers t
      org-display-inline-images t
      org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")
(setq org-agenda-files (list "~/org/global_agenda/work.org"
                             "~/org/global_agenda/projects.org"
                             "~/org/global_agenda/school.org"
                             "~/org/global_agenda/general.org"))
(setq agenda-skip-scheduled-if-done t
      org-directory "~/org"
      org-bullets-bullet-list '("")
      org-tags-column -80
      org-todo-keywords '((sequence "TODO(t)" "CURRENT(c)" "HOLD(h)" "POSTPONED(p)" "|" "FINISHED(f)" "CANCELLED(x)" "FAIL(F)"))
      org-todo-keyword-faces
      '(("TODO" :foreground "#b8bb26" :weight normal :underline t)
        ("CURRENT" :foreground "#fabd2f" :weight normal :underline t)
        ("HOLD" :foreground "#fe8019" :weight italic :underline t)
        ("POSTPONED" :foreground "#fabd2f" :weight italic :underline t)
        ("FINISHED" :foreground "#83a598" :weight normal :underline t)
        ("CANCELLED" :foreground "#fb4934" :weight bold :underline t)
        ("FAIL" :foreground "#cc241d" :weight bold :underline t)
        pp
        )
      org-log-done 'time
      )
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode)
                           (variable-pitch-mode)
                           (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-code nil   :inherit 'fixed-pitch)
                           ;;(set-face-attribute 'org-indent nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-verbatim nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-meta-line nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)))
(if (eq window-system nil)
    (add-hook 'org-mode-hook (lambda ()
                               (let* ((variable-tuple
                                       (cond ((x-list-fonts "Noto Sans Display")         '(:font "Noto Sans Display"))
                                             ((x-list-fonts "Noto Sans") '(:font "Noto Sans"))
                                             ((x-list-fonts "Liberation San")   '(:font "Liberation Sans"))
                                             ((x-list-fonts "DejaVu Sans")         '(:font "DejaVu Sans"))
                                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
                                      (base-font-color     (face-foreground 'default nil 'default))
                                      (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
                                 
                                 (custom-theme-set-faces
                                  'user
                                  `(org-level-8 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-7 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-6 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-5 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                                  `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                                  `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                                  `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                                  `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))
              ))

