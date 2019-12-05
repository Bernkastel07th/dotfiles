if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/satoukouki/.vimrc', '/Users/satoukouki/.vim/dein/dein.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/satoukouki/.vim/dein'
let g:dein#_runtime_path = '/Users/satoukouki/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/satoukouki/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/satoukouki/.vim,/Users/satoukouki/.vim/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim80,/usr/local/share/vim/vimfiles/after,/Users/satoukouki/.vim/after,/Users/satoukouki/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/satoukouki/.vim/dein/.cache/.vimrc/.dein/after'
