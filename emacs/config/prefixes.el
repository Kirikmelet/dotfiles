;; -*- lexical-binding t; -*-

(define-prefix-command 'org-funcs-map)
(define-prefix-command 'app-funcs-map)
(define-prefix-command 'org-files-map)
(define-prefix-command 'org-agenda-file-map)
(define-prefix-command 'regex-funcs)
(define-prefix-command 'search-funcs)

(if (not (getenv "TERM"))
    (progn
      (global-set-key (kbd "<C-f1> o") 'org-funcs-map)
      (global-set-key (kbd "<C-f1> a") 'app-funcs-map)
      (global-set-key (kbd "<C-f1> o f") 'org-files-map)
      (global-set-key (kbd "<C-f1> o f a") 'org-agenda-file-map)
      (global-set-key (kbd "<C-f2> r") 'regex-funcs)
      (global-set-key (kbd "<C-f2> s") 'regex-funcs)
      )
   (progn
     (global-set-key (kbd "<f25> o") 'org-funcs-map)
     (global-set-key (kbd "<f25> a") 'app-funcs-map)
     (global-set-key (kbd "<f25> o f") 'org-files-map)
     (global-set-key (kbd "<f25> o f a") 'org-agenda-file-map)
     (global-set-key (kbd "<f26> r") 'regex-funcs)
     (global-set-key (kbd "<f26> s") 'regex-funcs)
     )
  )

(provide 'prefixes)
