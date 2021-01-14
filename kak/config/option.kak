# Set theme
colorscheme gruvbox

# Set tab stop
set-option global tabstop 4
set-option global indentwidth 4

# Set scrolloff
set-option global scrolloff 1,3


# Grep
try %{
	require-module x11
	set-option global grepcmd 'rg --follow --vimgrep'
} catch %{
    echo 'Failed to load X11 and Ripgrep'
}
