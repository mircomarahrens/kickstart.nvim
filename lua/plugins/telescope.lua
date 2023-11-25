-- plugins/telescope.lua:
return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.4',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{'<leader>gf', require("telescope.builtin").git_files, { desc = 'Search [G]it [F]iles' }},
		{'<leader>ff', require("telescope.builtin").find_files, { desc = '[F]ind [F]iles' }},
		{'<leader>ps', function()
			require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") });
		end
		, { desc = '' }}
	},
}
