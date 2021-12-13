local plugman = require('func/packadder')

plugman.packadd({'telescope.nvim', 'plenary.nvim', 'popup.nvim'})


require('telescope').setup{
   extensions = {
      fzf = {
         fuzzy = true;
         override_generic_sorter = true;
         override_file_sorter = true;
         case_mode = 'smart_case';
      }
   }
}

require('telescope').load_extension('fzf')
