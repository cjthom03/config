echo "Running .zshrc"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# for a number of configuration options, see
# zshrc.zsh-template in the oh-my-zsh repo

# Some selected options from the template are below:
# ----------------------------------------------------------------------------

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(textmate)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ----------------------------------------------------------------------------
# Pre Oh My Zsh!
# ----------------------------------------------------------------------------
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'

precmd_dir() {
  PR_DIR_DEPTH=${PWD//[!\/]}
  PR_PATH_FROM_HOME=${PWD#$HOME}
  PR_DEPTH_FROM_HOME=${PR_PATH_FROM_HOME//[!\/]}
  PR_DIR_END='%3~'

  if () [[ ${#PR_DIR_DEPTH} > 2 ]]; then PR_DIR_START='../'; fi;
  if () [[ ($PWD/ = ~/) || ($PWD = '/' ) || (${#PR_DEPTH_FROM_HOME} < 3) ]]; then PR_DIR_START=''; fi;

  PR_DIR="${PR_DIR_START}$PR_DIR_END"
}
precmd_functions+=( precmd_dir )

# Modify $fpath for homebrew autocompletion BEFORE running compinit
#fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

autoload -Uz compinit
compinit -i

# allow for variables to be expanded in the prompt
setopt prompt_subst

NEWLINE=$'\n'
PROMPT='$NEWLINE%F{cyan}[%*]%f $PR_DIR | $NEWLINE  > '

# Have something displayed all the way to the right of the prompt
RPROMPT='%F{green}${vcs_info_msg_0_}%f'
# ----------------------------------------------------------------------------

# Autocomplete for 1Password CLI
eval "$(op completion zsh)"; compdef _op op

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_ENV=development

# VIM stuff
# Set default editor
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'
export GKEEP_USERNAME=op://4sowt4kvkmcw23gjnzuycgc6ti/kghvtoermrchjjav7u7rmqtg5q/identifier
export GKEEP_PASSWD=op://4sowt4kvkmcw23gjnzuycgc6ti/7wvs7orearndc476n6isqn6sme/password

# Alias Land
alias gs='git status'
alias ga='git add .'
alias gb='git branch'
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

alias tt='taskwarrior-tui'

# Lively Land
export LIVELY_SSO_EMAIL="charlie.thomas@livelyme.com"

# op -> 1Password
# acts as a cache so I dont get prompted to login everytime I open a new session in terminal
if [ ! -f ~/.op-env ]; then
  op run -- true
  ~/op-env > ~/.op-env
  chmod 600 ~/.op-env
fi

source ~/.op-env


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autocomplete for Git branch names, because laziness
# tab complete git commands -> try typing "git che<tab>"
# https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# Any personal scripts I want to run? Put 'em here:
export PATH="/Users/charlie/workspace/scripts:$PATH"

# python
export PATH="$PATH:/Users/charlie/Library/Python/3.9/bin"

# iTerm
# Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Scripting
alias it2run="/Applications/iTerm.app/Contents/Resources/it2run"

# Adding Lively internal-tool bin scripts to PATH
export PATH="$PATH:$HOME/workspace/internal-tools/bin"

# Adding ENV Variables for goodMorningLively script
export LOCAL_LIVELY_DB_DIR="$HOME/workspace/lively-database/package/lively"
export LOCAL_LIVELY_APP_DIR="$HOME/workspace/lively/package/lively"

# ----------------------------------------------------------------------------
# Custom yarn autocompletion, maybe
# function _yarn() {
# Check if there is a package.json file in the current directory
# if no file is found, cd .. and check again until we reach $HOME

# _describe 'command' "('cmd1:description1' 'cmd2:description2')"
# }

# compdef _yarn yarn

# ----------------------------------------------------------------------------
# Alias Land
alias tshn="tsh --proxy=lively-teleport.livelyme.net --auth=okta_saml_connector --user=$LIVELY_SSO_EMAIL"
alias tshp="tsh --proxy=teleport.livelyops.com --auth=okta_saml_connector --user=$LIVELY_SSO_EMAIL"
alias goodMorning="~/workspace/scripts/goodMorningLively.sh"


# ----------------------------------------------------------------------------
# We are ready to start typing things!!
echo "\nHello $USER, what can I do for you today?"
echo "-------------------------------------------"

