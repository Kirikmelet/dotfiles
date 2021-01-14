# Commands
define-command -docstring 'Find in File' ffh-grep-file %{
    info -title 'How to use grep' 'You can use grep to find text in files'
    prompt 'What to find ? ' 'grep %val{text}'
}
