local wait = function(n)
	n = n or 0
	assert(typeof(n) == "number", "Argument 1 must be a number")
	local s = tick()
	repeat game:GetService("RunService").Stepped:Wait() until tick() - s >= n
	return tick() - s
end

function ToSeconds(milliseconds)
	return milliseconds/1000
end

function IsNumberEven(number)
	return math.floor(number) % 2 == 0 
end

function IsNumberOdd(number)
	return math.floor(number) % 2 ~= 0 
end

function RoundToNearest(number, roundto)
	local x = number + (roundto / 2)
	return (x - (x % roundto))
end

function RoundToDecimal(number, decimals) 
	local tenToDecimals = 10 ^ decimals
	return math.round(number * tenToDecimals) / tenToDecimals
end

function GetPlatform()
	local UIS = game:GetService("UserInputService")
	if player.PlayerGui:FindFirstChild("TouchGui") and player.PlayerGui.TouchGui:IsA("ScreenGui") then return "Mobile" end
	if UIS.GamepadEnabled then return "Console" end
	if UIS.VREnabled then return "VR" end
	return "Computer"
end
