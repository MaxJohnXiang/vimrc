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




call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/mru.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'jiangmiao/auto-pairs'
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
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-eunuch'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug  'ntpeters/vim-better-whitespace'
Plug 'mzlogin/vim-markdown-toc'








let g:deoplete#enable_at_startup = 1


call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

source ~/.vim_runtime/vimrcs/basic.vim
" source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
source ~/.vim_runtime/my_configs.vim
catch
endtry
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd CursorHold * silent call CocActionAsync('highlight')
