# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ir/.konfig/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ir/.konfig/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ir/.konfig/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ir/.konfig/fzf/shell/key-bindings.bash"
