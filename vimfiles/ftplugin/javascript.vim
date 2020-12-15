set expandtab tabstop=2 shiftwidth=2 textwidth=400  backspace=eol,start,indent

let b:ale_fixers = ['standard']
set formatprg=standard\ --fix\ --stdin\ %\ 2>\ /dev/null
