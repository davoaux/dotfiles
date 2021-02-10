" Hide fzf statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=0 showmode ruler

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Match fzf colorscheme
" Alt:
" 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"
" Distilled colorscheme tweaks
" 'pointer': ['fg', 'Exception'],
" 'prompt':  ['fg', 'Conditional'],
" 'border':  ['fg', 'Ignore'],
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Folded'],
  \ 'pointer': ['fg', 'Error'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" 'highlight': 'Todo',
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5, 'highlight': 'Normal', 'border': 'rounded' }}
