# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }
# parse_git_branch() {
#     branch=git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# parse_git_branch() {
#     branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [ \1  ]/')
#     if [ -n "$branch" ]; then
#         echo "$branch "
#     fi
# }

parse_git_branch() {
    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "$inside_git_repo" ]; then
        branch=$(git branch 2>/dev/null | sed -n 's/\* \(.*\)/ \1 /p')
        dirty_status=""
        
        # Check for unstaged changes
        if ! git diff --quiet --exit-code; then
            dirty_status+="*"
        fi
        
        # Check for uncommitted changes
        if ! git diff --quiet --cached --exit-code; then
            dirty_status+="+"
        fi

        YELLOW='\033[0;33m'
        # Output the result
        # echo -e "${YELLOW}[ $branch$dirty_status ]"
        echo  "[ $branch$dirty_status ]"
    fi
}


export PS1="\n\[[ \e[00m\]\[\033[01;34m\]\w\[\033[00m\] ]\$(parse_git_branch) > "

# case insensitive completion
bind 'set completion-ignore-case on'

#nvim alias
alias v='nvim'

#Nix-shell stuff
alias ns='nix-shell'

# Git alias
alias gst='git status'
alias gsta='git status -s'

# cd alias / shortcuts
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '~'='cd ~'


# eza aliases
alias tree='eza --tree --icons'
alias ls='eza --icons'
alias l='eza -l --icons'
alias la='eza -la --icons'

# colored grep is best grep
alias grep='grep --color=auto'

