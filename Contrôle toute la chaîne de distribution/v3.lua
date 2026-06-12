local soronice = loadstring(game:HttpGet('https://raw.githubusercontent.com/Audinay/Cr-ation-principale-de-mon-site-internet-et-de-mes-scripts./refs/heads/main/Scriptation%20professionell%20SORONICE.COM'))()

local WindowName = "SORONICEv3 HUB"
local Window = soronice:CreateWindow({
    Name = WindowName,
    ShowDevice = true,
    ShowPing = true,
    ShowFPS = true,
    VersionTag = "V16",
    KeySystem = false, 
    KeySettings = { Title = "ACCÈS PREMIUM", LinkText = "Copier le lien", Key = "1234", GrabKeyFromSite = false, Link = "https://google.com" }
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- Variable pour arrêter proprement les boucles si l'interface est fermée
local scriptRunning = true 

-- ==========================================
-- 👑 IDENTIFIANTS DES CRÉATEURS
-- ==========================================
local CREATOR_IDS = {
    [9547606904] = true,
    [4366813752] = true
}

-- ==========================================
-- 📡 SYNCHRONISATION ENTRE JOUEURS (VIOLET)
-- ==========================================
local soroniceUsers = {}
local function listenForSync(p)
    p.Chatted:Connect(function(msg)
        if msg == "/e soronice_sync" then
            soroniceUsers[p.Name] = true
        end
    end)
end
for _, p in pairs(Players:GetPlayers()) do listenForSync(p) end
Players.PlayerAdded:Connect(listenForSync)

task.spawn(function()
    task.wait(2)
    pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("/e soronice_sync", "All") end)
    pcall(function() game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e soronice_sync") end)
end)

-- ==========================================
-- DÉTECTEUR DE FERMETURE DE L'INTERFACE (LE "X")
-- ==========================================
task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    while task.wait(1) do
        local uiExists = false
        for _, gui in pairs(CoreGui:GetDescendants()) do
            if gui:IsA("TextLabel") and gui.Text == WindowName then
                uiExists = true
                break
            end
        end
        
        if not uiExists then
            scriptRunning = false
            for _, v in pairs(Players:GetPlayers()) do
                if v.Character then
                    local hl = v.Character:FindFirstChild("SoroniceHighlight")
                    if hl then hl:Destroy() end
                    local hrp = v.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local bg = hrp:FindFirstChild("SoroniceESP_UI")
                        if bg then bg:Destroy() end
                    end
                end
            end
            break
        end
    end
end)

-- ==========================================
-- FONCTIONS OUTILS ET COOLDOWNS
-- ==========================================
local originalToolValues = {}

local function findToolSmart(character, toolName)
    local lowerTarget = string.lower(toolName)
    if character then
        for _, item in pairs(character:GetChildren()) do
            if item:IsA("Tool") and string.find(string.lower(item.Name), lowerTarget) then return item end
        end
    end
    if player.Backpack then
        for _, item in pairs(player.Backpack:GetChildren()) do
            if item:IsA("Tool") and string.find(string.lower(item.Name), lowerTarget) then return item end
        end
    end
    return nil
end

local function zeroOutCooldown(tool, valueNames)
    if not originalToolValues[tool] then originalToolValues[tool] = {} end
    for _, item in pairs(tool:GetDescendants()) do
        if item:IsA("NumberValue") or item:IsA("IntValue") then
            local nameL = string.lower(item.Name)
            for _, targetName in pairs(valueNames) do
                if nameL == string.lower(targetName) then
                    if originalToolValues[tool][item.Name] == nil then
                        originalToolValues[tool][item.Name] = item.Value
                    end
                    item.Value = 0 
                end
            end
        end
    end
end

local function restoreToolCooldowns()
    for tool, storedValues in pairs(originalToolValues) do
        if tool and (tool.Parent == player.Character or tool.Parent == player.Backpack) then
            for valName, origVal in pairs(storedValues) do
                for _, item in pairs(tool:GetDescendants()) do
                    if item.Name == valName and (item:IsA("NumberValue") or item:IsA("IntValue")) then
                        item.Value = origVal 
                    end
                end
            end
        end
    end
end

local function TeleportToPosition(x, y, z)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

local function triggerGodMode()
    pcall(function()
        local args = {
            "travelToArea",
            workspace:WaitForChild("areaCircles"):WaitForChild("areaCircle")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("areaTravelRemote"):InvokeServer(unpack(args))
    end)
end

-- ==========================================
-- VARIABLES GLOBALES
-- ==========================================
local autoRebirthActive = false 
local autoPunchActive = false
local autoWeightActive = false
local autoHandstandsActive = false
local autoPushupsActive = false
local autoSitupsActive = false
local autoGroundSlamActive = false
local autoStompActive = false

local spinActive = false 
local freezeActive = false
local savedFreezeCFrame = nil 

local bringTargetName = ""
local bringSingleActive = false
local bringAllActive = false
local originalPlayerCFrames = {} 

local ignoreTargetName = ""
local ignoreActive = false

-- Variables Rochers Optimisées
local bringRockTarget = "TINY ROCK"
local bringSingleRockActive = false
local activeRockObj = nil
local activeRockOriginalCFrame = nil

local isNearCreator = false 

-- Variables Mouvements (Vitesse/Saut)
local customWalkSpeed = 16
local customJumpPower = 50
local speedJumpEnabled = false
local originalWalkSpeed = 16
local originalJumpPower = 50

local rockList = {
    "TINY ROCK", "FROZEN ROCK", "INFERNO ROCK", "ROCK OF LEGENTS", "MUSCLE KING MOUNTAIN", "ROCHER 6"
}

-- Fonction de calcul de distance dynamique corrigée (Plus proche)
local function getDynamicRockDistance(playerChar, rockObj)
    local hrp = playerChar:FindFirstChild("HumanoidRootPart")
    if not hrp then return 5 end
    
    local rockSize = Vector3.new(5,5,5)
    if rockObj:IsA("Model") then
        rockSize = rockObj:GetExtentsSize()
    elseif rockObj:IsA("BasePart") then
        rockSize = rockObj.Size
    end
    
    -- Calcul basé sur les rayons (la moitié de la taille)
    local rockRadius = math.max(rockSize.X, rockSize.Z) / 2
    local myRadius = math.max(hrp.Size.X, hrp.Size.Z) / 2
    
    -- Distance = Rayon rocher + Rayon joueur + 1 petit stud de marge pour ne pas te pousser
    return rockRadius + myRadius + 1
end

local function isWhitelisted(targetPlayer)
    if CREATOR_IDS[targetPlayer.UserId] then return true end 
    if not ignoreActive or ignoreTargetName == "" then return false end
    
    local ignoredNames = string.split(ignoreTargetName, "-")
    for _, ign in pairs(ignoredNames) do
        local clean = string.lower(ign):match("^%s*(.-)%s*$")
        if clean and clean ~= "" and string.find(string.lower(targetPlayer.Name), clean) then
            return true
        end
    end
    return false
end

-- ==========================================
-- BOUCLES PRINCIPALES
-- ==========================================

-- Aura de protection du créateur
task.spawn(function()
    while true do
        if not scriptRunning then break end
        task.wait(0.05)
        isNearCreator = false
        if not CREATOR_IDS[player.UserId] then
            local myChar = player.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= player and CREATOR_IDS[v.UserId] and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (myChar.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 20 then
                            isNearCreator = true
                            if myChar:FindFirstChild("Humanoid") then
                                myChar.Humanoid:UnequipTools() 
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Auto Rebirth
task.spawn(function()
    while true do
        if not scriptRunning then break end
        if autoRebirthActive then
            pcall(function()
                local args = { "rebirthRequest" }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer(unpack(args))
            end)
        end
        task.wait(1) 
    end
end)

-- Vitesse et Saut
task.spawn(function()
    while true do
        if not scriptRunning then break end
        task.wait(0.1)
        if speedJumpEnabled then
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = customWalkSpeed
                char.Humanoid.JumpPower = customJumpPower
                char.Humanoid.UseJumpPower = true
            end
        end
    end
end)

-- Freeze & Spin
RunService.Stepped:Connect(function(_, dt)
    if not scriptRunning then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    if hum.Health <= 0 then return end

    if freezeActive and savedFreezeCFrame then
        hrp.Velocity = Vector3.new(0,0,0)
        hrp.RotVelocity = Vector3.new(0,0,0)
        if spinActive then
            savedFreezeCFrame = savedFreezeCFrame * CFrame.Angles(0, math.rad(1000 * dt), 0)
            hrp.CFrame = savedFreezeCFrame
        else
            hrp.CFrame = savedFreezeCFrame
        end
    elseif spinActive and not freezeActive then
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(1000 * dt), 0)
    end
end)

player.CharacterAdded:Connect(function(newChar)
    if freezeActive and savedFreezeCFrame then
        local hrp = newChar:WaitForChild("HumanoidRootPart", 5)
        if hrp then
            task.wait(0.5) 
            hrp.CFrame = savedFreezeCFrame 
        end
    end
end)

-- ESP
task.spawn(function()
    while true do
        if not scriptRunning then break end
        task.wait(0.5)
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
                local char = v.Character
                local hum = char.Humanoid
                local hrp = char:FindFirstChild("HumanoidRootPart")
                
                local hl = char:FindFirstChild("SoroniceHighlight")
                if not hl then
                    hl = Instance.new("Highlight")
                    hl.Name = "SoroniceHighlight"
                    hl.Parent = char
                end
                
                local bg = hrp and hrp:FindFirstChild("SoroniceESP_UI")
                
                if hrp and not bg then
                    bg = Instance.new("BillboardGui")
                    bg.Name = "SoroniceESP_UI"
                    bg.Size = UDim2.new(2.5, 0, 1.2, 0)
                    bg.StudsOffset = Vector3.new(0, -3.5, 0)
                    bg.AlwaysOnTop = true
                    bg.Parent = hrp
                    
                    local nameLabel = Instance.new("TextLabel", bg)
                    nameLabel.Name = "NameLabel"
                    nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.Font = Enum.Font.SourceSansBold
                    nameLabel.TextScaled = true
                    
                    local healthBg = Instance.new("Frame", bg)
                    healthBg.Name = "HealthBg"
                    healthBg.Size = UDim2.new(1, 0, 0.25, 0)
                    healthBg.Position = UDim2.new(0, 0, 0.5, 0)
                    healthBg.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
                    
                    local healthBar = Instance.new("Frame", healthBg)
                    healthBar.Name = "HealthBar"
                    healthBar.Size = UDim2.new(1, 0, 1, 0)
                    healthBar.BackgroundColor3 = Color3.new(0, 1, 0)
                end
                
                if CREATOR_IDS[v.UserId] then
                    hl.FillColor = Color3.new(0, 1, 0) 
                    if bg then 
                        bg.NameLabel.Text = "[CRÉATEUR] " .. v.Name
                        bg.NameLabel.TextColor3 = Color3.new(0, 1, 0)
                    end
                elseif isWhitelisted(v) then
                    hl.FillColor = Color3.new(0, 1, 0) 
                    if bg then 
                        bg.NameLabel.Text = "[ALLIÉ] " .. v.Name
                        bg.NameLabel.TextColor3 = Color3.new(0, 1, 0)
                    end
                elseif soroniceUsers[v.Name] then
                    hl.FillColor = Color3.new(0.6, 0, 1) 
                    if bg then 
                        bg.NameLabel.Text = "[SORONICE] " .. v.Name
                        bg.NameLabel.TextColor3 = Color3.new(0.6, 0.5, 1)
                    end
                else
                    hl.FillColor = Color3.new(1, 0, 0) 
                    if bg then 
                        bg.NameLabel.Text = "[ENNEMI] " .. v.Name
                        bg.NameLabel.TextColor3 = Color3.new(1, 0, 0)
                    end
                end
                
                if bg then
                    local healthPct = hum.Health / (hum.MaxHealth > 0 and hum.MaxHealth or 1)
                    bg.HealthBg.HealthBar.Size = UDim2.new(healthPct, 0, 1, 0)
                    bg.HealthBg.HealthBar.BackgroundColor3 = Color3.new(1 - healthPct, healthPct, 0)
                end
            end
        end
    end
end)

-- Boucle Ramener Joueurs
task.spawn(function()
    local wasPlayerActive = false
    while true do
        if not scriptRunning then break end
        task.wait(0.03) 
        if bringSingleActive or bringAllActive then
            wasPlayerActive = true
            local myChar = player.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                local myPos = myChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3) 
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local isTarget = false
                        if not isWhitelisted(v) then
                            if bringAllActive then isTarget = true
                            elseif bringSingleActive and v.Name == bringTargetName then isTarget = true end
                        end
                        
                        if isTarget then
                            if not originalPlayerCFrames[v] then originalPlayerCFrames[v] = v.Character.HumanoidRootPart.CFrame end
                            v.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            v.Character.HumanoidRootPart.CFrame = myPos
                        else
                            if originalPlayerCFrames[v] then
                                v.Character.HumanoidRootPart.CFrame = originalPlayerCFrames[v]
                                originalPlayerCFrames[v] = nil
                            end
                        end
                    end
                end
            end
        else
            if wasPlayerActive then
                for v, origCf in pairs(originalPlayerCFrames) do
                    if v and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.CFrame = origCf
                    end
                end
                originalPlayerCFrames = {} 
                wasPlayerActive = false
            end
        end
    end
end)

-- Boucle Rocher Optimisée (Zéro Lag)
task.spawn(function()
    while true do
        if not scriptRunning then break end
        task.wait(0.05) 
        if bringSingleRockActive and activeRockObj then
            local myChar = player.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                local dist = getDynamicRockDistance(myChar, activeRockObj)
                local myPos = myChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, -dist)
                
                if activeRockObj:IsA("Model") then 
                    activeRockObj:PivotTo(myPos)
                elseif activeRockObj:IsA("BasePart") then 
                    activeRockObj.CFrame = myPos 
                end
            end
        end
    end
end)

-- Boucles d'Outils
local function createAutoToolLoop(toolKeyword, statNames)
    task.spawn(function()
        while true do
            if not scriptRunning then break end
            local isActive = false
            if toolKeyword == "punch" then isActive = autoPunchActive
            elseif toolKeyword == "weight" then isActive = autoWeightActive
            elseif toolKeyword == "handstands" then isActive = autoHandstandsActive
            elseif toolKeyword == "pushups" then isActive = autoPushupsActive
            elseif toolKeyword == "situps" then isActive = autoSitupsActive
            elseif toolKeyword == "ground slam" then isActive = autoGroundSlamActive
            elseif toolKeyword == "stomp" then isActive = autoStompActive
            end
            
            if isActive and not isNearCreator then
                local char = player.Character
                if char and char:FindFirstChild("Humanoid") then
                    local tool = findToolSmart(char, toolKeyword)
                    if tool then
                        if tool.Parent == player.Backpack then char.Humanoid:EquipTool(tool) end
                        zeroOutCooldown(tool, statNames)
                        tool:Activate()
                    end
                end
            end
            task.wait(0.01)
        end
    end)
end

createAutoToolLoop("punch", {"attacktime"})
createAutoToolLoop("weight", {"reptime"})
createAutoToolLoop("handstands", {"reptime"})
createAutoToolLoop("pushups", {"reptime"})
createAutoToolLoop("situps", {"reptime"})
createAutoToolLoop("ground slam", {"attacktime", "reptime"})
createAutoToolLoop("stomp", {"attacktime", "reptime"})


-- ==========================================
-- INSTANCE 1 : AUTOFORM
-- ==========================================
local Tab1 = Window:CreateTab("AutoForm", 137079533665791)

Tab1:CreateSlider({
    Name = "🏃 Vitesse personnalisée",
    Range = {16, 1000},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 16,
    Callback = function(Value) customWalkSpeed = Value end,
})

Tab1:CreateSlider({
    Name = "🦘 Saut personnalisé",
    Range = {50, 1000},
    Increment = 1,
    Suffix = " Jump",
    CurrentValue = 50,
    Callback = function(Value) customJumpPower = Value end,
})

Tab1:CreateToggle({
    Name = "⚡ Activer Vitesse et Saut",
    CurrentValue = false,
    Callback = function(Value)
        speedJumpEnabled = Value
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            if Value then
                originalWalkSpeed = hum.WalkSpeed
                originalJumpPower = hum.JumpPower
            else
                hum.WalkSpeed = originalWalkSpeed
                hum.JumpPower = originalJumpPower
            end
        end
    end,
})

Tab1:CreateToggle({
    Name = "❄️ Freeze Absolu (Anti-Fling)",
    CurrentValue = false,
    Callback = function(Value)
        freezeActive = Value
        local char = player.Character
        if freezeActive then
            if char and char:FindFirstChild("HumanoidRootPart") then
                savedFreezeCFrame = char.HumanoidRootPart.CFrame
            end
        else
            savedFreezeCFrame = nil
        end
    end,
})

Tab1:CreateToggle({
    Name = "🌪️ True Beyblade (360 Spin Ultime)",
    CurrentValue = false,
    Callback = function(Value) spinActive = Value end,
})

Tab1:CreateToggle({
    Name = "🔄 Auto Rebirth (Renaissance)",
    CurrentValue = false,
    Callback = function(Value) autoRebirthActive = Value end,
})

Tab1:CreateToggle({
    Name = "🛡️ God Mode (Invincible)",
    CurrentValue = false,
    Callback = function(Value)
        local char = player.Character
        if Value then
            if char and char:FindFirstChild("HumanoidRootPart") then
                local currentCFrame = char.HumanoidRootPart.CFrame
                triggerGodMode()
                task.wait(0.2) 
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = currentCFrame 
                end
            end
        end
    end,
})

Tab1:CreateToggle({
    Name = "👊 Auto Punch (Frappe)",
    CurrentValue = false,
    Callback = function(Value) 
        autoPunchActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

Tab1:CreateToggle({
    Name = "💪 Auto Muscle (Weight)",
    CurrentValue = false,
    Callback = function(Value) 
        autoWeightActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

Tab1:CreateToggle({
    Name = "🤸 Auto Handstands",
    CurrentValue = false,
    Callback = function(Value) 
        autoHandstandsActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

Tab1:CreateToggle({
    Name = "💯 Auto Pushups",
    CurrentValue = false,
    Callback = function(Value) 
        autoPushupsActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

Tab1:CreateToggle({
    Name = "🪑 Auto Situps",
    CurrentValue = false,
    Callback = function(Value) 
        autoSitupsActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

Tab1:CreateToggle({
    Name = "💥 Auto Ground Slam",
    CurrentValue = false,
    Callback = function(Value) 
        autoGroundSlamActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

Tab1:CreateToggle({
    Name = "🦶 Auto Stomp",
    CurrentValue = false,
    Callback = function(Value) 
        autoStompActive = Value 
        if not Value then restoreToolCooldowns() end
    end,
})

-- ==========================================
-- INSTANCE 2 : TÉLÉPORTATION
-- ==========================================
local Tab2 = Window:CreateTab("Téléportation", 104689322606609)

local locations = {
    ["Base une"] = {x = 3.784, y = 9.031, z = 176.69},
    ["Base deux safe"] = {x = -40.777, y = 11.73, z = 1855.154},
    ["Base trois blood"] = {x = -2558.26, y = 17.854, z = -410.588},
    ["Base quatre people"] = {x = 2194.13, y = 16.957, z = 1073.512},
    ["Base cinq orange"] = {x = -6705.628, y = 16.638, z = -1285.84},
    ["Base légende"] = {x = 4652.192, y = 999.758, z = -3906.662},
    ["Base seven legendary"] = {x = -8753.05, y = 25.347, z = 2386.89},
    ["Communauté people ville"] = {x = -8569.865, y = 28.217, z = -5661.357}
}
local currentSelection = "Base une"

Tab2:CreateDropdown({
    Name = "Sélectionner une Destination",
    Options = {"Base une", "Base deux safe", "Base trois blood", "Base quatre people", "Base cinq orange", "Base légende", "Base seven legendary", "Communauté people ville"},
    CurrentOption = "Base une",
    Callback = function(Option) currentSelection = Option end,
})
Tab2:CreateButton({
    Name = "🚀 Se Téléporter à la base",
    Callback = function()
        local pos = locations[currentSelection]
        if pos then 
            triggerGodMode() 
            task.wait(0.1) 
            TeleportToPosition(pos.x, pos.y, pos.z) 
        end
    end,
})

local function GetPlayerNames()
    local names = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= player then table.insert(names, v.Name) end
    end
    if #names == 0 then table.insert(names, "Aucun autre joueur") end
    return names
end

local targetTpPlayer = ""
local TpDropdown = Tab2:CreateDropdown({
    Name = "Sélectionner un Joueur (Pour se TP)",
    Options = GetPlayerNames(),
    CurrentOption = GetPlayerNames()[1] or "",
    Callback = function(Option) targetTpPlayer = Option end,
})
Tab2:CreateButton({
    Name = "🔄 Actualiser la liste des joueurs",
    Callback = function() TpDropdown:Refresh(GetPlayerNames(), true) end,
})
Tab2:CreateButton({
    Name = "⚡ Se Téléporter au Joueur",
    Callback = function()
        local target = Players:FindFirstChild(targetTpPlayer)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            triggerGodMode()
            task.wait(0.1)
            local pos = target.Character.HumanoidRootPart.CFrame
            TeleportToPosition(pos.X, pos.Y, pos.Z)
        end
    end,
})

-- ==========================================
-- INSTANCE 3 : COMBAT MODE
-- ==========================================
local Tab3 = Window:CreateTab("Combat Mode", 114586072621018)

local PlayerDropdown = Tab3:CreateDropdown({
    Name = "Sélectionner un Joueur (Cible)",
    Options = GetPlayerNames(),
    CurrentOption = GetPlayerNames()[1] or "",
    Callback = function(Option) bringTargetName = Option end,
})
Tab3:CreateButton({
    Name = "🔄 Actualiser la cible",
    Callback = function() PlayerDropdown:Refresh(GetPlayerNames(), true) end,
})
Tab3:CreateToggle({
    Name = "🎯 Ramener le joueur sélectionné",
    CurrentValue = false,
    Callback = function(Value)
        bringSingleActive = Value
        if Value then bringAllActive = false end 
    end,
})
Tab3:CreateToggle({
    Name = "💀 Ramener TOUS LES JOUEURS (ALL)",
    CurrentValue = false,
    Callback = function(Value)
        bringAllActive = Value
        if Value then bringSingleActive = false end 
    end,
})
Tab3:CreateInput({
    Name = "Whitelist (Sépare par un tiret '-')",
    PlaceholderText = "Ex: joueur1-joueur2-joueur3",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text) ignoreTargetName = Text end,
})
Tab3:CreateToggle({
    Name = "🛡️ Activer la Whitelist",
    CurrentValue = false,
    Callback = function(Value) ignoreActive = Value end,
})

-- ==========================================
-- INSTANCE 4 : MODE FARM GO
-- ==========================================
local Tab4 = Window:CreateTab("Mode Farm Go", 137079533665791)

Tab4:CreateSlider({
    Name = "📏 Gérer ma Hauteur (Sûre)",
    Range = {0, 50},
    Increment = 1,
    Suffix = " Hauteur",
    CurrentValue = 2,
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.HipHeight = Value
        end
    end,
})
Tab4:CreateDropdown({
    Name = "Sélectionner un Rocher",
    Options = rockList,
    CurrentOption = "TINY ROCK",
    Callback = function(Option) bringRockTarget = Option end,
})
Tab4:CreateToggle({
    Name = "🪨 Ramener le rocher sélectionné (Zéro Lag)",
    CurrentValue = false,
    Callback = function(Value)
        bringSingleRockActive = Value
        if Value then
            -- Recherche unique du rocher pour éviter les chutes de FPS
            local targetName = string.lower(bringRockTarget)
            for _, obj in pairs(workspace:GetDescendants()) do
                if (obj:IsA("Model") or obj:IsA("BasePart")) and string.find(string.lower(obj.Name), targetName) then
                    activeRockObj = obj
                    if obj:IsA("Model") then
                        activeRockOriginalCFrame = obj:GetPivot()
                    else
                        activeRockOriginalCFrame = obj.CFrame
                    end
                    break 
                end
            end
        else
            -- Restauration immédiate
            if activeRockObj and activeRockOriginalCFrame then
                if activeRockObj:IsA("Model") then
                    activeRockObj:PivotTo(activeRockOriginalCFrame)
                elseif activeRockObj:IsA("BasePart") then
                    activeRockObj.CFrame = activeRockOriginalCFrame
                end
            end
            activeRockObj = nil
            activeRockOriginalCFrame = nil
        end
    end,
})

-- ==========================================
-- INSTANCE 5 : STATS JOUEURS (SCAN APPROFONDI)
-- ==========================================
local Tab5 = Window:CreateTab("Stats Joueurs", 134567891234)
local statsParagraph = Tab5:CreateParagraph({
    Title = "Données du Joueur", 
    Content = "Sélectionne un joueur pour lire ses statistiques."
})

local function refreshStats(playerName)
    local target = Players:FindFirstChild(playerName)
    if target then
        local statsText = ""
        local foldersToSearch = {"leaderstats", "Stats", "Data", "playerStats", "hiddenStats"}
        for _, folderName in pairs(foldersToSearch) do
            local folder = target:FindFirstChild(folderName)
            if folder then
                for _, stat in pairs(folder:GetDescendants()) do
                    if stat:IsA("ValueBase") then 
                        statsText = statsText .. "🔹 " .. stat.Name .. " : " .. tostring(stat.Value) .. "\n"
                    end
                end
            end
        end
        if statsText == "" then statsText = "⚠️ Stats introuvables." end
        statsParagraph:Set({Title = "📊 Stats de " .. playerName, Content = statsText})
    else
        statsParagraph:Set({Title = "Erreur", Content = "Joueur introuvable ou déconnecté."})
    end
end

local StatsDropdown = Tab5:CreateDropdown({
    Name = "Sélectionner un Joueur",
    Options = GetPlayerNames(),
    CurrentOption = GetPlayerNames()[1] or "",
    Callback = function(Option) refreshStats(Option) end,
})
Tab5:CreateButton({
    Name = "🔄 Actualiser la liste et les stats",
    Callback = function() 
        StatsDropdown:Refresh(GetPlayerNames(), true)
        if StatsDropdown.CurrentOption ~= "" then refreshStats(StatsDropdown.CurrentOption) end
    end,
})

getgenv().Titre = "Welcome to SORONICE HUB"
getgenv().Message = "This is the best script for this game."
getgenv().Temps = 10

-- LES NOUVELLES OPTIONS DE TEXTE
getgenv().Police = 6          -- 3 = Style Minecraft (1 à 10 disponibles)
getgenv().Gras = true         -- true = Activer le gras (B), false = Désactiver
getgenv().Italique = true     -- true = Activer l'italique (slash), false = Désactiver
getgenv().CouleurTexte = 6    -- 6 = Jaune (1=Blanc, 2=Noir, 3=Rouge, etc.)

-- LES ANCIENNES OPTIONS QUI FONCTIONNENT TOUJOURS
getgenv().LD = 2              -- Contour Noir
getgenv().CouleurFond = 3     -- Fond Blanc
getgenv().ImageID = 101735923084464         -- 0 = Pas d'image
getgenv().ImageArrondi = 0    -- Pas d'arrondi

loadstring(game:HttpGet("https://raw.githubusercontent.com/Audinay/GUI-MESSAGES/refs/heads/main/.lua"))()
