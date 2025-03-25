Table = {
	"A",
	"B",
	496594,
	false
}

function Convert(target)
	local String = ""
	
	for k, v in pairs(target) do
		String = String.. "\n"..tostring(v)
	end
	
	return String
end

print(Convert(Table))
