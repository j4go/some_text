"----------------------------------------------------------------------------------------------------------------------
" basic config
" let $BASH_ENV = '~/.bash_profile'
set shell=/bin/bash\ --login
syntax on
set nocp nu
set t_Co=256
set hid
set autoread
set wrap
set textwidth=70 
set shortmess=atI
set noerrorbells
set hlsearch showmatch
set clipboard=unnamedplus
set scrolloff=8 sidescrolloff=8
set colorcolumn=120 history=1000
set autoindent smartindent

" set tab indent use :retab to replace tab with spaces
set ts=4 sts=4 sw=4 et bs=indent,eol,start

" show tab space eol
set list listchars=tab:▸\ ,trail:•,eol:¬

" set utf-8
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" file backup and undo
set  noswapfile
"silent !mkdir ~/.vim/backup > /dev/null 2>&1
" silent !mkdir ~/.vim/undo > /dev/null 2>&1
" set backup backupdir=~/.vim/backup//
" set undofile undodir=~/.vim/undo//

" manual backup to ~/.vim/backup
" fun! WriteBackup()
"   let fname = strftime("%y%m%d_%H%M%S") . "_".expand("%:t")
"   silent exe ":%w ~/.vim/backup/" . fname
"   echo "Wrote ~/.vim/backup/" . fname
" endfun
" nnoremap  ,b  :call WriteBackup()<CR>

" clean trailing whitespace
" nnoremap  ,,  mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" set paste and insert
" nnoremap ,p :setlocal paste! paste?<cr>i

" set nohl
nnoremap ,h :nohl<CR>

" split window
nnoremap ,v <c-w>v
nnoremap ,s <c-w>s
nnoremap ,q <c-w>q
nnoremap ,w <c-w>w
nnoremap ,= <c-w>=

" keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" panic
" nnoremap 911 mzggg?G`z

" kill window
nnoremap ,k :qa<cr>

" copy to + register
nnoremap ,copy ggVG"+y

" sudo to write
cnoremap ww w !sudo tee % >/dev/null



" vundle cmd
cnoremap pi PluginInstall
" cnoremap pc PluginClean

" better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview


" time out on key codes but not mappings
" basically this makes terminal vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=10

" resize splits when the window is resized
au VimResized * :wincmd =

" make sure vim returns to the same line when you reopen a file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" I constantly hit 'u' in visual mode when i mean to 'y'. use 'gu' for those rare occasions.
" from https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
" vnoremap u <nop>
" vnoremap gu u

" if has("autocmd")
"   filetype on
"   au FileType javascript set ts=2 sts=2 sw=2 et
" au FileType javascript set textwidth=120 colorcolumn=+1
"   au BufWritePre *.js :%s/\s\+$//e
"   au BufRead,BufNewFile *.ejs set filetype=html
" endif



" vundle and plugins
" firstly git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" then :VundleInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/vim-tomorrow-theme'
" Plugin 'mru.vim'
" Plugin 'rking/ag.vim' " firstly install silversearcher-ag
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'benmills/vimux'
" Plugin 'majutsushi/tagbar'
" Plugin 'scrooloose/nerdtree'
" Plugin 'Yggdroot/indentLine'
" Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/syntastic'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'tpope/vim-surround'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'kien/ctrlp.vim'
" Plugin 'dkprice/vim-easygrep'
"Plugin 'moll/vim-node'
"Plugin 'walm/jshint.vim'
"Plugin 'einars/js-beautify'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
call vundle#end()
filetype plugin indent on

" theme
set bg=dark
colorscheme Tomorrow-Night-Eighties

" airline
set laststatus=2
set ttimeoutlen=10
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" nerdtree
"map <f10> :NERDTreeMirror<CR>
"map <f10> :NERDTreeToggle<CR>
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1
"autocmd bufenter * if(winnr("$")==1&&exists("b:NERDTreeType")&&b:NERDTreeType=="primary")|q|endif
"autocmd VimEnter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w


" indentLines
"map <f11> :IndentLinesToggle<CR>
"let g:indentLine_first_char = '┊'
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)


" tarbar
" map <f12> :TagbarToggle<CR>
" let g:tagbar_iconchars = ['▸', '▾']


" vimux
" let g:VimuxHeight = 30
" nmap <space>p :VimuxPromptCommand<cr>
" nmap <space>q :VimuxCloseRunner<cr>
" nmap <space>l :VimuxRunLastCommand<cr>
" nmap <space>x :VimuxInterruptRunner<cr>
" let runapp = 'clear && cd /mnt/shared/common/common && node app'
" nmap <space>r ::call VimuxRunCommand(runapp)<cr>


" vim-commentary
" autocmd FileType python,shell,apache set commentstring=#\ %s

" vim-jsbeautify
"map <space>f : call JsBeautify()<CR>
"autocmd FileType html noremap  :call HtmlBeautify()
"autocmd FileType css noremap  :call CSSBeautify()


" syntastic
" set statusline+=%*
" set statusline+=%#warningmsg#
" set statusline+=%{syntasticstatuslineflag()}
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_javascript_checkers = ['jshint']


" easygrep
" let g:EasyGrepMode = 2
" let g:EasyGrepCommand = 0
" let g:EasyGrepRecursive  = 1
" let g:EasyGrepIgnoreCase = 1
" let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc"


" mru
" map ,m :MRU<cr>
" let MRU_Max_Menu_Entries = 20
" let MRU_Max_Submenu_Entries = 20
" let MRU_Window_Height = 15


" ctrlsf
" nnoremap <c-o> :CtrlSFOpen<CR>
" nmap sf <Plug>CtrlSFPrompt


" ctrlp
" map <c-p> :CtrlP<CR>
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz
" let g:ctrlp_custom_ignore = {
" \ 'dir': '\v[\/]\.(git|hg|svn)$',
" \ 'file': '\v\.(exe|so|dll)$',
" \ 'link': 'some_bad_symbolic_links',
" \ }

"----------------------------------------------------------------------------------------------------------------------
