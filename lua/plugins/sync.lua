return {
	{
		"dravndal/vim-arsync",
		event = "BufRead",
		cond = function()
			return vim.fn.filereadable(vim.fn.getcwd() .. "/.vim-arsync") == 1
		end,
	},
}
