function ToSeconds(milliseconds:number):number
	assert(milliseconds ~= 0, "`function ToSeconds(milliseconds)`: Argument `milliseconds` is equal to 0!")
	return milliseconds / 1000
end

function ToMilliseconds(seconds:number):number
	assert(seconds ~= 0, "`function ToMilliseconds(seconds)`: Argument `seconds` is equal to 0!")
	return seconds * 1000
end

function IsNumberEven(number:number):number
	assert(number ~= 0, "`function IsNumberEven(number)`: Argument `number` is equal to 0!")
	return math.floor(number) % 2 == 0
end

function IsNumberOdd(number):number
	assert(number ~= 0, "`function IsNumberOdd(number)`: Argument `number` is equal to 0!")
	return math.floor(number) % 2 ~= 0
end

function RoundToNearest(number:number, roundto:number):number
	assert(number ~= 0, "`function RoundToNearest(number, roundto)`: Argument `roundto` is equal to 0!")
	local x = number + (roundto / 2)
	return (x - (x % roundto))
end

function RoundToDecimal(number:number, decimals:number):number
	assert(number ~= 0, "`function RoundToDecimal(number, decimals)`: Argument `decimals` is equal to 0!")
	local x = 10 ^ decimals
	return math.round(number * x) / x
end

function GetPlatform():string
	local UIS = game:GetService("UserInputService")
	assert(game:GetService("RunService"):IsClient(), "`function GetPlatform()`: You cannot get the platform of the server!")
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TouchGui") and game:GetService("Players").LocalPlayer.PlayerGui.TouchGui:IsA("ScreenGui") then return "Mobile" end
	if UIS.GamepadEnabled then return "Console" end
	if UIS.VREnabled then return "VR" end
	if UIS.KeyboardEnabled then return "Computer" end
	return "Unknown"
end
