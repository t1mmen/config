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
alias ngrok='/Applications/ngrok'
alias startngrok='ngrok http 80 -subdomain=gotdone'

## Shortcuts
alias ll='ls -al'
alias editgit='code ~/.gitconfig'
alias editbash='code ~/.bash_profile'
alias editbashrc='code ~/.bashrc'
alias edithttpd='code /Applications/MAMP/conf/apache/httpd.conf'
alias editvhosts='code /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf'
alias edithosts='code /etc/hosts'
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

## Switch repos
DIR=~/work
alias db='cd /Users/timmstokke/Dropbox'
alias h='cd ~/'
alias w='cd ${DIR}'
alias www='cd ${DIR}'

## Timely dev stuff
## requires $ npm install concurrently -g 
alias timelyServerDir='cd ${DIR}/timely'
alias timelyClientDir='cd ${DIR}/timely-frontend/react'
alias serverUpdate='timelyServerDir; git pull; bundle exec rake db:migrate'
alias serverStart='timelyServerDir; mysql.server start; concurrently "redis-server /usr/local/etc/redis.conf" "bundle exec rails s"'
alias clientUpdate='timelyClientDir; git pull'
alias clientStart='timelyClientDir; yarn; npm run start';

## Server guick starts
alias js='jekyll serve --watch'
alias ps='python -m SimpleHTTPServer 4000'

## Mobile iOS testing
alias ios='open /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app'

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Node version manager
export NVM_DIR="/Users/timmstokke/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ruby setup
eval "$(rbenv init -)"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
