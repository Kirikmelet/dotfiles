;;; mpdel-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads "actual autoloads are elsewhere" "mpdel" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdel" '("mpdel-")))

;;;***

;;;### (autoloads nil "mpdel-browser" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-browser.el"
;;;;;;  "cafa1d5e01326c84fcd252cc12c6247e")
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-browser.el

(autoload 'mpdel-browser-open "mpdel-browser" "\
Open the top level MPDel browser buffer.

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "mpdel-browser"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-browser.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-browser.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdel-browser" '("mpdel-browser-")))

;;;***

;;;***

;;;### (autoloads nil "mpdel-core" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-core.el"
;;;;;;  "2722213865ab237d076ff8d6bdc66a9b")
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-core.el

(autoload 'mpdel-core-open-artists "mpdel-core" "\
Display all artists in the MPD database.

\(fn)" t nil)

(autoload 'mpdel-core-open-stored-playlists "mpdel-core" "\
Display all stored playlists in MPD.

\(fn)" t nil)

(autoload 'mpdel-core-open-albums "mpdel-core" "\
Display all albums in the MPD database.

\(fn)" t nil)

(autoload 'mpdel-core-open-directories "mpdel-core" "\
Display all top-level directories in the MPD database.

\(fn)" t nil)

(autoload 'mpdel-core-search-by-artist "mpdel-core" "\
Display all songs whose artist's name match NAME.
Interactively, ask for NAME.

\(fn NAME)" t nil)

(autoload 'mpdel-core-search-by-album "mpdel-core" "\
Display all songs whose album's name match NAME.
Interactively, ask for NAME.

\(fn NAME)" t nil)

(autoload 'mpdel-core-search-by-title "mpdel-core" "\
Display all songs matching TITLE.
Interactively, ask for TITLE.

\(fn TITLE)" t nil)

(autoload 'mpdel-core-search-by-filter "mpdel-core" "\
Display all songs matching the mpd filter expression FILTER.
Interactively, ask for FILTER.

Example: ((artist == 'name') AND (any contains 'text'))
Documentation: https://www.musicpd.org/doc/html/protocol.html#filters

\(fn FILTER)" t nil)

(autoload 'mpdel-core-volume-increase "mpdel-core" "\
Increase the playback volume by AMOUNT.
If AMOUNT is nil, `mpdel-core-volume-step' is used instead.
Called interactively, AMOUNT can be passed as a prefix argument.

\(fn &optional AMOUNT)" t nil)

(autoload 'mpdel-core-volume-decrease "mpdel-core" "\
Decrease the playback volume by AMOUNT.
If AMOUNT is nil, `mpdel-core-volume-step' is used instead.
Called interactively, AMOUNT can be passed as a prefix argument.

\(fn &optional AMOUNT)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "mpdel-core" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdel-core" '("mpdel-core-")))

;;;***

;;;***

;;;### (autoloads nil "mpdel-playlist" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-playlist.el"
;;;;;;  "f0a09e23f483c7d17a9ec69619f42437")
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-playlist.el

(autoload 'mpdel-playlist-open "mpdel-playlist" "\
Display the current playlist.

\(fn)" t nil)

(autoload 'mpdel-playlist-open-stored-playlist "mpdel-playlist" "\
Ask for a stored playlist and open it.

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "mpdel-playlist"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-playlist.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-playlist.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdel-playlist" '("mpdel-playlist-")))

;;;***

;;;***

;;;### (autoloads nil "mpdel-song" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-song.el"
;;;;;;  "b28607b0e3c44d18b3c20883377fbf20")
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-song.el

(autoload 'mpdel-song-open "mpdel-song" "\
Open a buffer to display information about SONG.
If SONG is nil, use current song instead.

When SONG is nil, the buffer updates itself to keep showing
latest song.  Additionally, the buffer lets the user control
playback.

\(fn &optional SONG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "mpdel-song" "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-song.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-song.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdel-song" '("mpdel-song-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "mpdel-tablist"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-tablist.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-tablist.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdel-tablist" '("mpdel-tablist-")))

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-browser.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-core.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-playlist.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-song.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel-tablist.el"
;;;;;;  "../../../../.emacs.d/elpa/mpdel-20200221.1316/mpdel.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; mpdel-autoloads.el ends here
