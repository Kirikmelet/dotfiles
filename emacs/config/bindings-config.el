;;; -*- lexical-binding t; -*-
;; bindings-config.el


;; Applications
(global-set-key (kbd "<C-f1> a d") 'dired)
(global-set-key (kbd "<C-f1> a M") 'mail)

;; Commands
(define-prefix-command 'command-map)
(global-set-key (kbd "<C-f1> f") 'command-map)
(define-key 'command-map (kbd "n f") 'new-file)

(defun open-agenda-file/work ()
  (interactive)
  (find-file "~/org/global_agenda/work.org" ))

(defun open-agenda-file/school ()
  (interactive)
  (find-file "~/org/global_agenda/school.org" ))

(defun open-agenda-file/projects ()
  (interactive)
  (find-file "~/org/global_agenda/projects.org" ))

(define-key 'org-agenda-file-map (kbd "w") 'open-agenda-file/work)
(define-key 'org-agenda-file-map (kbd "s") 'open-agenda-file/school)
(define-key 'org-agenda-file-map (kbd "p") 'open-agenda-file/projects)

(provide 'bindings-config)
