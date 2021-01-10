-- Modules
--
-- Uncomment to enable
-- Comment to disable
--
-- Restart neovim to see changes

local requirements = {
   -- IMPORTANT
   'packages';
   'options';

   -- MODULES
   -- Tools
   'plugins.statusline';
   'plugins.netrw';
   -- Fuzzy UwU
   'plugins.telescope';
   -- LSP
   'plugins.completion';
   'plugins.treesitter';
   'plugins.lsp';

   -- LOAD AT END
   -- IMPORTANT
   'hotkeys';
   'autopairs';
}

for _,i in ipairs(requirements) do
   require(i)
end

