#!/bin/bash

################################################################################
# Title: curly completion script
# Author: Shakiba Moshiri
# Date: 20XX
################################################################################

cmd_long_opt=$(egrep -o '\-\-[a-z-]+=?' <(clamscan));

################################################################################
# main function which invoked by "complete -F"
################################################################################
_comp_clamscan () {
    C_FLAG=${COMP_WORDS[$COMP_CWORD]};
    P_FLAG=${COMP_WORDS[$COMP_CWORD-1]};

    case ${P_FLAG} in
        --alert-* | \
        --scan-*  | \
        --leave-temps | \
        --gen-json | \
        --official-db-only | \
        --recursive | \
        --allmatch | \
        --cross-fs | \
        --remove | \
        --bytecode | \
        --bytecode-unsigned | \
        --detect-pua | \
        --detect-structured | \
        --scan-mail | \
        --phishing-sigs | \
        --phishing-scan-urls | \
        --heuristic-alerts | \
        --heuristic-scan-precedence | \
        --normalize )

            COMPREPLY=(yes no '*');
            case ${C_FLAG} in
                y )
                    COMPREPLY=(yes)
                ;;
                n )
                    COMPREPLY=(no)
                ;;
                \* )
                    COMPREPLY=(\*)
                ;;
            esac
        ;;
        --move= )
            COMPREPLY=(yes no 0);
        ;;
    esac
    
    case ${C_FLAG} in
        --[a-z]* )
            COMPREPLY=( $(egrep -o "${C_FLAG//-/\\-}[^ ]+" <<< ${cmd_long_opt[@]}) );
        ;;
        - | -- )
            COMPREPLY=(${cmd_long_opt[@]});
        ;;
    esac
}

complete -o bashdefault -o default -F _comp_clamscan clamscan
