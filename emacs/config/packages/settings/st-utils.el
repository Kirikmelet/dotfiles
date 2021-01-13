;; -*- lexical-binding: t; -*-

(eval-when-compile
  (defvar grep-find-template)
  (declare-function grep-apply-setting "grep" (a b)))

(with-eval-after-load "grep"
  (grep-apply-setting
   'grep-find-command
   '("rg -n -H --no-heading --smart-case -e '' $(git rev-parse --show-toplevel 2>/dev/null || pwd)" . 40))
  (setq grep-find-template "rg -n -H --no-heading --smart-case -e '<R>' <D>"
        grep-command "rg -n -H --no-heading --smart-case -e"))
