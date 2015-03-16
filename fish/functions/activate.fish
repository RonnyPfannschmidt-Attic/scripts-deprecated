function activate -a ENV -d 'Activate a local or given virtualenv'

    if test -z "$ENV"
        if test -x .env/bin/python
            set ENV .env
            set ENVNAME (basename $PWD)
        else if test -x bin/python
            set ENV .
            set ENVNAME (basename $PWD)
        else
            return 1
        end
    else
        set ENVNAME (basename $ENV)
    end
    set ENV (realpath $ENV)
    deactivate
    set ENVNAME (printf '(%s)' $ENVNAME)
    set -gx VIRTUAL_ENV $ENV
    set -gx PATH "$VIRTUAL_ENV/bin" $PATH
    set -g __fish_prompt_virtualenv \
        (set_color -b blue white) $ENVNAME (set_color normal)
end
