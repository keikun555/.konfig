# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/kei/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/kei/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/kei/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/kei/.fzf/shell/key-bindings.bash"
