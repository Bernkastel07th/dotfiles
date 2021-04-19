export LANG=ja_JP.UTF-8

# set default login shell
set -gx LOGIN_SHELL "/usr/local/bin/fish"

# set bin
set -g PATH /usr/local/bin $PATH

# set nodenv
eval (nodenv init - | source)

# set rbenv
eval (rbenv init - | source)

# set git
set -g PATH /usr/local/opt/git/bin $PATH

# set config for Neovim
set -gx XDG_CONFIG_HOME "$HOME/.config"

# set TrueColor
set -g TERM screen-256color

# --------------------
# FZF
# --------------------
set -g FZF_LEGACY_KEYBINDINGS 0
set -g FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

# --------------------
# peco
# --------------------
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

# --------------------
# bobthefish
# --------------------
set -g fish_prompt_pwd_dir_length 0  # ディレクトリ省略しない
set -g theme_newline_cursor yes  # プロンプトを改行した先に設ける
set -g theme_display_git_master_branch yes  # git の branch 名を表示
set -g theme_color_scheme dracula
set -g theme_display_date no  # 時刻を表示しないように設定
set -g theme_display_cmd_duration no  # コマンド実行時間の非表示

# --------------------
# ghcup-env
# --------------------
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/satokoki/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/satokoki/.ghcup/bin $PATH
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
