
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/Cellar/php/7.4.4/bin:$PATH"

alias gst="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gbr="git branch"

source ~/.nvm/nvm.sh

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PGHOST=localhost
alias python="python3"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
