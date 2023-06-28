
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
require('glow').setup()
EOF

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" Modify fzf ag window search to not search file names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

