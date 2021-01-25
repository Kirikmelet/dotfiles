;; -*- lexical-binding: t; -*-

(eval-when-compile
  (defvar org-hide-emphasis-markers)
  (defvar org-display-inline-images)
  (defvar org-redisplay-inline-images)
  (defvar org-startup-with-inline-images)
  (defvar org-agenda-files)
  (defvar agenda-skip-scheduled-if-done)
  (defvar org-directory)
  (defvar org-bullets-bullet-list)
  (defvar org-tags-column)
  (defvar org-todo-keywords)
  (defvar org-log-done)
  (defvar org-latex-toc-command)
  (defvar org-default-notes-file))

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
      org-todo-keywords '((sequence "TODO(t)" "HOLD(h)" "|" "DONE(d)" "CANCELLED(x)" "FAIL(F)"))
      org-log-done 'time
      )
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode)
                           (variable-pitch-mode)))
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

(setq org-default-notes-file (concat org-directory "/notes.org"))
