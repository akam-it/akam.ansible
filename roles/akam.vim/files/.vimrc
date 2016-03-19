set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Plugin 'klen/python-mode'         " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'     " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'    " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim


set expandtab
set autoindent
set statusline=%t\ %y%m%r[%{&fileencoding}]%<[%{strftime(\"%d.%m.%y\",getftime(expand(\"%:p\")))}]%k%=%-14.(%l,%c%V%)\ %P   " делает очень информативную статус-строку
set laststatus=2    " always show the status line
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй

"НАСТРОЙКИ ОТСТУПА
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent " ai - включить автоотступы (копируется отступ предыдущей строки)
set cindent " ci - отступы в стиле С
set expandtab " преобразовать табуляцию в пробелы
set smartindent " Умные отступы (например, автоотступ после {)
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8
" Так как мы включили autoindent, то вставка текста с отступами (из буфера обмена X Window или screen) будет «глючить» — отсупы будут «съезжать». К счастью, это легко исправить — нажав Ctrl+U сразу после вставки.
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

"ВКЛЮЧЕНИЕ АВТОДОПЛНЕНИЯ ВВОДА (omnifunct)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu

" Поиск и подсветка результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

" Порядок применения кодировок и формата файлов
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,cp866
" Кодировки
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>

" Горячие клавиши
" F2 (сохранить файл) и F10 (выйти). F11 включает-выключает нумерацию строк
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
nmap <F10> :q!<cr>
vmap <F10> <esc>:q!<cr>i
imap <F10> <esc>:q!<cr>i
" F9 - включить-выключить браузер структуры документа (TagList)
map <F9> :TlistToggle<cr>
vmap <F9> <esc>:TlistToggle<cr>
imap <F9> <esc>:TlistToggle<cr>
" Ctrl-пробел для автодополнения
inoremap <C-space> <C-x><C-o>
" C-e - комментировать/раскомментировать (при помощи NERD_Comment)
map <C-e> ,ci
nmap <C-e> ,ci
imap <C-e> <ESC>,cii

" Все файлы, начинающиеся с !#/bin/sh или чего-то подобного автоматически будут сделаны исполняемыми
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
au BufWritePost * call ModeChange()


