-- Gui to Lua V5
-- GUI : Blox Fruits

local Players   = game:GetService('Players')
local player    = Players.LocalPlayer
local PlayerGui = player:WaitForChild('PlayerGui')

local _old = PlayerGui:FindFirstChild([[Blox Fruits]])
if _old then _old:Destroy() end

-- _i : tableau indexe en continu, jamais de trous
-- => evite les nil et la limite 200 variables locales
local _i = {}

-- Instances:

_i[1] = Instance.new("ScreenGui")
_i[1].DisplayOrder = 0
_i[1].Enabled = true
_i[1].IgnoreGuiInset = false
_i[1].ResetOnSpawn = true
_i[1].Name = [[Blox Fruits]]
_i[1].Parent = PlayerGui

_i[2] = Instance.new("Frame")
_i[2].AnchorPoint = Vector2.new(0.5,0.5)
_i[2].BackgroundColor3 = Color3.fromRGB(89,89,89)
_i[2].BackgroundTransparency = 0.4000000059604645
_i[2].BorderColor3 = Color3.fromRGB(0,0,0)
_i[2].BorderSizePixel = 0
_i[2].ClipsDescendants = false
_i[2].LayoutOrder = 0
_i[2].Position = UDim2.new(0.384259,145,0.309073,117)
_i[2].Rotation = 0
_i[2].Selectable = false
_i[2].Size = UDim2.new(0.231481,0,0.383486,0)
_i[2].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[2].Visible = true
_i[2].ZIndex = 1
_i[2].Name = [[Frame]]
_i[2].Parent = _i[1]

_i[3] = Instance.new("UICorner")
_i[3].CornerRadius = UDim.new(0,8)
_i[3].Name = [[UICorner]]
_i[3].Parent = _i[2]

_i[4] = Instance.new("UIStroke")
_i[4].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[4].Color = Color3.fromRGB(0,0,0)
_i[4].LineJoinMode = Enum.LineJoinMode.Round
_i[4].Thickness = 4.699999809265137
_i[4].Transparency = 0
_i[4].Name = [[UIStroke]]
_i[4].Parent = _i[2]

_i[5] = Instance.new("Frame")
_i[5].AnchorPoint = Vector2.new(0,0)
_i[5].BackgroundColor3 = Color3.fromRGB(72,72,72)
_i[5].BackgroundTransparency = 0.15000000596046448
_i[5].BorderColor3 = Color3.fromRGB(0,0,0)
_i[5].BorderSizePixel = 0
_i[5].ClipsDescendants = false
_i[5].LayoutOrder = 0
_i[5].Position = UDim2.new(0.0310345,0,0.0489362,0)
_i[5].Rotation = 0
_i[5].Selectable = false
_i[5].Size = UDim2.new(0.937931,0,0.906383,0)
_i[5].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[5].Visible = true
_i[5].ZIndex = 1
_i[5].Name = [[Frame]]
_i[5].Parent = _i[2]

_i[6] = Instance.new("UICorner")
_i[6].CornerRadius = UDim.new(0,8)
_i[6].Name = [[UICorner]]
_i[6].Parent = _i[5]

_i[7] = Instance.new("TextButton")
_i[7].AnchorPoint = Vector2.new(0.5,0.5)
_i[7].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[7].BackgroundTransparency = 0
_i[7].BorderColor3 = Color3.fromRGB(0,0,0)
_i[7].BorderSizePixel = 0
_i[7].ClipsDescendants = false
_i[7].LayoutOrder = 0
_i[7].Position = UDim2.new(0.5,0,0.713615,0)
_i[7].Rotation = 0
_i[7].Selectable = true
_i[7].Size = UDim2.new(0.9375,0,0.258216,0)
_i[7].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[7].Visible = true
_i[7].ZIndex = 1
_i[7].AutoButtonColor = false
_i[7].Font = Enum.Font.SourceSans
_i[7].LineHeight = 1
_i[7].Modal = false
_i[7].RichText = false
_i[7].Selected = false
_i[7].Text = [[]]
_i[7].TextColor3 = Color3.fromRGB(0,0,0)
_i[7].TextScaled = false
_i[7].TextSize = 14
_i[7].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[7].TextStrokeTransparency = 1
_i[7].TextTransparency = 0
_i[7].TextWrapped = false
_i[7].TextXAlignment = Enum.TextXAlignment.Center
_i[7].TextYAlignment = Enum.TextYAlignment.Center
_i[7].Name = [[TextButton]]
_i[7].Parent = _i[5]

_i[8] = Instance.new("UICorner")
_i[8].CornerRadius = UDim.new(0,8)
_i[8].Name = [[UICorner]]
_i[8].Parent = _i[7]

_i[9] = Instance.new("UIStroke")
_i[9].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_i[9].Color = Color3.fromRGB(0,0,0)
_i[9].LineJoinMode = Enum.LineJoinMode.Round
_i[9].Thickness = 2.799999952316284
_i[9].Transparency = 0
_i[9].Name = [[UIStroke]]
_i[9].Parent = _i[7]

_i[10] = Instance.new("TextLabel")
_i[10].AnchorPoint = Vector2.new(0,0)
_i[10].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[10].BackgroundTransparency = 1
_i[10].BorderColor3 = Color3.fromRGB(0,0,0)
_i[10].BorderSizePixel = 0
_i[10].ClipsDescendants = false
_i[10].LayoutOrder = 0
_i[10].Position = UDim2.new(0,0,0,0)
_i[10].Rotation = 0
_i[10].Selectable = false
_i[10].Size = UDim2.new(1,0,1,0)
_i[10].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[10].Visible = true
_i[10].ZIndex = 1
_i[10].Font = Enum.Font.SourceSans
_i[10].LineHeight = 1
_i[10].MaxVisibleGraphemes = -1
_i[10].RichText = false
_i[10].Text = [[SORONICE HUB]]
_i[10].TextColor3 = Color3.fromRGB(255,255,255)
_i[10].TextScaled = true
_i[10].TextSize = 14
_i[10].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[10].TextStrokeTransparency = 1
_i[10].TextTransparency = 0
_i[10].TextTruncate = Enum.TextTruncate.None
_i[10].TextWrapped = true
_i[10].TextXAlignment = Enum.TextXAlignment.Center
_i[10].TextYAlignment = Enum.TextYAlignment.Center
_i[10].Name = [[TextLabel]]
_i[10].Parent = _i[7]

_i[11] = Instance.new("UIStroke")
_i[11].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[11].Color = Color3.fromRGB(0,0,0)
_i[11].LineJoinMode = Enum.LineJoinMode.Round
_i[11].Thickness = 1
_i[11].Transparency = 0
_i[11].Name = [[UIStroke]]
_i[11].Parent = _i[10]

_i[12] = Instance.new("UIGradient")
_i[12].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,255,204)),ColorSequenceKeypoint.new(1,Color3.fromRGB(29,82,255))})
_i[12].Offset = Vector2.new(0,0)
_i[12].Rotation = 90
_i[12].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[12].Name = [[UIGradient]]
_i[12].Parent = _i[10]

_i[13] = Instance.new("UIGradient")
_i[13].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(67,49,139)),ColorSequenceKeypoint.new(1,Color3.fromRGB(136,29,29))})
_i[13].Offset = Vector2.new(0,0)
_i[13].Rotation = 180
_i[13].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.323432,0.20765,0),NumberSequenceKeypoint.new(0.536304,0.0874317,0),NumberSequenceKeypoint.new(0.660066,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[13].Name = [[UIGradient]]
_i[13].Parent = _i[7]

_i[14] = Instance.new("TextButton")
_i[14].AnchorPoint = Vector2.new(0.5,0.5)
_i[14].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[14].BackgroundTransparency = 0
_i[14].BorderColor3 = Color3.fromRGB(0,0,0)
_i[14].BorderSizePixel = 0
_i[14].ClipsDescendants = false
_i[14].LayoutOrder = 0
_i[14].Position = UDim2.new(0.5,0,0.262911,0)
_i[14].Rotation = 0
_i[14].Selectable = true
_i[14].Size = UDim2.new(0.9375,0,0.258216,0)
_i[14].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[14].Visible = true
_i[14].ZIndex = 1
_i[14].AutoButtonColor = false
_i[14].Font = Enum.Font.SourceSans
_i[14].LineHeight = 1
_i[14].Modal = false
_i[14].RichText = false
_i[14].Selected = false
_i[14].Text = [[]]
_i[14].TextColor3 = Color3.fromRGB(0,0,0)
_i[14].TextScaled = false
_i[14].TextSize = 14
_i[14].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[14].TextStrokeTransparency = 1
_i[14].TextTransparency = 0
_i[14].TextWrapped = false
_i[14].TextXAlignment = Enum.TextXAlignment.Center
_i[14].TextYAlignment = Enum.TextYAlignment.Center
_i[14].Name = [[TextButton]]
_i[14].Parent = _i[5]

_i[15] = Instance.new("UICorner")
_i[15].CornerRadius = UDim.new(0,8)
_i[15].Name = [[UICorner]]
_i[15].Parent = _i[14]

_i[16] = Instance.new("UIGradient")
_i[16].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(67,49,139)),ColorSequenceKeypoint.new(1,Color3.fromRGB(136,29,29))})
_i[16].Offset = Vector2.new(0,0)
_i[16].Rotation = 90
_i[16].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.323432,0.20765,0),NumberSequenceKeypoint.new(0.536304,0.0874317,0),NumberSequenceKeypoint.new(0.660066,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[16].Name = [[UIGradient]]
_i[16].Parent = _i[14]

_i[17] = Instance.new("TextLabel")
_i[17].AnchorPoint = Vector2.new(0,0)
_i[17].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[17].BackgroundTransparency = 1
_i[17].BorderColor3 = Color3.fromRGB(0,0,0)
_i[17].BorderSizePixel = 0
_i[17].ClipsDescendants = false
_i[17].LayoutOrder = 0
_i[17].Position = UDim2.new(0,0,0,0)
_i[17].Rotation = 0
_i[17].Selectable = false
_i[17].Size = UDim2.new(1,0,1,0)
_i[17].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[17].Visible = true
_i[17].ZIndex = 1
_i[17].Font = Enum.Font.SourceSans
_i[17].LineHeight = 1
_i[17].MaxVisibleGraphemes = -1
_i[17].RichText = false
_i[17].Text = [[CattStar]]
_i[17].TextColor3 = Color3.fromRGB(255,255,255)
_i[17].TextScaled = true
_i[17].TextSize = 14
_i[17].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[17].TextStrokeTransparency = 1
_i[17].TextTransparency = 0
_i[17].TextTruncate = Enum.TextTruncate.None
_i[17].TextWrapped = true
_i[17].TextXAlignment = Enum.TextXAlignment.Center
_i[17].TextYAlignment = Enum.TextYAlignment.Center
_i[17].Name = [[TextLabel]]
_i[17].Parent = _i[14]

_i[18] = Instance.new("UIStroke")
_i[18].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[18].Color = Color3.fromRGB(0,0,0)
_i[18].LineJoinMode = Enum.LineJoinMode.Round
_i[18].Thickness = 1
_i[18].Transparency = 0
_i[18].Name = [[UIStroke]]
_i[18].Parent = _i[17]

_i[19] = Instance.new("UIGradient")
_i[19].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,113,162)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
_i[19].Offset = Vector2.new(0,0)
_i[19].Rotation = 90
_i[19].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[19].Name = [[UIGradient]]
_i[19].Parent = _i[17]

_i[20] = Instance.new("UIStroke")
_i[20].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_i[20].Color = Color3.fromRGB(0,0,0)
_i[20].LineJoinMode = Enum.LineJoinMode.Round
_i[20].Thickness = 2.799999952316284
_i[20].Transparency = 0
_i[20].Name = [[UIStroke]]
_i[20].Parent = _i[14]

_i[21] = Instance.new("CanvasGroup")
_i[21].AnchorPoint = Vector2.new(0.5,0.5)
_i[21].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[21].BackgroundTransparency = 1
_i[21].BorderColor3 = Color3.fromRGB(0,0,0)
_i[21].BorderSizePixel = 0
_i[21].ClipsDescendants = true
_i[21].LayoutOrder = 0
_i[21].Position = UDim2.new(0.5,0,0.5,0)
_i[21].Rotation = 0
_i[21].Selectable = false
_i[21].Size = UDim2.new(1,0,1,0)
_i[21].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[21].Visible = true
_i[21].ZIndex = 1
_i[21].Name = [[Frame]]
_i[21].Parent = _i[14]

_i[22] = Instance.new("UICorner")
_i[22].CornerRadius = UDim.new(0,8)
_i[22].Name = [[UICorner]]
_i[22].Parent = _i[21]

_i[23] = Instance.new("ImageLabel")
_i[23].AnchorPoint = Vector2.new(0.5,0.5)
_i[23].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[23].BackgroundTransparency = 1
_i[23].BorderColor3 = Color3.fromRGB(0,0,0)
_i[23].BorderSizePixel = 0
_i[23].ClipsDescendants = false
_i[23].LayoutOrder = 0
_i[23].Position = UDim2.new(0.5,0,0.5,0)
_i[23].Rotation = 0
_i[23].Selectable = false
_i[23].Size = UDim2.new(2,0,2,0)
_i[23].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[23].Visible = true
_i[23].ZIndex = 5
_i[23].Image = [[rbxassetid://71904840558679]]
_i[23].ImageColor3 = Color3.fromRGB(0,104,239)
_i[23].ImageRectOffset = Vector2.new(0,0)
_i[23].ImageRectSize = Vector2.new(0,0)
_i[23].ImageTransparency = 0.36000001430511475
_i[23].ResampleMode = Enum.ResamplerMode.Default
_i[23].ScaleType = Enum.ScaleType.Stretch
_i[23].SliceCenter = Rect.new(0,0,0,0)
_i[23].SliceScale = 1
_i[23].Name = [[Shine]]
_i[23].Parent = _i[21]

_i[24] = Instance.new("UIAspectRatioConstraint")
_i[24].AspectRatio = 1
_i[24].AspectType = Enum.AspectType.FitWithinMaxSize
_i[24].DominantAxis = Enum.DominantAxis.Width
_i[24].Name = [[UIAspectRatioConstraint]]
_i[24].Parent = _i[23]

_i[25] = Instance.new("TextLabel")
_i[25].AnchorPoint = Vector2.new(0,0)
_i[25].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[25].BackgroundTransparency = 0.4000000059604645
_i[25].BorderColor3 = Color3.fromRGB(0,0,0)
_i[25].BorderSizePixel = 0
_i[25].ClipsDescendants = false
_i[25].LayoutOrder = 0
_i[25].Position = UDim2.new(-0.0330882,0,-0.056338,0)
_i[25].Rotation = 0
_i[25].Selectable = false
_i[25].Size = UDim2.new(1.06618,0,1.10563,0)
_i[25].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[25].Visible = false
_i[25].ZIndex = 1
_i[25].Font = Enum.Font.SourceSans
_i[25].LineHeight = 1
_i[25].MaxVisibleGraphemes = -1
_i[25].RichText = false
_i[25].Text = [[⚠️This script is not yet available😥.]]
_i[25].TextColor3 = Color3.fromRGB(255,255,255)
_i[25].TextScaled = true
_i[25].TextSize = 14
_i[25].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[25].TextStrokeTransparency = 1
_i[25].TextTransparency = 0
_i[25].TextTruncate = Enum.TextTruncate.None
_i[25].TextWrapped = true
_i[25].TextXAlignment = Enum.TextXAlignment.Center
_i[25].TextYAlignment = Enum.TextYAlignment.Center
_i[25].Name = [[Message d'erreur]]
_i[25].Parent = _i[5]

_i[26] = Instance.new("UIGradient")
_i[26].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(147,0,0))})
_i[26].Offset = Vector2.new(0,0)
_i[26].Rotation = 90
_i[26].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[26].Name = [[UIGradient]]
_i[26].Parent = _i[25]

_i[27] = Instance.new("UIStroke")
_i[27].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[27].Color = Color3.fromRGB(0,0,0)
_i[27].LineJoinMode = Enum.LineJoinMode.Round
_i[27].Thickness = 4.699999809265137
_i[27].Transparency = 0
_i[27].Name = [[UIStroke]]
_i[27].Parent = _i[25]

_i[28] = Instance.new("TextLabel")
_i[28].AnchorPoint = Vector2.new(0,0)
_i[28].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[28].BackgroundTransparency = 0.4000000059604645
_i[28].BorderColor3 = Color3.fromRGB(0,0,0)
_i[28].BorderSizePixel = 0
_i[28].ClipsDescendants = false
_i[28].LayoutOrder = 0
_i[28].Position = UDim2.new(-0.0330882,0,-0.056338,0)
_i[28].Rotation = 0
_i[28].Selectable = false
_i[28].Size = UDim2.new(1.06618,0,1.10563,0)
_i[28].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[28].Visible = false
_i[28].ZIndex = 1
_i[28].Font = Enum.Font.SourceSans
_i[28].LineHeight = 1
_i[28].MaxVisibleGraphemes = -1
_i[28].RichText = false
_i[28].Text = [[📢Activate successfully✅]]
_i[28].TextColor3 = Color3.fromRGB(255,255,255)
_i[28].TextScaled = true
_i[28].TextSize = 57
_i[28].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[28].TextStrokeTransparency = 1
_i[28].TextTransparency = 0
_i[28].TextTruncate = Enum.TextTruncate.None
_i[28].TextWrapped = true
_i[28].TextXAlignment = Enum.TextXAlignment.Center
_i[28].TextYAlignment = Enum.TextYAlignment.Center
_i[28].Name = [[Message Activate]]
_i[28].Parent = _i[5]

_i[29] = Instance.new("UIGradient")
_i[29].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(26,255,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,255,17))})
_i[29].Offset = Vector2.new(0,0)
_i[29].Rotation = 90
_i[29].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.165017,0,0),NumberSequenceKeypoint.new(0.40264,0.344262,0),NumberSequenceKeypoint.new(0.506601,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[29].Name = [[UIGradient]]
_i[29].Parent = _i[28]

_i[30] = Instance.new("UIStroke")
_i[30].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[30].Color = Color3.fromRGB(0,0,0)
_i[30].LineJoinMode = Enum.LineJoinMode.Round
_i[30].Thickness = 4.699999809265137
_i[30].Transparency = 0
_i[30].Name = [[UIStroke]]
_i[30].Parent = _i[28]

_i[31] = Instance.new("TextLabel")
_i[31].AnchorPoint = Vector2.new(0,0)
_i[31].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[31].BackgroundTransparency = 1
_i[31].BorderColor3 = Color3.fromRGB(0,0,0)
_i[31].BorderSizePixel = 0
_i[31].ClipsDescendants = false
_i[31].LayoutOrder = 0
_i[31].Position = UDim2.new(0,0,-0.238298,0)
_i[31].Rotation = 0
_i[31].Selectable = false
_i[31].Size = UDim2.new(1,0,0.238298,0)
_i[31].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[31].Visible = true
_i[31].ZIndex = 1
_i[31].Font = Enum.Font.SourceSans
_i[31].LineHeight = 1
_i[31].MaxVisibleGraphemes = -1
_i[31].RichText = false
_i[31].Text = [[Blox Fruits]]
_i[31].TextColor3 = Color3.fromRGB(255,255,255)
_i[31].TextScaled = true
_i[31].TextSize = 14
_i[31].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[31].TextStrokeTransparency = 1
_i[31].TextTransparency = 0.25
_i[31].TextTruncate = Enum.TextTruncate.None
_i[31].TextWrapped = true
_i[31].TextXAlignment = Enum.TextXAlignment.Center
_i[31].TextYAlignment = Enum.TextYAlignment.Center
_i[31].Name = [[TextLabel]]
_i[31].Parent = _i[2]

_i[32] = Instance.new("UIGradient")
_i[32].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,208,255))})
_i[32].Offset = Vector2.new(0,0)
_i[32].Rotation = -90
_i[32].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[32].Name = [[UIGradient]]
_i[32].Parent = _i[31]

_i[33] = Instance.new("UIStroke")
_i[33].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[33].Color = Color3.fromRGB(0,0,0)
_i[33].LineJoinMode = Enum.LineJoinMode.Round
_i[33].Thickness = 1
_i[33].Transparency = 0
_i[33].Name = [[UIStroke]]
_i[33].Parent = _i[31]

_i[34] = Instance.new("TextButton")
_i[34].AnchorPoint = Vector2.new(0,0)
_i[34].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[34].BackgroundTransparency = 1
_i[34].BorderColor3 = Color3.fromRGB(0,0,0)
_i[34].BorderSizePixel = 0
_i[34].ClipsDescendants = false
_i[34].LayoutOrder = 0
_i[34].Position = UDim2.new(-0.0344828,0,-0.0851064,0)
_i[34].Rotation = 0
_i[34].Selectable = true
_i[34].Size = UDim2.new(1.06897,0,0.221277,0)
_i[34].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[34].Visible = true
_i[34].ZIndex = 5
_i[34].AutoButtonColor = true
_i[34].Font = Enum.Font.SourceSans
_i[34].LineHeight = 1
_i[34].Modal = false
_i[34].RichText = false
_i[34].Selected = false
_i[34].Text = [[]]
_i[34].TextColor3 = Color3.fromRGB(0,0,0)
_i[34].TextScaled = false
_i[34].TextSize = 14
_i[34].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[34].TextStrokeTransparency = 1
_i[34].TextTransparency = 0
_i[34].TextWrapped = false
_i[34].TextXAlignment = Enum.TextXAlignment.Center
_i[34].TextYAlignment = Enum.TextYAlignment.Center
_i[34].Name = [[TMLTB]]
_i[34].Parent = _i[2]


-- Scripts:

local function KHOCU_fake_script() -- Frame.LocalScript
	local script = Instance.new('LocalScript', _i[2])
	script.Name = [[LocalScript]]

	local TweenService = game:GetService("TweenService")
	
	-- On récupère la frame (on part du principe que le script est dedans)
	local frame = script.Parent
	
	-- CONFIGURATION
	-- On stocke la taille originale que tu as définie dans l'UI
	local tailleOriginale = frame.Size
	-- Durée de l'animation (0.5 secondes pour que ce soit fluide)
	local duree = 0.5 
	
	-- Paramètres de l'animation avec l'effet de rebondissement (Elastic ou Back)
	-- "Back" est parfait pour l'effet "télé qui s'allume" avec un petit ressort à la fin
	local tweenInfo = TweenInfo.new(
		duree,                          -- Temps
		Enum.EasingStyle.Back,          -- Style : Back donne cet effet de dépassement/rebond
		Enum.EasingDirection.Out,       -- Direction : Appliquer l'effet à la fin du mouvement
		0,                              -- Répétitions
		false,                          -- Pas de reverse
		0                               -- Pas de délai
	)
	
	-- Initialisation de la Frame
	-- On la rend invisible et minuscule au départ
	frame.Size = UDim2.new(0, 0, 0, 0)
	frame.Visible = true
	
	-- Création de l'animation vers la taille d'origine
	local animationApparition = TweenService:Create(frame, tweenInfo, {Size = tailleOriginale})
	
	-- Lancement de l'animation
	animationApparition:Play()
end
coroutine.wrap(KHOCU_fake_script)()

local function IIBWS_fake_script() -- TextButton.Tween
	local script = Instance.new('LocalScript', _i[7])
	script.Name = [[Tween]]

	--// This is a Stroke Scale on Hover Effect, the uistroke thickness will grow on hover.
	
	local btn = script.Parent
	local stroke = btn.UIStroke
	local TS = game:GetService("TweenService")
	
	local origThick = stroke.Thickness
	local hoverThick = origThick + 2
	local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	local function makeTween(thick)
		return TS:Create(stroke, tInfo, {Thickness = thick})
	end
	
	btn.MouseEnter:Connect(function()
		makeTween(hoverThick):Play()
	end)
	
	btn.MouseLeave:Connect(function()
		makeTween(origThick):Play()
	end)
end
coroutine.wrap(IIBWS_fake_script)()

local function RPKWZ_fake_script() -- TextButton.Tween
	local script = Instance.new('LocalScript', _i[7])
	script.Name = [[Tween]]

	--// This is a Bounce On Click effect, the button will bounce when clicked.
	
	local btn = script.Parent
	local TS = game:GetService("TweenService")
	
	local origSize = btn.Size
	local origPos = btn.Position
	local hoverScl = 1.1
	local bounceUp = -0.02
	local bounceDown = 0.02
	local tInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local isClicking = false
	
	local function makeSizeTween(scl)
		local newSize = UDim2.new(
			origSize.X.Scale * scl,
			origSize.X.Offset * scl,
			origSize.Y.Scale * scl,
			origSize.Y.Offset * scl
		)
		return TS:Create(btn, tInfo, {Size = newSize})
	end
	
	local function makePosTween(offset)
		local newPos = UDim2.new(
			origPos.X.Scale,
			origPos.X.Offset,
			origPos.Y.Scale + offset,
			origPos.Y.Offset
		)
		return TS:Create(btn, tInfo, {Position = newPos})
	end
	
	btn.MouseEnter:Connect(function()
		if not isClicking then
			makeSizeTween(hoverScl):Play()
		end
	end)
	
	btn.MouseLeave:Connect(function()
		if not isClicking then
			makeSizeTween(1):Play()
		end
	end)
	
	btn.MouseButton1Click:Connect(function()
		isClicking = true
		local tweens = {
			makeSizeTween(1),
			makePosTween(bounceUp),
			makePosTween(bounceDown),
			makePosTween(0)
		}
		tweens[1]:Play()
		for i = 1, #tweens - 1 do
			tweens[i].Completed:Connect(function()
				tweens[i + 1]:Play()
			end)
		end
		tweens[#tweens].Completed:Connect(function()
			isClicking = false
		end)
	end)
end
coroutine.wrap(RPKWZ_fake_script)()

local function IQYBJ_fake_script() -- TextButton.LocalScript
	local script = Instance.new('LocalScript', _i[7])
	script.Name = [[LocalScript]]

	local bouton = script.Parent
	-- On remonte d'un niveau pour chercher le TextLabel dans le même dossier/parent
	local messageErreur = bouton.Parent:WaitForChild("Message d'erreur")
	
	bouton.MouseButton1Click:Connect(function()
		-- On rend le message visible
		messageErreur.Visible = true
	
		-- On attend 3 secondes
		task.wait(5)
	
		-- On le rend à nouveau invisible
		messageErreur.Visible = false
	end)
end
coroutine.wrap(IQYBJ_fake_script)()

local function NTMMP_fake_script() -- TextButton.Tween
	local script = Instance.new('LocalScript', _i[14])
	script.Name = [[Tween]]

	--// This is a Stroke Scale on Hover Effect, the uistroke thickness will grow on hover.
	
	local btn = script.Parent
	local stroke = btn.UIStroke
	local TS = game:GetService("TweenService")
	
	local origThick = stroke.Thickness
	local hoverThick = origThick + 2
	local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	local function makeTween(thick)
		return TS:Create(stroke, tInfo, {Thickness = thick})
	end
	
	btn.MouseEnter:Connect(function()
		makeTween(hoverThick):Play()
	end)
	
	btn.MouseLeave:Connect(function()
		makeTween(origThick):Play()
	end)
end
coroutine.wrap(NTMMP_fake_script)()

local function PFCAL_fake_script() -- TextButton.Tween
	local script = Instance.new('LocalScript', _i[14])
	script.Name = [[Tween]]

	--// This is a hover & click effect, i suggest you test this on pc. because it requires a mouse for hovering over the button.
	
	local btn = script.Parent
	local TS = game:GetService("TweenService")
	
	local origSize = btn.Size
	local hoverScl = 1.1
	local clickScl = 0.9
	local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	local function makeTween(scl)
		local newSize = UDim2.new(
			origSize.X.Scale * scl,
			origSize.X.Offset * scl,
			origSize.Y.Scale * scl,
			origSize.Y.Offset * scl
		)
		return TS:Create(btn, tInfo, {Size = newSize})
	end
	
	btn.MouseEnter:Connect(function()
		makeTween(hoverScl):Play()
	end)
	
	btn.MouseLeave:Connect(function()
		makeTween(1):Play()
	end)
	
	btn.MouseButton1Click:Connect(function()
		local shrink = makeTween(clickScl)
		local reset = makeTween(1)
		shrink:Play()
		shrink.Completed:Connect(function()
			reset:Play()
		end)
	end)
end
coroutine.wrap(PFCAL_fake_script)()

local function FCXIQ_fake_script() -- TextButton.Tween
	local script = Instance.new('LocalScript', _i[14])
	script.Name = [[Tween]]

	--// This is a Shine Effect, a shiny line will appear randomly.
	
	-- CREDITS TO RILEYBYTES (roblox.com/users/3890364928/profile) for making this
	
	
	local TS = game:GetService("TweenService")
	
	local button = script.Parent
	local shine = button:WaitForChild("Frame"):WaitForChild("Shine")
	local info = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.In, -1, false)
	
	shine.Position = UDim2.fromScale(-0.5, 0.5)
	TS:Create(shine, info, {Position = UDim2.fromScale(1.5, 0.5)}):Play()
end
coroutine.wrap(FCXIQ_fake_script)()

local function BKZUJ_fake_script() -- TextButton.LocalScript
	local script = Instance.new('LocalScript', _i[14])
	script.Name = [[LocalScript]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- WARNING: loadstring and HttpGet are not available in standard Roblox games!
		-- This code will only work in exploit environments or with special permissions.
		local success, err = pcall(function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/soronicepgf-rgb/Des-scripts-qui-ne-sont-pas-moi./refs/heads/main/eozizfiergierguierjger/roegtijtijtr/Mia.lua'))()
		end)
		if not success then
			warn("hello")
		end
	end)
	
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- WARNING: loadstring and HttpGet are not available in standard Roblox games!
		-- This code will only work in exploit environments or with special permissions.
		local success, err = pcall(function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/soronicepgf-rgb/Des-scripts-qui-ne-sont-pas-moi./refs/heads/main/eozizfiergierguierjger/roegtijtijtr/hgd.lua'))()
		end)
		if not success then
	
		end
	end)
end
coroutine.wrap(BKZUJ_fake_script)()

local function GLJAY_fake_script() -- TextButton.LocalScript
	local script = Instance.new('LocalScript', _i[14])
	script.Name = [[LocalScript]]

	local bouton = script.Parent
	-- On remonte d'un niveau pour chercher le TextLabel dans le même dossier/parent
	local messageErreur = bouton.Parent:WaitForChild("Message Activate")
	
	bouton.MouseButton1Click:Connect(function()
		-- On rend le message visible
		messageErreur.Visible = true
	
		-- On attend 3 secondes
		task.wait(4)
	
		-- On le rend à nouveau invisible
		messageErreur.Visible = false
	end)
	
	local bouton = script.Parent
	
	-- On remonte les parents pour trouver le ScreenGui qui contient tout
	-- Le bouton est dans une Frame ou directement dans le ScreenGui
	local guiASupprimer = bouton:FindFirstAncestorWhichIsA("ScreenGui")
	
	bouton.MouseButton1Click:Connect(function()
		-- On attend les 2 secondes demandées
		task.wait(2)
	
		-- On vérifie que le GUI existe toujours avant de le supprimer
		if guiASupprimer then
			guiASupprimer:Destroy()
		end
	end)
end
coroutine.wrap(GLJAY_fake_script)()

local function QKLCH_fake_script() -- TMLTB.LocalScript
	local script = Instance.new('LocalScript', _i[34])
	script.Name = [[LocalScript]]

	local bouton = script.Parent
	local conteneur = bouton.Parent -- Le dossier ou la Frame qui contient tout ce que tu veux déplacer
	local userInputService = game:GetService("UserInputService")
	
	local dragging = false
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		conteneur.Position = UDim2.new(
			startPos.X.Scale, 
			startPos.X.Offset + delta.X, 
			startPos.Y.Scale, 
			startPos.Y.Offset + delta.Y
		)
	end
	
	bouton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = conteneur.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	bouton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	userInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(QKLCH_fake_script)()
