""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
" Just Vundle things
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.konfig/vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.konfig/vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-signify'
Plugin 'junegunn/fzf', { 'dir': '~/.konfig/vim/', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'tpope/vim-obsession'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" encoding stuff for YouCompleteMe
set encoding=utf-8
" Color scheme stuff
let g:airline_theme='hybrid'
colorscheme hybrid_reverse
" Other plugin configs
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
nmap <F9> :TagbarToggle<CR>
" Other stuff
" folding
set foldmethod=indent
" so I can see where my cursor is
set cursorline
set cursorcolumn
" so I can paste with the mouse
"set paste
" this gets in the way of cindent, so let's just make it easy to toggle...
set pastetoggle=<F2>
" so I can click with my mouse
set mouse=a
"
" auto backups
"set backup
" backup file name extension
"set backupext=.foo
"
" format a paragraph with v key
"map v !}fmt
"
" no autowrap of lines
set wrapmargin=0
"
"
" stuff from Smylers's .vimrc
" http://www.stripey.com/vim/
"
" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
   syntax on
   colorscheme hybrid_reverse
endif
highlight PreProc   term=bold cterm=bold ctermfg=2 guifg=Cyan

set backspace=indent,eol,start
"
" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100
"
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
"
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
set shiftround
set expandtab
set autoindent
"
" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::
"
" enable filetype detection:
filetype on
filetype indent on
filetype plugin on
"
" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro
"
" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
"set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
noremap <Space> <PageDown>
noremap <BS> <PageUp>
noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap 
vnoremap Q gq 

" branen's refresh to get rid of the search highlights
map <C-L> :noh<CR>:redraw!<CR>
"
" html mapping
imap ;kb <kbd></kbd><left><left><left><left><left><left>
" 
" more fun from Ben Kuperman
imap ;so System.out.println();<left><left>
imap ;ne <esc>/;<cr>a
vmap <buffer> ;bo "zdi<B><c-r>z</B><esc>
"
" timestamp fun
"let b:timestamp_rep = '%d/%m/%Y %R #f'
"
" spell stuff
if has("spell")
    set nospell
    highlight PmenuSel ctermfg=black ctermbg=lightgray 
    map <F5> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
    set sps=best,10
endif
"
" 
" more from ben...
let spell_language_list = "american"
" end .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
