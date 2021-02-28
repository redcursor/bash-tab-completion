#!/bin/bash

################################################################################
# Title: LDC completion script
# Author: Shakiba Moshiri
# Date: 20XX
################################################################################

################################################################################
# long flags && short flags
################################################################################
ldc_long_opt=(--{help,os,docker,con,container,command,reg,registry,port});
ldc_short_opt=(-{h,O,D,C,R});

################################################################################
# list of actions
################################################################################
os_actions=(null type version update upgrade info);
docker_actions=(null docker remove compose kubectl);
container_actions=(null prometheus node-exporter visualizer portainer-ce);
command_actions=(null check docker);
registry_actions=(null index.docker.io docker.mirror.derak.cloud);


################################################################################
# main function which invoked by "complete -F"
################################################################################
_comp_ldc () {
    current_arg=${COMP_WORDS[$COMP_CWORD]};
    previous_arg=${COMP_WORDS[$COMP_CWORD-1]};

    case ${previous_arg} in
        ldc )
            COMPREPLY=(${ldc_short_opt[@]});
        ;;
        -O | --os )
            COMPREPLY=( $(egrep -o " ${current_arg//-/\\-}[^ ]+" <<< ${os_actions[@]}) );
        ;;
        -D | --docker )
            COMPREPLY=( $(egrep -o " ${current_arg//-/\\-}[^ ]+" <<< ${docker_actions[@]}) );
        ;;
        --con | --container )
            COMPREPLY=( $(egrep -o " ${current_arg//-/\\-}[^ ]+" <<< ${container_actions[@]}) );
        ;;
        --command )
            COMPREPLY=( $(egrep -o " ${current_arg//-/\\-}[^ ]+" <<< ${command_actions[@]}) );
        ;;
        -R | --reg | --registry )
            COMPREPLY=( $(egrep -o " ${current_arg//-/\\-}[^ ]+" <<< ${registry_actions[@]}) );
        ;;

    esac

    case ${current_arg} in
        -[a-zA-Z0-9] )
            COMPREPLY=($current_arg);
        ;;
        --[a-zA-Z0-9]* )
            COMPREPLY=( $(egrep -o "${current_arg//-/\\-}[^ ]+" <<< ${ldc_long_opt[@]}) );
        ;;
        - )
            COMPREPLY=(${ldc_short_opt[@]});
        ;;
        -- )
            COMPREPLY=(${ldc_long_opt[@]});
        ;;
    esac
}
complete -o bashdefault -o nosort  -o default -F _comp_ldc ldc

