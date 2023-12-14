""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
" source $KONFIG_DIR/vimrc_colors
" Just Vundle things
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
    " encoding stuff for YouCompleteMe
    set encoding=utf-8
    let g:ycm_filetype_blacklist = { 'typescript.tsx': 1 }
    " Don't show YCM's preview window [ I find it really annoying ]
    set completeopt-=preview
    let g:ycm_add_preview_to_completeopt = 0
    " Compatibility with UltiSnippets using supertab
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
Plugin 'scrooloose/nerdtree'
    let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
    nmap <C-e> :NERDTreeToggle<CR>
    nmap <F9> :TagbarToggle<CR>
Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#ale#enabled = 1
Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='hybrid'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-signify'
Plugin 'junegunn/fzf', { 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
    " Emmet with jsx
    let g:user_emmet_leader_key='<Tab>'
    let g:user_emmet_settings = {
                \  'javascript.jsx' : {
                \      'extends' : 'jsx',
                \  },
                \}
Plugin 'dense-analysis/ale'
    let g:ale_linters = {
    \   'typescript.tsx': ['tslint'],
    \}
    let g:ale_python_auto_virtualenv = 1
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-session'
    " vim-session don't ask when going on blank vim
    let g:session_autoload = 'no'
    let g:session_autosave = 'no'
Plugin 'tpope/vim-obsession'
Plugin 'itchyny/calendar.vim'
    " get google stuff
    let g:calendar_google_calendar = 1
    let g:calendar_google_task = 1
" Plugin 'vimwiki/vimwiki'
Plugin 'dkarter/bullets.vim'
" Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'
    let g:tex_flavor='latex'
" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'Chiel92/vim-autoformat' " This is done with ale
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<C-n>'
Plugin 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" typescript/javascript
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

" Plugin 'ap/vim-css-color'
" Plugin 'godlygeek/csapprox'
" Plugin 'mtdl9/vim-log-highlighting'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
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
" we want react to detect changes
set backupcopy=yes
" fast tty and lazyredraw
set ttyfast
set lazyredraw

" MacVim remove scrollbar
set guioptions=

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
" set working directory the same as editing file
set autochdir

" Color scheme stuff
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme hybrid

" for typescript files
set backupcopy=yes
autocmd BufNewFile *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile *.ts,*.js set filetype=typescript.jsx
filetype plugin on
syntax on

" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
set t_ut=

set termguicolors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    set t_ZH=^[[3m
    set t_ZR=^[[23m
endif
if $COLORTERM == 'xterm-256color'
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
endif
" vim tab navigation
map t<up> :tabr<cr>
map t<down> :tabl<cr>
map t<left> :tabp<cr>
map t<right> :tabn<cr>
map tn :tabnew<cr>
map tc :tabc<cr>
" Shortcuts to move between tabs with Ctrl+Shift+Left/Right
function TabLeft()
   if tabpagenr() == 1
      execute "tabm"
   else
      execute "tabm -1"
   endif
endfunction

function TabRight()
   if tabpagenr() == tabpagenr('$')
      execute "tabm" 0
   else
      execute "tabm +1"
   endif
endfunction

map T<right> :execute TabRight()<CR>
map T<left> :execute TabLeft()<CR>
" vim splits
map <C-w><bar> :vsplit<cr>
map <C-w>- :split<cr>
" display moves
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" folding
" set foldmethod=syntax
" so I can see where my cursor is
set cursorline
set cursorcolumn
" so I can paste with the mouse
"set paste
" this gets in the way of cindent, so let's just make it easy to toggle...
set pastetoggle=<F2>
" so I can click with my mouse
set ttymouse=sgr
set mouse=a

" set line numbers
set number relativenumber
" turn them off if typescript and others
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.ts,*.js
            \ set nocursorline |
            \ set nocursorcolumn |
            \ set norelativenumber
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
" highlight PreProc   term=bold cterm=bold ctermfg=2 guifg=Cyan

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
" spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=2
set modelines=1
" nnoremap Q <nop>
" vmap <Tab> >gv
" vmap <S-Tab> <gv
" set shiftwidth=2
set shiftround
set expandtab
set autoindent
" }}}
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
" tsx/jsx comment style
autocmd FileType typescript.tsx set commentstring={/*\ %s\ */}
autocmd FileType typescript.tsx set ts=2
autocmd FileType typescript.tsx set sts=2
autocmd FileType typescript.tsx set et     "expand tabs to spaces
autocmd FileType typescript.tsx set sw=2
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

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

call SourceIfExists("~/.vimrc_local")
" end .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
