
begin
    for item in $HOME/.local/bin node_modules/.bin
        for name in $PATH
            if test $name = $item
                set found 1
                break
            end
        end

        if set -q found
            set -e found
        else
            set -gx PATH $item $PATH
        end
    end
end

set -x WORKON_HOME $HOME/.local/venvs
set -x PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig

set SUDO_ALIASES btrfs pm-suspend yum

for com in $SUDO_ALIASES
    alias $com="sudo $com"
end

function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end


    echo -n -s \
        $__fish_prompt_virtualenv \
        $__fish_prompt_hostname ' ' \
        $__fish_prompt_cwd (prompt_pwd) $__fish_prompt_normal \
        '> '


 end
