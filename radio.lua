local gpu = require("component").gpu
local w,h = gpu.getResolution()
fm = components.openfm_radio
gpu.fill(1,1,w,h," ")
function clear(color_bg, color_fg)
	local w,h = gpu.getResolution()
	local oldbg = gpu.getBackground()
	local oldfg = gpu.getForeground()
	gpu.setBackground(color_bg)
	gpu.setForeground(color_fg)
	gpu.fill(1,1,w,h, " ")
	gpu.setBackground(oldbg)
	gpu.setForeground(oldfg)
end
local unicode = require("unicode")
function drawButton(x,y,bg,fg,text)
	local oldbg = gpu.getBackground()
	local oldfg = gpu.getForeground()
	gpu.setBackground(color_bg)
	gpu.setForeground(color_fg)
	gpu.set(x,y,text)
	gpu.setBackground(oldbg)
	gpu.setForeground(oldfg)
	enddrawButton(2,2,0xff0000, 0x00ff00, "Play")
	event.pullwhile true do
	local name, add, xP, yP, b = event.pull("touch")
	if name ~= nil then
		if xP >= 2 and yP = 2 and xP <= 2 + unicode.len("Play") then
			gpu.set(1,20, "Song 'Was wollen wir trinken' is playing")
			fm.setURL("http://dl2.mp3party.net/download/2005805")
			fm.start()
			fm.volUp()
		end
	end
end