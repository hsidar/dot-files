" Autocomplete/Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

let g:coc_global_extensions = ['coc-solargraph', 'coc-eslint', 'coc-tsserver', 'coc-snippets']

let g:coc_snippet_next = '<tab>'

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr>
  \ pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ? to show documentation in preview window.
nnoremap <silent> ? :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" make error texts have a red color
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> ge <Plug>(coc-diagnostic-next)


