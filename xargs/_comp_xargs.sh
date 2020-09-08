################################################################################
# Bash completion for xargs
#
# Copyright (C) 2020  Red Cursor
#
# Author: Shakiba Moshiri
# Project: btc (Bash Tab Completion)
# Source: github.com/redcursor
################################################################################

cmd_name='xargs';   # $1
current_arg='';     # $2
previous_arg='';    # $3


xargs_path=$(which xargs);
xargs_short_opt=($(egrep -o ' \-[a-zA-Z0-9]' <($xargs_path --help) | sort | uniq))
xargs_long_opt=($(egrep -o ' \-\-[a-zA-Z0-9-]+' <($xargs_path --help 2>&1) | sort | uniq));


_comp_xargs () {
    current_arg=${COMP_WORDS[$COMP_CWORD]};
    previous_arg=${COMP_WORDS[$COMP_CWORD-1]};

    case ${previous_arg} in
        xargs )
            COMPREPLY=(${xargs_short_opt[@]});
        ;;
    esac

    case ${current_arg} in
        -[a-zA-Z0-9] )
            COMPREPLY=($current_arg);
        ;;
        --[a-zA-Z0-9]* )
            COMPREPLY=( $(egrep -o "${current_arg//-/\\-}[^ ]+" <<< ${xargs_long_opt[@]}) );
        ;;
        - )
            COMPREPLY=(${xargs_short_opt[@]});
        ;;
        -- )
            COMPREPLY=(${xargs_long_opt[@]});
        ;;
    esac
}

complete -o bashdefault -o default -F _comp_xargs xargs
