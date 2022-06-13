" let g:airline_theme = 'dracula'
" let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#wordcount#enabled = 0
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ' '

map u H0<Plug>Lightspeed_s

" Comfortable Motion
nnoremap <silent> <S-t> :call comfortable_motion#flick(75)<CR>
nnoremap <silent> <S-s> :call comfortable_motion#flick(-75)<CR>

let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'basic',
  \ 'suite':   'basic',
\}

lua << EOF
require'sniprun'.setup({
  display = {
    "TempFloatingWindow",      --# display results in a floating window
    }})
EOF

" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
