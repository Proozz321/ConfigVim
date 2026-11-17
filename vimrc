" ==============================================================================
" 1. ISOLAMENTO E CONFIGURACOES BASICAS
" ==============================================================================
set nocompatible

set runtimepath=~/.vim-rust,$VIMRUNTIME,~/.vim-rust/after
set packpath^=~/.vim-rust

set backupdir=~/.vim-rust/backup//
set directory=~/.vim-rust/swap//
set undodir=~/.vim-rust/undo//
set undofile
set noswapfile
set viminfo='100,<50,s10,h,n~/.vim-rust/viminfo

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set termguicolors
set encoding=utf-8
set hidden
set updatetime=300
set timeoutlen=500
set signcolumn=yes
set laststatus=2
set showtabline=2
set noshowmode

let mapleader = " "

" ==============================================================================
" 2. PLUGINS (vim-plug, instalado dentro de ~/.vim-rust)
" ==============================================================================
let s:plug_path = expand('~/.vim-rust/autoload/plug.vim')
if empty(glob(s:plug_path))
  silent execute '!curl -fLo ' . s:plug_path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.vim-rust/vimrc
endif

call plug#begin('~/.vim-rust/plugged')

" Interface e UI
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mattn/vim-notification'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Edicao, navegacao e Git
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key'

" Rust, LSP, formatacao, snippets
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'puremourning/vimspector'
Plug 'Chiel92/vim-autoformat'
Plug 'voldikss/vim-floaterm'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Icones: precisa vir depois do nerdtree
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ==============================================================================
" 3. VISUAL E TRANSPARENCIA
" ==============================================================================

silent! colorscheme proozz


" --- Detalhes de interface ---
set cursorline
set scrolloff=8
set sidescrolloff=8
set colorcolumn=100
set cmdheight=1
set pumheight=12
set splitright
set splitbelow
set list
set listchars=tab:»\ ,trail:·,extends:›,precedes:‹
let &fillchars = 'eob: ,vert:│,fold:─'

" --- Airline ---
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 0

" --- Indentacao ---
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3c3836'
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['startify', 'nerdtree', 'help', 'floaterm', 'json', 'markdown']

" --- Floaterm com borda arredondada ---
let g:floaterm_borderchars = '─│─│╭╮╯╰'

" --- Rolagem suave ---
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" ==============================================================================
" 4. NERDTREE
" ==============================================================================
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.git$', 'target$', '\.swp$', 'node_modules$']
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 0

nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>E :NERDTreeFind<CR>

" Fecha o Vim se o NERDTree for a unica janela que sobrou
augroup nerdtree_fix
  autocmd!
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" ==============================================================================
" 5. STARTIFY (DASHBOARD)
" ==============================================================================
" ==============================================================================
" 5. DASHBOARD PROPRIO
" ==============================================================================
" ==============================================================================
" 5. DASHBOARD PROPRIO
" ==============================================================================
let g:startify_disable_at_vimenter = 1

let s:title = [
      \ ' ____            _   ',
      \ '|  _ \ _   _ ___| |_ ',
      \ '| |_) | | | / __| __|',
      \ '|  _ <| |_| \__ \ |_ ',
      \ '|_| \_\\__,_|___/\__|',
      \ ]

let s:cmds = [
      \ ['e', 'Explorer',          'NERDTreeToggle'],
      \ ['f', 'Buscar arquivo',    'Files'],
      \ ['g', 'Buscar texto (rg)', 'Rg'],
      \ ['r', 'Recentes',          'History'],
      \ ['p', 'Projetos',          'cd ~/Projectos | Files'],
      \ ['c', 'Editar vimrc',      'edit ~/.vim-rust/vimrc'],
      \ ['l', 'Atualizar plugins', 'PlugUpdate'],
      \ ['q', 'Sair',              'qall'],
      \ ]

let s:rows = 8
let s:rkeys = split('asdwuion', '\zs')

function! s:fit(str, w) abort
  let l:s = a:str
  if strdisplaywidth(l:s) > a:w
    let l:s = strcharpart(l:s, 0, a:w - 1) . '…'
  endif
  return l:s . repeat(' ', max([a:w - strdisplaywidth(l:s), 0]))
endfunction

function! s:center(str, w) abort
  return repeat(' ', max([(a:w - strdisplaywidth(a:str)) / 2, 0])) . a:str
endfunction

function! s:data() abort
  let l:acts = {}
  for l:c in s:cmds
    let l:acts[l:c[0]] = l:c[2]
  endfor

  " Projects: um caminho por linha em ~/.vim-rust/projects.txt
  let l:proj = []
  let l:file = expand('~/.vim-rust/projects.txt')
  let l:i = 1
  if filereadable(l:file)
    for l:p in readfile(l:file)
      let l:p = expand(trim(l:p))
      if empty(l:p) || !isdirectory(l:p)
        continue
      endif
      if l:i > 8
        break
      endif
      call add(l:proj, '  [' . l:i . ']  ' . fnamemodify(l:p, ':t'))
      let l:acts[l:i] = 'cd ' . fnameescape(l:p) . ' | Files'
      let l:i += 1
    endfor
  endif
  if empty(l:proj)
    call add(l:proj, '  (nenhum projeto)')
  endif

  " Recent
  let l:rec = []
  let l:n = 0
  for l:f in v:oldfiles
    if l:n >= len(s:rkeys)
      break
    endif
    let l:f = expand(l:f)
    if !filereadable(l:f) || l:f =~# '^/usr/share/vim' || l:f =~# 'viminfo$'
      continue
    endif
    let l:k = s:rkeys[l:n]
    call add(l:rec, '  [' . l:k . ']  ' . fnamemodify(l:f, ':h:t') . '/' . fnamemodify(l:f, ':t'))
    let l:acts[l:k] = 'edit ' . fnameescape(l:f)
    let l:n += 1
  endfor
  if empty(l:rec)
    call add(l:rec, '  (vazio)')
  endif

  " Keybinds
  let l:keys = map(copy(s:cmds), {_, c -> '  [' . c[0] . ']  ' . c[1]})

  return [l:proj, l:keys, l:rec, l:acts]
endfunction

function! s:render() abort
  let l:W = winwidth(0)
  let l:H = winheight(0)
  let l:cw = min([38, (l:W - 12) / 3])
  let l:sep = ' │ '
  let l:gap = '   '
  let l:ind = repeat(' ', max([(l:W - (3 * l:cw + 6)) / 2, 0]))
  let [l:proj, l:keys, l:rec, l:acts] = s:data()
  let b:dash_actions = l:acts

  let l:lines = repeat([''], max([(l:H - s:rows - 16) / 3, 1]))
  let l:t1 = len(l:lines) + 1
  for l:t in s:title
    call add(l:lines, s:center(l:t, l:W))
  endfor
  let l:t2 = len(l:lines)
  call extend(l:lines, ['', ''])
  call add(l:lines, l:ind . s:fit(s:center('Projects', l:cw), l:cw) . l:gap
        \ . s:fit(s:center('Keybinds', l:cw), l:cw) . l:gap
        \ . s:fit(s:center('Recent', l:cw), l:cw))
  let l:head = len(l:lines)
  call add(l:lines, '')
  for l:i in range(s:rows)
    call add(l:lines, l:ind
          \ . s:fit(get(l:proj, l:i, ''), l:cw) . l:sep
          \ . s:fit(get(l:keys, l:i, ''), l:cw) . l:sep
          \ . s:fit(get(l:rec, l:i, ''), l:cw))
  endfor
  call extend(l:lines, ['', ''])
  call add(l:lines, s:center('Pão é Bom', l:W))
  let l:foot = len(l:lines)

  setlocal modifiable
  silent %delete _
  call setline(1, l:lines)
  setlocal nomodifiable

  syntax clear
  syntax match DashSep /│/
  syntax match DashKey /\[\w\]/
  execute 'syntax match DashTitle /\%>' . (l:t1 - 1) . 'l\%<' . (l:t2 + 1) . 'l\S.*/'
  execute 'syntax match DashHead /\%' . l:head . 'l\S\+/'
  execute 'syntax match DashFoot /\%' . l:foot . 'l\S.*/'
  highlight link DashSep Comment
  highlight link DashKey Number
  highlight link DashTitle Title
  highlight link DashHead Statement
  highlight link DashFoot Comment
  call cursor(1, 1)
endfunction

function! s:run(key) abort
  let l:cmd = get(b:dash_actions, a:key, '')
  if !empty(l:cmd)
    execute l:cmd
  endif
endfunction

function! s:dashboard() abort
  if exists('b:NERDTree')
    wincmd l
  endif
  enew
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
  setlocal nonumber norelativenumber nocursorline nolist signcolumn=no colorcolumn= foldcolumn=0
  setlocal filetype=dashboard
  for l:k in split('12345678', '\zs') + s:rkeys + map(copy(s:cmds), {_, c -> c[0]})
    execute 'nnoremap <buffer><silent><nowait> ' . l:k . ' :call <SID>run("' . l:k . '")<CR>'
  endfor
  call s:render()
endfunction

command! Dashboard call s:dashboard()
nnoremap <silent> <leader>h :Dashboard<CR>

augroup dashboard
  autocmd!
  autocmd VimEnter * nested if argc() == 0 && !&modified && line2byte('$') == -1 | call s:dashboard() | endif
  autocmd VimResized * if &filetype ==# 'dashboard' | call s:render() | endif
augroup END
" ==============================================================================
" 6. RUST E LSP
" ==============================================================================
if executable('rust-analyzer')
  augroup lsp_rust
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'rust-analyzer',
          \ 'cmd': {server_info->['rust-analyzer']},
          \ 'allowlist': ['rust'],
          \ })
  augroup END
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nnoremap <buffer> gd :LspDefinition<CR>
    nnoremap <buffer> K :LspHover<CR>
    nnoremap <buffer> gr :LspReferences<CR>
    nnoremap <buffer> <leader>rn :LspRename<CR>
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Autocomplete: Enter confirma a sugestao
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"

" Formatacao com rustfmt
let g:formatters_rust = ['rustfmt']
nnoremap <leader>fm :Autoformat<CR>
" autocmd BufWritePost *.rs silent Autoformat

" ==============================================================================
" 7. ATALHOS GERAIS E FERRAMENTAS
" ==============================================================================
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nnoremap <leader>gs :Git<CR>
nnoremap <leader>t :FloatermNew --height=0.4 --width=0.8 --wintype=floating<CR>

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
