
set -x PATH $HOME/.local/bin $PATH
#set -x PATH $HOME/Projects/mercurial/contrib/ $PATH
set -x WORKON_HOME $HOME/.local/venvs

set -x PATH $WORKON_HOME/tools/bin $PATH
set -x AUTOSSH_POLL 30

set -x PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig
set -x LD_LIBRARY_PATH $HOME/.local/lib


for file in $S_SCRIPTSDIR/functions/*.fish
    source $file
end


source $S_SCRIPTSDIR/aliases.fish

