" Default Colors for CursorLine
highlight  CursorLine guibg=None guifg=None

" Change Color when entering Insert Mode
" autocmd InsertEnter * colorscheme hotline
autocmd InsertEnter * highlight  CursorLine guibg=Black guifg=None

" Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * colorscheme evokai
autocmd InsertLeave * highlight  CursorLine guibg=None guifg=None

cnoreabbrev <expr> qq (getcmdtype() == ':' && getcmdline() =~ '^qq$')? 'q!' : 'qq'

" left
noremap h h
" right
noremap s l
" up
noremap n k
" down
noremap t j

" undo
noremap ; u

" beginning/end of word
noremap S e
noremap H b

noremap L H

" remap key for "next/previous search"
noremap b n
noremap B N

" Clear search highlighting
nnoremap <silent> <esc> :noh<return><esc>

:command W :noa w

