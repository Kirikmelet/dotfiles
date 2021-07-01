local vim = vim

require('func.packadder').packadd({'snap'})

local snap = require('snap')

snap.maps {
   {"<leader>fs", snap.config.vimgrep {}};
   {"<leader>bf", snap.config.file {
      producer = snap.get'consumer.fzf'(snap.get'producer.ripgrep.file')}};
   {"<leader>bb", snap.config.file {producer = 'vim.buffer'}};
}
