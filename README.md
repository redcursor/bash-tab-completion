
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

### Scripts 

 - [clamscan](https://raw.githubusercontent.com/redcursor/btc/master/clamscan/_comp_clamscan.sh)
 - [nginx](https://raw.githubusercontent.com/redcursor/btc/master/nginx/_comp_nginx.sh)
 - [nodejs](https://raw.githubusercontent.com/redcursor/btc/master/nodejs/_comp_nodejs.sh)
