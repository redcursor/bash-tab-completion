################################################################################
# Bash completion for nodejs
#
# Copyright (C) 2020  Red Cursor
#
# Author: Shakiba Moshiri
# Project: btc (Bash Tab Completion)
# Source: github.com/redcursor
################################################################################

cmd_name='nodejs';  # $1
current_arg='';     # $2
previous_arg='';    # $3

nodejs_path=$(which nodejs);
nodejs_long_opt=($(egrep -o '\-\-[a-z0-9-]+=?' <($nodejs_path --help 2>&1)));

_comp_nodejs () {
    current_arg=${COMP_WORDS[$COMP_CWORD]};
    previous_arg=${COMP_WORDS[$COMP_CWORD-1]};

    case ${previous_arg} in
        --print )
            # there are examples
            COMPREPLY=("1. 'console.log(\"hi\")'" "2. 'console.log(process.argv)'");
        ;;
    esac
    
    case ${current_arg} in
        --[a-z]* )
            COMPREPLY=( $(egrep -o "${current_arg//-/\\-}[^ ]+" <<< ${nodejs_long_opt[@]}) );
        ;;
        - | -- )
            COMPREPLY=(${nodejs_long_opt[@]});
        ;;
    esac
}

complete -o bashdefault -o default -F _comp_nodejs nodejs;
