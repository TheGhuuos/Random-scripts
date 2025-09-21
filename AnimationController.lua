local module = {}

local ActiveTracks = {}

function module:Init()
	
end

function module:PlayExisting(character, name)
	local Humanoid = character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		warn("No Humanoid found for", character.Name)
		return
	end

	local Animator = Humanoid:FindFirstChildOfClass("Animator")
	if not Animator then
		warn("Animator not found for", character.Name)
		return
	end

	local Animation = Humanoid:FindFirstChild("GhuuAnim_" .. name)
	if not Animation then
		warn("Animation 'GhuuAnim_"..name.."' not found in", character.Name)
		return
	end

	local Track = Animator:LoadAnimation(Animation)
	Track:Play()

	ActiveTracks[character] = ActiveTracks[character] or {}
	ActiveTracks[character][name] = Track
	
	return Track
end

function module:Play(character, ID, name)
	if not ID then
		warn("No Animation ID provided")
		return
	end
	if not name then
		warn("No Animation name provided")
		return
	end

	local Humanoid = character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		warn("No Humanoid found for", character.Name)
		return
	end

	local Animator = Humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator")
	if not Animator.Parent then
		Animator.Parent = Humanoid
	end

	local Animation = Humanoid:FindFirstChild("GhuuAnim_"..name)
	if not Animation then
		Animation = Instance.new("Animation")
		Animation.Name = "GhuuAnim_"..name
		Animation.Parent = Humanoid
	end
	Animation.AnimationId = ID

	local Track : AnimationTrack = Animator:LoadAnimation(Animation)
	Track:Play()
	
	ActiveTracks[character] = ActiveTracks[character] or {}
	ActiveTracks[character][name] = Track

	return Track
end

function module:PreloadAnimation(character, ID, name)
	local Humanoid = character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then return end

	local Animator = Humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator")
	if not Animator.Parent then
		Animator.Parent = Humanoid
	end

	local Animation = Humanoid:FindFirstChild("GhuuAnim_"..name)
	if not Animation then
		Animation = Instance.new("Animation")
		Animation.Name = "GhuuAnim_"..name
		Animation.Parent = Humanoid
	end
	Animation.AnimationId = ID

	local Track = Animator:LoadAnimation(Animation)
	return Track
end

function module:Stop(character, name)
	local Tracks = ActiveTracks[character]
	if Tracks and Tracks[name] then
		Tracks[name]:Stop()
		Tracks[name] = nil
	end
end

return module
