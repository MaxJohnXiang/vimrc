set runtimepath+=~/.vim_runtime
let vim_plug_just_installed = 0
let vim_plug_path = expand("~/.vim_runtime/autoload/plug.vim")
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim_runtime/autoload
    silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute source .fnameescape(vim_plug_path)
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: installed, updated, or unchanged
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == installed || a:info.force
    !./install.py
  endif
endfunction

function! InstallDependence(info)
    !pip2 install --user pynvim
    !pip3 install --user pynvim
    !pip2 install --user neovim
endfunction



call plug#begin("~/.vim/plugged")

Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/mru.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'chr4/nginx.vim'
Plug 'amix/vim-zenroom2'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-expand-region'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'liuchengxu/vista.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'honza/vim-snippets'
Plug 'hzchirs/vim-material'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'ashfinal/vim-colors-violet'
Plug 'altercation/vim-colors-solarized'
Plug 'thenewvu/vim-colors-sketching'
Plug 'antlypls/vim-colors-codeschool'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nightsense/seagrey'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-eunuch'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }



if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc', {'do' :function('InstallDependence')}
endif
let g:deoplete#enable_at_startup = 1


call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
source ~/.vim_runtime/my_configs.vim
catch
endtry
