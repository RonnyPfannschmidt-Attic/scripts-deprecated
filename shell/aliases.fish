
alias irc="autossh -t mm 'screen -Ux'"
alias ls="ls --color=auto"
alias pypy=/home/ronny/Projects/pypy/pypy/pypy/translator/goal/pypy-c
alias pypy-bin=/home/ronny/Projects/pypy/pypy-bin/bin/pypy
alias pypy3-bin=/home/ronny/Projects/pypy/pypy3-bin/bin/pypy
alias weechat-curses='echo DEPP'
alias vim ~/.local/sublime_text_3/sublime_text
alias gvim ~/.local/sublime_text_3/sublime_text
alias subl ~/.local/sublime_text_3/sublime_text

function tmux
    ssh -t us "tmux -S .tmux attach-session -t pro -d"
end

set SUDO_ALIASES modprobe insmod rmmod btrfs pm-suspend docker yum

for com in $SUDO_ALIASES
    alias $com="sudo $com"
end

