" Basic settings
" -------------------------------------
set nocompatible
filetype off   
filetype plugin indent on
colorscheme desert 
set t_Co=256
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " do incremental searching
set nu!                         " show line number
set isk+=-                      " set *-* as word
set matchpairs=(:),{:},[:],<:>  " add match pair <:> for html
set viewdir=$HOME/.vimview      " path to save view
set shell=/bin/zsh              " set zsh as shell
set guioptions-=r               " Hide scrollbar
set guioptions-=L               " Hide leftscrollbar
set fillchars+=vert:\┊
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
set tm=3000
" set fdm=marker
" set autosave=5
" set cursorline
" set cursorcolumn
" -------------------------------------


" Autocommands
" -------------------------------------
" Change default working dir
exec 'cd ~/tmp'
" Enable mouse
if has('mouse')
  set mouse=a
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif
" Macvim setting
if has('gui_macvim')
    set transparency=6
    se guifont=Sauce_Code_Powerline_Light:h13
    set antialias
    set gcr=a:blinkon0
endif
" Automatically retab after opening a fila
au BufReadPost * if &modifiable | retab
" Automatically located to last position 
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Auto mkview and loadview
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 
" --------------------------------------


" Plugin configurations
" --------------------------------------
" Put Vundle into use
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'ShowMarks'
Plugin 'The-NERD-Commenter'
Plugin 'Emmet.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'fugitive.vim'
Plugin 'taglist.vim'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()            " required
" Put Powerline into use
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
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
let g:ycm_semantic_triggers =  {
    \ 'c' : ['->', '.'], 
    \ 'objc' : ['->', '.'],
    \ 'ocaml' : ['.', '#'],
    \ 'cpp,objcpp' : ['->', '.', '::'],
    \ 'perl' : ['->'],
    \ 'php' : ['->', '::'],
    \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \ 'ruby' : ['.', '::'],
    \ 'lua' : ['.', ':'],
    \ 'erlang' : [':'] }
" Javacomplete related conf
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf
" IndentLine related conf
let g:indentLine_enabled=1
let g:indentLine_char='┆'
let g:indentLine_color_gui='#5C8A41'
" Enable html/css only for emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Syntastic related conf
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_warning_symbol = ">*"
let g:syntastic_enable_balloons = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }
" let g:syntastic_check_on_open = 1
" let g:syntastic_auto_jump = 1
nmap <silent> <leader>lr :SyntasticReset<CR>
" NERDTree related conf
let NERDTreeWinSize=20
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=0
" EasyMotion related conf
let g:EasyMotion_smartcase = 1
" UltiSnips related conf
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-w>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
" Taglist related conf
let Tlist_Auto_Open=0 " Let the tag list open automatically
let Tlist_Compact_Format=0 " Hide help menu
let Tlist_Enable_Fold_Column=0 "do show folding tree
let Tlist_Show_One_File=0 " Only show the tag list of current file
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exist_OnlyWindow=1 " If you are the last, kill yourself
let Tlist_File_Fold_Auto_Close=1 " Fold closed other trees
let Tlist_Sort_Type="name" " Order by name
let Tlist_WinWidth=20 " Set the window 40 cols wide.
let Tlist_Close_On_Select=1 " Close the list when a item is selected
" --------------------------------------


" Keymappings
" --------------------------------------
" ---Move related---
" Move in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-a> <Esc>^i
imap <C-e> <Esc>$a
nmap , %
vmap , %
" Jump to prev/next func
nmap <silent> [[ ?{<CR>w99[{
nmap <silent> ][ :/}<CR>b99]}
nmap <silent> ]] j0[[%:/{<CR>
nmap <silent> [] k$][%?}<CR>
" Move a line of text using option+[jk]
nmap ∆ mz:m+<cr>`z
nmap ˚ mz:m-2<cr>`z
imap ∆ <Esc>mz:m+<cr>`za
imap ˚ <Esc>mz:m-2<cr>`za
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z
" Jump to prev/next hunk/change 
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" ---Plugin related---
"  YouCompleteMe related
let g:ycm_key_detailed_diagnostics = '<leader>i'
let g:ycm_key_invoke_completion = '<C-f>'
nmap <silent> <leader>g :call Diags()<CR>
nmap <silent> <leader>d :YcmCompleter GoTo<CR>
nmap <silent> <leader>e :YcmCompleter GetType<CR>
" Open Taglist
nmap <leader>t :Tlist<CR>
" Open NERDTree and CtrlP
nmap <leader>f :NERDTree<CR>
let g:ctrlp_map = '<leader>wf'
nmap <leader>wr :CtrlPMRU<CR>
nmap <leader>wt :CtrlPBufTagAll<CR>
" Toggle IndentLines 
nmap <silent> ˙ :IndentLinesToggle<CR>
vmap <silent> ˙ :IndentLinesToggle<CR>
imap <silent> ˙ <Esc>:IndentLinesToggle<CR>a
" Toggle GitGutter
nmap <silent> © :GitGutterToggle<CR>
vmap <silent> © :GitGutterToggle<CR>
imap <silent> © <Esc>:GitGutterToggle<CR>
nmap <Leader>hp <Plug>GitGutterPreviewHunk <C-w><C-j>
" Auto-complete (using omni/ycm)
imap π <C-p>
imap ¬ <C-x><C-l>
imap ø <C-x><C-o>
imap ø <C-x><C-o>
" Align by [=/|] (using Tabular)
nmap ≠ :Tab /=<CR>
vmap ≠ :Tab /=<CR>
imap ≠ <Esc>:Tab /=<CR>
nmap « :Tab /\|<CR>
vmap « :Tab /\|<CR>
imap « <Esc>:Tab /\|<CR>
nmap … :Tab /:<CR>
vmap … :Tab /:<CR>
imap … <Esc>:Tab /:<CR>
" MultipleCursorsFind
nmap ƒ :MultipleCursorsFind
" EasyMotion
nmap / <Plug>(easymotion-sn)


" ---Misc---
" Fix tilde/escape
imap <S-Esc> ~
nmap <S-Esc> ~
vmap <S-Esc> ~
" Toggle highlight for search results
nmap <silent> <leader><space> :set hls!<CR>
" Fold {...} quickly
nnoremap <silent> <leader>zf ?{<CR>:nohl<CR>zf%
" Change the behavior of <Enter> to IDE mode when completing
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Paste last yank(after deletion) or just last deleted
nmap <C-p> "0p
nmap π "0P
" Show location list
nmap <leader>lo :lopen<CR>
nmap <leader>ln :lne<CR>
nmap <leader>lp :lp<CR>
nmap <leader>lf :lfirst<CR>
nmap <leader>ll :llast<CR>
" Open new tab from current split window
nnoremap <C-w><C-t> <C-w><S-t>
" mkview and loadview
nmap <silent> <leader>vm :mkview<CR>
nmap <silent> <leader>vl :loadview<CR>
" mksession and source session (for last session)
nmap <silent> <leader>sm :mksession! ~/.vimview/lastsession.vim<CR>:wviminfo! ~/.vimview/lastsession.viminfo<CR>
nmap <silent> <leader>sl :source ~/.vimview/lastsession.vim<CR>:rviminfo ~/.vimview/lastsession.viminfo<CR>
" --------------------------------------


" Custom functions
" --------------------------------------
" Option+c to enter multi-match-copy search mode, paste by "+p
nnoremap ç :let @+ = ''<cr>:%s//\=CopyMatches(submatch(0))/g
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
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc
nmap :cpl<CR> :call CompileCode()<CR>

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
    endif
endfunc
" --------------------------------------

" Nohighlight search, this has to be at the end
set nohlsearch
