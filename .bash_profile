# Get the Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Custom bash prompt
#
# Includes custom character for the prompt, path, and Git branch name.
#
# Source: kirsle.net/wizards/ps1.html
export PS1="\n\[$(tput bold)\]\[$(tput setaf 5)\]➜ \[$(tput setaf 6)\]\w\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

export PATH=/opt/local/bin:/opt/local/sbin:${PATH}

# Aliases

## Tools
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl' 

## Shortcuts
alias ll='ls -al'
alias editgit='atom ~/.gitconfig'
alias editbash='subl ~/.bash_profile'
alias edithttpd='subl /Applications/MAMP/conf/apache/httpd.conf'
alias editvhosts='subl /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf'
alias edithosts='subl /etc/hosts'
alias resource='source ~/.bash_profile && echo "Done!"'

## Git commands
alias log='git log'
alias diff='git diff'
alias branch='git branch'
alias st='git status'
alias fetch='git fetch'
alias push='git push origin head'
alias pull='git pull'
alias fp='fetch && pull'
alias gmm='git merge master'
alias gmghp='git merge gh-pages'
alias recent='git for-each-ref --sort=-committerdate refs/heads/'
alias branch_new="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"

## Git branch switching
alias master='git co master'
alias ghp='git co gh-pages'

## Build tools
alias gd='grunt dist'

## SVN
alias up='svn up'
alias sst='svn st'

## Switch repos
DIR=~/work
alias db='cd /Users/timmstokke/Dropbox'
alias h='cd ~/'
alias w='cd ${DIR}'
alias www='cd ${DIR}'
alias gotdone-client='cd ${DIR}/gotdone-client'
alias gotdone-server='cd ${DIR}/gotdone-server'
alias gotdone-workers='cd ${DIR}/gotdone-workers'

## Server guick starts
alias js='jekyll serve --watch'
alias ps='python -m SimpleHTTPServer 4000'

## Mobile iOS testing
alias ios='open /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
