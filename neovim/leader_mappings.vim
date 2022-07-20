" Leader mappings
noremap <Leader>y "*y
noremap <Leader>m zz
noremap <Leader>u :bn<CR>
noremap <Leader>j :bd!<CR>
noremap <leader>t :%bd\|e#\|bd#<CR>
noremap <Leader>; <C-R>

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vv :source ~/.config/nvim/init.vim<cr>

noremap <Leader>o :Buffers<CR>
noremap <Leader>e :Ag<CR>
noremap <Leader>i :Mark<CR>
nnoremap <expr> <Leader>a (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

noremap <Leader>z :Goyo<CR>

noremap <Leader>tn :TestNear<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>ts :TestSuite<CR>

nnoremap <leader>d "_dd

noremap <leader>b :Git blame<CR>

" Put terminal in normal mode
tnoremap <Leader>q <C-\><C-n>

