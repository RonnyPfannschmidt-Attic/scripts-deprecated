
for item in $HOME/.local/bin node_modules/.bin
    if not contains $item $PATH
        set PATH $item $PATH
    end
end

set -x WORKON_HOME $HOME/.local/venvs
set -x PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig

set SUDO_ALIASES btrfs pm-suspend yum

for com in $SUDO_ALIASES
    alias $com="sudo $com"
end

