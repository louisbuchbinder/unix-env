hi Search ctermbg=White
set number
set hlsearch
set tabstop=2 shiftwidth=2 expandtab

" enable syntax highlighting
filetype plugin indent on
syntax on

" use php syntax highlighting for *.gne
augroup gne
  autocmd BufNewFile,BufRead *.gne set syntax=php
augroup END

" load the cwd .vimrc
set exrc

" configure ctags
set tags=.git/tags
map <C-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
