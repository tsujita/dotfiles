"--------------------
" NeoBundle Settings
"--------------------
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" NeoBundleをNeoBundleで管理
NeoBundle 'Shougo/neobundle.vim'

" NeoComplcache
NeoBundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20

" Vimshell
NeoBundle 'Shougo/vimshell'

" Vimproc
NeoBundle 'Shougo/vimproc', {
\     'build' : {
\         'windows' : 'make -f make_mingw32.mak',
\         'cygwin'  : 'make -f make_cygwin.mak',
\         'mac'     : 'make -f make_mac.mak',
\         'unix'    : 'make -f make_unix.mak',
\     },
\ }

" NERDTree
NeoBundle 'scrooloose/nerdtree'
" 引数なしで起動すると自動的にNERTTreeを表示
autocmd vimenter * if !argc() | NERDTree | endif
" 起動時に自動的にNERTTreeを表示
"autocmd vimenter * NERDTree
" NERDTree以外のウィンドウが閉じたら終了
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ,kでNERTTreeを表示/非表示
nmap ,j :NERDTreeToggle<CR>

" Syntastic
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

" ビジュアルモードで選択したキーワードを*を押して検索
NeoBundle 'thinca/vim-visualstar'

" Shift+Kでドキュメント参照
NeoBundle 'thinca/vim-ref'
let g:ref_phpmanual_path = $HOME . '/.dotfiles/php-chunked-xhtml/'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"--------------------
" Basic Settings
"--------------------
syntax enable
colorscheme desert
set background=dark
set tabstop=4           " タブが対応する空白の数
set shiftwidth=4        " 自動インデントの空白数
set expandtab           " タブの代わりに空白を挿入
set nowrap              " ウィンドウ幅より長い行を折り返さない
set incsearch           " インクリメンタルサーチを行う
set smartcase           " 大文字を含む検索では大文字/小文字を区別
set nowrapscan          " 検索を先頭にループさせない
set hlsearch            " 検索結果をハイライト
set nobackup            " バックアップを作らない
set noswapfile          " スワップファイルを作らない
set autoread            " 他でファイルが更新されたら自動で読みなおす
set smartindent         " 高度な自動インデントを行う
set ambiwidth=double    " 文脈依存の文字幅

" ;でコマンド入力
nnoremap ; :

" Escの2回押しで検索結果のハイライトを消す
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" タブ関係
nnoremap <C-w>j gt
nnoremap <C-w>k gT
nnoremap <C-w>n :tabnew<CR>
nnoremap <C-w>c :tabclose<CR>

" Twigシンタックスハイライト
au BufRead,BufNewFile *.twig set syntax=htmljinja

" ',l'をタイプするとPHPのシンタックスチェックが走る
" http://kaworu.jpn.org/kaworu/2009-07-15-1.php
function PHPLint()
        "let result = system( &ft . ' -l ' . bufname(""))
        let result = system('php -l ' . bufname(""))
        echo result
endfunction
autocmd FileType php :nmap ,l :call PHPLint()<CR>

