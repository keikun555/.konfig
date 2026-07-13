    if executable('lake')
 au User lsp_setup call lsp#register_server({
     \ 'name': 'lean4-lsp',
     \ 'cmd': {server_info->['lake', 'serve']},
     \ 'allowlist': ['lean'],
     \ })
endif
