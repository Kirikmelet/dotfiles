# Mapping config file

# Declare user modes
declare-user-mode ffH

# Set user map
map global normal <space> , -docstring 'Enter User mode (alias for ",")'

# User mappings
map global user q ':q<ret>' -docstring 'Exit kakoune'
map global user f ':fHub<ret>' -docstring 'File settings'

# User commands
map -docstring 'Format file' global ffH f ':format<ret>'
map -docstring 'Search (grep) files' global ffH s ':ffh-grep-file<ret>'

define-command -docstring 'File Settings hub' fHub %{
    enter-user-mode ffH
}
