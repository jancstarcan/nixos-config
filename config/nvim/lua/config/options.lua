local o = vim.opt

o.number = true
o.cursorline = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.clipboard = "unnamedplus"

vim.cmd([[
  hi NotifyBackground guibg=#282828 guifg=#ebdbb2
  hi NotifyERRORBorder guibg=#282828 guifg=#fb4934
  hi NotifyWARNBorder guibg=#282828 guifg=#fabd2f
  hi NotifyINFOBorder guibg=#282828 guifg=#83a598
  hi NotifyDEBUGBorder guibg=#282828 guifg=#8ec07c
  hi NotifyTRACEBorder guibg=#282828 guifg=#d3869b

  hi MasonNormal guibg=#282828
  hi MasonBorder guibg=#282828
  hi MasonWindow guibg=#282828

  hi LazyNormal guibg=#282828
  hi LazyFloat guibg=#282828
  hi LazyBorder guibg=#282828

  hi NoiceCmdlinePopup guibg=#282828
  hi NoiceCmdlinePopupBorder guibg=#282828 guifg=#ebdbb2
]])

vim.api.nvim_create_user_command("DT", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
