echo "Running .zshrc"

# ----------------------------------------------------------------------------
# Prompt
# ----------------------------------------------------------------------------
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'

precmd_dir() {
  if () [[ $PWD/ = ~/ ]];
  then
    PR_DIR=''
  else
    PR_DIR='/'
  fi;
}
precmd_functions+=( precmd_dir )

# allow for variable
setopt prompt_subst

PROMPT='%F{cyan}| %* |%f $PR_DIR%1~ %# '
RPROMPT='%F{green}${vcs_info_msg_0_}%f'
# ----------------------------------------------------------------------------

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# VIM stuff
# Set default editor
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'

# Alias Land
alias gs='git status'
alias ga='git add .'
alias gca='git commit -am'
alias gco='git checkout'
alias gdb='git branch --merged | egrep -v "(^\*|master|staging|prod)" | xargs git branch -d'
alias upg='cd $(git rev-parse --show-toplevel)'

alias ls='ls -a'
alias hosts='sudo nvim /etc/hosts'
alias vim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias zsource='source ~/.zshrc'

alias tshn="tsh --proxy=lively-teleport.livelyme.net"
alias tshp="tsh --proxy=teleport.livelyops.com"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autocomplete for Git branch names, because laziness
# https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# tab complete git commands -> try typing "git che<tab>"
autoload -Uz compinit && compinit

echo "\nHello $USER, what can I do for you today?"
echo "-------------------------------------------\n"


# Kept for posterity;

# Ruby
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# eval "$(rbenv init - zsh)"

# python
# export PATH="/usr/bin/python3:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# so everyone knows that kind of tests we were running back in the day! (At DataGrail)
# alias beri="bundle exec rspec --exclude-pattern 'spec/features/**/*_spec.rb'"
# alias sberi="bundle exec spring rspec --exclude-pattern 'spec/features/**/*_spec.rb'"
# alias burpi='RAILS_ENV=test noglob rails parallel:spec["spec\/(?!features)"]'

# alias be='bundle exec'
# alias ber='bundle exec rspec'
# alias sber='bundle exec spring rspec'
# alias burp='RAILS_ENV=test bundle exec rake parallel:spec'
# alias grumble='RAILS_ENV=test bundle exec rake grumble'

# alias mongostart='brew services start mongodb-community@5.0'
# alias mongostop='brew services stop mongodb-community@5.0'
