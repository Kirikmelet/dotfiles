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
   'plugins.orgmode';
   'plugins.autopairs';
   'plugins.git';
   'plugins.bqf';
   'plugins.which-key';
   -- Fuzzy UwU
   --'plugins.telescope';
   'plugins.snap';
   -- LSP
   'plugins.completion';
   'plugins.treesitter';
   'plugins.lsp';
   -- LOAD AT END

   -- IMPORTANT
   --'hotkeys';
   'autopairs';
}

for _,i in ipairs(requirements) do
   require(i)
end

