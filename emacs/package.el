(use-package
 :fetcher github
 :repo "jwiegley/use-package"
 :files (:defaults (:exclude "bind-key.el"
			     "bind-chord.el"
			     "use-package-chords.el"
				 "use-package-ensure-system-package.el")))

(evil :repo "emacs-evil/evil"
      :fetcher github
      :files (:defaults
	      "doc/build/texinfo/evil.texi"
	                    (:exclude "evil-test-helpers.el")))

(bongo :repo "dbrock/bongo" :fetcher github 
       :files ("*.el" "*.texi" "images" "*.rb"))

(powerline :fetcher github
           :repo "milkypostman/powerline")

(powerline-evil :fetcher github
                :repo "johnson-christopher/powerline-evil")

(dired-sidebar :fetcher github :repo "jojojames/dired-sidebar")

(ccls :repo "MaskRay/emacs-ccls" :fetcher github)

(lsp-mode :repo "emacs-lsp/lsp-mode" :fetcher github)

(quelpa-use-package :fetcher github :repo "quelpa/quelpa-use-package")

(use-package-ensure-system-package :repo "jwiegley/use-package"
								   :fetcher github
								   :files ("use-package-ensure-system-package.el"))




						    
(lsp-dart :repo "emacs-lsp/lsp-dart" :fetcher github )


(gruvbox-theme :fetcher github :repo "greduan/emacs-theme-gruvbox")
(libmpdel :fetcher github :repo "mpdel/libmpdel")
