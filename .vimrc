"set number auto on
set number

" tab set
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" japanese 
:set fenc=utf-8
:set fencs=iso-2022-jp,euc-jp,cp932,utf-8,sjis
:set enc=utf-8

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
   " Required:
   if &compatible
      set nocompatible
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimfiler'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 " NERDTree
NeoBundle 'scrooloose/nerdtree'

" autoclose
NeoBundle 'Townk/vim-autoclose'

" syntax chck
NeoBundle 'scrooloose/syntastic'

"quickrun
NeoBundle 'thinca/vim-quickrun'

"unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

"slimv
"NeoBundle 'slimv.vim'

"vimproc and vimshell
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'

"indent coloring
"NeoBundle 'nathanaelkane/vim-indent-guides'

call neobundle#end()

" Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck


" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
"""""""""""""""""""""""""""""""
" " Unit.vim$B$N@_Dj(B
"""""""""""""""""""""""""""""""
" " $BF~NO%b!<%I$G3+;O$9$k(B
let g:unite_enable_start_insert=1
" " $B%P%C%U%!0lMw(B
noremap <C-P> :Unite buffer<CR>
" " $B%U%!%$%k0lMw(B
noremap <C-N> :Unite -buffer-name=file file<CR>
" " $B:G6a;H$C$?%U%!%$%k$N0lMw(B
noremap <C-Z> :Unite file_mru<CR>
" " sources$B$r!V:#3+$$$F$$$k%U%!%$%k$N%G%#%l%/%H%j!W$H$9$k(B
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " $B%&%#%s%I%&$rJ,3d$7$F3+$/(B
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" " $B%&%#%s%I%&$r=D$KJ,3d$7$F3+$/(B
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" " ESC$B%-!<$r(B2$B2s2!$9$H=*N;$9$k(B
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""""

"Lisp FileType config
au BufNewFile,BufRead *.l set filetype=lisp
