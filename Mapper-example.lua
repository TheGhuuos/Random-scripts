local Colors = {
  ["Red"] = Color3.fromRGB(1,0,0),
  ["Green"] = Color3.fromRGB(0,1,0),
  ["Blue"] = Color3.fromRGB(0,0,1)
}

local function Mapper(value)
  if not Colors[value] then
    print("Error fetching value from table.")
    return
  end

  return Colors[value]
end

print(Mapper("Red")) -- // Will return "1,0,0"
