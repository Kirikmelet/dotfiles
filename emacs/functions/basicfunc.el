;; -*- lexical-binding t; -*-


(define-minor-mode untitled-buffer-mode
  "For untitled buffers"
  ;;
  :init-value nil
  ;;
  :lighter " Untitled File"
  ;;
  :keymap '(
            ((kbd "C-x C-s") . (write-file (read-file-name "Filename? ")))
            )
  )

(defun new-file ()
  (interactive)
  (let ((bufv (generate-new-buffer "New File")))
    (switch-to-buffer bufv)
    (funcall initial-major-mode)
    (untitled-buffer-mode)
    (setq buffer-offer-save t)
    bufv
    )
  )


(defun set-japanese ()
  (dolist (charset '(kana han cjk-misc symbol bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Noto Sans CJK JP"))
    )
  )


(provide 'basicfunc)
