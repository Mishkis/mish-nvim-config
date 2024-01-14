vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		local charToMatch = string.lower(string.sub(vim.v.event.new_mode, 1, 1))
		local matchingString = {
			["n"] = "NORMAL",
			["v"] = "VISUAL",
			["\22"]= "VISUAL",
			["s"] = "SELECT",
			["\19"]= "SELECT",
			["i"] = "INSERT",
			["r"] = "REPLACE",
			["c"] = "COMMAND",
			["t"] = "TERMINAL",
		}
        vim.opt.stl="%#WinMode# %{winnr()} %-8.("..matchingString[charToMatch].."%) %#WinModeTrans#│%#WinDir# %F %m%=%-4.L %#WinModeTrans#│%#WinMode#   %-3.l%-3.(:%)%-3.c"
	end
})
