
# Bash Tab Completion script for common CLIs


### How to use?

Add `.sh` files into the `/etc/bash_completion.d/` directory and fresh your shell's session login. That is it.

```bash
>>> tree  /etc/bash_completion.d/
/etc/bash_completion.d/
├── apport_completion
├── _comp_clamscan.sh
├── _comp_nodejs.sh
├── _comp_nginx.sh
├── dkms
├── git-prompt
└── grub

0 directories, 7 files
```
Or all `.sh` once at all.
 1. `cd /tmp`
 2. `git clone https://github.com/redcursor/btc.git`
 3. `find btc -type f -name \*.sh  | sudo xargs -I xxx mv xxx /etc/bash_completion.d/`
 4. close your session (terminal) and open it up again
 
 
 ### how to enable Tab Completion
 
 
 ```bash
>>> shopt -s
checkwinsize   	on
cmdhist        	on
complete_fullquote	on
expand_aliases 	on
extglob        	on
extquote       	on
force_fignore  	on
histappend     	on
interactive_comments	on
progcomp       	on              # this should be on
promptvars     	on
sourcepath     	on
 ```

if `progcomp` is not **on** turn it on;

```bash
>>> shopt -s progcomp
```

### Scripts and link for raw code

 - [clamscan](https://www.clamav.net/downloads) *Clam AntiVirus is an open source (GPLv2) anti-virus toolkit, ...*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/clamscan/_comp_clamscan.sh)`
 - [nginx](http://nginx.org/) *HTTP and reverse proxy server, mail proxy server*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/nginx/_comp_nginx.sh)`
 - [nodejs](https://nodejs.org/) *JavaScript runtime environment*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/nodejs/_comp_nodejs.sh)`
 - xargs *build and execute command lines from standard input*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/xargs/_comp_xargs.sh)`
 - [curly](https://github.com/k-five/curly) *Speak curl for faster troubleshooting*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/curly/_comp_curly.sh)`
 - [certbot](https://certbot.eff.org/) *EFF project to HTTPS every website*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/certbot/_comp_certbot.sh)`
 - [ldc](https://github.com/k-five/ldc) *Linux Docker Configuration*
     - `source <(curl -sL https://raw.githubusercontent.com/redcursor/btc/master/ldc/_comp_ldc.sh)`

