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
                             "~/org/global_agenda/trips.org"
                             "~/org/global_agenda/general.org"))
(setq agenda-skip-scheduled-if-done t
      org-directory "~/org"
      org-tags-column -80
      org-todo-keywords '((sequence "TODO(t)" "HOLD(h)" "|" "DONE(d)" "CANCELLED(x)" "FAIL(F)"))
      org-log-done 'time
      )
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode)))

(setq org-default-notes-file (concat org-directory "/notes.org"))
