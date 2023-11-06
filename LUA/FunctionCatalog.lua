--\\ VINUS FUNCTION CATALOG //--

local FunctionCatalog = {
    Time = {

	};
    Number = {
		
	};
    String = {

	};
    Boolean = {

	};
	Platform = {

	};
    CurrentVersion = "1";
	VersionURL = "raw.githubusercontent.com/TerameTechYT/RobloxStuff/development/VERSION";
}

--\\ Time Utils //--

function FunctionCatalog.Time:ToSeconds(milliseconds:number):number
	assert(milliseconds ~= 0, "`function ToSeconds(milliseconds)`: Argument `milliseconds` is equal to 0!")
	return milliseconds / 1000
end

function FunctionCatalog.Time:ToMilliseconds(seconds:number):number
	assert(seconds ~= 0, "`function ToMilliseconds(seconds)`: Argument `seconds` is equal to 0!")
	return seconds * 1000
end

--\\ Number Utils //--

function FunctionCatalog.Number:Lerp(a:number, b:number, t:number):number
	return a + (b - a) * t
end

function FunctionCatalog.Number:IsNumberEven(number:number):number
	assert(number ~= 0, "`function IsNumberEven(number)`: Argument `number` is equal to 0!")
	return math.floor(number) % 2 == 0
end

function FunctionCatalog.Number:IsNumberOdd(number):number
	assert(number ~= 0, "`Number IsNumberOdd(number)`: Argument `number` is equal to 0!")
	return math.floor(number) % 2 ~= 0
end

function FunctionCatalog.Number:RoundToNearest(number:number, roundto:number):number
	assert(number ~= 0, "`function RoundToNearest(number, roundto)`: Argument `roundto` is equal to 0!")
	local x = number + (roundto / 2)
	return (x - (x % roundto))
end

function FunctionCatalog.Number:RoundToDecimal(number:number, decimals:number):number
	assert(number ~= 0, "`function RoundToDecimal(number, decimals)`: Argument `decimals` is equal to 0!")
	local x = 10 ^ decimals
	return math.round(number * x) / x
end

--\\ String Utils //--

function FunctionCatalog.String:DeleteLastCharacter(string:string):string
	assert(string:len() ~= 0, "`function DeleteLastCharacter(string)`: Argument `string` is empty!")
	return string:sub(0, string:len() - 1)
end

function FunctionCatalog.String:String2Vector(string:string, seperator:string):string
	assert(string:len() ~= 0, "`function String2Vector(string, seperator)`: Argument `string` is empty!")
	assert(string:len() ~= 0, "`function String2Vector(string, seperator)`: Argument `seperator` is empty!")
	local x = tonumber(string.split(string, seperator)[1]) or 0
	local y = tonumber(string.split(string, seperator)[2]) or 0
	local z = tonumber(string.split(string, seperator)[3]) or 0
	return Vector3.new(x,y,z)
end

--\\ Boolean Utils //--

function FunctionCatalog.Boolean:ToBoolean(any:any):boolean
	assert(any ~= nil, "`function ToBoolean(any)`: Argument `any` is nil!")
	if (typeof(any) == "string" and any == "true") or (typeof(any) == "number" and any == 1) then return true end
	return false
end

--\\ Platform Utils //--

function FunctionCatalog.Platform:GetPlatform():string
	local UIS = game:GetService("UserInputService")
	assert(game:GetService("RunService"):IsClient(), "`function GetPlatform()`: You cannot get the platform of the server!")
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TouchGui") and game:GetService("Players").LocalPlayer.PlayerGui.TouchGui:IsA("ScreenGui") then return "Mobile" end
	if UIS.GamepadEnabled then return "Console" end
	if UIS.VREnabled then return "VR" end
	if UIS.KeyboardEnabled then return "Computer" end
	return "Unknown"
end

function FunctionCatalog.CheckForUpdates()
	local HTTP = game:GetService("HttpService")
	local NewVersion = HTTP:GetAsync(FunctionCatalog.VersionURL)

	if NewVersion > FunctionCatalog.CurrentVersion then
		warn("!!! -- NEW UPDATE AVAILABLE FOR FUNCTION CATALOG -- !!!")
	else
		print("Function catalog up-to-date!")
	end

	return FunctionCatalog
end

return FunctionCatalog.CheckForUpdates()