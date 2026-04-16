# Initialize zplug via brew
export ZPLUG_HOME=/usr/local/bin/zplug
#export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Load configuration framework
zplug "sorin-ionescu/prezto"

# Load pachages
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

# Load theme file
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
zplug load --verbose

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# cdrの設定
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
fi

# History設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

setopt print_eight_bit

# peco
## ctrl + r で過去に実行したコマンドを選択できるようにする。
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ctrl + f で過去に移動したことのあるディレクトリを選択できるようにする。
function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^f' peco-cdr

# deで目的のdockerコンテナに接続
alias deb='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
alias dea='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/ash'

# GCP
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# Customize to your needs...
#$ zplug install
#$ ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
#$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

umask 0002 
eval "$(hub alias -s)" # bash


function gi() { curl https://www.gitignore.io/api/$@ ;}

function sleep_time() {
    pmset -g log | grep "Display is turned"| sed 's/[ ][ ]*/ /g'
}

function rails_new() {

    while read -p "Please enter project name: " railsName ; do
        if [ -n "$railsName" ] ; then
            break
        fi
    done

    while read -p "Whether use Test::Unit[y/n] " skipTest ; do
        case $skipTest in
            [Yy]* ) 
                skipTest=''
                break
                ;; 
            [Nn]* ) 
                skipTest='-T'
                break
                ;;
            *)        
            echo "Please answer yes or no."
            ;;
        esac
    done

    read -p "Please enter rails version: " version 

    if [ -n "$version" ] ; then
        version=", \"$version\""
    fi

    cat << EOS > Gemfile
source "http://rubygems.org"
gem "rails"$version
EOS

    bundle install --path vendor/bundle
    bundle exec rails new $railsName --skip-bundle $skipTest 

    rm -f Gemfile
    rm -f Gemfile.lock
    rm -rf .bundle
    rm -rf vendor
    cd $railsName

    if [ "$skipTest" != "" ] ; then
    cat << EOS >> Gemfile
gem 'rspec-rails', group: [:development, :test]
gem 'factory_girl_rails', group: [:development, :test]
EOS
    fi
    bundle install --path vendor/bundle
    
    if [ "$skipTest" != "" ] ; then
        bundle exec rails g rspec:install
    fi

    gi rails > .gitignore

}

# tmux レイアウト自動構築
ide() {
  local session="$1"
  if [ -z "$session" ]; then
    echo "Usage: ide <session-name> [ide1-path1] [ide1-path2] [ide1-path3] [ide2-path1] [ide2-path2] [ide2-path3] [analytics-path]"
    return 1
  fi
  shift

  local ide1_path1="$1"
  local ide1_path2="$2"
  local ide1_path3="$3"
  local ide2_path1="$4"
  local ide2_path2="$5"
  local ide2_path3="$6"
  local analytics_path="$7"
  [ -z "$ide1_path1" ] && ide1_path1="${IDE1_CLAUDE_PATHS[1]:-$(pwd)}"
  [ -z "$ide1_path2" ] && ide1_path2="${IDE1_CLAUDE_PATHS[2]:-$ide1_path1}"
  [ -z "$ide1_path3" ] && ide1_path3="${IDE1_CLAUDE_PATHS[3]:-$ide1_path1}"
  [ -z "$ide2_path1" ] && ide2_path1="${IDE2_CLAUDE_PATHS[1]:-$ide1_path1}"
  [ -z "$ide2_path2" ] && ide2_path2="${IDE2_CLAUDE_PATHS[2]:-$ide2_path1}"
  [ -z "$ide2_path3" ] && ide2_path3="${IDE2_CLAUDE_PATHS[3]:-$ide2_path1}"
  [ -z "$analytics_path" ] && analytics_path="${ANALYTICS_CLAUDE_PATH:-$HOME}"

  # 既存セッションがあれば削除（現在アタッチ中なら警告）
  if tmux has-session -t "$session" 2>/dev/null; then
    if [ "$(tmux display-message -p '#S')" = "$session" ]; then
      echo "Error: currently attached to session '$session'. Detach first or use a different name."
      return 1
    fi
    tmux kill-session -t "$session"
  fi

  # 新規セッション作成（Window 0: home）
  tmux new-session -d -s "$session" -n home -c "$HOME"

  # Window 1: git（3ペイン横分割）
  tmux new-window -t "${session}:1" -n git -c "$ide1_path1"
  tmux split-window -t "${session}:git" -v -c "$ide1_path2"
  tmux split-window -t "${session}:git" -v -c "$ide1_path3"
  tmux select-layout -t "${session}:git" even-vertical

  # Window 2: git2（3ペイン横分割、別IDE環境）
  tmux new-window -t "${session}:2" -n git2 -c "$ide2_path1"
  tmux split-window -t "${session}:git2" -v -c "$ide2_path2"
  tmux split-window -t "${session}:git2" -v -c "$ide2_path3"
  tmux select-layout -t "${session}:git2" even-vertical

  # Window 3: analytics
  tmux new-window -t "${session}:3" -n analytics -c "$analytics_path"

  # git ウィンドウを選択してアタッチ
  tmux select-window -t "${session}:git"
  tmux attach-session -t "$session"
}

