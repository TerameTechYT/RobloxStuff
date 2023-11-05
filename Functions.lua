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
