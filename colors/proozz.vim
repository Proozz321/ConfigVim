" ==============================================================================
" proozz: colorscheme para fundo transparente
" ==============================================================================
highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
let g:colors_name = 'proozz'

" NOCTALIA-START
let s:c = {
      \ 'fg':      '#cdd6f4',
      \ 'fg_dim':  '#a6adc8',
      \ 'muted':   '#7f849c',
      \ 'comment': '#7f849c',
      \ 'surface': '#313244',
      \ 'overlay': '#45475a',
      \ 'accent':  '#89b4fa',
      \ 'red':     '#f38ba8',
      \ 'orange':  '#fab387',
      \ 'yellow':  '#f9e2af',
      \ 'green':   '#a6e3a1',
      \ 'teal':    '#94e2d5',
      \ 'blue':    '#89b4fa',
      \ 'purple':  '#cba6f7',
      \ 'pink':    '#f5c2e7',
      \ }
" NOCTALIA-END

function! s:hi(group, fg, bg, style) abort
  let l:fg = a:fg ==# 'NONE' ? 'NONE' : get(s:c, a:fg, a:fg)
  let l:bg = a:bg ==# 'NONE' ? 'NONE' : get(s:c, a:bg, a:bg)
  execute 'highlight ' . a:group
        \ . ' guifg=' . l:fg . ' guibg=' . l:bg
        \ . ' gui=' . a:style . ' cterm=' . a:style
endfunction

" --- Base e transparencia ---
call s:hi('Normal',       'fg',      'NONE', 'NONE')
call s:hi('NonText',      'overlay', 'NONE', 'NONE')
call s:hi('EndOfBuffer',  'NONE',    'NONE', 'NONE')
call s:hi('SpecialKey',   'overlay', 'NONE', 'NONE')
call s:hi('SignColumn',   'NONE',    'NONE', 'NONE')
call s:hi('LineNr',       'muted',   'NONE', 'NONE')
call s:hi('CursorLineNr', 'yellow',  'NONE', 'bold')
call s:hi('CursorLine',   'NONE',    'surface', 'NONE')
call s:hi('ColorColumn',  'NONE',    'surface', 'NONE')
call s:hi('VertSplit',    'overlay', 'NONE', 'NONE')
call s:hi('Folded',       'muted',   'NONE', 'italic')
call s:hi('FoldColumn',   'muted',   'NONE', 'NONE')
call s:hi('MatchParen',   'orange',  'overlay', 'bold')
call s:hi('Visual',       'NONE',    'overlay', 'NONE')
call s:hi('Search',       'surface', 'yellow', 'NONE')
call s:hi('IncSearch',    'surface', 'orange', 'bold')
call s:hi('Directory',    'blue',    'NONE', 'NONE')
call s:hi('Title',        'accent',  'NONE', 'bold')
call s:hi('ErrorMsg',     'red',     'NONE', 'bold')
call s:hi('WarningMsg',   'yellow',  'NONE', 'NONE')
call s:hi('ModeMsg',      'green',   'NONE', 'bold')
call s:hi('MoreMsg',      'green',   'NONE', 'NONE')
call s:hi('Question',     'teal',    'NONE', 'NONE')

" --- Menus, barras ---
call s:hi('Pmenu',        'fg',      'surface', 'NONE')
call s:hi('PmenuSel',     'surface', 'accent',  'bold')
call s:hi('PmenuSbar',    'NONE',    'overlay', 'NONE')
call s:hi('PmenuThumb',   'NONE',    'muted',   'NONE')
call s:hi('WildMenu',     'surface', 'accent',  'bold')
call s:hi('StatusLine',   'fg',      'NONE', 'NONE')
call s:hi('StatusLineNC', 'muted',   'NONE', 'NONE')
call s:hi('TabLine',      'muted',   'NONE', 'NONE')
call s:hi('TabLineSel',   'accent',  'NONE', 'bold')
call s:hi('TabLineFill',  'NONE',    'NONE', 'NONE')

" --- Sintaxe ---
call s:hi('Comment',      'comment', 'NONE', 'italic')
call s:hi('Todo',         'yellow',  'NONE', 'bold')
call s:hi('Constant',     'orange',  'NONE', 'NONE')
call s:hi('String',       'green',   'NONE', 'NONE')
call s:hi('Character',    'green',   'NONE', 'NONE')
call s:hi('Number',       'orange',  'NONE', 'NONE')
call s:hi('Boolean',      'orange',  'NONE', 'bold')
call s:hi('Float',        'orange',  'NONE', 'NONE')
call s:hi('Identifier',   'fg',      'NONE', 'NONE')
call s:hi('Function',     'blue',    'NONE', 'NONE')
call s:hi('Statement',    'purple',  'NONE', 'NONE')
call s:hi('Conditional',  'purple',  'NONE', 'NONE')
call s:hi('Repeat',       'purple',  'NONE', 'NONE')
call s:hi('Label',        'purple',  'NONE', 'NONE')
call s:hi('Keyword',      'purple',  'NONE', 'NONE')
call s:hi('Exception',    'red',     'NONE', 'NONE')
call s:hi('Operator',     'teal',    'NONE', 'NONE')
call s:hi('PreProc',      'pink',    'NONE', 'NONE')
call s:hi('Include',      'pink',    'NONE', 'NONE')
call s:hi('Define',       'pink',    'NONE', 'NONE')
call s:hi('Macro',        'teal',    'NONE', 'bold')
call s:hi('Type',         'yellow',  'NONE', 'NONE')
call s:hi('StorageClass', 'purple',  'NONE', 'NONE')
call s:hi('Structure',    'yellow',  'NONE', 'NONE')
call s:hi('Typedef',      'yellow',  'NONE', 'NONE')
call s:hi('Special',      'teal',    'NONE', 'NONE')
call s:hi('SpecialChar',  'pink',    'NONE', 'NONE')
call s:hi('Delimiter',    'fg_dim',  'NONE', 'NONE')
call s:hi('Error',        'red',     'NONE', 'bold')

" --- Rust ---
call s:hi('rustSelf',      'red',    'NONE', 'italic')
call s:hi('rustLifetime',  'orange', 'NONE', 'italic')
call s:hi('rustAttribute', 'pink',   'NONE', 'NONE')
call s:hi('rustDerive',    'pink',   'NONE', 'NONE')
call s:hi('rustModPath',   'fg_dim', 'NONE', 'NONE')
call s:hi('rustSigil',     'teal',   'NONE', 'NONE')
call s:hi('rustMacro',     'teal',   'NONE', 'bold')
call s:hi('rustEnumVariant', 'orange', 'NONE', 'NONE')
call s:hi('rustFuncCall',  'blue',   'NONE', 'NONE')

" --- Diff e Git (fugitive) ---
call s:hi('DiffAdd',      'green',   'surface', 'NONE')
call s:hi('DiffChange',   'yellow',  'surface', 'NONE')
call s:hi('DiffDelete',   'red',     'surface', 'NONE')
call s:hi('DiffText',     'blue',    'overlay', 'bold')

" --- NERDTree ---
call s:hi('NERDTreeDir',        'blue',   'NONE', 'NONE')
call s:hi('NERDTreeDirSlash',   'muted',  'NONE', 'NONE')
call s:hi('NERDTreeOpenable',   'accent', 'NONE', 'NONE')
call s:hi('NERDTreeClosable',   'accent', 'NONE', 'NONE')
call s:hi('NERDTreeFile',       'fg',     'NONE', 'NONE')
call s:hi('NERDTreeExecFile',   'green',  'NONE', 'NONE')
call s:hi('NERDTreeCWD',        'accent', 'NONE', 'bold')
call s:hi('NERDTreeHelp',       'muted',  'NONE', 'italic')

" --- Startify ---
call s:hi('StartifyHeader',  'accent', 'NONE', 'bold')
call s:hi('StartifySection', 'yellow', 'NONE', 'bold')
call s:hi('StartifyNumber',  'orange', 'NONE', 'NONE')
call s:hi('StartifyBracket', 'muted',  'NONE', 'NONE')
call s:hi('StartifyPath',    'muted',  'NONE', 'NONE')
call s:hi('StartifySlash',   'muted',  'NONE', 'NONE')
call s:hi('StartifyFile',    'fg',     'NONE', 'bold')
call s:hi('StartifySpecial', 'muted',  'NONE', 'NONE')

" --- LSP (diagnosticos) ---
execute 'highlight LspErrorText   guifg=' . s:c.red    . ' guibg=NONE'
execute 'highlight LspWarningText guifg=' . s:c.yellow . ' guibg=NONE'
execute 'highlight LspInformationText guifg=' . s:c.blue . ' guibg=NONE'
execute 'highlight LspHintText    guifg=' . s:c.teal   . ' guibg=NONE'
execute 'highlight LspErrorHighlight   gui=undercurl guisp=' . s:c.red
execute 'highlight LspWarningHighlight gui=undercurl guisp=' . s:c.yellow
