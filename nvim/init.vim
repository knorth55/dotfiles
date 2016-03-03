syntax enable

"colorscheme
colorscheme molokai

set number
set laststatus=2
set clipboard=unnamedplus
set background =dark

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
nmap <s-h> ^
nmap <s-k> }
nmap <s-j> {
nmap <s-l> $
nmap == gg=g''

" note: skip initialization for vim-tiny or vim-small.
if 0 | endif
if has('vim_starting')
set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))
" let neobundle manage neobundle
" required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimfiler'

" my bundles here:
" refer to |:neobundle-examples|.
" note: you don't set neobundle setting in .gvimrc!

"deoplete
NeoBundle 'Shougo/deoplete.nvim'

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
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'

"yankround
NeoBundle 'LeafCage/yankround.vim'

"caw
NeoBundle 'tyru/caw.vim'

" vim-scala
NeoBundle 'derekwyatt/vim-scala'

"TwitVim
NeoBundle 'vim-scripts/TwitVim'

"vim-ros
NeoBundle 'taketwo/vim-ros'

"vim-fugitive
NeoBundle 'tpope/vim-fugitive'

"vim-airline
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

"pydiction
NeoBundle 'vim-scripts/Pydiction'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"python3 settings
let g:python3_host_prog = '/usr/bin/python3'

"deoplete settings
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_auto_select = 0
let g:deoplete#enable_auto_close_preview = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_enable_camel_case_completion = 0
if !exists('g:deoplete#keyword_patterns')
    let g:deocomplete#keyword_patterns = {}
endif
let g:deocomplete#keyword_patterns._ = '\h\w*'

" DEBUG(https://github.com/Shougo/deoplete.nvim/issues/160)
" python3 plugins register for deoplete
call remote#host#RegisterPlugin('python3', expand('~/.config/nvim/bundle/deoplete.nvim/rplugin/python3/deoplete.py'), [
      \ {'sync': 1, 'name': '_deoplete', 'type': 'function', 'opts': {}},
     \ ])

"unite.vim settings
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ub :<C-u>Unite buffer<CR>
nnoremap <silent> uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> uu :<C-u>Unite file_mru buffer<CR>

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
au BufNewFile,BufRead *.sbt set filetype=scala

"TwitVim config
nmap cp :CPosttoTwitter<CR>

"vim-ros config
let g:ros_make='current'
let g:ros_build_system='catkin'
set makeprg=catkin\ build

"vim-fugitive config
nmap gdf :Gvdiff<CR>
nmap gst :Gstatus<CR>

"vim-airline config
let g:airline_theme='molokai'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#displayed_head_limit = 10

"pydiction config
let g:pydiction_location = '~/.config/nvim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 8

" change molokai color scheme
highlight visual ctermbg=8
highlight comment ctermfg=61

"vimdiff color
highlight diffadd    cterm=bold ctermfg=10 ctermbg=22
highlight diffdelete cterm=bold ctermfg=10 ctermbg=52
highlight diffchange cterm=bold ctermfg=10 ctermbg=17
highlight difftext   cterm=bold ctermfg=10 ctermbg=21

