
alias irc="autossh -t mm 'screen -Ux'"
alias ls="ls --color=auto"
alias pypy=/home/ronny/Projects/pypy/pypy/pypy/translator/goal/pypy-c
alias pypy-bin=/home/ronny/Projects/pypy/pypy-bin/bin/pypy
alias pypy3-bin=/home/ronny/Projects/pypy/pypy3-bin/bin/pypy
alias weechat-curses='echo DEPP'


alias tmux="ssh -t us 'tmux -S .tmux attach-session -t pro -d'"

set SUDO_ALIASES modprobe insmod rmmod apt-get aptitude btrfs hibernate-ram

for com in $SUDO_ALIASES
    alias $com="sudo $com"
end

