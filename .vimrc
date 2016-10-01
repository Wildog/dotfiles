" Basic settings {{{1
" -------------------------------------
set nocompatible
filetype off
filetype plugin indent on
syntax on
set fileencodings=utf-8,ucs-bom,cp936,gb18030,gbk,gb2312,euc-jp,euc-kr,latin1
set termencoding=utf-8
colorscheme desert
set t_Co=256
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set laststatus=2               " Always display the statusline in all windows
set noshowmode                 " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nu!                        " show line number
set isk+=-                     " set *-* as word
set matchpairs=(:),{:},[:],<:> " add match pair <:> for html
set viewdir=$HOME/.vimview     " path to save view
set shell=/bin/zsh             " set zsh as shell
set guioptions-=r              " Hide scrollbar
set guioptions-=L              " Hide leftscrollbar
set fillchars+=vert:\┊
set autochdir
set showmatch
set ignorecase
set smartcase
set smartindent
set autoindent
set scrolloff=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cursorline
set timeoutlen=3000 ttimeoutlen=0
set foldlevel=99
" set fdm=marker
" set autosave=5
" set cursorline
" set cursorcolumn
" -------------------------------------
"  }}}


" Autocommands"{{{
" -------------------------------------
" Enable mouse
if has('mouse')
  set mouse=a
endif
" Macvim setting
if has('gui_macvim')
    set transparency=5
    se guifont=Sauce_Code_Powerline_Light:h13
    set antialias
    set gcr=a:blinkon0
endif
" Cursor shape setting
if exists('$TMUX')
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[6 q\033\\"
else
    autocmd VimLeave * silent !echo -ne "\033[6 q"
endif
" Disable IME back to normal mode
set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0
" Automatically insert java class template
autocmd BufNewFile *.java
  \ exe "normal Opublic class " . expand('%:t:r') . " {\n}\<Esc>1G"
" stop indentLine from messing with json
autocmd InsertEnter *.json setlocal concealcursor=
autocmd InsertLeave *.json setlocal concealcursor=inc
autocmd BufNewFile,BufRead *.json let g:indentLine_conceallevel=0
" Automatically retab after opening a fila
au BufReadPost * if &modifiable | retab
" Automatically located to last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Change default working dir to ~/tmp if current tab is empty
au BufWinEnter * if bufname("%") == "" | exec "cd ~/tmp" | endif
au TabEnter * if bufname("%") == "" | exec "cd ~/tmp" | endif
" diable readonly warning
au BufEnter * set noro
" Custom vim-airline initialization
autocmd User AirlineAfterInit call AirlineInit()
" SimpylFold fix
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
autocmd BufWinEnter *.py exec "VirtualEnvActivate default"
" Auto mkview and loadview
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
" --------------------------------------"}}}


" Plugin configurations"{{{
" --------------------------------------
" Put Vundle into use
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/unicode.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'The-NERD-Commenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tabular'
Plugin 'davidhalter/jedi-vim'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'sjl/vitality.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fugitive.vim'
Plugin 'alvan/vim-closetag'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Yggdroot/indentLine'
Plugin 'ShowMarks'
Plugin 'Emmet.vim'
Plugin 'vim-scripts/indentpython'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kannokanno/previm'
Plugin 'plasticboy/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-capslock'
Plugin 'honza/vim-snippets'
Plugin 'antoyo/vim-licenses'
Plugin 'mattn/webapi-vim'
Plugin 'Wildog/airline-weather.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'rizzatti/dash.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
call vundle#end()            " required
" Airline related conf
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerline'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 "tab number
" let g:airline#extensions#ycm#enabled = 1
" airline-weather related conf
let g:weather#area = 'xuzhou,china'
let g:weather#cache_ttl = '14400'
" Highlight YAML frontmatter of markdown
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0
" Jedi-vim related conf
let g:jedi#show_call_signatures = '1'
let g:jedi#show_call_signatures_delay = 0
" YouCompleteMe related conf
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'python': 1
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" Javacomplete related conf
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_LibsPath='/Users/pro/algs4/algs4.jar:/Users/pro/algs4/servlet-api.jar:/Users/pro/algs4/mysql.jar'
" JCommenter related conf
autocmd FileType java source ~/.vim/macros/jcommenter.vim
autocmd FileType java map <leader>cj :call JCommentWriter()<CR>
autocmd FileType java let b:jcommenter_file_author='Wildog (i@wil.dog)'
autocmd FileType java let b:jcommenter_class_author='Wildog (i@wil.dog)'
let java_highlight_functions = 1
" EasyTags related conf
" let g:easytags_syntax_keyword = 'always'
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_async = 1
let g:easytags_by_filetype = '~/.tags'
" IndentLine related conf
let g:indentLine_enabled=1
let g:indentLine_char='┆'
let g:indentLine_color_gui='#5C8A41'
let g:indentLine_color_term=28
" closetag related conf
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.jsp"
" Enable html/css only for emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Previm Markdown
let g:previm_open_cmd = 'open -g'
map <silent> <leader>p :PrevimOpen<CR>
" NERDCommenter related
let g:NERDSpaceDelims = 1
" Python related
let python_highlight_all=1
" Syntastic related conf
let g:syntastic_python_checkers = ['python']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_checkstyle_classpath = "~/algs4/checkstyle-6.13-all.jar"
let g:syntastic_java_javac_classpath = '.:~/algs4/algs4.jar:~/algs4/mysql.jar:~/algs4/servlet-api.jar'
let g:syntastic_java_checkstyle_conf_file = "~/algs4/google_checks.xml"
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_warning_symbol = ">*"
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
\ "mode": "passive",
\ "active_filetypes": ['java', 'python'],
\ "passive_filetypes": [] }
" let g:syntastic_auto_jump = 1
" CtrlP related
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 't'
let g:ctrlp_max_depth = 10
let g:ctrlp_extensions = ['bookmarkdir', 'dir']
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.(android|gradle|qrsctl|qrsboxcli|tags|qrsync|sogouinput|subversion|Genymobile|pylint.d|oracle_jre_usage|cocoapods|gervill|git|boot|local|oh-my-zsh|ssh|dropbox|Trash|ShadowsocksX|bash_profile|bash_sessions|aria2|asciinema|pip|virtualenvs|cheat|gem|lldb|node-gyp|hg|svn|cache|npm|vimview|vim|javacomplete2)$)|(Library|Documents|Music|Photos).*',
\ 'file': '\v\.(DS_Store|mp3|so|jpg|qvnote|qvnotebook|png|jpeg|swp|swo|swm|swn|swl|nmsv|session|history|historynew|pdf|tiff)$',
\ }
" NERDTree related conf
let NERDTreeWinSize=30
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=0
" EasyMotion related conf
let g:EasyMotion_smartcase=1
" UltiSnips related conf
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsListSnippets=""
let g:UltiSnipsJumpForwardTrigger="<C-D-.>"
let g:UltiSnipsJumpBackwardTrigger="<C-D-,>"
let g:UltiSnipsEditSplit="vertical"
" Tagbar related conf
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus=1
let g:tagbar_singleclick=1
let g:tagbar_autoclose=1
" License related conf
let g:licenses_copyright_holders_name = 'Wildog <in@limbo.space>'
let g:licenses_authors_name = 'Wildog <in@limbo.space>'
" --------------------------------------"}}}


" Keymappings"{{{
" --------------------------------------
" ---Move related---"{{{
" Move in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-a> <Esc>^i
imap <C-e> <Esc>$a
nmap , %
vmap , %
" Move current buffer to a new tab
nmap <C-w>t <C-w>T
" Jump to prev/next func
nmap <silent> [[ ?{<CR>w99[{
nmap <silent> ][ :/}<CR>b99]}
nmap <silent> ]] j0[[%:/{<CR>
nmap <silent> [] k$][%?}<CR>
" Move a line of text <option+j/k>
nmap ∆ mz:m+<cr>`z
nmap ˚ mz:m-2<cr>`z
imap ∆ <Esc>mz:m+<cr>`za
imap ˚ <Esc>mz:m-2<cr>`za
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z
" Jump to prev/next hunk/change
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" Open current directory in Finder/iTerm
nmap <silent> <leader>of :silent !open .<CR>
nmap <silent> <leader>ot :silent !osascript ~/Library/Services/terminalcommandhere-newwin.applescript %:p:h<CR>
" smooth scroll
nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
" switch buffer
nmap <leader>bn :bnext!<CR>
nmap <leader>bp :bprevious!<CR>
nmap <leader>bb :buffers<CR>:buffer!<Space>
nmap <leader>bc :tabnew<CR>
nmap <leader>bd :bd<CR>"}}}
" ---Plugin related---"{{{
" YouCompleteMe related
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_key_invoke_completion = '<C-s>'
nmap <silent> <leader>g :YcmCompleter GoTo<CR>
nmap <silent> <leader>r :YcmCompleter GoToReferences<CR>
nmap <silent> <leader>e :YcmCompleter GetType<CR>
nmap <silent> <leader>i :YcmCompleter FixIt<CR>
nmap <silent> <leader>a :YcmCompleter GetDoc<CR>
" Jedi-vim related
let g:jedi#goto_command = ''
let g:jedi#goto_assignments_command = ''
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = '<leader>a'
let g:jedi#usages_command = ''
let g:jedi#completions_command = '<C-s>'
let g:jedi#rename_command = '<leader>cn'
" JavaComplete related
nmap <leader>ji <Plug>(JavaComplete-Imports-Add)
nmap <leader>jm <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jr <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>jd :call javacomplete#generators#AbstractDeclaration()<CR>
" VimShell related
nmap <leader>sh :call RunVimShell()<CR>
" Dash.vim related
nmap <silent> <D-C-/> <Plug>DashSearch
" Unicode related
nmap ga :UnicodeName<CR>
imap <C-g>a <C-x><C-z>
" Open Taglist
nmap <leader>t :TagbarToggle<CR>
" Open NERDTree and CtrlP
nmap <leader>f :NERDTreeFind<CR>
let g:ctrlp_map = '<leader>wf'
nmap <leader>wr :CtrlPMRU<CR>
nmap <leader>wt :CtrlPBufTagAll<CR>
nmap <leader>wd :CtrlPDir ~<CR>
nmap <leader>wb :CtrlPBookmarkDir<CR>
nmap <leader>wa :CtrlPBookmarkDirAdd!<CR>
" Toggle IndentLines <Option-h>
nmap <silent> ˙ :IndentLinesToggle<CR>
imap <silent> ˙ <Esc>:IndentLinesToggle<CR>a
" Toggle Gutter <Option-g>
nmap <silent> © :GitGutterToggle<CR>
" Auto-complete (using omni/ycm) <Option-p/l/o>
imap π <C-p>
imap ¬ <C-x><C-l>
imap ø <C-x><C-o>
" Align by '=' (using Tabular) <Option-=>
nmap ≠ :Tab /=<CR>
vmap ≠ :Tab /=<CR>
imap ≠ <Esc>:Tab /=<CR>
" MultipleCursorsFind <Option-f>
nmap ƒ :MultipleCursorsFind
" EasyMotion
nmap / <Plug>(easymotion-sn)
"}}}"}}}


" ---Misc---"{{{
" Fix tilde/escape on FC660 keyboard
imap <S-Esc> ~
nmap <S-Esc> ~
vmap <S-Esc> ~
" Toggle highlight for search results
nmap <silent> <leader><space> :set hls!<CR>
" Fold {...} quickly
nnoremap <silent> <leader>zf ?{<CR>:nohl<CR>zf%
nnoremap <silent> <space> za
nnoremap <silent> zr zR
nnoremap <silent> zm zM
" Change the behavior of <Enter> to IDE mode when completing
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Paste last yank(after deletion) or just last deleted
nmap <C-p> "0p
" Show location list (ycm diagnostic list)
nmap ]l :lne<CR>
nmap [l :lp<CR>
nmap <silent> <leader>l :call Diags()<CR>
" Open new tab from current split window
nnoremap <C-w><C-t> <C-w><S-t>
" mkview and loadview
nmap <silent> <leader>vm :mkview<CR>
nmap <silent> <leader>vl :loadview<CR>
" mksession and source session (for last session)
nmap <silent> <leader>sm :mksession! ~/.vimview/lastsession.vim<CR>:wviminfo! ~/.vimview/lastsession.viminfo<CR>
nmap <silent> <leader>sl :source ~/.vimview/lastsession.vim<CR>:rviminfo ~/.vimview/lastsession.viminfo<CR>
" Save with sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" showmarks(modified) keymappings
   "\mt : Toggles ShowMarks on and off.
   "\mh : Hides an individual mark.
   "\ma : Hides all marks in the current buffer.
   "\mm : Places the next available mark.
" --------------------------------------"}}}


" Custom functions"{{{
" --------------------------------------
" Custom airline initialization
function! AirlineInit()
    let spc = g:airline_symbols.space
    call airline#parts#define_raw('filename', '%f ')
    call airline#parts#define_accent('filename', 'red')
    call airline#parts#define_accent('readonly', 'truered')
    call airline#parts#define_raw('modified', '%m')
    call airline#parts#define_accent('modified', 'bright')
    call airline#parts#define_function('fillup', 'AirlineFillup')
    let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'capslock', 'iminsert'])
    let g:airline_section_b = airline#section#create(['hunks', 'branch', '%<', 'readonly', spc, 'filename', 'modified'])
    let g:airline_section_c = airline#section#create(['tagbar', 'fillup'])
    let g:airline_section_gutter = airline#section#create(['%='])
    let g:airline_section_x = airline#section#create_right(['filetype', 'ffenc'])
    let g:airline_section_y = airline#section#create(['%1p%%'])
    let g:airline_section_z = airline#section#create(['linenr', ':%v '])
    let g:airline_section_warning = airline#section#create(['syntastic', 'whitespace'])
endfunction

function! AirlineFillup()
    return ' '
endfunction

" Option+c to enter multi-match-copy search mode, paste by "+p
" nmap ç :let @+ = ''<cr>:%s//\=CopyMatches(submatch(0))/g
function! CopyMatches (m)
    let @+ .= a:m . "\n"
    return a:m
endfunction

" Quick compile and run
func! CompileGcc()
    exec "w"
    let compilecmd="!clang "
    let compileflag="-o %< "
    " if search("mpi\.h") != 0
    "     let compilecmd = "!mpicc "
    " endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!clang "
    let compileflag="-o %< "
    " if search("mpi\.h") != 0
    "     let compilecmd = "!mpic++ "
    " endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! RunPython()
        exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc
func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        endif
endfunc
func! RunResult()
        exec "w"
        " if search("mpi\.h") != 0
        "     exec "!mpirun -np 4 ./%<"
        if &filetype == "cpp"
            exec "! %<"
        elseif &filetype == "c"
            exec "! %<"
        elseif &filetype == "python"
            exec "call RunPython()"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc
nmap <leader>cp :call CompileCode()<CR>
nmap <leader>cr :call CompileCode()<CR>:call RunResult()<CR>

" Diagnose syntax
func! Diags()
    if &filetype == "cpp"
        exec "YcmDiags"
    elseif &filetype == "c"
        exec "YcmDiags"
    elseif &filetype == "objc"
        exec "YcmDiags"
    elseif &filetype == "objcpp"
        exec "YcmDiags"
    else
        exec "SyntasticCheck"
        exec "lopen"
    endif
endfunc

func! RunVimShell()
    setlocal noautochdir
    exec "VimShell"
    setlocal autochdir
endfunc

" Check whether a tab is empty
function! TabIsEmpty()
    " Remember which window we're in at the moment
    let initial_win_num = winnr()

    let win_count = 0
    " Add the length of the file name on to count:
    " this will be 0 if there is no file name
    windo let win_count += len(expand('%'))

    " Go back to the initial window
    exe initial_win_num . "wincmd w"

    " Check count
    if win_count == 0
        " Tab page is empty
        return 1
    else
        return 0
    endif
endfunction
" --------------------------------------


" Nohighlight search, this has to be at the end
set nohlsearch"}}}

" vim: set foldmethod=marker:
