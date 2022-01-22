" file encoding
set encoding=utf-8
set fileencodings=utf-8,cp950

" config settings
syntax on        " enable syntax
set nocompatible " vim nocompatible with vi
" set ai           " auto indent
" set shiftwidth=2 " set indent width = 4
set tabstop=4    " set tab width = 4
" set softtabstop=4
set expandtab   " use space to replace tab
" set ruler        " show information
set backspace=2  " use backspace in insert mode
set ic           " ignore uppercase and lowercase when searching
" set ru           " show row and column number
set hlsearch     " highlight the searched result
set incsearch    " use incremental search
" set smartindent  " enable smartindent
set confirm      " ask for confirm when need
set history=100  " reserved 100 commands for history
" set cursorline   " show current cursor position
" set laststatus=2
" set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]
set wrap		" auto wrap
set nu			" show line number
set autoread	" Set to auto read when a file is changed from the outside set autoread
set nobackup
set nowritebackup
" colorscheme torte " colorscheme elflord
colorscheme elflord

" cscope settings
if has("cscope")
" set csprg=/usr/bin/cscope
set csprg=~/bin/cscope
set csto=0
set nocsverb
"if filereadable("cscope.out") 
"	cscope add cscope.out    
"else 
"	if $ANDROID_BUILD_TOP !=""
"		"This assumes you have sourced the Android build environment
"		cscope add $ANDROID_BUILD_TOP/cscope.out    
"	else
"		"Or, you can point to your android source directory in $ANDROID_DIR 
"		cscope add $ANDROID_DIR/cscope.out
"	endif 
"endif
let $CURDIR = getcwd()
let i = 1
while i < 20
    if filereadable("cscope.out")
        let db = getcwd() . "/cscope.out"
        "echo db
        let $CSCOPE_DB = db
        cs add $CSCOPE_DB
        let i = 32
    else
        cd ..
        let i += 1
    endif
endwhile
cd $CURDIR
endif


" taglist settings
nnoremap <silent> <f7> :TlistToggle<cr>
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
