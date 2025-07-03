function! LatexIndentModifyLinebreaks(buffer) abort
    return {
    \   'command': 'latexindent -l -m --stdin'
    \}
endfunction

execute ale#fix#registry#Add('latexindent-modifylinebreaks', 'LatexIndentModifyLinebreaks', ['tex'], 'latexindent with -m flag')

let b:ale_fixers = ['latexindent-modifylinebreaks']

" let b:ale_linters = ['chktex', 'lacheck', 'cspell', 'proselint', 'textlint', 'write-good']
let b:ale_linters = ['chktex', 'cspell']

set conceallevel=2
highlight clear Conceal

syntax sync minlines=256
