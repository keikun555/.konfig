# Just some personal config files

General steps
git submodule update --init --recursive
stow zsh powerlevel10k oh-my-zsh
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
stow fzf
install fzf

Make sure to run git submodule update --init --recursive before stowing any files

For YouCompleteMe you need cmake and vim with python3 support
And compile with
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

To install fzf we need to run
~/.fzf/install
