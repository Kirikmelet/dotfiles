
(define-minor-mode untitled-buffer-mode
  :init-value nil
  :lighter " Untitled File"
  :keymap '(
            ((kbd "C-x C-s") . (write-file (read-file-name "Filename? ")))
            )
  )

(defun new-file ()
  (interactive)
  (let ((bufv (generate-new-buffer "New File")))
    (switch-to-buffer bufv)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    bufv
    )
  )

(provide 'basicfunc)
