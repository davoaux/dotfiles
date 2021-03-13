" https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? &filetype.' ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let pos = ' %-8(%l:%c%)'
  return '%f %<'.mod.ro.' %= '.fug.' '.ft.'%*'.pos
endfunction
let &statusline = s:statusline_expr()
