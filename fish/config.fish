#if test -f ~/.nix-profile/etc/profile.d/nix.fish
#    . ~/.nix-profile/etc/profile.d/nix.fish
#   end

for item in $HOME/.local/bin node_modules/.bin $HOME/Projects/tools/arcanist/bin/ $HOME/.npm/bin
    if not contains $item $PATH
        set -x PATH $item $PATH
    end
end



set -x WORKON_HOME $HOME/.local/venvs
set -x PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig

set SUDO_ALIASES btrfs pm-suspend dnf

for com in $SUDO_ALIASES
    alias $com="sudo $com"
end
