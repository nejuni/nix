" Set leader key 
let mapleader = " "

" Open netrw with <leader>cd
nnoremap <leader>cd :Ex<CR>

" Make <C-c> behave like <Esc> in insert mode
inoremap <C-c> <Esc>

" Save file
nnoremap <leader>w :wa<CR>

" Quit
nnoremap <leader>qq :q!<CR>

" Save and quit
nnoremap <leader>wq :wqa<CR>

" Move selected lines up/down (like Alt-Up/Down)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Join lines with cursor preserved
nnoremap J mzJ`z

" Scroll half-page and center cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Center on next/previous search result
nnoremap n nzzzv
nnoremap N Nzzzv

" Delete selected line
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Disable Ex mode (accidental Q)
nnoremap Q <nop>

" Substitute word under cursor on line
nnoremap <leader>s :s/\<<C-r><C-w>\>//gI<Left><Left><Left>

" Make current file executable
nnoremap <leader>x :!chmod +x %<CR>

" Reload vimrc (adjust path as needed)
nnoremap <leader>rl :source ~/.vim/vimrc<CR>

" Source current file
nnoremap <leader><leader> :so<CR>
