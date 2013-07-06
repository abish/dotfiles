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

# Source global definitions
if [ -f /etc/bashrc ]; then
          . /etc/bashrc
        fi
source ~/perl5/perlbrew/etc/bashrc
