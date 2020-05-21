;;; lsp-dart-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "lsp-dart" "lsp-dart.el" (0 0 0 0))
;;; Generated autoloads from lsp-dart.el

(autoload 'lsp-dart-version "lsp-dart" "\
Get the lsp-dart version as string.

The returned string includes the version from main file header,
 the current time and the Emacs version.

If the version number could not be determined, signal an error.

\(fn)" t nil)

(autoload 'lsp-dart-show-outline "lsp-dart" "\
Show an outline tree and focus on it if IGNORE-FOCUS? is nil.

\(fn IGNORE-FOCUS\\=\\?)" t nil)

(autoload 'lsp-dart-show-flutter-outline "lsp-dart" "\
Show a Flutter outline tree and focus on it if IGNORE-FOCUS? is nil.

\(fn IGNORE-FOCUS\\=\\?)" t nil)

(autoload 'lsp-dart-run-test-at-point "lsp-dart" "\
Run test checking for the previous overlay at point.
Run test of the overlay which has the smallest range of
all test overlays in the current buffer.

\(fn)" t nil)

(autoload 'lsp-dart-run-test-file "lsp-dart" "\
Run dart/Flutter test command only for current buffer.

\(fn)" t nil)
(with-eval-after-load 'lsp-mode (require 'lsp-dart))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart" '("lsp-dart-")))

;;;***

;;;### (autoloads nil "lsp-dart-dap" "lsp-dart-dap.el" (0 0 0 0))
;;; Generated autoloads from lsp-dart-dap.el

(autoload 'lsp-dart-dap-open-devtools "lsp-dart-dap" "\
Open Dart DevTools for the current debug session.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart-dap" '("lsp-dart-dap-")))

;;;***

;;;### (autoloads nil "lsp-dart-flutter-colors" "lsp-dart-flutter-colors.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from lsp-dart-flutter-colors.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart-flutter-colors" '("lsp-dart-flutter-colors")))

;;;***

;;;### (autoloads nil "lsp-dart-flutter-fringe" "lsp-dart-flutter-fringe.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from lsp-dart-flutter-fringe.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart-flutter-fringe" '("lsp-dart-flutter-fringe-")))

;;;***

;;;### (autoloads nil "lsp-dart-flutter-widget-guide" "lsp-dart-flutter-widget-guide.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from lsp-dart-flutter-widget-guide.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart-flutter-widget-guide" '("lsp-dart-flutter-widget-guide-")))

;;;***

;;;### (autoloads nil "lsp-dart-project" "lsp-dart-project.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from lsp-dart-project.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart-project" '("lsp-dart-project-")))

;;;***

;;;### (autoloads nil "lsp-dart-test-support" "lsp-dart-test-support.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from lsp-dart-test-support.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-dart-test-support" '("lsp-dart-test-support-")))

;;;***

;;;### (autoloads nil nil ("lsp-dart-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lsp-dart-autoloads.el ends here
