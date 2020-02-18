# --------------------
# asdf
# --------------------
source /usr/local/opt/asdf/asdf.fish

# --------------------
# FZF
# --------------------
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

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
# keymapping
# --------------------
function fish_user_key_bindings
  bind /cr 'peco_select_history_order' # Ctrl + R
end
