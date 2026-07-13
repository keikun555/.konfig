" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" This needs to be put into .vimrc, otherwise tab colors will break (I dunno
" why).
" syntax enable

" let g:vimtex_complete_ref = {
"    \ 'custom_patterns': ['\\[esftESFT]ref\*\?{[^}]*$']
"    \ }

" let g:tex_fold_enabled = 0
" let g:vimtex_fold_enabled = 1

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_method = 'zathura_simple'
let g:vimtex_view_method = 'sioyek'
let g:vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
let g:vimtex_view_sioyek_options = '--reuse-window'

" Or with a generic interface:
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_autoclose_after_keystrokes=1


" This is a dictionary that can be used to configure the built-in ToC
" matchers. See below for a specification of the ToC matcher "objects" and the
" various keys that can be defined/changed (|toc_matcher_specification|).
let g:vimtex_toc_config_matchers = {
    \ 'apxsubsection': {'title': 'Subsection'},
    \}

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","

" let g:vimtex_view_zathura_hook_callback = 'MyZathuraCallbackHook'

" function! MyZathuraCallbackHook() dict
"   call self.xwin_send_keys('R')
" endfunction

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

set conceallevel=2
highlight clear Conceal

" for omnicompletion
let g:vimtex_complete_ref = {
    \  'custom_patterns': [
    \    '\\getkeytheorem\*\?{[^}]*$',
    \    '\\apxsubsection\*\?{[^}]*$',
    \    '\\apxsubsection\*\?{[^}]*}{[^}]*$',
    \    '\\psubsection\*\?{[^}]*$',
    \    '\\psubsection\*\?{[^}]*}{[^}]*$',
    \  ],
    \}


let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'Font shape',
      \ 'Some font shapes',
      \ 'Size substitutions with differences',
      \ 'You have requested package',
      \ 'Empty bibliography',
      \ 'float specifier changed to',
      \ 'standard defaults will be used',
      \ 'setting the option has no effect',
      \ 'Package hyperref Warning: Draft mode on.',
      \ 'LaTeX Warning: Unused global option',
      \ 'A possible image without description',
      \ 'vspace should only be used to provide space above/below surrounding objects',
      \ 'Package wrapfig Warning: Stationary wrapfigure forced to float',
      \ 'Package wrapfig Warning: wrapfigure used inside a conflicting environment',
      \ 'LaTeX Warning: Marginpar on page',
	  \ 'Package todonotes Warning: The length marginparwidth is less than',
      \]

" use for longer compilation but better errors
" \   '-interaction=nonstopmode',
let g:vimtex_compiler_latexmk = {
    \ 'aux_dir' : '',
    \ 'out_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-f',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=batchmode',
    \ ],
    \}

syntax sync minlines=256

" https://github.com/lervag/vimtex/issues/2599
let g:vimtex_indent_lists = []


" \ {'name': 'vct', 'mathmode': 1, 'argstyle': 'bold'},
" \ {'name': 'R', 'cmdre': 'R>', 'mathmode': 1, 'concealchar': 'ℝ'},
" \ {'name': 'mathnote', 'mathmode': 1, 'nextgroup': 'texMathTextArg'},
" \ {'name': 'nospell', 'argspell': 0},
" \ {'name': 'pluseq', 'cmdre': 'coloneq>', 'mathmode': 1, 'concealchar': '+='},
" \ {'name': 'lstinline', 'cmdre': 'lstinline', 'conceal': 1},
" \ {'name': 'zlstinline', 'cmdre': 'zlstinline', 'conceal': 1},
let g:vimtex_syntax_custom_cmds = [
    \ {'name': 'R', 'cmdre': 'R>', 'mathmode': 1, 'concealchar': '𝐑'},
    \ {'name': 'N', 'cmdre': 'N>', 'mathmode': 1, 'concealchar': 'N'},
    \ {'name': 'I', 'cmdre': 'I>', 'mathmode': 1, 'concealchar': '𝐈'},
    \ {'name': 'ep', 'cmdre': 'ep>', 'mathmode': 1, 'concealchar': 'ε'},
    \ {'name': 'pow', 'cmdre': 'pow>', 'mathmode': 1, 'concealchar': '𝒫'},
    \ {'name': 'nse', 'cmdre': 'nse>', 'mathmode': 1, 'concealchar': '⭑'},
    \ {'name': 'to', 'cmdre': 'to>', 'mathmode': 1, 'concealchar': '→'},
    \ {'name': 'coloneq', 'cmdre': 'coloneq>', 'mathmode': 1, 'concealchar': '≔'},
    \ {'name': 'vdash', 'cmdre': 'vdash>', 'mathmode': 1, 'concealchar': '⊢'},
    \ {'name': 'vDash', 'cmdre': 'vDash>', 'mathmode': 1, 'concealchar': '⊨'},
    \ {'name': 'vdashd', 'cmdre': 'vdashd>', 'mathmode': 1, 'concealchar': '⊢'},
    \ {'name': 'vDashd', 'cmdre': 'vDashd>', 'mathmode': 1, 'concealchar': '⊨'},
    \ {'name': 'vdashc', 'cmdre': 'vdashd>', 'mathmode': 1, 'concealchar': '⊢'},
    \ {'name': 'vDashc', 'cmdre': 'vDashd>', 'mathmode': 1, 'concealchar': '⊨'},
    \ {'name': 'triangleq', 'cmdre': 'triangleq>', 'mathmode': 1, 'concealchar': '≜'},
    \ {'name': 'rightarrowtriangle', 'cmdre': 'rightarrowtriangle>', 'mathmode': 1, 'concealchar': '⇾'},
    \ {'name': 'negthinspace', 'cmdre': 'negthinspace>', "conceal": 1},
    \ {'name': 'Coloneqq', 'cmdre': 'Coloneqq>', 'mathmode': 1, 'concealchar': '⩴'},
    \ {'name': 'square', 'cmdre': 'square>', 'mathmode': 1, 'concealchar': '☐'},
    \ {'name': 'Diamond', 'cmdre': 'Diamond>', 'mathmode': 1, 'concealchar': '◇'},
    \ {'name': 'upharpoonright', 'cmdre': 'upharpoonright>', 'mathmode': 1, 'concealchar': '↾'},
    \ {'name': 'scriptstyle', 'cmdre': 'scriptstyle>', "conceal": 1},
    \ {'name': 'ms', 'cmdre': 'ms>', 'mathmode': 1, 'concealchar': 'ℳ'},
    \ {'name': 'ds', 'cmdre': 'ds>', 'mathmode': 1, 'concealchar': '𝒟'},
    \ {'name': 'ws', 'cmdre': 'ws>', 'mathmode': 1, 'concealchar': '𝒲'},
    \ {'name': 'lesssim', 'cmdre': 'lesssim>', 'mathmode': 1, 'concealchar': '≲'},
    \]

" \ {'name': 'ket',
" \  'mathmode': 1,
" \  'cchar_open': '|',
" \  'cchar_close': '>'},
" \ {'name': 'binom',
" \  'nargs': 2,
" \  'mathmode': 1,
" \  'cchar_open': '(',
" \  'cchar_mid': '|',
" \  'cchar_close': ')'},
let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
    \ {'name': 'vtag',
    \  'mathmode': 1,
    \  'cchar_open': '〈',
    \  'cchar_close': '〉'},
    \ {'name': 'ceil',
    \  'mathmode': 1,
    \  'cchar_open': '⌈',
    \  'cchar_close': '⌉'},
    \ {'name': 'floor',
    \  'mathmode': 1,
    \  'cchar_open': '⌊',
    \  'cchar_close': '⌋'},
    \ {'name': 'abs',
    \  'mathmode': 1,
    \  'cchar_open': '|',
    \  'cchar_close': '|'},
    \ {'name': 'norm',
    \  'mathmode': 1,
    \  'cchar_open': '‖',
    \  'cchar_close': '‖'},
    \ {'name': 'sem',
    \  'mathmode': 1,
    \  'cchar_open': '〚',
    \  'cchar_close': '〛'},
    \ {'name': 'sembound',
    \  'nargs': 2,
    \  'mathmode': 1,
    \  'cchar_open': '〚',
    \  'cchar_mid': '|',
    \  'cchar_close': '〛'},
    \ {'name': 'dsem',
    \  'nargs': 1,
    \  'mathmode': 1,
    \  'cchar_open': '〈',
    \  'cchar_close': '〉'},
    \ {'name': 'csem',
    \  'nargs': 1,
    \  'mathmode': 1,
    \  'cchar_open': '⦇',
    \  'cchar_close': '⦈'},
    \ {'name': 'wsem',
    \  'nargs': 1,
    \  'mathmode': 1,
    \  'cchar_open': '⦃',
    \  'cchar_close': '⦄'},
    \ {'name': 'denc',
    \  'mathmode': 1,
    \  'cchar_open': '⦃',
    \  'cchar_close': '⦄'},
    \ {'name': 'denp',
    \  'mathmode': 1,
    \  'cchar_open': '⦅',
    \  'cchar_close': '⦆'},
    \ {'name': 'hoare',
    \  'nargs': 3,
    \  'mathmode': 1,
    \  'cchar_open': '{',
    \  'cchar_mid': '|',
    \  'cchar_close': '}'},
    \ {'name': 'hoarefst',
    \  'nargs': 3,
    \  'mathmode': 1,
    \  'cchar_open': '[',
    \  'cchar_mid': '|',
    \  'cchar_close': ']'},
    \ {'name': 'hoaret',
    \  'nargs': 3,
    \  'mathmode': 1,
    \  'cchar_open': '[',
    \  'cchar_mid': '|',
    \  'cchar_close': ']'},
    \ {'name': 'interior',
    \  'mathmode': 1,
    \  'cchar_open': '',
    \  'cchar_close': '◌૾'},
    \ {'name': 'lstinline',
    \  'mathmode': 1},
    \ {'name': 'zlstinline',
    \  'mathmode': 1},
    \]
