set number

 "设置切换Buffer快捷键"
 " nnoremap <C-n> :bn<CR>
 " nnoremap <C-p> :bp<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

set laststatus=2

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:NERDTreeWinSize=20

let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

"ale config"
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"you complete me"
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'css': [ 're!^\s{4}', 're!:\s+'],
  \   'html': [ '</' ],
  \ }

" hi Pmenu ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
" hi PmenuSel ctermfg=NONE ctermbg=30 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE


set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_python_binary_path = 'python'




"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:clang_user_options='|| exit 0'

" map <leader>g :Ag<space>

set clipboard=unnamed


" If installed using Homebrew
set rtp+=~/.fzf

nnoremap <silent> <C-f> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit'  }


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~30%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"autocmd VimEnter * NERDTree



let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'




inoremap 44 $
inoremap <C-_> ->

let g:NERDTreeWinSize=40



let g:phpcomplete_min_num_of_chars_for_namespace_completion = 1
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" set tags=./tags;,tags

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pne <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pne :call PhpExpandClass()<CR>


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pnu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pnu :call PhpInsertUse()<CR>


let g:phpcomplete_enhance_jump_to_definition = 1
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   endif
endif

let g:phpcomplete_mappings = {
  \ 'jump_to_def': ',g',
  \ 'jump_to_def_tabnew': ',t',
  \ }

let g:phpcomplete_mappings = {
   \ 'jump_to_def': '<C-]>',
   \ 'jump_to_def_split': '<C-D><C-]>',
   \ 'jump_to_def_vsplit': '<C-D><C-\>',
   \ 'jump_to_def_tabnew': '<C-D><C-[>',
   \}
" let g:debuggerPort = 9003

" vdebug settings
 let g:vdebug_options= {
 \    "port" : 9003,
 \    "watch_window_style" : 'expanded',
 \    "marker_default" : '⬦',
 \    "marker_closed_tree" : '▸',
 \    "marker_open_tree" : '▾'
 \}



if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" autocmd FileType go nmap <Leader>r :!go run %<CR>
autocmd FileType py nmap <Leader>r :! run %<CR>


map <Leader>5 :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python3 %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

let g:go_highlight_types = 1

let g:go_highlight_fields = 1

let g:go_highlight_functions = 1

let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_list_type = "quickfix"
set spelllang=en_GB.UTF-8

au FileType go nmap <leader>r :GoRun %<CR>
au FileType go nmap <leader>b <Plug>(go-build)


let g:slime_target = "tmux"
" 为tmux设置默认配置，指定socket_name为tmux_scheme，目标窗格为当前窗口的第2个窗格
let g:slime_default_config = {"socket_name": "tmux_scheme", "target_pane":":.2"}
" 指定slime在第一次发送代码时不要询问配置
let g:slime_dont_ask_default = 1
" 指定作为缓冲区的文件（该文件默认在执行完后不会被清空或者删除）
let g:slime_paste_file = "$HOME/.slime_paste"

nnoremap <c-c>l :SlimeSendCurrentLine<CR>



let g:comfortable_motion_no_default_key_mappings = 1


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<Down>"
let g:UltiSnipsJumpBackwardTrigger="<Up>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir="/Users/xiangyun/.vim_runtime/my_snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips","my_snippets"]




" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
" let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" " 检测 ~/.cache/tags 不存在就新建 "
" if !isdirectory(s:vim_tags)
"    silent! call mkdir(s:vim_tags, 'p')
" endif

" " 配置 ctags 的参数 "
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args = ['--languages=php']
" let g:gutentags_ctags_extra_args += ['--exclude=vendor --exclude=assets --exclude=web --exclude=views --exclude=.git --exclude=components -R']


" let g:auto_save = 1  " enable AutoSave on Vim startup
" let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:phpcd_autoload_path = '/home/max/.vim/plugged/phpcd.vim/vendor/autoload.php'


let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

let g:phpcd_php_cli_executable = 'php7.2'
