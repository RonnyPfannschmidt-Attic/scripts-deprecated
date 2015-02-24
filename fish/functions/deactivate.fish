function deactivate  -d "Exit virtualenv and return to normal shell environment"
    if set -q VIRTUAL_ENV
        if test "$PATH[1]" = "$VIRTUAL_ENV/bin"
            set -e PATH[1]
        end
        set -e VIRTUAL_ENV
        set -e __fish_prompt_virtualenv
    end
end
