local cmd = vim.cmd

cmd([[
autocmd! filetype c,cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd! filetype markdown,text set nonu nornu signcolumn=no textwidth=150
autocmd! filetype json setlocal filetype=jsonc
autocmd! filetype zsh setlocal filetype=sh
autocmd! bufnewfile,bufread *.jbuilder setlocal filetype=ruby
autocmd! bufnewfile,bufread *.tsx setlocal filetype=typescript.tsx

" completion-nvim 
" autocmd! BufEnter * lua require'completion'.on_attach()
]])

cmd([[
command! Vimrc :e $MYVIMRC
command! Stack :e $HOME/workspace/STACK.md

command! WQ wq
command! Wq wq
command! W w
command! Q q
]])

