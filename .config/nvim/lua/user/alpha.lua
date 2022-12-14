local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

	[[              .,-:;//;:=,]],
	[[          . :H@@@MM@M#H/.,+%;,]],
	[[       ,/X+ +M@@M@MM%=,-%HMMM@X/,]],
	[[     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-]],
	[[    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.]],
	[[  ,%MM@@MH ,@%=             .---=-=:=,.]],
	[[  =@#@@@MX.,                -%HX$$%%%:;]],
	[[ =-./@M@M$                   .;@MMMM@MM:]],
	[[ X@/ -$MM/                    . +MM@@@M$]],
	[[,@M@H: :@:                    . =X#@@@@-]],
	[[,@@@MMX, .                    /H- ;@M@M=]],
	[[.H@@@@M@+,                    %MM+..%#$.]],
	[[ /MMMM@MMH/.                  XM@MH; =;]],
	[[  /%+%$XHH@$=              , .H@@@@MX,]],
	[[   .=--------.           -%H.,@@@@@MX,]],
	[[   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.]],
	[[     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=]],
	[[       =%@M@M#@$-.=$@MM@@@M; %M%=]],
	[[         ,:+$+-,/H#MMMMMMM@= =,]],
	[[               =++%%%%+/:-.]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
