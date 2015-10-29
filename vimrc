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
" " Unit.vimの設定
"""""""""""""""""""""""""""""""
" " 入力モードで開始する
let g:unite_enable_start_insert=1
" " バッファ一覧
noremap <C-P> :Unite buffer<CR>
" " ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" " sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" " ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""""

"Lisp FileType config
au BufNewFile,BufRead *.l set filetype=lisp
