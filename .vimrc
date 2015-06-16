syntax on
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022,utf-8,euc-jp,cp932
set ambiwidth=double
set number
" vi非互換にする
set nocompatible
" コマンドモードの補完
set wildmode=longest:full,list
if filereadable(expand('~/.vimrc.include/.vimrc.neobundle')) 
  source ~/.vimrc.include/.vimrc.neobundle
endif
if filereadable(expand('~/.vimrc.include/.vimrc.neocomplete')) 
  source ~/.vimrc.include/.vimrc.neocomplete
endif
"if filereadable(expand('~/.vimrc.include/.vimrc.vundle')) 
"  source ~/.vimrc.include/.vimrc.vundle
"endif
"if filereadable(expand('~/.vimrc.include/.vimrc.netrw')) 
"  source ~/.vimrc.include/.vimrc.netrw
"endif
"if filereadable(expand('~/.vimrc.include/.vimrc.vimfiler')) 
"  source ~/.vimrc.include/.vimrc.vimfiler
"endif
"if filereadable(expand('~/.vimrc.include/.vimrc.visualstar')) 
"  source ~/.vimrc.include/.vimrc.visualstar
"endif
"if filereadable(expand('~/.vimrc.include/.vimrc.yankring')) 
"  source ~/.vimrc.include/.vimrc.yankring
"endif

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
" 挿入モードでbs,del,C-hで削除
set backspace=indent,eol,start
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
set clipboard+=unnamed
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

" コメント改行時の自動挿入解除
:setlocal formatoptions-=ro

" ctrl + a ,(x)のカウントアップ(ダウン)を10進数にする
:set nrformats=
" ctagsが見つかるまで探す
if has('path_extra')
    set tags+=tags;
endif

" %でのジャンプ機能を拡張
:runtime macros/matchit.vim
:let b:match_ignorecase = 1
:let b:match_words="def:end"

" Neosnippetの設定
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" 画面分割・タブページ
nnoremap s <Nop>

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's.', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's,', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '.', '<C-w>>')
call submode#map('bufmove', 'n', '', ',', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

set t_Co=256
colorscheme desert
