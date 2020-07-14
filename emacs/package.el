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

(lsp-ui :repo "emacs-lsp/lsp-ui"
        :fetcher github
        :files (:defaults "lsp-ui-doc.html"))
(company :repo "company-mode/company-mode" :fetcher github)
(lsp-treemacs :repo "emacs-lsp/lsp-treemacs" :fetcher github :files (:defaults "icons"))

(ivy :repo "abo-abo/swiper"
     :fetcher github
     :files (:defaults
             (:exclude "swiper.el" "counsel.el" "ivy-hydra.el" "ivy-avy.el")
"doc/ivy-help.org"))
(lsp-ivy :repo "emacs-lsp/lsp-ivy" :fetcher github)

(dap-mode :repo "emacs-lsp/dap-mode" :fetcher github :files (:defaults "icons"))

(counsel :repo "abo-abo/swiper"
         :fetcher github
:files ("counsel.el"))
(sublimity :fetcher github :repo "zk-phi/sublimity")
(projectile :repo "bbatsov/projectile"
            :fetcher github
            :files ("projectile.el"))
