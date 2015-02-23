
set -x PATH $HOME/.local/bin node_modules/.bin $PATH
set -x WORKON_HOME $HOME/.local/venvs

set -x NLS_LANG .UTF8

set -x PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig
set -x LD_LIBRARY_PATH $HOME/.local/lib /usr/lib/oracle/11.1/client64/lib


for file in $S_SCRIPTSDIR/functions/*.fish
    source $file
end


source $S_SCRIPTSDIR/aliases.fish

