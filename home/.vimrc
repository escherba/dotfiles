if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

filetype off                   " required!

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'int3/vim-extradite'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'Shougo/vimproc', {
 \ 'build' : {
 \     'windows' : 'make -f make_mingw32.mak',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make -f make_mac.mak',
 \     'unix' : 'make -f make_unix.mak',
 \    },
 \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'sudo.vim'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build' : {
     \     'mac' : 'git submodule update --init --recursive && bash ./install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'unix' : 'git submodule update --init --recursive && bash ./install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'cygwin' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
     \    }
     \ }
NeoBundle 'sjl/gundo.vim'
NeoBundle 'xolox/vim-misc'
"NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'Lokaltog/TagHighlight'
NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'bling/vim-airline'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'moll/vim-node'
NeoBundle 'jcfaria/Vim-R-plugin'
"NeoBundle 'jalvesaq/VimCom', {
" \ 'build' : {
" \      'mac' : 'R CMD build .; R CMD INSTALL vimcom.*.tar.gz'
" \    }
" \ }

" Snippets!
NeoBundle 'SirVer/ultisnips'
NeoBundle 'ervandew/supertab'
NeoBundle 'honza/vim-snippets'

"NeoBundle 'MarcWeber/vim-addon-mw-utils'
"NeoBundle 'tomtom/tlib_vim'
"NeoBundle 'garbas/vim-snipmate'
"NeoBundle 'msanders/snipmate.vim'

" color schemes
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'ajacksified/vim-colors-solarized-brown'
"NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
"NeoBundle 'chriskempson/base16-vim'
"NeoBundle 'john2x/flatui.vim'

" markdown, RST
NeoBundle 'tpope/vim-markdown'
NeoBundle 'rykka/clickable.vim'
NeoBundle 'rykka/clickable-things'
NeoBundle 'rykka/os.vim'
NeoBundle 'rykka/riv.vim'

" Ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'

"Lua
NeoBundle 'xolox/vim-lua-inspect'
NeoBundle 'xolox/vim-lua-ftplugin'

" Puppet
NeoBundle 'rodjek/vim-puppet'

" iOS and Cocoa
NeoBundle 'eraserhd/vim-ios'
NeoBundle 'msanders/cocoa.vim'
"NeoBundle 'Rip-Rip/clang_complete'

" C
NeoBundle 'c.vim'
NeoBundle 'Alternate-workspace'

" Python
NeoBundle 'klen/python-mode'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'python.vim'
"NeoBundle 'pyflakes.vim'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'alfredodeza/pytest.vim'
NeoBundle 'fs111/pydoc.vim'
NeoBundle 'tshirtman/vim-cython'
"NeoBundle 'vim-scripts/pyrex.vim'
NeoBundle 'vim-scripts/swap-parameters'
"NeoBundle 'jmcantrell/vim-virtualenv'


" Javascript
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'wookiehangover/jshint.vim'
NeoBundle 'walm/jshint.vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'elzr/vim-json'

" Haskell
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'bitc/vim-hdevtools'
NeoBundle 'feuerbach/vim-hs-module-name'
NeoBundle 'escherba/vim-haskellConceal'

" Graphviz
NeoBundle 'wannesm/wmgraphviz.vim'

" Protobuf
NeoBundle 'uarun/vim-protobuf'

" Agda
"NeoBundle 'derekelkins/agda-vim'

"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Matlab
NeoBundle 'MatlabFilesEdition'

"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'

" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"NeoBundle 'file:///Users/gmarik/path/to/plugin'
" ...

call neobundle#end()

filetype plugin indent on     " required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

let mapleader = ','
set ruler       " show cursor position
set t_Co=256    " use 256 colors
set hlsearch    " highlight search terms
set cursorline  " show line under cursor
set title       " reflect what buffer you are working in
syntax enable
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set encoding=utf-8
set ffs=unix,dos,mac " Default line endings
try
    lang en_US
catch
endtry

set background=dark
" controls transparency, needed for Terminal
let g:solarized_termtrans = 1

if has('gui_macvim')
    set transparency=0
endif


let g:solarized_visibility = 'high'
let g:solarized_contrast = 'high'
colorscheme solarized
"colorscheme flatui
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme base16-eighties
"colorscheme base16-ocean
"colorscheme base16-solarized

" ----------------------------------------------
"  Git
"
"  taken from https://github.com/begriffs/haskell-vim-now/blob/master/.vimrc
" ----------------------------------------------

let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep 
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list, '')
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

" ----------------------------------------------
" Airline
" ----------------------------------------------

let g:airline_powerline_fonts = 1


let g:airline_symbols = {}
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.whitespace = 'Ξ'


if has('gui_running')
    " set default font
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
endif

" VimShell
let  g:vimshell_editor_command='vim'

" Create the :Retag command
" requires exuberant-ctags
function! Retag() abort
    call system("ctags -R --languages=-TeX --python-kinds=-i .")
    exec "redraw!"
endfunction
function! RetagObjC() abort
    call system("ctags -R --languages=-TeX --python-kinds=-i --langmap=C:.m.h .")
    call system("ctags -R --languages=-TeX --python-kinds=-i --langmap=ObjectiveC:.m.h --append .")
    exec "redraw!"
endfunction
command! Retag call Retag()
command! RetagObjC call RetagObjC()

" -------------------------------
" TagBar
" -------------------------------
nnoremap <leader>t :TagbarToggle<CR>
runtime include/tagbar-types.vim
"let g:tagbar_autoclose = 1


" Alternate plugin -- configure for Objective-C
autocmd FileType objc let g:alternateExtensions_h = "m"
autocmd FileType objc let g:alternateExtensions_m = "h"

" clang_complete
"let g:clang_auto_select = 1
"let g:clang_user_options='|| exit 0'
"let g:clang_library_path = '/Applications/Xcode5-DP4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_user_options = '-fblocks -isysroot /Applications/Xcode5-DP4.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS7.0.sdk'

" --------------------------
" Syntastic for Objective-C
" --------------------------
"also check header files (this usually creates a .gch file in your source directory)
let g:syntastic_objc_check_header = 1
"enable header files being re-checked on every file write
let g:syntastic_objc_auto_refresh_includes = 1
"  disable the include of the default include dirs (such as /usr/include)
let g:syntastic_objc_no_default_include_dirs = 1
"define a file that contains additional compiler arguments like include
"directories or CFLAGS. The file is expected to contain one option per line.
"If none is given the filename defaults to .syntastic_objc_config
"let g:syntastic_objc_config_file = '.config'

" for Python, disable 'line too long' error
let g:syntastic_python_flake8_args = "--ignore=E501 --max-complexity 20"

let g:syntastic_haskell_hdevtools_args = '-g -isrc -g -Wall -g -hide-package -g transformers'
" set compiler executable
"let g:syntastic_objc_compiler = 'clang'
"let g:syntastic_objc_checker = 'clang'

" --------------------------
"  NERDTree
" --------------------------
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.pyd$', '\.swp$', '\.swo$']

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" --------------------------
" Lua
" --------------------------
let g:lua_check_syntax = 1
"let g:lua_compiler_name = 'luac5.1'
let g:lua_complete_omni = 1

" --------------------------
" Ensure correct syntax highlighting and auto-indentation for Fortran free-form
" source code.
let fortran_free_source=1
let fortran_do_enddo=1
" --------------------------
" python-mode
" --------------------------
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501,C0103,C0111,C0301,C0326,E1101,R0903,R0904,R0913,W0141,W0142"
let g:pymode_lint_write = 1  " Auto check on save
"let g:syntastic_python_checker_args='-d E501,C0103,C0111,C0301,C0326,E1101,R0903,R0904,R0913,W0141,W0142'
let g:syntastic_python_pylint_args='-d E501,C0103,C0111,C0301,C0326,E1101,R0903,R0904,R0913,W0141,W0142 -f parseable -r n -i y'

" misc
let g:pymode_trim_whitespaces = 0
let g:pymode_virtualenv = 1  " Support virtualenv

" rope
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0   " we use Jedi instead of Rope

" breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" --------------------------
"  jedi-vim
"  -------------------------
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0

" --------------------------
" Syntastic
" --------------------------
"let g:syntastic_check_on_open=1
"let g:syntastic_python_checker="flake8"
"let g:syntastic_disabled_filetypes = ['lua', 'python']
let g:syntastic_auto_loc_list=0
"let g:syntastic_warning_symbol = 'WW'
"let g:syntastic_error_symbol = 'EE'

" Syntastic - toggle between active and passive type checking
map <silent> <leader>e :Errors<CR>
map <leader>s :SyntasticToggleMode<CR>
" Syntastic - always show error list when editing
let g:syntastic_auto_loc_list=1

" ------------------------------
"  Make
" ------------------------------
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested copen  " cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"-------------------------------
" General
" ------------------------------
" source .vimrc files from local directories
set exrc
" limit commands sourced from local .vimrc for security reasons
set secure


" ------------------------------
" Haskell
" ------------------------------
au Bufenter *.hs compiler ghc
au BufEnter *.hs set formatprg=pointfree
au Bufread,BufNewFile *.hsc set filetype=haskell
au FileType cabal setl et ts=2 sw=2 sts=2

" Configure browser for haskell_doc.vim
" Note: you need to run the following when setting up your GHC env:
"
"      cabal update
"      cabal install hdevtools
"      cabal install happy
"      cabal install ghc-mod
"
let g:haddock_browser = 'open'
let g:haddock_browser_callformat = '%s %s'
let g:haddock_docdir = '/usr/local/share/doc/ghc/html/'

" hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" haskellmode - Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" haskellmode - Type Lookup
map tt :call GHC_ShowType(0)<CR>
" haskellmode - Type Infer
map <silent> tw :call GHC_ShowType(1)<CR>
map trai :call GHC_MkImportsExplicit()<CR>

if has("gui_running")
  map tghc :popup ]OPTIONS_GHC<cr>
else
  map tghc :emenu ]OPTIONS_GHC.
endif

if has("gui_running")
  map tlo :popup ]LANGUAGES_GHC<cr>
else
  map tlo :emenu ]LANGUAGES_GHC.
endif

" =============================

" Easytags
let g:easytags_updatetime_min=1000

" Prevent UltiSnips <tab> mapping from colliding with YouCompleteMe
" (still allow us to cycle through completion with <C-N> and <C-P> keys)
"
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'
"let g:UltiSnipsListSnippets="<c-e>"

" ===================================
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Use system Clipboard
" Register unnamedplus does not exist on Mac OS X though,
" use the following shortcuts to yank and paste to/from the system
" clipboard: \"*y \"*p (no backslashes)
set clipboard=unnamed
"set clipboard=unnamedplus

" Disable the *incredibly* annoying screen blinking when reached end of buffer
set vb t_vb=

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" =====
" clickable
call os#init()

" ===================================
"YouCompleteMe
"let g:ycm_register_as_syntastic_checker=0

let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'

"global fallback to extra_conf file
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
"ignore warnings about extra_conf files
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']

"map Jedi's jump to definition/declaration feature to the <leader>g shortcut
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" neco-ghc plugin
let g:necoghc_enable_detailed_browse = 1

" Dash.app documentation
nmap <silent> <leader>h <Plug>DashSearch

" Pretty-print *.json files (requires yajl)
"autocmd BufRead,BufNewFile *.json set equalprg=json_reformat

" gradle syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy

" python syntax highlighting
let python_highlight_all = 1

" play nicely with tmux
map <Esc>[B <Down>

" do not fold everything
set foldlevelstart=1

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" disable background erase
set t_ut=

" ----------------------------------------------
" Unicode Entry
" ----------------------------------------------

autocmd BufReadPost *.agda cal s:AgdaKeys()

function s:AgdaKeys()
    imap <buffer> \alpha α
    imap <buffer> \beta β
    imap <buffer> \gamma γ
    imap <buffer> \delta δ
    imap <buffer> \epsilon ∊
    imap <buffer> \varepsilon ε
    imap <buffer> \zeta ζ
    imap <buffer> \eta η
    imap <buffer> \theta θ
    imap <buffer> \vartheta ϑ
    imap <buffer> \iota ι
    imap <buffer> \kappa κ
    imap <buffer> \lambda λ
    imap <buffer> \mu μ
    imap <buffer> \nu ν
    imap <buffer> \xi ξ
    imap <buffer> \pi π
    imap <buffer> \varpi ϖ
    imap <buffer> \rho ρ
    imap <buffer> \varrho ϱ
    imap <buffer> \sigma σ
    imap <buffer> \varsigma ς
    imap <buffer> \tau τ
    imap <buffer> \upsilon υ
    imap <buffer> \phi φ
    imap <buffer> \varphi ϕ
    imap <buffer> \chi χ
    imap <buffer> \psi ψ
    imap <buffer> \omega ω
    imap <buffer> \Gamma Γ
    imap <buffer> \Delta Δ
    imap <buffer> \Theta Θ
    imap <buffer> \Lambda Λ
    imap <buffer> \Xi Ξ
    imap <buffer> \Pi Π
    imap <buffer> \Upsilon Υ
    imap <buffer> \Phi Φ
    imap <buffer> \Psi Ψ
    imap <buffer> \Omega Ω
    imap <buffer> \leq ≤
    imap <buffer> \ll ≪
    imap <buffer> \prec ≺
    imap <buffer> \preceq ≼
    imap <buffer> \subset ⊂
    imap <buffer> \subseteq ⊆
    imap <buffer> \sqsubset ⊏
    imap <buffer> \sqsubseteq ⊑
    imap <buffer> \in ∈
    imap <buffer> \vdash ⊢
    imap <buffer> \mid ∣
    imap <buffer> \smile ⌣
    imap <buffer> \geq ≥
    imap <buffer> \gg ≫
    imap <buffer> \succ ≻
    imap <buffer> \succeq ≽
    imap <buffer> \supset ⊃
    imap <buffer> \supseteq ⊇
    imap <buffer> \sqsupset ⊐
    imap <buffer> \sqsupseteq ⊒
    imap <buffer> \ni ∋
    imap <buffer> \dashv ⊣
    imap <buffer> \parallel ∥
    imap <buffer> \frown ⌢
    imap <buffer> \notin ∉
    imap <buffer> \equiv ≡
    imap <buffer> \doteq ≐
    imap <buffer> \sim ∼
    imap <buffer> \simeq ≃
    imap <buffer> \approx ≈
    imap <buffer> \cong ≅
    imap <buffer> \Join ⋈
    imap <buffer> \bowtie ⋈
    imap <buffer> \propto ∝
    imap <buffer> \models ⊨
    imap <buffer> \perp ⊥
    imap <buffer> \asymp ≍
    imap <buffer> \neq ≠
    imap <buffer> \pm ±
    imap <buffer> \cdot ⋅
    imap <buffer> \times ×
    imap <buffer> \cup ∪
    imap <buffer> \sqcup ⊔
    imap <buffer> \vee ∨
    imap <buffer> \oplus ⊕
    imap <buffer> \odot ⊙
    imap <buffer> \otimes ⊗
    imap <buffer> \bigtriangleup △
    imap <buffer> \lhd ⊲
    imap <buffer> \unlhd ⊴
    imap <buffer> \mp ∓
    imap <buffer> \div ÷
    imap <buffer> \setminus ∖
    imap <buffer> \cap ∩
    imap <buffer> \sqcap ⊓
    imap <buffer> \wedge ∧
    imap <buffer> \ominus ⊖
    imap <buffer> \oslash ⊘
    imap <buffer> \bigcirc ○
    imap <buffer> \bigtriangledown ▽
    imap <buffer> \rhd ⊳
    imap <buffer> \unrhd ⊵
    imap <buffer> \triangleleft ◁
    imap <buffer> \triangleright ▷
    imap <buffer> \star ⋆
    imap <buffer> \ast ∗
    imap <buffer> \circ ∘
    imap <buffer> \bullet ∙
    imap <buffer> \diamond ⋄
    imap <buffer> \uplus ⊎
    imap <buffer> \dagger †
    imap <buffer> \ddagger ‡
    imap <buffer> \wr ≀
    imap <buffer> \sum ∑
    imap <buffer> \prod ∏
    imap <buffer> \coprod ∐
    imap <buffer> \int ∫
    imap <buffer> \bigcup ⋃
    imap <buffer> \bigcap ⋂
    imap <buffer> \bigsqcup ⊔
    imap <buffer> \oint ∮
    imap <buffer> \bigvee ⋁
    imap <buffer> \bigwedge ⋀
    imap <buffer> \bigoplus ⊕
    imap <buffer> \bigotimes ⊗
    imap <buffer> \bigodot ⊙
    imap <buffer> \biguplus ⊎
    imap <buffer> \leftarrow ←
    imap <buffer> \rightarrow →
    imap <buffer> \leftrightarrow ↔
    imap <buffer> \Leftarrow ⇐
    imap <buffer> \Rightarrow ⇒
    imap <buffer> \Leftrightarrow ⇔
    imap <buffer> \mapsto ↦
    imap <buffer> \hookleftarrow ↩
    imap <buffer> \leftharpoonup ↼
    imap <buffer> \leftharpoondown ↽
    imap <buffer> \hookrightarrow ↪
    imap <buffer> \rightharpoonup ⇀
    imap <buffer> \rightharpoondown ⇁
    imap <buffer> \longleftarrow ←
    imap <buffer> \longrightarrow →
    imap <buffer> \longleftrightarrow ↔
    imap <buffer> \Longleftarrow ⇐
    imap <buffer> \Longrightarrow ⇒
    imap <buffer> \Longleftrightarrow ⇔
    imap <buffer> \longmapsto ⇖
    imap <buffer> \uparrow ↑
    imap <buffer> \downarrow ↓
    imap <buffer> \updownarrow ↕
    imap <buffer> \Uparrow ⇑
    imap <buffer> \Downarrow ⇓
    imap <buffer> \Updownarrow ⇕
    imap <buffer> \nearrow ↗
    imap <buffer> \searrow ↘
    imap <buffer> \swarrow ↙
    imap <buffer> \nwarrow ↖
    imap <buffer> \leadsto ↝
    imap <buffer> \dots …
    imap <buffer> \cdots ⋯
    imap <buffer> \vdots ⋮
    imap <buffer> \ddots ⋱
    imap <buffer> \hbar ℏ
    imap <buffer> \ell ℓ
    imap <buffer> \Re ℜ
    imap <buffer> \Im ℑ
    imap <buffer> \aleph א
    imap <buffer> \wp ℘
    imap <buffer> \forall ∀
    imap <buffer> \exists ∃
    imap <buffer> \mho ℧
    imap <buffer> \partial ∂
    imap <buffer> \prime ′
    imap <buffer> \emptyset ∅
    imap <buffer> \infty ∞
    imap <buffer> \nabla ∇
    imap <buffer> \triangle △
    imap <buffer> \Box □
    imap <buffer> \Diamond ◇
    imap <buffer> \bot ⊥
    imap <buffer> \top ⊤
    imap <buffer> \angle ∠
    imap <buffer> \surd √
    imap <buffer> \diamondsuit ♢
    imap <buffer> \heartsuit ♡
    imap <buffer> \clubsuit ♣
    imap <buffer> \spadesuit ♠
    imap <buffer> \neg ¬
    imap <buffer> \flat ♭
    imap <buffer> \natural ♮
    imap <buffer> \sharp ♯
    imap <buffer> \digamma Ϝ
    imap <buffer> \varkappa ϰ
    imap <buffer> \beth ב
    imap <buffer> \daleth ד
    imap <buffer> \gimel ג
    imap <buffer> \lessdot ⋖
    imap <buffer> \leqslant ≤
    imap <buffer> \leqq ≦
    imap <buffer> \lll ⋘
    imap <buffer> \lesssim ≲
    imap <buffer> \lessgtr ≶
    imap <buffer> \lesseqgtr ⋚
    imap <buffer> \preccurlyeq ≼
    imap <buffer> \curlyeqprec ⋞
    imap <buffer> \precsim ≾
    imap <buffer> \Subset ⋐
    imap <buffer> \sqsubset ⊏
    imap <buffer> \therefore ∴
    imap <buffer> \smallsmile ⌣
    imap <buffer> \vartriangleleft ⊲
    imap <buffer> \trianglelefteq ⊴
    imap <buffer> \gtrdot ⋗
    imap <buffer> \geqq ≧
    imap <buffer> \ggg ⋙
    imap <buffer> \gtrsim ≳
    imap <buffer> \gtrless ≷
    imap <buffer> \gtreqless ⋛
    imap <buffer> \succcurlyeq ≽
    imap <buffer> \curlyeqsucc ⋟
    imap <buffer> \succsim ≿
    imap <buffer> \Supset ⋑
    imap <buffer> \sqsupset ⊐
    imap <buffer> \because ∵
    imap <buffer> \shortparallel ∥
    imap <buffer> \smallfrown ⌢
    imap <buffer> \vartriangleright ⊳
    imap <buffer> \trianglerighteq ⊵
    imap <buffer> \doteqdot ≑
    imap <buffer> \risingdotseq ≓
    imap <buffer> \fallingdotseq ≒
    imap <buffer> \eqcirc ≖
    imap <buffer> \circeq ≗
    imap <buffer> \triangleq ≜
    imap <buffer> \bumpeq ≏
    imap <buffer> \Bumpeq ≎
    imap <buffer> \thicksim ∼
    imap <buffer> \thickapprox ≈
    imap <buffer> \approxeq ≊
    imap <buffer> \backsim ∽
    imap <buffer> \vDash ⊨
    imap <buffer> \Vdash ⊩
    imap <buffer> \Vvdash ⊪
    imap <buffer> \backepsilon ∍
    imap <buffer> \varpropto ∝
    imap <buffer> \between ≬
    imap <buffer> \pitchfork ⋔
    imap <buffer> \blacktriangleleft ◀
    imap <buffer> \blacktriangleright ▷
    imap <buffer> \dashleftarrow ⇠
    imap <buffer> \leftleftarrows ⇇
    imap <buffer> \leftrightarrows ⇆
    imap <buffer> \Lleftarrow ⇚
    imap <buffer> \twoheadleftarrow ↞
    imap <buffer> \leftarrowtail ↢
    imap <buffer> \leftrightharpoons ⇋
    imap <buffer> \Lsh ↰
    imap <buffer> \looparrowleft ↫
    imap <buffer> \curvearrowleft ↶
    imap <buffer> \circlearrowleft ↺
    imap <buffer> \dashrightarrow ⇢
    imap <buffer> \rightrightarrows ⇉
    imap <buffer> \rightleftarrows ⇄
    imap <buffer> \Rrightarrow ⇛
    imap <buffer> \twoheadrightarrow ↠
    imap <buffer> \rightarrowtail ↣
    imap <buffer> \rightleftharpoons ⇌
    imap <buffer> \Rsh ↱
    imap <buffer> \looparrowright ↬
    imap <buffer> \curvearrowright ↷
    imap <buffer> \circlearrowright ↻
    imap <buffer> \multimap ⊸
    imap <buffer> \upuparrows ⇈
    imap <buffer> \downdownarrows ⇊
    imap <buffer> \upharpoonleft ↿
    imap <buffer> \upharpoonright ↾
    imap <buffer> \downharpoonleft ⇃
    imap <buffer> \downharpoonright ⇂
    imap <buffer> \rightsquigarrow ⇝
    imap <buffer> \leftrightsquigarrow ↭
    imap <buffer> \dotplus ∔
    imap <buffer> \ltimes ⋉
    imap <buffer> \Cup ⋓
    imap <buffer> \veebar ⊻
    imap <buffer> \boxplus ⊞
    imap <buffer> \boxtimes ⊠
    imap <buffer> \leftthreetimes ⋋
    imap <buffer> \curlyvee ⋎
    imap <buffer> \centerdot ⋅
    imap <buffer> \rtimes ⋈
    imap <buffer> \Cap ⋒
    imap <buffer> \barwedge ⊼
    imap <buffer> \boxminus ⊟
    imap <buffer> \boxdot ⊡
    imap <buffer> \rightthreetimes ⋌
    imap <buffer> \curlywedge ⋏
    imap <buffer> \intercal ⊺
    imap <buffer> \divideontimes ⋇
    imap <buffer> \smallsetminus ∖
    imap <buffer> \circleddash ⊝
    imap <buffer> \circledcirc ⊚
    imap <buffer> \circledast ⊛
    imap <buffer> \hbar ℏ
    imap <buffer> \hslash ℏ
    imap <buffer> \square □
    imap <buffer> \blacksquare ■
    imap <buffer> \circledS Ⓢ
    imap <buffer> \vartriangle △
    imap <buffer> \blacktriangle ▲
    imap <buffer> \complement ∁
    imap <buffer> \triangledown ▽
    imap <buffer> \blacktriangledown ▼
    imap <buffer> \lozenge ◊
    imap <buffer> \blacklozenge ◆
    imap <buffer> \bigstar ★
    imap <buffer> \angle ∠
    imap <buffer> \measuredangle ∡
    imap <buffer> \sphericalangle ∢
    imap <buffer> \backprime ‵
    imap <buffer> \nexists ∄
    imap <buffer> \Finv Ⅎ
    imap <buffer> \varnothing ∅
    imap <buffer> \eth ð
    imap <buffer> \mho ℧
endfunction
