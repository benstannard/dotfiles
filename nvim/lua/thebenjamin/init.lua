require("thebenjamin.remap")
vim.cmd [[
  highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
]]
