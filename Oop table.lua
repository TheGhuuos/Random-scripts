local module = {}
module.__index = module

function module.Create(details)
	local self = setmetatable({}, module)

	self.PrimaryKey = details or "Unknown"
	self[details] = "Value for "..details

	return self
end

function module:Insert(details)
	self[details] = details
end

function module:Output(Object)
	print("Primary key: "..self.PrimaryKey)
	for _, value in pairs(self) do
		if value == "PrimaryKey" then continue end
		
		print(value)
	end
end

return module
