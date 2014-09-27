filetype off

setlocal tabstop=2
setlocal shiftwidth=2

if has('vim_starting')
  " vim起動時 
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" refを参照できるようにするPlugin
NeoBundleLazy 'yuku-t/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
      \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }

" endを自動補完するplugin
NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

" ファイルの構文エラーなどを表示するPlugin
" この場合はRubyをsave時にrubocopを動作させてます。
"NeoBundle 'scrooloose/syntastic'
"let g:syntastic_mode_map = { 'mode': 'passive',
"            \ 'active_filetypes': ['ruby'] }
"let g:syntastic_ruby_checkers = ['rubocop']

" railsのファイル移動をコマンド移動するplugin
NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
      
" railsのファイル種類ごとに一覧を表示する
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

"NeoBundleLazy 'alpaca-tc/neorspec.vim', {
"      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
"      \ 'autoload' : {
"      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
"      \ }}
"
"NeoBundleLazy 'alpaca-tc/alpaca_tags', {
"      \ 'depends': 'Shougo/vimproc',
"      \ 'autoload' : {
"      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
"      \ }}

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
