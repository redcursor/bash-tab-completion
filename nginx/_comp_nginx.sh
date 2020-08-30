################################################################################
# Bash completion for nginx
#
# Copyright (C) 2020  Red Cursor
#
# Author: Shakiba Moshiri
# Project: btc (Bash Tab Completion)
# Source: github.com/redcursor
################################################################################

cmd_name='nginx';   # $1
current_arg='';     # $2
previous_arg='';    # $3

_s_value=(stop quit reopen reload);

cmd_short_opt=$(egrep -o '\-[a-z-]+=?' <($cmd_name -h 2>&1));
cmd_long_opt=$(egrep -o '\-\-[a-z-]+=?' <($cmd_name -h 2>&1));

_s_comp () {
    case $1 in
        [!sqr] )
            COMPREPLY=("# invalid '$1' value");
        ;;
        $1 )
            COMPREPLY=( $(egrep -o "$1[^ ]+\b" <<< ${_s_value[@]}) );
        ;;
    esac
}

_comp_nginx () {
    current_arg=${COMP_WORDS[$COMP_CWORD]};
    previous_arg=${COMP_WORDS[$COMP_CWORD-1]};

    case ${previous_arg} in
        -s )
            COMPREPLY=(${_s_value[@]});
            _s_comp $current_arg;
        ;;
    esac

    case ${current_arg} in
        -? | -h | -v | -t | -s )
            COMPREPLY=($current_arg);
        ;;
        - | -- )
            COMPREPLY=(${cmd_short_opt[@]});
        ;;
    esac
}

complete -o bashdefault -o default -F _comp_nginx nginx
