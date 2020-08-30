#!/bin/bash

################################################################################
# Title: Node.js completion script
# Author: Shakiba Moshiri
# Date: 20XX
################################################################################

################################################################################
# generate an array of all -- options
################################################################################
cmd_name='nodejs';
which $cmd_name 1> /dev/null 2>&1;
if [[ $? != 0 ]]; then
    echo "$cmd_name has been installed";
    exit;
fi
cmd_flags=($(egrep -o '\-\-[a-z0-9-]+=?' <($cmd_name --help)));


################################################################################
# main function which invoked by "complete -F"
################################################################################
comp () {
    C_FLAG=${COMP_WORDS[$COMP_CWORD]};
    P_FLAG=${COMP_WORDS[$COMP_CWORD-1]};

    case ${P_FLAG} in
        --movejj )
            COMPREPLY=(yes no 0);
        ;;
    esac
    
    case ${C_FLAG} in
        --[a-z]* )
            COMPREPLY=( $(egrep -o "${C_FLAG//-/\\-}[^ ]+" <<< ${cmd_flags[@]}) );
        ;;
        - | -- )
            COMPREPLY=(${cmd_flags[@]});
        ;;
    esac
}

complete -o bashdefault -o default -F comp nodejs
