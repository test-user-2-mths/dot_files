# .bashrc file

export PATH="${PATH}":/usr/bin/swift/bin
export PATH="${PATH}":/usr/bin/swiftlint

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\] $ '

PROMPT_DIRTRIM=1
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
