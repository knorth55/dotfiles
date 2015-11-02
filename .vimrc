"set number auto on
set number

" tab set
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" japanese 
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932,utf-8,sjis
set enc=utf-8

"keymapping
nmap <S-h> ^
nmap <S-j> }
nmap <S-k> {
nmap <S-l> $
nmap == gg=G''
nmap <C-t> :tabnew<CR>

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

"vimproc and vimshell
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'

"indent coloring
"NeoBundle 'nathanaelkane/vim-indent-guides'

"yankround
NeoBundle 'LeafCage/yankround.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"unite.vim settings
let g:unite_enable_start_insert=1
nmap <C-u><C-b> :Unite buffer<CR>
nmap <C-u><C-f> :Unite -buffer-name=file file<CR>
nmap <C-u><C-m> :Unite file_mru<CR>
nmap <C-u><C-a> :UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q<CR>
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q<CR>
""""""""""""""""""""""""""""""""

"VimShell settings
nmap vs :VimShell<CR>
nmap vp :VimShellPop<CR>

"yankround settings
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"NERDTree settings

"Lisp FileType config
au BufNewFile,BufRead *.l set filetype=lisp
