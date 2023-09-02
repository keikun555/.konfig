# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kei/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/kei/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kei/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/kei/.fzf/shell/key-bindings.zsh"
