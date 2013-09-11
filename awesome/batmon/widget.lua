local wibox = require("wibox")

local batwidget = wibox.widget.textbox()

function readnumber(path)
	local f = io.open(path,"r")
	return tonumber(f:read("*number"))
end

function batwidget.updateDisplay()
	local timeleft = readnumber("/sys/class/power_supply/sbs-4-000b/time_to_empty_avg")
	timeleft = timeleft / 60
	local percent = readnumber("/sys/class/power_supply/sbs-4-000b/charge_now") / readnumber("/sys/class/power_supply/sbs-4-000b/charge_full")
	local timestr = ""
	if timeleft > 2000 then
		timestr = "charging"
	else
		timestr = string.format(timeleft .. "mins")
	end

	batwidget:set_text("Batt: " .. string.format("%.2f",(100 * percent)) .. "% " .. timestr)
end

battimer = timer({timeout = 10})
battimer:connect_signal("timeout", batwidget.updateDisplay)
battimer:start()

batwidget.updateDisplay()
return batwidget
