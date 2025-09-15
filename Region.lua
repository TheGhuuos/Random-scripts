local Region = workspace.Region

workspace.Part.Position = (Region.CFrame * CFrame.new(
    (math.random() - 0.5) * Region.Size.X,
    (math.random() - 0.5) * Region.Size.Y,
    (math.random() - 0.5) * Region.Size.Z
)).Position
