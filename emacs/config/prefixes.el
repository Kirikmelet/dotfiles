;; -*- lexical-binding t; -*-

(define-prefix-command 'org-funcs-map)
(define-prefix-command 'app-funcs-map)
(define-prefix-command 'org-files-map)
(define-prefix-command 'org-agenda-file-map)

(global-set-key (kbd "<C-f1> o") 'org-funcs-map)
(global-set-key (kbd "<C-f1> a") 'app-funcs-map)
(global-set-key (kbd "<C-f1> o f") 'org-files-map)
(global-set-key (kbd "<C-f1> o f a") 'org-agenda-file-map)

(provide 'prefixes)
