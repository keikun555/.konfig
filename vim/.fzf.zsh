# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kimada1/.konfig/vim/bundle/fzf/bin* ]]; then
  export PATH="$PATH:/home/kimada1/.konfig/vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kimada1/.konfig/vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/kimada1/.konfig/vim/bundle/fzf/shell/key-bindings.zsh"

