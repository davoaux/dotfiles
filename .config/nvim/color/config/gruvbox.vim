let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1

autocmd ColorScheme *
      \ hi LineNr ctermbg=NONE guibg=NONE |
      \ hi SignColumn ctermbg=NONE guibg=NONE |
      \ hi CursorLineNr guifg=#bdae93 guibg=NONE gui=bold |
      \ hi GruvboxRedSign guifg=#fb4934 guibg=NONE gui=bold |
      \ hi GruvboxOrangeSign guifg=#fe8019 guibg=NONE gui=bold |
      \ hi GruvboxBlueSign guifg=#83a598 guibg=NONE gui=bold |
      \ hi GruvboxAquaSign guifg=#8ec07c guibg=NONE gui=bold
