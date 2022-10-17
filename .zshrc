echo "Hello Master, what can I do for you today?"

# VIM stuff
# Set default editor
# export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'

# Ruby
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init - zsh)"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# source $(brew --prefix nvm)/nvm.sh
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#Alias Land
alias gs='git status'
alias ga='git add .'
alias gca='git commit -am'
alias gco='git checkout'
alias gdb='git branch --merged | egrep -v "(^\*|master|staging|prod)" | xargs git branch -d'
alias upg='cd $(git rev-parse --show-toplevel)'

alias ls='ls -a'

alias be='bundle exec'
alias ber='bundle exec rspec'
alias sber='bundle exec spring rspec'
alias burp='RAILS_ENV=test bundle exec rake parallel:spec'
alias grumble='RAILS_ENV=test bundle exec rake grumble'

alias hosts='sudo nvim /etc/hosts'
alias vim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias zsource='source ~/.zshrc'

alias mongostart='brew services start mongodb-community@5.0'
alias mongostop='brew services stop mongodb-community@5.0'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autocomplete for Git branch names, because laziness
#   Per instructions here: https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# python
export PATH="/usr/bin/python3:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Kept for posterity; so everyone knows that kind of tests we were running back in the day!
#alias beri="bundle exec rspec --exclude-pattern 'spec/features/**/*_spec.rb'"
#alias sberi="bundle exec spring rspec --exclude-pattern 'spec/features/**/*_spec.rb'"
#alias burpi='RAILS_ENV=test noglob rails parallel:spec["spec\/(?!features)"]'

