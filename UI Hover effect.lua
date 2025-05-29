local TweenService = game:GetService("TweenService")

local function RegisterHover(v)
  	local originalSize = v.Size
  	local hoverSize = UDim2.new(
  		originalSize.X.Scale * 1.15, originalSize.X.Offset * 1.15,
  		originalSize.Y.Scale * 1.15, originalSize.Y.Offset * 1.15
  	)
  
  	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
  
  	v.MouseEnter:Connect(function()
  		local tween = TweenService:Create(v, tweenInfo, {Size = hoverSize})
  		tween:Play()
  	end)
  
  	v.MouseLeave:Connect(function()
  		local tween = TweenService:Create(v, tweenInfo, {Size = originalSize})
  		tween:Play()
  	end)
end
