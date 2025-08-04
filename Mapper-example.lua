local Colors = {
	["Red"] = Color3.fromRGB(255,0,0),
	["Green"] = Color3.fromRGB(0,255,0),
	["Blue"] = Color3.fromRGB(0,0,255)
}

local function Mapper(value)
	if not Colors[value] then
		print("Error fetching value from table.")
		return
	end

	return Colors[value]
end

print(Mapper("Red")) -- // Will return "1,0,0"
print(Colors["Red"]) -- // Same thing

workspace.Baseplate.Color = Mapper("Red") -- // Makes the baseplate red
workspace.Baseplate.Color = Colors["Red"] -- // Same thing
