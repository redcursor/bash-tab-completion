################################################################################
# Bash completion for certbot
#
# Copyright (C) 2020  Red Cursor
#
# Author: Shakiba Moshiri
# Project: btc (Bash Tab Completion)
# Source: github.com/redcursor
################################################################################

cmd_name='certbot'; # $1
current_arg='';     # $2
previous_arg='';    # $3

certbot_path=$(which certbot);
certbot_long_opt=($(egrep -o ' \-\-[a-zA-Z0-9_-]+\b' <($certbot_path --help all 2>&1) | sort | uniq));
certbot_short_opt=($(egrep -o '\-[a-zA-Z0-9]' <($certbot_path --help all 2>&1) | sort | uniq));
certbot_name_opt=('run' 'certonly' 'renew' 'endorce' 'https://acme-v02.api.letsencrypt.org/directory');

_comp_certbot () {
    current_arg=${COMP_WORDS[$COMP_CWORD]};
    previous_arg=${COMP_WORDS[$COMP_CWORD-1]};

    case ${previous_arg} in
        certbot )
            COMPREPLY=(${certbot_name_opt[@]});
        ;;
    esac

    case ${current_arg} in
        [a-z]* )
            COMPREPLY=( $(egrep -o "\b${current_arg}[^ ]+\b" <<< ${certbot_name_opt[@]}) );
        ;;
        -[a-zA-Z0-9] )
            COMPREPLY=($current_arg);
        ;;
        --[a-zA-Z0-9]* )
            COMPREPLY=( $(egrep -o "${current_arg//-/\\-}[^ ]+" <<< ${certbot_long_opt[@]}) );
        ;;
        - )
            COMPREPLY=(${certbot_short_opt[@]});
        ;;
        -- )
            COMPREPLY=(${certbot_long_opt[@]});
        ;;
    esac
}

complete -o bashdefault -o default -F _comp_certbot certbot
