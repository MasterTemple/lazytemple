-- -- [[ Fuzzy Finder (files, lsp, etc) ]]
-- --
-- -- Telescope is a fuzzy finder that comes with a lot of different things that
-- -- it can fuzzy find! It's more than just a "file finder", it can search
-- -- many different aspects of Neovim, your workspace, LSP, and more!
-- --
-- -- There are lots of other alternative pickers (like snacks.picker, or fzf-lua)
-- -- so feel free to experiment and see what you like!
-- --
-- -- The easiest way to use Telescope, is to start by doing something like:
-- --  :Telescope help_tags
-- --
-- -- After running this command, a window will open up and you're able to
-- -- type in the prompt window. You'll see a list of `help_tags` options and
-- -- a corresponding preview of the help.
-- --
-- -- Two important keymaps to use while in Telescope are:
-- --  - Insert mode: <c-/>
-- --  - Normal mode: ?
-- --
-- -- This opens a window that shows you all of the keymaps for the current
-- -- Telescope picker. This is really useful to discover what Telescope can
-- -- do as well as how to actually do it!

-- ---@type (string|vim.pack.Spec)[]
-- local telescope_plugins = {
--   -- Will not longer be need after https://github.com/nvim-telescope/telescope.nvim/pull/3647
--   {
--     "nvim-lua/plenary.nvim",
--     version = "74b06c6",
--   },
--   {
--     "nvim-telescope/telescope.nvim",
--     version = "7d32479",
--     -- lazy = false,
--   },
--   {
--     "nvim-telescope/telescope-ui-select.nvim",
--     version = "6e51d7d",
--   },
-- }
-- if vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1 then
--   table.insert(telescope_plugins, {
--     "nvim-telescope/telescope-fzf-native.nvim",
--     version = "b25b749",
--   })
-- end
--
-- -- NOTE: You can install multiple plugins at once
--
-- -- See `:help telescope` and `:help telescope.setup()`
-- require("telescope").setup({
--   lazy = false,
--   -- You can put your default mappings / updates / etc. in here
--   --  All the info you're looking for is in `:help telescope.setup()`
--   --
--   -- defaults = {
--   --   mappings = {
--   --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
--   --   },
--   -- },
--   -- pickers = {}
--   extensions = {
--     ["ui-select"] = { require("telescope.themes").get_dropdown() },
--   },
-- })
--
-- -- Enable Telescope extensions if they are installed
-- -- pcall(require("telescope").load_extension, "fzf")
-- require("telescope").load_extension("fzf") -- I want to know that fzf-native works
-- pcall(require("telescope").load_extension, "ui-select")
--
-- -- See `:help telescope.builtin`
-- local builtin = require("telescope.builtin")
--
-- -- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
-- -- If you later switch picker plugins, this is where to update these mappings.
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
--   callback = function(event)
--     local buf = event.buf
--
--     -- Find references for the word under your cursor.
--     -- vim.keymap.set("n", "<leader>lrf", builtin.lsp_references, { buffer = buf, desc = "[L]SP [R]e[F]erences" })
--     -- TODO: Should I make these conform to `L` as the first key?
--     vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { buffer = buf, desc = "[S]each [R]eferences (LSP)" })
--
--     vim.keymap.set("n", "gd", builtin.lsp_references, { buffer = buf, desc = "[G]oto [D]efinition (LSP)" })
--     vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype (LSP)" })
--
--     vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics (LSP)" })
--
--     -- Jump to the implementation of the word under your cursor.
--     -- Useful when your language has ways of declaring types without an actual implementation.
--     vim.keymap.set("n", "<leader>lim", builtin.lsp_implementations, { buffer = buf, desc = "[L]SP [Im]plementation" })
--
--     -- TODO: Technically not a telescope keybind
--     -- lid: LSP Info Diagnostic?
--     vim.keymap.set(
--       "n",
--       "<leader>lfd",
--       vim.diagnostic.open_float,
--       { buffer = buf, desc = "[L]SP [F]loating [D]iagnostic" }
--     )
--
--     -- Jump to the definition of the word under your cursor.
--     -- This is where a variable was first declared, or where a function is defined, etc.
--     -- To jump back, press <C-t>.
--     vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = buf, desc = "[L]SP [D]e[F]initions" })
--     vim.keymap.set("n", "<leader>ldf", builtin.lsp_definitions, { buffer = buf, desc = "[L]SP [D]e[F]initions" })
--
--     -- Jump to the type of the word under your cursor.
--     -- Useful when you're not sure what type a variable is and you want to see
--     -- the definition of its *type*, not where it was *defined*.
--     vim.keymap.set(
--       "n",
--       "<leader>ldt",
--       builtin.lsp_type_definitions,
--       { buffer = buf, desc = "[L]SP [D]efinition: [T]ype" }
--     )
--
--     -- Fuzzy find all the symbols in your current document.
--     -- Symbols are things like variables, functions, types, etc.
--     vim.keymap.set(
--       "n",
--       "<leader>lsd",
--       builtin.lsp_document_symbols,
--       { buffer = buf, desc = "[L]SP [S]ymbols: [D]ocument" }
--     )
--
--     -- Fuzzy find all the symbols in your current workspace.
--     -- Similar to document symbols, except searches over your entire project.
--     vim.keymap.set(
--       "n",
--       -- NOTE: I don't need lws for now, but lds is really easy to type; I could try lw
--       "<leader>lsw",
--       builtin.lsp_dynamic_workspace_symbols,
--       { buffer = buf, desc = "[L]SP [S]ymbols: [W]orkspace" }
--     )
--   end,
-- })
--
-- -- Meta Searches
-- vim.keymap.set("n", "<leader>;", builtin.builtin, { desc = "Open Telescope" })
-- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
-- vim.keymap.set("n", "<leader>sp", builtin.resume, { desc = "[S]earch [P]revious" })
-- vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
--
-- -- Locations
-- vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
-- vim.keymap.set("n", "<leader><tab>", builtin.buffers, { desc = "[Tab] Find existing buffers" })
--
-- -- Files
-- vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
-- vim.keymap.set("n", "<leader>sa", function()
--   builtin.find_files({ follow = true, no_ignore = true, hidden = true })
-- end, { desc = "[S]earch [A]ll Files" })
-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
--
-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
-- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
--
-- -- Current file
-- vim.keymap.set("n", "<leader><leader>", function()
--   builtin.current_buffer_fuzzy_find({
--     layout_config = {
--       width = 0.8,
--       height = 0.6,
--     },
--     previewer = false,
--   })
-- end, { desc = "Fuzzily search in current buffer" })
--
-- -- Open Files
-- vim.keymap.set("n", "<leader>se", function()
--   builtin.live_grep({
--     grep_open_files = true,
--     prompt_title = "Live Grep in Open Files",
--   })
-- end, { desc = "[S]earch Open Files in [E]ditor" })
--
-- -- Neovim config
-- vim.keymap.set("n", "<leader>sn", function()
--   builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "[S]earch [N]eovim files" })
--
-- -- Personal
-- if vim.g.personal then
--   -- Obsidian
--   vim.keymap.set("n", "<leader>so", function()
--     builtin.find_files({ cwd = "~/Obsidian/" })
--   end, { desc = "[S]earch [O]bsidian files" })
-- end

-- return telescope_plugins

return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		  {
			"nvim-telescope/telescope-ui-select.nvim",
			-- version = "6e51d7d",
		  },
    },
	opts = {
	  extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	  },
	},
	keys = {
		-- LSP
		{ "gd", "<cmd>Telescope lsp_references<cr>", desc = "[G]oto [D]efinition (LSP)" },
		{ "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "[G]oto [T]ype (LSP)" },
		{ "<leader>sr", "<cmd>Telescope lsp_references<cr>", desc = "[S]each [R]eferences (LSP)" },

		{ "<leader>sdd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics (LSP)" },
		{
			'<leader>sde',
			function()
			  require('telescope.builtin').diagnostics({
				severity = vim.diagnostic.severity.ERROR
			  })
			end,
			desc = '[S]earch [D]iagnostics [E]rrors'
		},
		{
			'<leader>sdw',
			function()
			  require('telescope.builtin').diagnostics({
				severity = vim.diagnostic.severity.WARN
			  })
			end,
			desc = '[S]earch [D]iagnostics [W]arnings'
		},


		{ "<leader>lim", "<cmd>Telescope lsp_implementations<cr>", desc = "[L]SP [Im]plementation" },
		{ "<leader>lfd", vim.diagnostic.open_float, desc = "[L]SP [F]loating [D]iagnostic" },
		{ "<leader>ldf", "<cmd>Telescope lsp_definitions<cr>", desc = "[L]SP [D]e[F]initions" },
		{ "<leader>ldt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "[L]SP [D]efinition: [T]ype" },
		{ "<leader>lsd", "<cmd>Telescope lsp_document_symbols<cr>", desc = "[L]SP [S]ymbols: [D]ocument" },
		{ "<leader>lsw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "[L]SP [S]ymbols: [W]orkspace" },
		-- Meta Searches
		{ "<leader>;", "<cmd>Telescope builtin<cr>", desc = "Open Telescope" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
		{ "<leader>sp", "<cmd>Telescope resume<cr>", desc = "[S]earch [P]revious" },
		{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "[S]earch [C]ommands" },
		-- Locations
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "[S]earch [M]arks" },
		{ "<leader><tab>", "<cmd>Telescope buffers<cr>", desc = "[Tab] Find existing buffers" },
		-- Files
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
		{
		  "<leader>sa",
		  function()
			require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
		  end,
		  desc = "[S]earch [A]ll Files",
		},
		{ "<leader>s.", "<cmd>Telescope oldfiles<cr>", desc = "[S]earch Recent Files ('.' for repeat)" },
		-- { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },

		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
		-- Current file
		{
		  "<leader><leader>",
		  function()
			require("telescope.builtin").current_buffer_fuzzy_find({
				layout_config = {
				  width = 0.8,
				  height = 0.6,
				},
				previewer = false,
			})
		  end,
		  desc = "Fuzzily search in current buffer",
		},
		-- Open Files
		{
			"<leader>se",
			function()
			  require("telescope.builtin").live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			  })
			end,
			desc = "[S]earch Open Files in [E]ditor"
		},

		-- Neovim config
		{ "<leader>sn", function()
		  require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end, desc = "[S]earch [N]eovim files" },

		-- Obsidian
		{ "<leader>so", function()
		  require("telescope.builtin").find_files({ cwd = "/home/dgmastertemple/Dropbox/Apps/remotely-save/MasterTemple/" })
		end, desc = "[S]earch [O]bsidian files" },
	}
}
