alias ls='ls -G'
alias l='ls -al'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gr='git remote'
alias gl='git log'
alias gl1="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

ssh-add > /dev/null 2>&1

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi
source ~/dotfiles/.git-completion.sh
source ~/dotfiles/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
