if filereadable(expand('~/.vimrc.source/.vimrc.neobundle')) 
  source ~/.vimrc.source/.vimrc.neobundle
endif
"if filereadable(expand('~/.vimrc.source/.vimrc.vundle')) 
"  source ~/.vimrc.source/.vimrc.vundle
"endif
"if filereadable(expand('~/.vimrc.source/.vimrc.netrw')) 
"  source ~/.vimrc.source/.vimrc.netrw
"endif
"if filereadable(expand('~/.vimrc.source/.vimrc.vimfiler')) 
"  source ~/.vimrc.source/.vimrc.vimfiler
"endif
"if filereadable(expand('~/.vimrc.source/.vimrc.visualstar')) 
"  source ~/.vimrc.source/.vimrc.visualstar
"endif
"if filereadable(expand('~/.vimrc.source/.vimrc.yankring')) 
"  source ~/.vimrc.source/.vimrc.yankring
"endif

syntax on
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022,utf-8,euc-jp,cp932
set ambiwidth=double
set number
"タブの代わりに空白文字を挿入する
set expandtab
set softtabstop=0
" 自動インデント
set autoindent
" スマートインデント
set smartindent
" タブサイズ1
set tabstop=4
" シフト移動幅
set shiftwidth=4
" 対応したカッコを表示する
set showmatch
" 入力と同時に検索
set incsearch
" 検索時にハイライトするがESC二度押しで解除
set hlsearch
:nnoremap <ESC><ESC> :nohlsearch<CR>
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" コマンドをステータス行に表示
set showcmd
" yank時のデフォルトをクリップボードにする
" set clipboard+=unnamed
" :ls時に最後に開いた場所にカーソルを戻す
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" ヤンク後に何度pしても置き換わらないようにする
" vnoremap <silent> <C-p> "0p<CR>
" ペースト直後のテキストをすぐに選択する
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" ヤンクした文字列とカーソル位置の文字列を置換する
" nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR> 
" vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR> 
" nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" 矩形ビジュアルモードで文字のない所でも選択
set virtualedit=block
" makefileの場合の処理
autocmd FileType make setlocal noexpandtab
" xmlファイル用の折り畳設定
"let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax

" %でのジャンプ機能を拡張
:runtime macros/matchit.vim
:let b:match_ignorecase = 1
:let b:match_words="\/*:*\/"

set t_Co=256
colorscheme desert


