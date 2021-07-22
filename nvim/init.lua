-- Modules
--
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
   'plugins.netrw';
   --'plugins.orgmode';
   --'plugins.autopairs';
   'plugins.telescope';
   'plugins.git';
   --'plugins.bqf';
   'plugins.which-key';
   'plugins.lir';
   -- LSP
   --'plugins.completion';
   'plugins.treesitter';
   'plugins.lsp';
   -- Looks
   -- LOAD AT END
   'plugins.statusline';
   -- IMPORTANT
   'hotkeys';
   'augroups';
}

for _,i in ipairs(requirements) do
   require(i)
end

