  vim.cmd([[
      autocmd Filetype php setlocal textwidth=80
      autocmd Filetype php setlocal colorcolumn=+1,+41
      autocmd Filetype php :iabbrev ret return
      autocmd Filetype php :iabbrev pub public
      autocmd Filetype php :iabbrev pri private
      autocmd Filetype php :iabbrev pro protected
      autocmd Filetype php :iabbrev con const
      autocmd Filetype php :iabbrev thr throw
      autocmd Filetype php :iabbrev impl implements
      autocmd Filetype php :iabbrev ext extends
      autocmd Filetype php :iabbrev fun function
      autocmd Filetype php :iabbrev str string
      autocmd Filetype php :iabbrev arr array
  ]])
