local soronice = loadstring(game:HttpGet('https://raw.githubusercontent.com/Audinay/Cr-ation-principale-de-mon-site-internet-et-de-mes-scripts./refs/heads/main/Scriptation%20professionell%20SORONICE.COM'))()

local Window = soronice:CreateWindow({
    Name = "SORONICEv4 HUB",
    ShowDevice = true,
    ShowPing = true,
    ShowFPS = true,
    VersionTag = "V25 Launch Control",
    KeySystem = false, 
    KeySettings = {
        Title = "ACCÈS PREMIUM",
        LinkText = "Copier le lien",
        Key = "1234", 
        GrabKeyFromSite = false,
        Link = "https://google.com"
    }
})

-- ====================================================
-- ONGLET 1 : MOTEUR ET FLAMMES
-- ====================================================
local TabExhaust = Window:CreateTab("Moteur & Flammes", "car")

local antiSurchauffeActif = true
TabExhaust:CreateToggle({
    Name = "❄️ Anti-Surchauffe Moteur (Temp = 0)",
    CurrentValue = true,
    Flag = "ToggleTemp",
    Callback = function(Value) antiSurchauffeActif = Value end,
})

local modeMitrailleActif = false
TabExhaust:CreateToggle({
    Name = "🔥 Activer la Mitraillette (Touche M)",
    CurrentValue = true,
    Flag = "ToggleFlammes",
    Callback = function(Value) modeMitrailleActif = Value end,
})

-- NOUVEAU : LAUNCH CONTROL / LIMITEUR
local regulateurRPMActif = false
local cibleRPM = 4000

TabExhaust:CreateToggle({
    Name = "⚙️ Activer le Limiteur de Régime (Z / Accélérateur)",
    CurrentValue = false,
    Flag = "ToggleRPM",
    Callback = function(Value) regulateurRPMActif = Value end,
})

TabExhaust:CreateSlider({
    Name = "Régime Max (RPM)",
    Range = {1000, 9000},
    Increment = 100,
    CurrentValue = 4000,
    Flag = "SliderRPM",
    Callback = function(Value) cibleRPM = Value end,
})
TabExhaust:CreateParagraph({Title = "Info Limiteur :", Content = "Maintiens 'Z' pour accélérer. Le script stabilisera le moteur exactement au régime choisi, comme une manette ou un Launch Control !"})

-- ====================================================
-- ONGLET 2 : PERFORMANCES
-- ====================================================
local TabPerf = Window:CreateTab("Performances", "dashboard")

local turboActif = false
local puissanceTurbo = 50
local freinsActifs = false

TabPerf:CreateToggle({
    Name = "🚀 Turbo (Désactivé en Point Mort)",
    CurrentValue = false,
    Flag = "ToggleTurbo",
    Callback = function(Value) turboActif = Value end,
})
TabPerf:CreateSlider({
    Name = "Puissance du Turbo",
    Range = {10, 500},
    Increment = 10,
    CurrentValue = 50,
    Flag = "SliderTurbo",
    Callback = function(Value) puissanceTurbo = Value end,
})
TabPerf:CreateToggle({
    Name = "🛑 Freins Anti-Glisse Absolus",
    CurrentValue = false,
    Flag = "ToggleFreins",
    Callback = function(Value) freinsActifs = Value end,
})

-- ====================================================
-- BOUTON MOBILE FLOTTANT (Ton code)
-- ====================================================
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("BoutonFlammeMobile") then
    CoreGui.BoutonFlammeMobile:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BoutonFlammeMobile"
ScreenGui.Parent = CoreGui

local BoutonMitraille = Instance.new("TextButton")
BoutonMitraille.Parent = ScreenGui
BoutonMitraille.Size = UDim2.new(0, 90, 0, 90)
BoutonMitraille.Position = UDim2.new(1, -120, 0.5, -45)
BoutonMitraille.BackgroundColor3 = Color3.fromRGB(255, 30, 30)
BoutonMitraille.Text = "🔥"
BoutonMitraille.TextScaled = true
BoutonMitraille.BackgroundTransparency = 0.4
BoutonMitraille.ZIndex = 999

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = BoutonMitraille

-- ====================================================
-- LOGIQUE DES TOUCHES (Ton code exact)
-- ====================================================
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local maintientBouton = false
local dernierTir = 0

BoutonMitraille.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        maintientBouton = true
        BoutonMitraille.BackgroundTransparency = 0.1
    end
end)
BoutonMitraille.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        maintientBouton = false
        BoutonMitraille.BackgroundTransparency = 0.4
    end
end)
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.M then maintientBouton = true end
end)
UserInputService.InputEnded:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.M then maintientBouton = false end
end)

-- ====================================================
-- DÉCLENCHEUR DE FLAMMES (Ton code exact)
-- ====================================================
local function declencherFlammes()
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character
    local vehicle = nil
    
    if char and char:FindFirstChild("Humanoid") and char.Humanoid.SeatPart then
        vehicle = char.Humanoid.SeatPart.Parent
        while vehicle and not vehicle:IsA("Model") do
            vehicle = vehicle.Parent
        end
    end
    
    if vehicle then
        local backfire = vehicle:FindFirstChild("backfire", true)
        if backfire and backfire:IsA("RemoteEvent") then backfire:FireServer() end
        
        local exhaust = vehicle:FindFirstChild("ExhaustHandler", true)
        if exhaust and exhaust:IsA("RemoteEvent") then
            exhaust:FireServer("FlamesSmall", true)
            exhaust:FireServer("Flames", true)
        end
    end
end

-- ====================================================
-- BOUCLE MITRAILLETTE (Ton code exact)
-- ====================================================
RunService.RenderStepped:Connect(function()
    if modeMitrailleActif and maintientBouton then
        if tick() - dernierTir > 0.04 then
            dernierTir = tick()
            declencherFlammes()
        end
    end
end)

-- ====================================================
-- BOUCLE PHYSIQUE (Limiteur, Surchauffe, Turbo, Freins)
-- ====================================================
RunService.Heartbeat:Connect(function(deltaTime)
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:FindFirstChild("PlayerGui")
    local aChassisGUI = pGui and pGui:FindFirstChild("A-Chassis Interface")
    
    -- 1. ANTI-SURCHAUFFE
    if antiSurchauffeActif and aChassisGUI then
        local tempFolder = aChassisGUI:FindFirstChild("Temperature", true)
        if tempFolder then
            local tempValue = tempFolder:FindFirstChild("Temp")
            if tempValue and tempValue:IsA("NumberValue") then tempValue.Value = 0 end
        end
    end

    local char = player.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid or not humanoid.SeatPart or not humanoid.SeatPart:IsA("VehicleSeat") then return end

    local seat = humanoid.SeatPart
    local vehicle = seat.Parent
    while vehicle and not vehicle:IsA("Model") do vehicle = vehicle.Parent end
    if not vehicle then return end

    -- Lecture des valeurs de l'interface
    local currentRPM = 0
    local gearText = "N"
    
    if aChassisGUI then
        -- Lecture du RPM pour le limiteur
        local rpmVal = aChassisGUI:FindFirstChild("RPM", true)
        if rpmVal and rpmVal:IsA("NumberValue") then currentRPM = rpmVal.Value end
        
        -- Lecture de la vitesse pour bloquer le turbo
        for _, obj in pairs(aChassisGUI:GetDescendants()) do
            if obj:IsA("TextLabel") and (obj.Name == "Gear" or obj.Name == "GearText" or obj.Name == "G") then
                gearText = obj.Text
            end
        end
    end

    -- 2. LIMITEUR DE RÉGIME (Launch Control avec Z)
    if regulateurRPMActif then
        local drive = vehicle:FindFirstChild("Drive")
        local throttleVal = drive and drive:FindFirstChild("Values") and drive.Values:FindFirstChild("Throttle")
        
        -- Si tu es en train d'accélérer (touche Z appuyée)
        if throttleVal and seat.Throttle > 0 then
            if currentRPM > cibleRPM then
                -- Si le moteur dépasse la limite, on coupe virtuellement les gaz (0)
                throttleVal.Value = 0
            else
                -- S'il est en dessous, on remet les gaz (1)
                throttleVal.Value = 1
            end
        end
    end

    -- 3. TURBO 
    if turboActif and string.upper(gearText) ~= "N" and string.upper(gearText) ~= "P" and seat.Throttle ~= 0 then
        local directionTurbo = (string.find(string.upper(gearText), "R")) and -1 or 1
        seat.AssemblyLinearVelocity = seat.AssemblyLinearVelocity + (seat.CFrame.LookVector * (puissanceTurbo * deltaTime * 10 * directionTurbo))
    end

    -- 4. FREINS ANTI-GLISSE
    if freinsActifs and seat.Throttle < 0 then
        local forwardSpeed = seat.AssemblyLinearVelocity:Dot(seat.CFrame.LookVector)
        if forwardSpeed > 2 then
            seat.AssemblyLinearVelocity = seat.AssemblyLinearVelocity * 0.85
            seat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    end
end)
