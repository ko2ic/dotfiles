filetype off

setlocal tabstop=2
setlocal shiftwidth=2

if has('vim_starting')
  " vim起動時 
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" js用のインデント
NeoBundle 'pangloss/vim-javascript'

" jsの補完
NeoBundle 'mattn/jscomplete-vim'  
let g:jscomplete_use = ['dom', 'moz', 'es6th']

" ファイルの構文エラーなどを表示するPlugin
" この場合はjsをsave時にjshintを動作させてます。
"NeoBundle 'scrooloose/syntastic'
"let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
"let g:syntastic_check_on_save=1 "保存時にはチェック
"let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
"let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
"set statusline+=%#warningmsg# "エラーメッセージの書式
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_javascript_checkers = ['jshint'] "jshintを使う
"let g:syntastic_mode_map = {
"      \ 'mode': 'active',
"      \ 'active_filetypes': ['javascript'],
"      \ 'passive_filetypes': []
"      \ }

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
