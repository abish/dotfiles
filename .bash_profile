# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export LSCOLORS=gxfxcxdxbxegedabagacad
PATH=$PATH:$HOME/bin:/usr/local/bin:/Users/tatsuya_shibahara/Library/Android/sdk/platform-tools

eval "$(nodenv init -)"
