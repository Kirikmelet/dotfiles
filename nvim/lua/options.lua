local vim = vim

--{{{Colorscheme
if (os.getenv("TERM") == "linux") then
   vim.g.colors_name = 'default'
   vim.o.termguicolors = false
else
   vim.g.colors_name = 'gruvbox'
   vim.o.termguicolors = true
end
--}}}

--{{{Options
local nOpts = {
   [vim.o] = { -- Global Options
      number = false;
      expandtab = true;
      sidescroll = 1;
      ruler = true;
      smarttab = true;
      shiftround = true;
      ['smartindent'] = true;
      autoindent = true;
      hidden = true;
      splitbelow = true;
      wrapscan = true;
      softtabstop = 4;
      mouse = 'a';
      report = 2;
      synmaxcol = 0;
      completeopt = 'menuone,noinsert,noselect';
      inccommand = 'split';
      grepprg = 'rg --vimgrep --no-heading --smart-case';
      lazyredraw = true;
   };
   [vim.wo] = { -- Window Options
      cursorline = true;
      foldmethod = 'marker';
   };
   [vim.bo] = { -- Buffer Options
      omnifunc = 'v:lua.vim.lsp.omnifunc';
   };
   [vim.g] = { -- Globals (General)
      mapleader = ' ';
      gruvbox_italic = 1;
      -- Disable apps
      --loaded_gzip = 1;
      --loaded_tar = 1;
      --tarPlugin = 1;
      --zip = 1;
      --zipPlugin = 1;
      --loaded_getscript = 1;
      --loaded_getscriptPlugin = 1;
      --vimball = 1;
      --vimballPlugin = 1;
      --loaded_matchit = 1;
      --loaded_matchparen = 1;
      --loaded_2html_plugin = 1;
      --loaded_logiPat = 1;
      --loaded_rrhelper = 1;
      -- Providers
      loaded_python_provider = 0;
      loaded_python3_provider = 0;
      loaded_node_provider = 0;
      loaded_perl_provider = 0;
      loaded_ruby_provider = 0;
   }
}
--}}}

for scope,arg in pairs(nOpts) do
   for opt,val in pairs(arg) do
      scope[opt] = val
   end
end
