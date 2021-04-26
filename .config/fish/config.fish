export LANG=ja_JP.UTF-8

# disable keyring
set -x PYTHON_KEYRING_BACKEND "keyring.backends.null.Keyring"

# github ssh settings
set -gx SSH_AUTH_SOCK /tmp/ssh-YO4ipKQB7ZnS/agent.2833

if [ -z "$SSH_AUTH_SOCK" ]
  # Check for a currently running instance of the agent.
  set RUNNING_AGENT "`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"

  if [ "RUNNING_AGENT" = "0" ]
    # Launch a new instance of the agent.
    eval (ssh-agent -c &> /usr/bin/ssh-agent)
  end

  eval (cat /usr/bin/ssh-agent)
end
ssh-add ~/.ssh/id_ed25519

# set default login shell
set -gx LOGIN_SHELL "/usr/bin/fish"

# set rust
set -g PATH ~/.cargo/bin $PATH

# set bin
set -g PATH /usr/local/bin $PATH

# x-server
set NAME_SERVER (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
set -x DISPLAY "$NAME_SERVER:0"

# alias
alias gocopy=~/go/bin/gocopy
alias gopaste=~/go/bin/gopaste
alias tig=~/bin/tig

# Neovim
set -gx XDG_CONFIG_HOME "$HOME/.config"

# TrueColor
set -g TERM screen-256color

# FZF
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

# peco
set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

function peco_select_history_order
  if test (count $argv) = 0
    set peco_flags --layout=top-down
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

# bobthefish
set -g fish_prompt_pwd_dir_length 0  # ディレクトリ省略しない
set -g theme_newline_cursor yes  # プロンプトを改行した先に設ける
set -g theme_display_git_master_branch yes  # git の branch 名を表示
set -g theme_color_scheme dracula # color theme
set -g theme_display_date no  # 時刻を表示しないように設定
set -g theme_display_cmd_duration no  # コマンド実行時間の非表示
