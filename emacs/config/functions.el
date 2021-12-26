;;; -*- lexical-binding: t; -*-

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

