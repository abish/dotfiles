"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sudo.vim'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'YankRing.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'Shougo/unite.vim'
NeoBundleCheck


set number
syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,mac,dos
set backspace=indent,eol,start
set hlsearch
set incsearch
set clipboard=unnamedplus,unnamed
"外部で変更のあったファイルを自動的に読みなおす
set autoread

set modifiable
"test
"make space, tab ... visible
set list
set listchars=tab:>\ 
"perltidy
map tv <Esc>:'<,'>! perltidy<CR>
"auto space insert
"inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')

"end search highlight
nnoremap <Esc><Esc> :set nohlsearch<CR>
nnoremap <Esc><Esc><Esc> :set hlsearch<CR>

set cursorline
"augroup cch
"	autocmd! cch
"	autocmd WinLeave * set nocursorline
"	autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"cursor move
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap "" ""<Left>
"imap '' ''<Left>
"imap <> <><Left>

"insert mode でjjでesc
inoremap jj <Esc>

vnoremap <silent> <C-p> "0p<CR>
"--------------------------------------------------------------------------
"test
"check package name
function! s:get_package_name()
    let mx = '^\s*package\s\+\([^ ;]\+\)'
    for line in getline(1, 5)
        if line =~ mx
            return substitute(matchstr(line, mx), mx, '\1', '')
        endif
    endfor
    return ""
endfunction

function! s:check_package_name()
    let path = substitute(expand('%:p'), '\\', '/', 'g')
    let name = substitute(s:get_package_name(), '::', '/', 'g') . '.pm'
    if path[-len(name):] != name
        echohl WarningMsg
        echomsg "ぱっけーじめいと、ほぞんされているぱすが、ちがうきがします！"
        echomsg "ちゃんとなおしてください＞＜"
        echohl None
    endif
endfunction

au! BufWritePost *.pm call s:check_package_name()

"--------------------------------------------------------------------------
"Enable omni completion. Not required if they are already set elsewhere in .vimrc
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd BufNewFile,BufRead *.t      set filetype=perl
 autocmd BufNewFile,BufRead *.tt      set filetype=html
 "template
 autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
 autocmd BufNewFile *.t 0r $HOME/.vim/template/perl-test.txt
 autocmd FileType * setlocal formatoptions-=ro

"--------------------------------------------------------------------------
"" neocomplcache

 " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
 
   " Use smartcase.
   let g:neocomplcache_enable_smart_case = 1
   " Use camel case completion.
   let g:neocomplcache_enable_camel_case_completion = 1
   " Select with <TAB>
   inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
 
   let g:neocomplcache_ctags_arguments_list = {
     \ 'perl' : '-R -h ".pm"'
       \ }
 
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
        \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"--------------------------------------------------------------------------
" neosnippet

"Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)

 " SuperTab like snippets behavior.
 imap <expr><TAB> neosnippet#expandable() ?"\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable() ?"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

 " For snippet_complete marker.
 if has('conceal')
   set conceallevel=2 concealcursor=i
 endif

"NERDTree
nmap <silent> <C-e>      :NERDTreeToggle<CR>   

" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'),  '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1,  tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window,first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr,  '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr),  ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() .'my_tabline()'
set showtabline=2 
"常にタブラインを表示

" The prefix key.
nnoremap  [Tag] <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" t1で1番左のタブ、t2で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast<bar> tabnew<CR>
" tc新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
nmap , y :YRShow<CR>
nmap U :UndotreeToggle<CR>

"----------------------------------------------------------
" Unite
"----------------------------------------------------------
let g:unite_enable_start_insert=1
nmap <silent> <C-l>      :<C-u>Unite -start-insert file_rec<CR>
