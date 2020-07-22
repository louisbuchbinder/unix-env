hi Search ctermbg=White
set number
set hlsearch
set tabstop=2 shiftwidth=2 expandtab

" enable syntax highlighting
filetype plugin indent on
syntax on

" use graphql syntax for *.prisma
augroup grpahql
  autocmd BufNewFile,BufRead *.prisma setfiletype graphql
augroup END

" use php syntax highlighting for *.gne
augroup gne
  autocmd BufNewFile,BufRead *.gne set syntax=php
augroup END

" remove trailing whitespace
" * disable this feature with :autocmd! remove_trailing_whitespace
augroup remove_trailing_whitespace
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" load the cwd .vimrc
set exrc

" configure ctags
set tags=.git/tags
map <C-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
