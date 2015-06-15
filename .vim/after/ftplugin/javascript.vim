filetype off

setlocal tabstop=2
setlocal shiftwidth=2

if has('vim_starting')
  " vim起動時 
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" node.js用(vim-railsのnode版)
NeoBundle 'moll/vim-node'

" jsの補完
NeoBundle 'mattn/jscomplete-vim'
let g:jscomplete_use = ['dom', 'moz', 'es6th']
" node.jsの補完
NeoBundle 'myhere/vim-nodejs-complete'
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

" js用のインデント
NeoBundle 'pangloss/vim-javascript'
" jsプログラムのシンタックスハイライトを変更
NeoBundle 'jelera/vim-javascript-syntax'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
