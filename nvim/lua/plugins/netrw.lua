local vim = vim
local api = vim.api

-- Netrw Protocol Commands
vim.g.netrw_dav_cmd           = 'curl'
vim.g.netrw_fetch_cmd         = ''
vim.g.netrw_ftp_cmd           = 'ftp'
vim.g.netrw_http_cmd          = 'curl'
vim.g.netrw_rcp_cmd           = 'rcp'
vim.g.netrw_rsync_cmd         = 'rsync'
vim.g.netrw_scp_cmd           = 'scp -q'
vim.g.netrw_sftp_cmd          = 'sftp'
vim.g.netrw_ssh_cmd           = 'ssh'

-- Netrw Transfer Control
vim.g.netrw_cygwin            = 0
vim.g.netrw_ftp               = 0
vim.g.netrw_ftpmode           = 'binary'
vim.g.netrw_ignorenetrc       = 0
vim.g.netrw_sshport           = '-p'
vim.g.netrw_silent            = 0
vim.g.netrw_use_nt_rcp        = 0
vim.g.netrw_win95ftp          = 1

-- Netrw Messages
vim.g.netrw_use_errorwindow    = 1

-- Netrw Browser Control
vim.g.netrw_altfile   = 0
vim.g.netrw_alto              = 1
vim.g.netrw_altv              = 0
vim.g.netrw_banner            = 0
-- vim.g.netrw_bannerbackslash   = '(not defined)'
vim.g.netrw_browse_split      = 1
-- vim.g.netrw_browsex_viewer   = '(not defined)'
vim.g.netrw_compress          = 'tar'
-- vim.g.Netrw_corehandler      = '(not defined)'
vim.g.netrw_ctags             = 'ctags'
vim.g.netrw_cursor            = 2
vim.g.netrw_decompress = {
   ['.xz'] = 'unxz';
   ['.tar'] = 'tar -xf';
   ['.gz'] = 'gunzip';
   ['.bz2'] = 'bunzip2';
   ['.zip'] = 'unzip'
}
-- vim.g.netrw_dynamic_maxfilenamelen= '(not defined)'
vim.g.netrw_dirhistmax        = 10
vim.g.netrw_errorlvl          = 0
vim.g.netrw_fastbrowse        = 1
vim.g.netrw_fname_escape      = ' ?&;%'
vim.g.netrw_ftp_browse_reject = [[^total\s\+\d\+$\|^Trying\s\+\d\+.*$\|^KERBEROS_V\d rejected\|^Security extensions not\|No such file\|: connect to address [0-9a-fA-F:]*: No route to host$]]
vim.g.netrw_ftp_list_cmd      = 'ls -lF'
vim.g.netrw_ftp_sizelist_cmd  = 'ls -slF'
vim.g.netrw_ftp_timelist_cmd  = 'ls -tlF'
vim.g.netrw_glob_escape       = [[*[]?`{~$\]]
vim.g.netrw_hide              = 1
vim.g.netrw_home              = '/home/troyd/.config/nvim'
vim.g.netrw_keepdir           = 1
vim.g.netrw_list_cmd          = 'ssh USEPORT HOSTNAME ls -FLa'
vim.g.netrw_list_hide         = ''
vim.g.netrw_liststyle         = 0
vim.g.netrw_localcopycmd      = 'cp'
vim.g.netrw_localcopycmdopt   = ''
vim.g.netrw_localmkdir        = 'mkdir'
vim.g.netrw_localmkdiropt     = ''
vim.g.netrw_localmovecmd      = 'mv'
vim.g.netrw_localmovecmdopt   = ''
vim.g.netrw_localrmdiropt     = ''
vim.g.netrw_maxfilenamelen    = 32
vim.g.netrw_menu              = 0
vim.g.netrw_mousemaps         = 0
vim.g.netrw_mkdir_cmd         = 'ssh USEPORT HOSTNAME mkdir'
-- vim.g.netrw_nobeval           = '(not defined)'
vim.g.netrw_remote_mkdir      = 'mkdir'
vim.g.netrw_preview           = 0
vim.g.netrw_rename_cmd        = 'ssh USEPORT HOSTNAME mv'
vim.g.netrw_retmap            = 0
vim.g.netrw_rm_cmd            = 'ssh USEPORT HOSTNAME rm'
vim.g.netrw_rmdir_cmd         = 'ssh USEPORT HOSTNAME rmdir'
vim.g.netrw_rmf_cmd           = 'ssh USEPORT HOSTNAME rm -f '
vim.g.netrw_sort_by           = 'name'
vim.g.netrw_sort_direction    = 'normal'
vim.g.netrw_sort_options      = ''
vim.g.netrw_sort_sequence     = [[[\/]$,\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$']]
vim.g.netrw_servername        = 'NETRWSERVER'
vim.g.netrw_special_syntax    = 0
vim.g.netrw_ssh_browse_reject = [[^total\s\+\d\+$]]
vim.g.netrw_ssh_cmd           = 'ssh'
vim.g.netrw_scpport           = '-P'
vim.g.netrw_sepchr            = 'ÿ'
vim.g.netrw_sshport           = '-p'
vim.g.netrw_timefmt           = '%c'
vim.g.netrw_tmpfile_escape    = ' &;'
vim.g.netrw_use_noswf         = 1
vim.g.netrw_xstrlen           = 1
vim.g.netrw_winsize           = 50

-- For help, place cursor on line and press <F1>
