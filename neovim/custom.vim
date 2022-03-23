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
noremap n l
" up
noremap s k
" down
noremap t j

" undo
noremap ; u

" half-page up/down
noremap T <C-d>
noremap S <C-u>

" remap m key for "next/previous search"
noremap m n
noremap M N
" Clear search highlighting
nnoremap <silent> <esc> :noh<return><esc>

tnoremap q <C-\><C-n>
