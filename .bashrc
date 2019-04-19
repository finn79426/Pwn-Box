export LC_ALL=zh_TW.UTF-8
export LANG=zh_TW.UTF-8
export EDITOR=vim

alias cls='clear'
alias ls='ls -HGF'
function cd { builtin cd "$@" && ls }

alias cx='chmod +x'
alias myip="curl ipinfo.io"
alias bashrc="vim ~/.bashrc"
function mkcd { mkdir -p "$@" && cd "$@";  }

# Python
alias py2="/usr/bin/python"
alias py3="python3"

# Pwn
alias gdb='gdb -q'
alias objdump='objdump -M intel'
alias cs='checksec'
alias strace="strace -ixv"
alias ltrace="ltrace -iC"