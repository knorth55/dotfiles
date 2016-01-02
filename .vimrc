set number

" tab set
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" japanese 
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,sjis
set encoding=utf-8

"keymapping
nmap <S-h> ^
nmap <S-k> }
nmap <S-j> {
nmap <S-l> $
nmap == gg=G''

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

"yankround
NeoBundle 'LeafCage/yankround.vim'

"neocomplete
NeoBundle 'Shougo/neocomplete'

"caw
NeoBundle 'tyru/caw.vim'

" vim-scala
NeoBundle 'derekwyatt/vim-scala'

"TwitVim
NeoBundle 'vim-scripts/TwitVim'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"unite.vim settings
let g:unite_enable_start_insert=1
nmap ub :Unite buffer<CR>

nmap uf :Unite -buffer-name=file file<CR>
nmap up :Unite file_mru<CR>
nmap ua :UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q<CR>
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q<CR>

"VimShell settings
"nmap vs :VimShell<CR>
nmap vs :VimShellPop<CR>

"yankround settings
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
nmap pp :Unite yankround<CR>
xmap pp :Unite yankround<CR>

"neocomplete settings 
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_enable_camel_case_completion = 0
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
" neocomplete plugin
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"NERDTree setting
nmap nt :NERDTree<CR>
nmap nc :NERDTreeClose<CR>

"quickrun setting
nmap <C-R> :QuickRun<CR>
vmap <C-R> :QuickRun<CR> 

"caw setting
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

"FileType config
au BufNewFile,BufRead *.l set filetype=lisp
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.scala set filetype=scala

"TwitVim config
nmap cp :CPosttoTwitter<CR>
