;;; -*- lexical-binding t; -*-
;; bindings-config.el


;; Applications
(define-key 'app-funcs-map (kbd "M") 'mail)

;; Commands
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(define-key 'start-commands (kbd "F") 'new-file)

(defun open-agenda-file/work ()
  (interactive)
  (find-file "~/org/global_agenda/work.org" ))

(defun open-agenda-file/school ()
  (interactive)
  (find-file "~/org/global_agenda/school.org" ))

(defun open-agenda-file/projects ()
  (interactive)
  (find-file "~/org/global_agenda/projects.org" ))

(defun config-files/open ()
  (interactive)
  (dired "~/.config/emacs"))

(defun config-files/eval ()
  (interactive)
  (load-file "~/.config/emacs/init.el")
  (message "Config restarted"))

(define-key 'org-agenda-file-map (kbd "w") 'open-agenda-file/work)
(define-key 'org-agenda-file-map (kbd "s") 'open-agenda-file/school)
(define-key 'org-agenda-file-map (kbd "p") 'open-agenda-file/projects)
(define-key 'config-files-map (kbd "f") 'config-files/open)
(define-key 'config-files-map (kbd "e") 'config-files/eval)
(define-key 'eval-map (kbd "b") 'eval-buffer)
(define-key 'eval-map (kbd "e") 'eval-expression)


;; Regex
(define-key 'regex-funcs (kbd "r") 'replace-regexp)
;;(define-key 'regex-funcs (kbd "s") 'rgrep)


;; Unbind stuff here
