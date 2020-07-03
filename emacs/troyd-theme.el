(deftheme troyd
  "Created 2020-06-30.")

(custom-theme-set-variables
 'troyd
 '(ansi-color-names-vector ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(eaf-find-alternate-file-in-dired t)
 '(mingus-mpd-config-file "~/.config/mpd/mpd.conf")
 '(mingus-mpd-port 23955)
 '(mingus-mpd-root "/home/troyd/Music")
 '(nil nil)
 '(package-selected-packages (quote (gruvbox-theme mingus ivy ivy-mpdel lsp-dart pylint flycheck-pycheckers lsp-python-ms w3m highlight-indentation highlight-escape-sequences highlight mpv terminal-toggle ## dashboard dired-sidebar which-key evil-surround use-package lsp-ui evil dired-icon company-lsp company-c-headers ccls)))
 '(custom-safe-themes (quote ("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))))

(provide-theme 'troyd)
