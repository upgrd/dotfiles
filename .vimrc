
"____vundle section____ 
"
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"*** PLUGIN section ****
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'othree/xml.vim'
Plugin 'scrooloose/nerdtree'

"let NERDTreeQuitOnOpen=1

"easymotion from https://github.com/easymotion/vim-easymotion
Plugin 'easymotion/vim-easymotion'

"_____vim bufferline (https://github.com/bling/vim-bufferline)
Plugin 'bling/vim-bufferline'

"syntastic from https://github.com/vim-syntastic/syntastic
Plugin 'vim-syntastic/syntastic'
"set syntastic to python 3
"let g:syntastic_python_python_exec = '/usr/bin/python3'

"rdf syntax from https://github.com/niklasl/vim-rdf
Plugin 'niklasl/vim-rdf'

"window swap from https://github.com/wesQ3/vim-windowswap
Plugin 'wesQ3/vim-windowswap'

"emmet-like plugin from https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'
"fugitive git wrapper
Plugin 'tpope/vim-fugitive'

"multi curser from https://github.com/terryma/vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

"vimtext from https://github.com/lervag/vimtex
Plugin 'lervag/vimtex'

"js from 
Plugin 'pangloss/vim-javascript'

"vim surround
Plugin 'tpope/vim-surround'

"tern js for js autocompletion from http://tilvim.com/2013/08/21/js-autocomplete.html
Plugin 'ternjs/tern_for_vim'

" ***ultisnips block from https://github.com/SirVer/ultisnips

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"youcompleteme from https://valloric.github.io/YouCompleteMe/#ubuntu-linux-x64
Plugin 'Valloric/YouCompleteMe'

" *** ultisnips + YCM via supertab! from  http://chauncey.io/ultisnips-youcompleteme-now-if-i-can-just-get-you-two-to-cooperate/
"Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
Plugin 'ervandew/supertab'

"autopairs plugin
Plugin 'jiangmiao/auto-pairs'

"taglist
"apt-get install exuberant-ctags!
Plugin 'vim-scripts/taglist.vim'

" nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" fzf for vim (fuck you ctrl-p! :D)
Plugin 'https://github.com/junegunn/fzf'

" agbar; requires exuberant ctags! (av. in linux repos)
Plugin 'majutsushi/tagbar'

" xpath search
Plugin 'actionshrimp/vim-xpath'

" css syntax
Plugin 'hail2u/vim-css3-syntax'


Plugin 'Yggdroot/indentLine'

Plugin 'shawncplus/phpcomplete.vim'


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
 
"Set ultisnips triggers
" from http://stackoverflow.com/questions/19039443/vim-ultisnips-how-do-i-move-to-the-next-placeholder-or-tabstop
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

call vundle#end()            " required

"____basic setup_____ (http://www.makeuseof.com/tag/5-things-need-put-vim-config-file/)

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set clipboard=unnamed
set breakindent
"activate omnifunc
set omnifunc=syntaxcomplete#Complete

"set hl search from http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
set hlsearch

" set cursorline toggle map
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" nice mapping for running python code from vim (http://stackoverflow.com/questions/18948491/running-python-code-in-vim)
"nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
:map <F9> :exec ':w !python3 %'<cr>

nnoremap <F5> :XPathSearchPrompt

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"colorscheme molokai 
autocmd VimEnter * colorscheme monokai 

" json syntax and linting via js! (http://www.codeography.com/2010/07/13/json-syntax-highlighting-in-vim.html)
autocmd BufNewFile,BufRead *.json set ft=javascript


"basic setup for syntastic from https://github.com/vim-syntastic/syntastic#settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" *** ultisnips + ycm settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"____wordprocessor mode____ (http://www.makeuseof.com/tag/5-things-need-put-vim-config-file/)


func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

"____hybrid numbering mode____ (http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/)
" *** DEPRECATED *** use RltvNumber instead (= rel + abs numbers!) (http://www.vim.org/scripts/script.php?script_id=2351)
"set relativenumber AND absolute number!
"autocmd VimEnter * RltvNmbr
" solution for calling Rltv after .vimrc has loaded: http://stackoverflow.com/questions/6821033/vim-how-to-run-a-command-immediately-when-starting-vim

"autocmd VimEnter * RltvNmbr
set number


"syntax always on
syntax on

"____enable airline (solution from https://github.com/vim-airline/vim-airline/issues/130)
set laststatus=2

"____ft enabled____

:filetype on
filetype plugin on
filetype indent on

"____mappings____

 "____new line mapping____(http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode)

nmap <Enter> o<Esc>
nmap <S-Enter> O<Esc>
nmap <C-Enter> o<Esc>k
nmap <C-S-Enter< O<Esc>j

" cycle through buffers

:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
