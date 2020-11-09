;; -*- lexical-binding t; -*-

(define-prefix-command 'org-funcs-map)
(define-prefix-command 'app-funcs-map)
(define-prefix-command 'org-files-map)
(define-prefix-command 'org-agenda-file-map)
(define-prefix-command 'regex-funcs)
(define-prefix-command 'search-funcs)
(define-prefix-command 'start-maps)
(define-prefix-command 'start-commands)

(global-set-key (kbd "M-c") 'start-maps)
(global-set-key (kbd "M-v") 'start-commands)

(global-set-key (kbd "M-c o") 'org-funcs-map)
(global-set-key (kbd "M-c a") 'app-funcs-map)
(global-set-key (kbd "M-c o f") 'org-files-map)
(global-set-key (kbd "M-c o f a") 'org-agenda-file-map)
(global-set-key (kbd "M-v r") 'regex-funcs)

