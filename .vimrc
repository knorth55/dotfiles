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

"neocomplcache
NeoBundle 'Shougo/neocomplcache'

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
nmap pp :Unite yankround<CR>
xmap pp :Unite yankround<CR>

"complcache settings 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()""

"NERDTree settings
nmap nt :NERDTree<CR>
nmap nc :NERDTreeClose<CR>

"Lisp FileType config
au BufNewFile,BufRead *.l set filetype=lisp
au BufNewFile,BufRead *.launch set filetype=xml

