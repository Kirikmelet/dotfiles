;;; -*- lexical-binding t; -*-
;; bindings-config.el

(dolist (list '(
                (start-maps . "M-c")
                (start-commands . "M-v")))
  (define-prefix-command (car list))
  (global-set-key (kbd (cdr list)) (car list)))


;; Applications
(define-key 'start-maps (kbd "a m") 'mail)

;; Commands
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(define-key 'start-commands (kbd "f f") 'new-file)

(defun open-agenda-file/work ()
  (interactive)
  (find-file "~/org/global_agenda/work.org" ))

(defun open-agenda-file/school ()
  (interactive)
  (find-file "~/org/global_agenda/school.org" ))

(defun open-agenda-file/projects ()
  (interactive)
  (find-file "~/org/global_agenda/projects.org" ))

(define-key 'start-maps (kbd "o w") 'open-agenda-file/work)
(define-key 'start-maps (kbd "o s") 'open-agenda-file/school)
(define-key 'start-maps (kbd "o p") 'open-agenda-file/projects)
(define-key 'start-maps (kbd "e b") 'eval-buffer)
(define-key 'start-maps (kbd "e e") 'eval-expression)


;; Regex
(define-key 'start-commands (kbd "r r") 'replace-regexp)
;;(define-key 'regex-funcs (kbd "s") 'rgrep)


;; Unbind stuff here
