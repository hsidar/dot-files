
map u L0<Plug>Lightspeed_s

" Comfortable Motion
nnoremap <silent> <S-t> :call comfortable_motion#flick(75)<CR>
nnoremap <silent> <S-n> :call comfortable_motion#flick(-75)<CR>

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

