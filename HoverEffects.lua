local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Controllers = ReplicatedStorage:WaitForChild("Controllers")

for index, value in Controllers:GetChildren() do
	if not value:IsA("ModuleScript") then continue end
	
	local success, response = pcall(function()
		require(value):Init()
	end)
	if success then
		print("✅", value.Name)
	else
		warn("❌", value.Name, response)
	end
end
