"########################################
" dein.vimの設定
"########################################
" provider disable
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
" pythonのパス指定
let g:python3_host_prog = expand('~/.asdf/shims/python3')

let s:dein_dir = expand('~/.cache/dein') " プラグインが実際にインストールされるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル(後述)を用意しておく
  let g:rc_dir    = expand('~/.vim/dein')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"########################################
" 基本設定
"########################################
" シンタックスハイライトをオンにする
syntax on

colorscheme iceberg

" coc-prettierの設定
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" 文字コードを正しく認識させる
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile

" 行番号表示
set number

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" コマンドラインに使われる画面上の行数
set cmdheight=2

" 入力中のコマンドを表示する
set showcmd

" 小文字のみで検索したときに大文字小文字を無視する
set smartcase

" 検索結果をハイライト表示する
set hlsearch

" 暗い背景色に合わせた配色にする
set background=dark

" タブ入力を複数の空白入力に置き換える
set expandtab

" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

" 対応する括弧やブレースを表示する
set showmatch

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" タブ文字の表示幅
set tabstop=2

" Vimが挿入するインデントの幅
set shiftwidth=2

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,,[,]

" 行番号の色を設定
hi LineNr ctermbg=22 ctermfg=3
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine

" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" markdownプレビュー
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" 検索
autocmd QuickFixCmdPost *grep* cwindow

" ###################################
" 自動的に閉じ括弧を入力
" ###################################
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" ###################################
" 最後のカーソル位置を復元する
" ###################################
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" ###################################
" KeyMap
" ###################################
" :vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ
" neovim terminal mapping
if has('nvim')
  " 新しいタブでターミナルを起動
  nnoremap @t :tabe<CR>:terminal<CR>
  " Ctrl + q でターミナルを終了
  tnoremap <C-q> <C-\><C-n>:q<CR>
  " ESCでターミナルモードからノーマルモードへ
  tnoremap <ESC> <C-\><C-n>
  " ターミナルモードでのタブ移動
  tnoremap <C-l> <C-\><C-n>gt
  tnoremap <C-h> <C-\><C-n>gT
endif

" ###################################
" 全角スペースの可視化
" ###################################
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=red gui=reverse guibg=red
endfunction

if has('syntax')
  augroup ZenkakuSpace
      autocmd!
      autocmd ColorScheme * call ZenkakuSpace()
      autocmd VimEnter,WinEnter
  augroup END
  call ZenkakuSpace()
endif
