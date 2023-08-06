# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/charlie/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/charlie/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/charlie/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/charlie/.fzf/shell/key-bindings.bash"
