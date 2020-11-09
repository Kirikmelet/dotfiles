;;; -*- lexical-binding t; -*-
;; bindings-config.el


;; Applications
(define-key 'app-funcs-map (kbd "d") 'dired)
(define-key 'app-funcs-map (kbd "M") 'mail)

;; Commands

(define-key 'start-commands (kbd "f") 'new-file)

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


;; Regex
(define-key 'regex-funcs (kbd "r") 'replace-regexp)

