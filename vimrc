" dein config
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"colorscheme
colorscheme molokai
syntax on

set number
set laststatus=2
set clipboard=unnamed,unnamedplus,autoselect
set background =dark

" tab set
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set nocompatible

set splitbelow
set splitright
set history=50
set commentstring=\ #\ %s
set browsedir=buffer
set hidden

" japanese
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,sjis
set encoding=utf-8

" backspace 
set backspace=indent,eol,start

"search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Required:
filetype plugin indent on

"unite.vim settings
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> \ub :<C-u>Unite buffer<CR>
nnoremap <silent> \uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> \ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> \uu :<C-u>Unite file_mru buffer<CR>

"yankround settings
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
nmap pp :Unite yankround<CR>

"NERDTree setting
nmap nt :NERDTree<CR>
nmap nc :NERDTreeClose<CR>

"FileType config
au BufNewFile,BufRead *.l set filetype=lisp
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.scala set filetype=scala
au BufNewFile,BufRead *.sbt set filetype=scala
au BufNewFile,BufRead *.erb set filetype=ruby

"syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_markdown_checkers = ['mdl']

"vim-fugitive config
nmap gdf :Gvdiff<CR>
nmap gst :Gstatus<CR>

"vim-airline config
let g:airline_theme='molokai'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#displayed_head_limit = 10

" ddc setting
call ddc#custom#patch_global('ui', 'native')

call ddc#custom#patch_global('sources', ['around', 'vim-lsp', 'file'])

call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \   'matchers': ['matcher_head'],
  \   'sorters': ['sorter_rank'],
  \   'converters': ['converter_remove_overlap'],
  \ },
  \ 'around': {'mark': 'Around'},
  \ 'vim-lsp': {
  \   'mark': 'LSP',
  \   'matchers': ['matcher_head'],
  \   'forceCompletionPattern': '\.|:|->|"\w+/*'
  \ },
  \ 'file': {
  \   'mark': 'file',
  \   'isVolatile': v:true, 
  \   'forceCompletionPattern': '\S/\S*'
  \ }})

inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()

"change molokai colorscheme
highlight Normal ctermbg=None
highlight LineNr ctermbg=None
highlight SignColumn ctermbg=None
highlight VertSplit ctermbg=None
highlight NonText ctermbg=None
highlight Visual ctermbg=8
highlight Comment ctermfg=61

"vimdiff color
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
