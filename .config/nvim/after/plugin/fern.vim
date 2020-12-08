" lambdalisue/fern-renderer-nerdfont.vim
let g:fern#renderer = "nerdfont"
let g:fern#drawer_width = 27

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

function! s:custom_mappings() abort
  nmap <buffer> <tab> <Plug>(fern-action-choice)
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> o <Plug>(fern-action-open:vsplit)
  nmap <buffer> a <Plug>(fern-action-new-file)
  nmap <buffer> A <Plug>(fern-action-new-dir)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> <C-L> <C-W><C-L>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern set nornu nonu
  autocmd FileType fern set signcolumn=no
  autocmd FileType fern call s:custom_mappings()
augroup END
