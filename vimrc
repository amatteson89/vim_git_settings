runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Auto source vimrc on save
augroup AutoSave
   autocmd!
   autocmd bufwritepost vimrc source $MYVIMRC
augroup END

Helptags

" Getting around git for windows issue where it sets the SHELL variable
set shell=cmd.exe
   
   
" Set leader to be space
let mapleader="\<Space>"
"   
"   " Airline settings --------------------------{{{1
"   " Always have it turned on
"   set laststatus=2
"   " Use special fonts for git logo and such. Font not currently installed
"   " let g:airline_powerline_fonts = 1
"   let g:airline#extensions#tagbar#enabled = 1
"   
"   set encoding=utf-8
"   set guifont=Consolas_for_Powerline_FixedD:h12
"   
"   
"   " settings for all the special characters in airline
"   let g:airline_symbols = {}
"   let g:airline_left_sep = "\u2b80" "use double quotes here
"   let g:airline_left_alt_sep = "\u2b81"
"   let g:airline_right_sep = "\u2b82"
"   let g:airline_right_alt_sep = "\u2b83"
"   let g:airline_symbols.branch = "\u2b60"
"   let g:airline_symbols.readonly = "\u2b64"
"   let g:airline_symbols.linenr = "\u2b61"
"   let g:airline_symbols.space = " "
"   
"   " 1}}}
"   
"   " Clighter settings --------------------------{{{
"   " First need to add the vimfiles directory to the python path so it can find
"   " the clangflags module.
"   exe 'python sys.path = sys.path + ["' . escape(expand("~/vimfiles"), ' \') . '"]'
"   py import clangflags
"   
"   
"   " Clighter is using a global variable for the clang args, not ideal
"   " architecture, but we'll work around it by setting the args each time a c
"   " file is opened...  This really only needs to be done once per project, might
"   " think about setting this manually...
"   augroup myclighterhack
    "   autocmd!
    "   autocmd FileType c,cpp call clighter#SetCompileArgs(pyeval('str(clangflags.RawFlags(vim.current.buffer.name))'))
"   augroup END
"   " }}}
"   
"   " Clear whitespace  --------------------------{{{
"   "remove trailing white space on file save does this on all files
"   augroup ClearWhitespace
    "   autocmd!
    "   autocmd BufWritePre * silent :%s/\s\+$//e
"   augroup END
"   " }}}

" CTRLP plugin settings --------------------------{{{
"For G2xxx with all the submodules the 'r' option
"locks your searches down in your local submodule
"so just use 'a' so we can see all files from where
"vim was started.
let g:ctrlp_working_path_mode = 'a'
"Open by filename, ignore path matching
let g:ctrlp_by_filename = 1
"ignore my binaries
let g:ctrlp_custom_ignore = {
   \ 'dir': '\v[\/]\.(git|hg|svn|sbas)$',
   \ 'file': '\v\.(o32|o|via|exe|so|dll|bmp|obj|rsp|oxml|sbmp|lib|pyc)$',
   \ }

"Faster ctrl-p usage, it does lose some stuff in submodules though
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
" }}}

"   " Cscope settings --------------------------{{{
"   " Found a trick for asynchronous running and updating, so what we do is call
"   " cscope to update the file databases, then once it's done it calls back into
"   " Vim to reset or add the cscope database.
"   "nnoremap <f12> :!start /min ctags -R --fields=+liaS --c-kinds=+px --c++-kinds=+p --extra=+q --languages=c,c++ --excmd=n . <cr>
"   nnoremap <f12> :exec 'silent !start /b cmd /c "
"   \                 cscope.exe -R -b -q
"   \                 & vim --servername '.v:servername.' --remote-expr UpdateCscope()
"   \                 "'<cr>
"   \                 \|:silent !start /b ctags -R --fields=+liaS --c-kinds=+px --c++-kinds=+p
"   \                          --extra=+q --languages=c,c++ --excmd=n . <cr>
"   
"   function! UpdateCscope()
"   cscope kill -1
"   cscope add cscope.out
"   endfunction
"   
"   if filereadable("cscope.out")
"   cscope add cscope.out
"   endif
"   nnoremap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"   nnoremap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"   nnoremap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"   nnoremap <leader>vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
"   nnoremap <leader>vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"   nnoremap <leader>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"   " }}}
"   
"   " VimWiki settings --------------------------{{{
"   " Need these turned on for vimwiki to work
"   " Its possible these may be duplicated elsewhere in this vimrc
"   set nocompatible
"   filetype plugin on
"   syntax on
"   
"   nnoremap <Leader>wcc :VimwikiAll2HTML<CR>:Vimwiki2HTMLBrowse<CR>
"   " }}}
   
" Easy Motion settings --------------------------{{{
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)

" Make it not case sensitive
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" }}}

" General settings --------------------------{{{
" Prevent do you want to reload file when editing in VS
set autoread

" Lets you walk around the text anywhere
set virtualedit=all

" This will force visual mode pasting to not use the default buffer
" By default, it overwrites your buffer with stuff that was overridden when
" visual pasting
vnoremap p "0p

" Hotkey to add new line after/before current line without entering insert mode
" It will also leave you on your current line
nnoremap <S-Enter> o<Esc>k

" list out files using tab
set wildmode=list

" use tilde as an operator
set tildeop

"Font and color
" colorscheme monokai
" set guifont=Consolas:h12 " there is a fixed font using powerline
syntax enable
set background=light
colorscheme solarized
let g:solarized_italic=0

" turn on spell checker
set spell spelllang=en_us

" syntax highlighting
syntax on

" Turn on backspace
set backspace=2

" turn on line number
set number

"Vertical lines
set colorcolumn=25,37,61,71,81,93
"highlight ColorColumn guibg=black

" Turn off word wrap
set nowrap

" Open split on vertically
cnoremap help vert help

" Set split to open on the right
set splitright

" Easier split navigation
nnoremap <leader>j <C-W><C-j>
nnoremap <leader>k <C-W><C-k>
nnoremap <leader>l <C-W><C-l>
nnoremap <leader>h <C-W><C-h>

" Swap windows around using a similar motion as navigating, just hold shift
" during key command
nnoremap <leader>J <C-W><S-j>
nnoremap <leader>K <C-W><S-k>
nnoremap <leader>L <C-W><S-l>
nnoremap <leader>H <C-W><S-h>


" Highlight current line
set cursorline

"Directory setups
set backupdir=~/vimfiles/backup//
set directory=~/vimfiles/swap//
set undodir=~/vimfiles/undo//

set foldmethod=marker

" Keep a 4 line buffer on the top and bottom
set scrolloff=4

" indent magic
set autoindent
set smartindent

" Mainly using this for code comments
" Cap the comment length to the specified column, use gqq to force current line to format
" and then reset the comment length
function! CommentWrap(size)
"   "Save off current width
"   let current_width=&l:textwidth

"   let &l:textwidth=a:size
"   execute "normal! gqq"
"   let &l:textwidth=current_width
endfunction

" Used for comment blocks
nnoremap <leader>Q :call CommentWrap(60)<CR>

" Mainly using this for header comments
nnoremap <leader>q :call CommentWrap(70)<CR>

"" Sort of copying the logic from the Vim numbertoggle plugin
augroup numbers
"   autocmd!
"   au FocusLost,WinLeave,InsertEnter * setlocal norelativenumber
"   au FocusGained,WinEnter,InsertLeave *  setlocal relativenumber
augroup END

" Grep for word under cursor
nnoremap <leader>g :grep <C-r><C-w>
" Find for word under cursor
nnoremap <leader>f /\v<C-r><C-w>

" Folding hotkeys
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Set scroll lock
"   (I got sick of typing this in everytime)
nnoremap <f11> :set scrollbind! scrollbind?<CR>
" }}}

" Indent guide settings --------------------------{{{
" Adds color for every indentation.
" let g:indent_guides_enable_on_vim_startup = 1
" }}}

" Makeprg options --------------------------{{{
"This uses boost for make so you can do
":make target
set makeprg=support\tools\boost-build\bin\bjam.exe\ -j8

"if a mod test is opened make its path part of the make command
"so you can just type :make
augroup make
"   autocmd!
"   autocmd BufNewfile,BufRead mod_test_*.c
    "   \ setlocal makeprg=support\tools\boost-build\bin\bjam.exe\ release\ --utf-cmd=\"all\"\ -j8\ %:h |
    "   \ setlocal errorformat+=%A\ \ \ \ \ \ Location:\ %f:%l |
    "   \ setlocal errorformat+=%tRROR:\ %m
augroup END

" }}}

" NERDtree settings --------------------------{{{
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

"This one closes NERDTree on normal open commands but stays open for the g*
"commands
let g:NERDTreeQuitOnOpen=1

" }}}

"   " Search options --------------------------{{{
"   "these are for doing incremental and highlighting on searching
"   set incsearch
"   set hlsearch
"   
"   "case insensitive when all lower case
"   "if any uppercase characters then it's
"   "a case sensitive search
"   set ignorecase
"   set smartcase
"   
"   "default to normal regex when doing searches
"   nnoremap / /\v
"   nnoremap ? ?\v
"   cnoremap s/ s/\v
"   
"   "make double escape unhighlight searches
"   nnoremap <esc> :nohlsearch<cr>:<esc>
"   
"   "If ag is an executable on this system set it as the grep program
"   if executable('ag')
    "   set grepprg=ag\ --nogroup\ --nocolor
"   endif
"   
"   " }}}
"   
"   " Rainbow settings --------------------------{{{
"   let g:rainbow_active=1
"   nnoremap <F21> :RainbowToggle<CR>
"   " }}}
"   
"   " Rebase options --------------------------{{{
"   "Make it easy to squash rebases.
"   augroup squash
    "   autocmd!
    "   autocmd FileType gitrebase nnoremap <buffer> <Leader>s :2,$substitute/^pick\>/fixup/e\|:1substitute/^pick\>/reword/e<cr>
"   augroup END
"   " }}}
"   
"   " Tagbar options --------------------------{{{
"   "This allows exploring file by function variable declarations
"   "Use leader t to show the tagbar
"   nnoremap <leader>t :TagbarOpenAutoClose<CR>
"   
"   "override the order of displayed info for my
"   "preferences
"   let g:tagbar_type_c = {
    "   \ 'kinds' : [
        "   \ 'f:functions:0:1',
        "   \ 'd:macros:0:0',
        "   \ 'g:enums',
        "   \ 'e:enumerators:0:0',
        "   \ 't:typedefs:0',
        "   \ 's:structs',
        "   \ 'u:unions',
        "   \ 'm:members:0',
        "   \ 'v:variables:0',
    "   \ ],
"   \ }
"   
"   
"   let g:tagbar_type_cpp = {
    "   \ 'kinds' : [
        "   \ 'f:functions:0:1',
        "   \ 'd:macros:0:1',
        "   \ 'g:enums',
        "   \ 'e:enumerators:0:0',
        "   \ 't:typedefs:0:0',
        "   \ 'n:namespaces',
        "   \ 'c:classes',
        "   \ 's:structs',
        "   \ 'u:unions',
        "   \ 'm:members:0:0',
        "   \ 'v:variables:0:0',
    "   \ ],
"   \ }
"   " }}}
"   
"   " UltiSnips options --------------------------{{{
"   
"   "set up UltiSnips to work nicely with you complete me
"   let g:UltiSnipsExpandTrigger="<c-j>"
"   let g:UltiSnipsJumpForwardTrigger="<c-j>"
"   
"   "For my plugin and manager and work plugin name
"   "need to set this so ultisnips sees the work
"   "snips last
"   let g:UltiSnipsDontReverseSearchPath="1"
"   
"   " }}}
"   
"   " YouCompleteMe options --------------------------{{{
"   
"   "I was having problems with it erroring out on
"   "vim scripts when editing so this just tells it
"   "to work on c files
"   let g:ycm_filetype_whitelist= {'c': 1, 'python': 1, 'cpp': 1}
"   let g:ycm_confirm_extra_conf = 0
"   let g:ycm_global_ycm_extra_conf = '~/vimfiles/clangflags.py'
"   let g:ycm_add_preview_to_completeopt = 1
"   let g:ycm_autoclose_preview_window_after_completion = 0
"   "let g:ycm_collect_identifiers_from_tags_files = 1
"   let g:ycm_always_populate_location_list = 1
"   
"   " Remaps vim goto definition to use youcomplete me,
"   " its a lot more robust for C
"   " Note: k1 is the numpad
"   nnoremap <leader>] :YcmCompleter GoTo<CR>
"   nnoremap } :YcmCompleter GoToDeclaration<CR>
"   
"   " Get the variable type
"   nnoremap <leader>T :YcmCompleter GetType<CR>
"   nnoremap <leader>F :YcmCompleter FixIt<CR>
"   
"   " When saving files, sometimes the YcmServer will hold a file so it can't be
"   " saved. This forces it to restart and release that hold.
"   function! SaveWithYCM()
"   YcmRestartServer
"   w!
"   endfunction
"   command! W call SaveWithYCM()
"   
"   " }}}
"   
"   " Y U NO COMMIT options --------------------------{{{
"   let g:YUNOcommit_after = 40
"   " }}}
"   
"   " Squelch this error, not sure what is causing it. Maybe fix later.
"   " It doesn't seem like anything is being negatively effected by this error
"   " coming up
"   augroup SquelchingError
    "   autocmd!
    "   autocmd CursorHold * silent! checktime
"   augroup END
"   
"   
