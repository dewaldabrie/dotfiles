" ========== Vim Basic Settings ============="




" ========================================================================================
" Make vim incompatbile to vi.
set nocompatible
set modelines=0

" ========================================================================================
"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set showtabline=2
set ruler

" ========================================================================================
" More Common Settings.
set encoding=utf-8
set scrolloff=3
""set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

set history=1000
set undolevels=10000

set nobackup
set noswapfile

set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

set pastetoggle=<F2>
"set relativenumber
set number
set norelativenumber

set undofile
set undodir=/tmp

set shell=/bin/bash
set lazyredraw
set matchtime=3

" ========================================================================================
"Changing Leader Key
let mapleader = ","

" ========================================================================================
" Map : to ; also in command mode.
nnoremap ; :
vmap ; :
nmap <silent> <leader>/ :nohlsearch<CR>
" ========================================================================================

" Set title to window
set title

" Dictionary path, from which the words are being looked up.
" ========================================================================================
set dictionary=/usr/share/dict/words

" ========================================================================================
" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" ========================================================================================
" Enable Mouse
set mouse=a

" ========================================================================================
"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" ========================================================================================
" go to next/previous tag
nnoremap <leader>f :tnext<cr>
nnoremap <leader>d :tprev<cr>
nnoremap <leader>tj :tjump<cr>

" ========================================================================================
" Make Vim to handle long lines nicely.
set wrap
set textwidth=85
set colorcolumn=+1
set formatoptions=qrn1
"set colorcolumn=79

" ========================================================================================
" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" ========================================================================================
" set unnamed clipboard
set clipboard=unnamedplus


"==========================================================================="
" Different search patterns 
let g:cpp_pattern = "*.{cpp,c,h,hpp}"
let g:java_pattern = "*.{java}"
let g:makefile_pattern = "Makefile*"
let g:text_pattern = "*.{txt,text}"
let g:python_pattern = "*.{py}"
let g:cpp_java_pattern = "*.{cpp,c,h.hpp,java,cc,hh}"

"==========================================================================="
" C\C++ projects settings
"==========================================================================="
"Global project settings 
let g:project_root = "."

let g:search_root = g:project_root
let g:search_pattern = "*.*"
"==========================================================================="
" Get Rid of stupid help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"==========================================================================="
" Set vim to save the file on focus out.
au FocusLost * :wa
"==========================================================================="
" Redraw screen every time when focus gained
au FocusGained * :redraw!
"==========================================================================="
" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>


"==========================================================================="
" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =
" Split vertically to the bottom
set splitbelow

"==========================================================================="
" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig,*.rej "Merge resolution files"

"==========================================================================="
" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

"==========================================================================="
" go to place of last change
nnoremap g; g;zz

" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
endif

" ========== END Gvim Settings ==========


" ================ ReplaceText function ============================

function! MySearchText()
    let text = input("Text to find: ")
    :call MySearchSelectedText(text)
endfunction

function! MySearchSelectedText(text)
    :execute "vimgrep /" . a:text . "/jg ".g:search_root."/**/".g:search_pattern
endfunction

map <F3> :call MySearchText() <Bar> botright cw<cr>
map <F3><F3> :execute "call MySearchSelectedText (\"".expand("<cword>") . "\")" <Bar> botright cw<cr>

"==========================================================================="
"Make window mosaic 
nmap <leader>mon :split<cr>:vsplit<cr><C-Down>:vsplit<cr><C-Up><leader>l
imap <leader>mon <ESC>:split<cr>:vsplit<cr><C-Down>:vsplit<cr><C-Up><leader>li

"==========================================================================="
" Make check spelling on or off 
nmap <leader>cson   :set spell<CR>
nmap <leader>csoff  :set nospell<CR>


"==========================================================================="
" Indentation (got to opening bracket and indent section) 

nmap <leader>ip [{=%

"==========================================================================="
"Highlight section between brackets (do to opening bracket and highlight)
nmap <leader>hp [{%v%<Home>
"
"==========================================================================="
" Map copy delete and paste to system clipboard
"
vmap <Leader>y "+y
vmap <Leader>d "+d

nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"==========================================================================="
" Double learder for selection whole line
nmap <Leader>v V

"==========================================================================="
function! FindProjectRoot(lookFor)
    let pathMaker='%:p'
    while(len(expand(pathMaker))>len(expand(pathMaker.':h')))
        let pathMaker=pathMaker.':h'
        let fileToCheck=expand(pathMaker).'/'.a:lookFor
        if filereadable(fileToCheck)||isdirectory(fileToCheck)
            return expand(pathMaker)
        endif
    endwhile
    return 0
endfunction

"==========================================================================="
function! BuildAndInstallCppApp()
    let project_root = FindProjectRoot("main.cpp")
    if project_root == 0
        let project_root = "."
    endif
    execute "!cd ".project_root."/build; sudo make install;"
endfunction

"==========================================================================="
function! BuildAndInstallCSharpApp()
    execute "!xbuild;"
endfunction

"==========================================================================="
function! BuildAndInstallQtApp()
    execute "!make;"
endfunction

function! OpenQuickFixInRightLocation() 
    execute ":TagbarClose"
    execute ":copen"
    execute ":TagbarOpen"
    " TODO - improve me
    " go to window one above the quickfix window
    execute ":normal \<C-j>\<C-l>100\<C-j>\<C-k>"
endfunction

"==========================================================================="
" Improve detecting filetype (ex. for files starting with /bin/echo syntax
" should be as for sh files)
function! DetectFileType() 
    "if did_filetype() 
      "finish
    "endif 
    if getline(1) =~ '^#!.*/bin/echo.*'
      setfiletype sh
    endif
endfunction

"==========================================================================="
" Quickfix navigation 
nmap <leader>co :call OpenQuickFixInRightLocation()<cr>
nmap <leader>cq :cclose<cr>
nmap <leader>cw :q<cr>:cclose<cr>
nmap <leader>n :cnext<cr>
nmap <leader>p :cprevious<cr>

"==========================================================================="
" CMake 
nmap <F8> <C-s> :call BuildAndInstallCppApp()<cr>
imap <F8> <ESC> <C-s> :call BuildAndInstallCppApp()<cr>

"==========================================================================="
" Make 
nmap <C-F8> <C-s> :call BuildAndInstallQtApp()<cr>
imap <C-F8> <ESC> <C-s> :call BuildAndInstallQtApp()<cr>

"==========================================================================="
" CSharp make 
nmap <C-F5> <C-s> :call BuildAndInstallCSharpApp()<cr>
imap <C-F5> <ESC> <C-s> :call BuildAndInstallCSharpApp()<cr>

"==========================================================================="
" Normal make 
nmap <F9>> :set makeprg=make\ -C\ .<cr> :make --no-print-directory <cr> :TagbarClose<cr> :cw <cr> :TagbarOpen <cr>
imap <F9> <ESC> set makeprg=make\ -C\ ./build<cr> :make --no-print-directory <cr> :TagbarClose<cr> :cw <cr> :TagbarOpen <cr>i


"==========================================================================="
" TAB and Shift-TAB in normal mode cycle buffers
"
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR> 


"==========================================================================="
" highlight current line
set cursorline

"==========================================================================="
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

set nowrap
set expandtab

"==========================================================================="
" Edit .vimrc file
nmap <silent> <leader>ov :e $MYVIMRC<CR>
nmap <silent> <leader>sv :w<CR> :so $MYVIMRC<CR>


"==========================================================================="
function! LoadCScopeDatabases()
    let databaseDir = $HOME."/.vim/cscope_databases"
    if IsFileAlreadyExists ( databaseDir."/last_project_cscope")
        execute ":silent cs add ".databaseDir."/last_project_cscope"  
    endif
    if IsFileAlreadyExists ( databaseDir."/gstreamer_cscope")
        execute ":silent cs add ".databaseDir."/gstreamer_cscope"  
    endif
    if IsFileAlreadyExists ( databaseDir."/mythtv_cscope")
        execute ":silent cs add ".databaseDir."/mythtv_cscope"  
    endif
    if IsFileAlreadyExists ( databaseDir."/cpp_scope")
        execute ":silent cs add ".databaseDir."/cpp_scope"
    endif
    "load dtv_project only when we are working on docker 
    let userDef = substitute(system("echo $USER"), "\n", '', '')
    if userDef == "docker" && IsFileAlreadyExists( databaseDir."/dtv_project_cscope")
        execute ":silent cs add ".databaseDir."/dtv_project_cscope"  
    endif
    echohl StatusLine | echo "CScope databases loaded successfully..." | echohl None 
endfunction


function! UpdateCscopeDatabase(basedir)
    let databaseDir = $HOME."/.vim/cscope_databases"
    let findCommand = "find `pwd` -name '*.c' -o -name '*.h' -o -name '*.java' -o -name '*.py' -o -name '*.js' -o -name '*.hpp' -o -name '*.hh' -o -name '*.cpp' -o -name '*.cc' > cscope.files"

    execute ":silent !cd ".a:basedir." && ".findCommand." && cscope -b && cp cscope.out ".databaseDir."/last_project_cscope && rm cscope.files cscope.out"
    execute ":silent cs reset"

    call UpdateTags(a:basedir)
    execute ":redraw!"

endfunction

function! UpdateAllCscopeDatabases()
    let databaseDir = $HOME."/.vim/cscope_databases"
    let tagsDir = $HOME."/.vim/tags"

    call UpdateCscopeDatabase("/usr/src/gstreamerInstall")
    execute ":silent !cp ".databaseDir."/last_project_cscope ".databaseDir."/gstreamer_cscope"
    execute ":silent !cp ".tagsDir."/last_project_tags ".tagsDir."/gstreamer_tags"

    call UpdateCscopeDatabase($HOME."/projects/xmementoit/digitalTVOpenSource/mythtv")
    execute ":silent !cp ".databaseDir."/last_project_cscope ".databaseDir."/mythtv_cscope"
    execute ":silent !cp ".tagsDir."/last_project_tags ".tagsDir."/mythtv_tags"

    call UpdateCscopeDatabase($HOME."/.vim/tags/cpp_src")
    execute ":silent !cp ".databaseDir."/last_project_cscope ".databaseDir."/cpp_scope"
    execute ":silent !cp ".tagsDir."/last_project_tags ".tagsDir."/cpp_tags"

    call UpdateCscopeDatabase("/usr/local/include")
    execute ":silent !cp ".databaseDir."/last_project_cscope ".databaseDir."/usr_local_include_cscope"
    execute ":silent !cp ".tagsDir."/last_project_tags ".tagsDir."/usr_local_include_tags"

    call UpdateCscopeDatabase(".")
    execute ":redraw!"
endfunction

function! UpdateTags(basedir)
    execute ":silent !cd ".a:basedir." && ctags -R --sort=yes --fields=+iaSnkt --extra=+q+f --exclude=build -f ~/.vim/tags/last_project_tags `pwd`"
    execute ":redraw!"
endfunction

function! IsFileAlreadyExists(filename)
   if filereadable(a:filename)
        return 1
    else 
        return 0
    endif
endfunction

"==========================================================================="
"Invoke this function if we are opening main.cpp or main.c file"
function! CheckIfMain()
    if !IsFileAlreadyExists(expand("%:t")) && expand("%:t:r") == "main" && expand("%:e") == "cpp"
        execute 'normal! 1G 1000dd'
        execute ':Template maincpp'
        execute ':w'
    elseif !IsFileAlreadyExists(expand("%:t")) && expand("%:t:r") == "main" && expand("%:e") == "c"
        execute 'normal! 1G 1000dd' 
        execute ':Template mainc'
        execute ':w'
    endif
endfunction

"==========================================================================="
"Invoke this function when you would like to create new C++ class files (.cpp
"and .h file)"
function! CreateCppClassFiles(className)
    "create cpp file
    if !IsFileAlreadyExists(a:className.'.cpp')
        execute ':n '.a:className.'.cpp'
        execute 'normal! 1G 1000dd'
        execute ':Template cppclass'
        execute ':w'
    else
        execute ':n '.a:className.'.cpp'
    endif 
    "create h file
    if !IsFileAlreadyExists(a:className.'.h')
        execute ':n '.a:className.'.h'
        execute 'normal! 1G 1000dd'
        execute ':Template cppclassh'
        execute ':w'
    else
        execute ':n '.a:className.'.h'
    endif
endfunction

"create new command for creating cpp class"
command! -nargs=1 NewCppClass call CreateCppClassFiles("<args>")

"==========================================================================="
nmap <leader>ud :silent call UpdateCscopeDatabase(".")<cr>:w<cr>
imap <leader>ud <ESC>l:silent call UpdateCscopeDatabase(".")<cr>:w<cr>i

nmap <leader>uad :call UpdateAllCscopeDatabases()<cr>:w<cr>
imap <leader>uad <ESC>l:call UpdateAllCscopeDatabases()<cr>:w<cr>i


" =========== Startup commands =========="

"autocmd VimEnter * exe 2 . "wincmd w"
autocmd VimEnter * call CheckIfMain()
autocmd VimEnter * call LoadCScopeDatabases()
autocmd VimEnter * call DetectFileType()

autocmd BufWritePost ~/.vimrc source ~/.vimrc
"au BufNewFile,BufRead * :set relativenumber " relative line numbers


" =========== Leaving commands =========="

autocmd VimLeave * SessionSaveAs vim_auto_saved_session


"===================================================================================================
" Commenting blocks of code.
autocmd FileType c,cppva,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>'"'"


" ========================================================================================
" SURRENDINGS 

autocmd FileType c,cpp let b:surround_105  = "if (condition) {\n \r } \n"
autocmd FileType c,cpp let b:surround_102  = "for (int i=0; i<condition;i++) {\n\r}\n"
autocmd FileType c,cpp let b:surround_119  = "while (condition) {\n\r}\n"
autocmd FileType c,cpp let b:surround_112  = "printf(\"\r\\n\");"
autocmd FileType c,cpp let b:surround_99   = "/*\n\r*/"

autocmd FileType html  let b:surround_102  = "<font face=\"courier\">/r</font>"

" ========================================================================================
"Enable snippets for cpputest 
autocmd FileType cpp :set filetype=cpp.cpputest
autocmd FileType c   :set filetype=c.cpputest

" ========================================================================================
" REFRESH COMMANDS

" warning: to refresh NERDTree just type 'r' being in NERD window

nmap <F5> :e<cr>
imap <F5> <ESC>l:e<cr>i

" ========================================================================================
" " USING MARKERS
" Create marker: m<markerSign> ex. ma 
" Goto marker:   '<markerSign> ex. 'a 
"
" ========================================================================================
" " INSERT C++ GETTER NAD SETTER
"map <Leader>igs :InsertBothGetterSetter<CR>

" ========================================================================================
" " USING VIM AS HEX EDITOR
map <Leader>hon :%!xxd<CR>
map <Leader>hof :%!xxd -r<CR>

" ========================================================================================
" " Resize split window horizontally and vertically
" Shortcuts to Shift-Alt-Up - Alt is mapped as M in vim
nmap <S-M-Up> :2winc+<cr>
imap <S-M-Up> <Esc>:2winc+<cr>i
nmap <S-M-Down> :2winc-<cr>
imap <S-M-Down> <Esc>:2winc-<cr>i

nmap <S-M-Left> :2winc><cr>
imap <S-M-Left> <Esc>:2winc><cr>i
nmap <S-M-Right> :2winc<<cr>
imap <S-M-Right> <Esc>:2winc<<cr>i


" ========================================================================================
" " Set up folding configuration 
"
nnoremap <leader>fo :setlocal foldexpr=(getline(v:lnum)=~@/)?0:1 foldmethod=expr fml=0 foldlevelstart=0 foldcolumn=1<CR> 

" ========================================================================================
" " Set up scrolling winding one line up and down  
nnoremap <S-Up> <C-E>
nnoremap <S-Down> <C-Y> 

" ========================================================================================
" " Automatically go to the end of pasted text 
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
 
" ========================================================================================
" " Quickly select text which I just pasted  
noremap gV `[v`]


" ========================================================================================
" map ctrl+j to ctrl+m (for INSERT mode)in order to be more consistent with bash terminal 
let g:BASH_Ctrl_j='off'
inoremap <C-j> <C-m>
noremap  <C-j> <C-m>

" ========================================================================================
" automatically detect messages.log files and highlight them
au BufNewfile,BufRead messages* set filetype=dtv_logs_highlights
au BufNewfile,BufRead logsense*[^py] set filetype=dtv_logs_highlights
au BufNewfile,BufRead syslog* set filetype=gstreamer_highlight_syntax

" ========================================================================================
" remap f{char} repetition keys shortcuts
noremap _ ,
noremap - ;

" ========================================================================================
" vimdiff options
" Always use vertical diffs 
set diffopt+=vertical
if &diff 
    colorscheme badwolf_diff
endif

" ========================================================================================
" ack and silversearcher-ag 
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

nmap  <leader>ag :exe "Ack " expand('<cword>') <CR>

" ========================================================================================
" remap movement for wrapped lines being the same as for non-wrapped lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" ========================================================================================
" set middle of screen for new searches
nnoremap <silent>n nzz
nnoremap <silent>N Nzz
nnoremap <silent>* *zz
nnoremap <silent># #zz
nnoremap <silent>g* g*zz

" ========================================================================================
" toggle normal line numbers and relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>tn :call NumberToggle()<cr>
" ========================================================================================
iabbr /** /************************************************************************
iabbr **/ ************************************************************************/
iabbr //- //-----------------------------------------------------------------------

" ========================================================================================
" replaces selected text with test from buffer
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" ========================================================================================
" search but say in the current search occurance
nmap * *N


" " ========================================================================================
" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" " ========================================================================================
" ," Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>
" <leader>) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

map <leader>` ysiw`

" " ========================================================================================
"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>
" " ========================================================================================
" Change inside various enclosures with Alt-" and Alt-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <leader><leader>' f'ci'
nnoremap <leader><leader>" f"ci"
nnoremap <leader><leader>( f(ci(
nnoremap <leader><leader>) f)ci)
nnoremap <leader><leader>[ f[ci[
nnoremap <leader><leader>] f]ci]
" " ========================================================================================
" assign q; to avoid shift pressing when searching last ex commands
nmap q; q:
vmap q; q:
" " ========================================================================================
" use ag as default grep tool if it is installed on the machine
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

map <leader>gr :grep <C-R><C-w><CR><CR><CR>
vmap <leader>gr :grep <C-R><C-w><CR><CR><CR>

" " ========================================================================================
" make vim working as tailf
function! Tailf()
    e
    normal G
    redraw

    sleep 1
    call Tailf()
endfunction

" ======================================================================================== 
" function allows going to selected jump from :jumps list
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <leader>j :call GotoJump()<cr>


" ======================================================================================== 
" Set the cursor to to a '|' when in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" ======================================================================================== 
" Insert breakpoint for Python 
nnoremap <leader>p Oimport pdb; pdb.set_trace()<Esc>

