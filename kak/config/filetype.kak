# Filetype configs


hook global WinSetOption filetype=lua %{
    set-option buffer tabstop 3
    set-option buffer indentwidth 4
}

hook global WinSetOption filetype=c %{
   	set-option buffer tabstop 8
   	set-option buffer indentwidth 8
}

hook global BufCreate *bash* %{
    set-option window filetype sh
}
