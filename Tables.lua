
local Numbers = {1,2,3,4,5}
table.insert(Numbers, 6)
print(Numbers) -- 1,2,3,4,5,6
print(#Numbers) -- 6, because # returns the length
------------------------------------------------
local Names = {"a","b","c", "f"}
table.remove(Names, table.find(Names, "f"))
------------------------------------------------
-- Dictonary, basically SOMETHING is SOMETHING
local Ages = {
    ["Alpha"] = 15,
    ["Bravo"] = 55
}

local MyName = "Bob"
if Ages[MyName] >= 18 then
    print("You are old enough to drive")
else
    print("You can not drive a car")
end
------------------------------------------------
-- Nested dictonaries
local People = { 
    ["mr b"] = {
        Name = "Bob",
        Age = 61,
        Occupation = "Government"
    },
    ["thug"] = {
        Name = "ererer",
        Age = 1065,
        Occupation = "None"
    }
}

for index, value in pairs(People) do
    if value.Occupation == "Government" then
        print(value.Name.. " is a government official")
    else
        print("Useless")
    end
end
