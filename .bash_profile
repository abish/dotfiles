# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH="$HOME/.rbenv/bin:/usr/local/vim-7.3/bin:$HOME/github/workshop/mysql/archives/5.6.10:$HOME/github/workshop/mysql/archives/5.6.10/bin:$PATH"
eval "$(rbenv init -)"
