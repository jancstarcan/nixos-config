local o = vim.opt

o.number = true
o.cursorline = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true

vim.api.nvim_create_user_command("DT", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
