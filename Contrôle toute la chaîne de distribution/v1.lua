local soronice = loadstring(game:HttpGet('https://raw.githubusercontent.com/Audinay/Cr-ation-principale-de-mon-site-internet-et-de-mes-scripts./refs/heads/main/Scriptation%20professionell%20SORONICE.COM'))()

-- NOM EXACT DE LA FENÊTRE
local WindowName = "SORONICEv1 HUB"

local Window = soronice:CreateWindow({
    Name = WindowName,
    ShowDevice = true,
    ShowPing = true,
    ShowFPS = true,
    VersionTag = "V13 STABLE",
    KeySystem = false, 
    KeySettings = {
        Title = "ACCÈS PREMIUM",
        LinkText = "Copier le lien",
        Key = "1234", 
        GrabKeyFromSite = false,
        Link = "https://google.com"
    }
})

-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

-- ÉTATS
local muscleActive, speedActive, jumpActive, autoMasteryActive = false, false, false, false
local autoKillPlayersTP = false 
local autoKillPlayersAura = false 
local antiAfkActive = true 
local autoProteinActive = false
local speedHackActive = false 
local godModeActive = false 

-- INITIALISATION VALEURS
local currentWalkSpeed = 16
local currentJumpPower = 50

if player.Character and player.Character:FindFirstChild("Humanoid") then
    currentWalkSpeed = player.Character.Humanoid.WalkSpeed
    currentJumpPower = player.Character.Humanoid.JumpPower
end

local chosenSpeed = currentWalkSpeed
local chosenJump = currentJumpPower
local DISTANCE_MAX = 50 
local TP_DISTANCE_MAX = 5000 
local GamePassID = 1708974634

-- ZONES MT1 / MT2
local MAP_LIMITS = { minX = 738, maxX = 5600, minZ = -923, maxZ = 3388 }
local MAP_LIMITS_2 = {
    minX = 715,   maxX = 6159,
    minZ = -1163, maxZ = 3474,
    maxY = 400 
}

local levels = {
    L1 = false, L2 = false, L3 = false, L4 = false, L5 = false, L6 = false, 
    GLAD = false, TANK = false, GUARD = false, BOSS = false,
    MT2_L1 = false, MT2_L2 = false, MT2_L3 = false, MT2_L4 = false, MT2_L5 = false, MT2_L6 = false,
    MT2_GLAD = false, MT2_TANK = false, MT2_GUARD = false, MT2_BOSS = false
}

-- ANTI-AFK (Renforcé pour tenir 24h+)
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- SAFE ZONE
local function isPlayerInSafeZone(targetChar)
    local detectionPart = game.Workspace:FindFirstChild("DetectionPart", true)
    if detectionPart and targetChar:FindFirstChild("HumanoidRootPart") then
        local hrpPos = targetChar.HumanoidRootPart.Position
        local partPos = detectionPart.Position
        local partSize = detectionPart.Size
        return (hrpPos.X >= partPos.X - partSize.X/2 and hrpPos.X <= partPos.X + partSize.X/2) and
               (hrpPos.Y >= partPos.Y - partSize.Y/2 and hrpPos.Y <= partPos.Y + partSize.Y/2) and
               (hrpPos.Z >= partPos.Z - partSize.Z/2 and hrpPos.Z <= partPos.Z + partSize.Z/2)
    end
    return false
end

-- ==========================================
-- ONGLET 1 : AUTOFORM & GOD MODE
-- ==========================================
local Tab1 = Window:CreateTab("AutoForm", 79047049601630)

Tab1:CreateToggle({
   Name = "💪 Auto Muscle",
   CurrentValue = false,
   Callback = function(Value)
      muscleActive = Value
      task.spawn(function()
         while muscleActive do
            local char = player.Character
            local tool = char and (char:FindFirstChild("Weight") or player.Backpack:FindFirstChild("Weight"))
            if tool then 
                if tool.Parent ~= char then tool.Parent = char end
                tool:Activate() 
            end
            task.wait(0.01) 
         end
      end)
   end,
})

Tab1:CreateToggle({
   Name = "⚡ Auto Speed (Drink)",
   CurrentValue = false,
   Callback = function(Value)
      speedActive = Value
      task.spawn(function()
         while speedActive do
            local char = player.Character
            local tool = char and (char:FindFirstChild("Drink") or player.Backpack:FindFirstChild("Drink"))
            if tool then 
                if tool.Parent ~= char then tool.Parent = char end
                tool:Activate() 
            end
            task.wait(0.01)
         end
      end)
   end,
})

Tab1:CreateToggle({
   Name = "⭐ Auto Mastery (Points)",
   CurrentValue = false,
   Callback = function(Value)
      autoMasteryActive = Value
      task.spawn(function()
         while autoMasteryActive do
            if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("IncreaseMastery") then
                ReplicatedStorage.Remotes.IncreaseMastery:FireServer()
            end
            task.wait(0.3)
         end
      end)
   end,
})

Tab1:CreateToggle({
   Name = "🍫 Auto Protein Bar",
   CurrentValue = false,
   Callback = function(Value)
      autoProteinActive = Value
      if autoProteinActive then
          task.spawn(function()
             while autoProteinActive do
                local args = { "ProteinBar" }
                if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("UseConsumable") then
                    ReplicatedStorage.Remotes.UseConsumable:InvokeServer(unpack(args))
                end
                task.wait(0.1)
             end
          end)
      end
   end,
})

-- SYSTÈME VITESSE MANUEL
Tab1:CreateSection("Réglages Vitesse/Saut")

Tab1:CreateToggle({
   Name = "⚡ Activer Modifs Vitesse/Saut",
   CurrentValue = false,
   Callback = function(Value)
       speedHackActive = Value
       if not speedHackActive and player.Character and player.Character:FindFirstChild("Humanoid") then
           player.Character.Humanoid.WalkSpeed = 16
           player.Character.Humanoid.JumpPower = 50
       end
   end,
})

Tab1:CreateSlider({
   Name = "🏃 Vitesse de Course",
   Range = {16, 1000},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) 
       chosenSpeed = Value 
   end,
})

Tab1:CreateSlider({
   Name = "⏫ Puissance de Saut",
   Range = {50, 1000},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) 
       chosenJump = Value 
   end,
})

Tab1:CreateToggle({
   Name = "🚀 Saut Infini",
   CurrentValue = false,
   Callback = function(Value) jumpActive = Value end,
})

-- ==========================================
-- ONGLET 2 : KILL ENEMY
-- ==========================================
local Tab2 = Window:CreateTab("kill Enemy", 77992538168733)

Tab2:CreateSection("MT1")

local function findNearestEnemy(targetName)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    
    local nearest = nil
    local minDist = math.huge
    
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == targetName and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            local dist = (char.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist < minDist and dist <= TP_DISTANCE_MAX then
                minDist = dist
                nearest = v
            end
        end
    end
    return nearest
end

local function CreateKillToggleMT1(displayName, stateKey, targetName)
    Tab2:CreateToggle({
       Name = displayName,
       CurrentValue = false,
       Callback = function(Value)
          levels[stateKey] = Value
          
          if levels[stateKey] then
             task.spawn(function()
                while levels[stateKey] do
                   local char = player.Character
                   if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then
                       task.wait(1) 
                       continue 
                   end

                   local myPos = char.HumanoidRootPart.Position
                   if myPos.X < MAP_LIMITS.minX or myPos.X > MAP_LIMITS.maxX or 
                      myPos.Z < MAP_LIMITS.minZ or myPos.Z > MAP_LIMITS.maxZ then
                      -- Hors zone
                   end

                   local target = findNearestEnemy(targetName)
                   
                   if target then
                       local tHrp = target:FindFirstChild("HumanoidRootPart")
                       local tHum = target:FindFirstChild("Humanoid")
                       
                       while levels[stateKey] and target and tHum and tHum.Health > 0 and char.Humanoid.Health > 0 do
                           -- OPTIMISATION ANTI-CRASH & ANTI-LAG
                           local targetPos = tHrp.CFrame * CFrame.new(0, 0, 3)
                           
                           -- Ne met à jour le CFrame que si on est loin (évite le lag visuel et la surcharge moteur)
                           if (char.HumanoidRootPart.Position - targetPos.Position).Magnitude > 2 then
                               char.HumanoidRootPart.CFrame = targetPos
                               char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                               char.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                           end
                           
                           local combat = char:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                           if combat then 
                               -- Évite la fuite de mémoire (ne reparente pas si c'est déjà fait)
                               if combat.Parent ~= char then 
                                   combat.Parent = char 
                               end
                               if combat:FindFirstChild("ToolScript") then
                                   combat.ToolScript.Action:FireServer("HitEvent", {HitPart = tHrp, OriginPart = char:FindFirstChild("LeftHand"), HitDirection = Vector3.new(0,0,0)})
                               end
                           end
                           
                           Remotes.HitSignal:FireServer(tHrp, 5853689.8, true)
                           Remotes.SendData:FireServer("NPC_Kill_Val", targetName, 2058)
                           
                           -- Le Sweet Spot pour ne pas saturer le serveur sur la durée
                           task.wait(0.1) 
                       end
                   else
                       task.wait(0.5) 
                   end
                end
             end)
          end
       end,
    })
end

CreateKillToggleMT1("Level un", "L1", "Noob")
CreateKillToggleMT1("Level deux", "L2", "Noob2")
CreateKillToggleMT1("Level trois", "L3", "Noob3")
CreateKillToggleMT1("Level quatre", "L4", "Noob4")
CreateKillToggleMT1("Level cinq", "L5", "Noob5")
CreateKillToggleMT1("Level six", "L6", "Noob6")
CreateKillToggleMT1("⚔️ Gladiator", "GLAD", "Gladiator")
CreateKillToggleMT1("🛡️ Tank", "TANK", "Tank")
CreateKillToggleMT1("👑 Guardian", "GUARD", "Guardian")
CreateKillToggleMT1("👹 Boss", "BOSS", "Boss")

Tab2:CreateSection("MT2 (VIP 🔒)")

Tab2:CreateButton({
   Name = "📋 Get the battle pass link",
   Callback = function()
      setclipboard("https://www.roblox.com/fr/game-pass/1708974634/Mode-de-combat-SORONICE-HUB")
      soronice:Notify({Title = "Copié !", Content = "Le lien est dans ton presse-papier.", Duration = 2})
   end,
})

local function CreateKillToggleMT2(displayName, stateKey, targetName)
    Tab2:CreateToggle({
       Name = "🔒 " .. displayName, 
       CurrentValue = false,
       Callback = function(Value)
          
          local hasPass = false
          pcall(function()
              hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, GamePassID)
          end)

          if not hasPass then
              if Value == true then
                  MarketplaceService:PromptGamePassPurchase(player, GamePassID)
                  soronice:Notify({Title = "PAS DE PASS", Content = "Ah, veuillez payer le pass.", Duration = 3})
              end
              levels[stateKey] = false 
              return 
          end

          levels[stateKey] = Value
          if levels[stateKey] then
             task.spawn(function()
                while levels[stateKey] do
                   local char = player.Character
                   if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then
                       task.wait(1)
                       continue 
                   end

                   local target = findNearestEnemy(targetName)
                   
                   if target then
                       local tHrp = target:FindFirstChild("HumanoidRootPart")
                       local tHum = target:FindFirstChild("Humanoid")
                       
                       while levels[stateKey] and target and tHum and tHum.Health > 0 and char.Humanoid.Health > 0 do
                           
                           local myPos = char.HumanoidRootPart.Position
                           if myPos.Y > MAP_LIMITS_2.maxY then
                               char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame - Vector3.new(0, 5, 0)
                           end

                           local targetPos = tHrp.CFrame * CFrame.new(0, 0, 3)
                           if (char.HumanoidRootPart.Position - targetPos.Position).Magnitude > 2 then
                               char.HumanoidRootPart.CFrame = targetPos
                               char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                               char.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                           end
                           
                           local combat = char:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                           if combat then 
                               if combat.Parent ~= char then combat.Parent = char end
                               if combat:FindFirstChild("ToolScript") then
                                   combat.ToolScript.Action:FireServer("HitEvent", {HitPart = tHrp, OriginPart = char:FindFirstChild("LeftHand"), HitDirection = Vector3.new(0,0,0)})
                               end
                           end
                           
                           Remotes.HitSignal:FireServer(tHrp, 5853689.8, true)
                           Remotes.SendData:FireServer("NPC_Kill_Val", targetName, 2058)
                           
                           task.wait(0.1) 
                       end
                   else
                       task.wait(0.5) 
                   end
                end
             end)
          end
       end,
    })
end

CreateKillToggleMT2("Level un", "MT2_L1", "Beast")
CreateKillToggleMT2("Level deux", "MT2_L2", "HammerWarrior")
CreateKillToggleMT2("Level trois", "MT2_L3", "Nightshade")
CreateKillToggleMT2("Level quatre", "MT2_L4", "Elite")
CreateKillToggleMT2("Level cinq", "MT2_L5", "Commander")
CreateKillToggleMT2("Level six", "MT2_L6", "Quickblade")
CreateKillToggleMT2("⚔️ Gladiator", "MT2_GLAD", "NightTerror")
CreateKillToggleMT2("🛡️ Tank", "MT2_TANK", "Knight")
CreateKillToggleMT2("👑 Guardian", "MT2_GUARD", "Swordmaster")
CreateKillToggleMT2("👹 Boss", "MT2_BOSS", "Boss")

-- ==========================================
-- ONGLET 3 : AutoKILL
-- ==========================================
local Tab3 = Window:CreateTab("AutoKILL", 74139402690197)

local targetPlayerName = ""
local autoKillSpecificPlayer = false
local currentHighlight = nil

local function getPlayerFromPartialName(partialName)
    if not partialName or partialName == "" then return nil end
    local lowerPartial = string.lower(partialName)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            if string.lower(string.sub(p.Name, 1, #lowerPartial)) == lowerPartial or 
               string.lower(string.sub(p.DisplayName, 1, #lowerPartial)) == lowerPartial then
                return p
            end
        end
    end
    return nil
end

Tab3:CreateSection("🎯 Ciblage Spécifique")

Tab3:CreateInput({
   Name = "Nom du joueur",
   PlaceholderText = "Entrez le nom ou pseudo exact/partiel",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      targetPlayerName = Text
   end,
})

Tab3:CreateToggle({
   Name = "🎯 Kill & ESP Joueur Ciblé (TP)",
   CurrentValue = false,
   Callback = function(Value)
      autoKillSpecificPlayer = Value
      
      if not autoKillSpecificPlayer then
          if currentHighlight then
              currentHighlight:Destroy()
              currentHighlight = nil
          end
      else
          task.spawn(function()
             while autoKillSpecificPlayer do
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then
                    task.wait(1)
                    continue
                end

                local targetPlayer = getPlayerFromPartialName(targetPlayerName)
                
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health > 0 then
                    local tChar = targetPlayer.Character
                    local tHrp = tChar:FindFirstChild("HumanoidRootPart")
                    
                    if tHrp and not isPlayerInSafeZone(tChar) then
                        if not currentHighlight or currentHighlight.Parent ~= tChar then
                            if currentHighlight then currentHighlight:Destroy() end
                            currentHighlight = Instance.new("Highlight")
                            currentHighlight.FillColor = Color3.fromRGB(255, 0, 0)
                            currentHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                            currentHighlight.FillTransparency = 0.5
                            currentHighlight.OutlineTransparency = 0
                            currentHighlight.Parent = tChar
                        end

                        while autoKillSpecificPlayer and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health > 0 and char.Humanoid.Health > 0 and not isPlayerInSafeZone(targetPlayer.Character) do
                            local combat = char:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                            if combat then 
                                if combat.Parent ~= char then combat.Parent = char end 
                            end
                            
                            local targetPos = tHrp.CFrame * CFrame.new(0, 0, 3)
                            if (char.HumanoidRootPart.Position - targetPos.Position).Magnitude > 2 then
                                char.HumanoidRootPart.CFrame = targetPos
                                char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                char.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                            end
                            
                            if combat and combat:FindFirstChild("ToolScript") then
                               combat.ToolScript.Action:FireServer("HitEvent", {HitPart = tHrp, OriginPart = char:FindFirstChild("LeftHand"), HitDirection = Vector3.new(0,0,0)})
                            end
                            Remotes.HitSignal:FireServer(tHrp, 5853689.8, true)
                            task.wait(0.1)
                        end
                    else
                        task.wait(0.5)
                    end
                else
                    if currentHighlight then
                        currentHighlight:Destroy()
                        currentHighlight = nil
                    end
                    task.wait(0.5)
                end
             end
          end)
      end
   end,
})

Tab3:CreateSection("🌐 Kill Général")

Tab3:CreateToggle({
   Name = "⚔️ PvP Aura (Attaque sans TP)",
   CurrentValue = false,
   Callback = function(Value)
      autoKillPlayersAura = Value
      task.spawn(function()
         while autoKillPlayersAura do
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
               for _, p in pairs(Players:GetPlayers()) do
                  if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                     local tHrp = p.Character:FindFirstChild("HumanoidRootPart")
                     if tHrp then
                        local dist = (char.HumanoidRootPart.Position - tHrp.Position).Magnitude
                        if dist <= 50 and not isPlayerInSafeZone(p.Character) then
                           local combat = char:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                           if combat then 
                               if combat.Parent ~= char then combat.Parent = char end 
                           end
                           if combat and combat:FindFirstChild("ToolScript") then
                               combat.ToolScript.Action:FireServer("HitEvent", {HitPart = tHrp, OriginPart = char:FindFirstChild("LeftHand"), HitDirection = Vector3.new(0,0,0)})
                           end
                           Remotes.HitSignal:FireServer(tHrp, 5853689.8, true)
                        end
                     end
                  end
               end
            end
            task.wait(0.1) 
         end
      end)
   end,
})

Tab3:CreateToggle({
   Name = "💀 Kill Players (Avec TP)",
   CurrentValue = false,
   Callback = function(Value)
      autoKillPlayersTP = Value
      task.spawn(function()
         while autoKillPlayersTP do
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
               for _, p in pairs(Players:GetPlayers()) do
                  if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                     local tHrp = p.Character:FindFirstChild("HumanoidRootPart")
                     if tHrp then
                        local dist = (char.HumanoidRootPart.Position - tHrp.Position).Magnitude
                        if dist <= TP_DISTANCE_MAX and not isPlayerInSafeZone(p.Character) then
                           while autoKillPlayersTP and p.Character.Humanoid.Health > 0 and char.Humanoid.Health > 0 and not isPlayerInSafeZone(p.Character) do
                              local combat = char:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                              if combat then 
                                  if combat.Parent ~= char then combat.Parent = char end 
                              end
                              
                              local targetPos = tHrp.CFrame * CFrame.new(0, 0, 3)
                              if (char.HumanoidRootPart.Position - targetPos.Position).Magnitude > 2 then
                                  char.HumanoidRootPart.CFrame = targetPos
                                  char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                  char.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                              end
                              
                              if combat and combat:FindFirstChild("ToolScript") then
                                 combat.ToolScript.Action:FireServer("HitEvent", {HitPart = tHrp, OriginPart = char:FindFirstChild("LeftHand"), HitDirection = Vector3.new(0,0,0)})
                              end
                              Remotes.HitSignal:FireServer(tHrp, 5853689.8, true)
                              task.wait(0.1)
                           end
                        end
                     end
                  end
               end
            end
            task.wait(0.5)
         end
      end)
   end,
})

Tab3:CreateToggle({
   Name = "🛡️ God Mode (Test Client)",
   CurrentValue = false,
   Callback = function(Value)
      godModeActive = Value
      if godModeActive then
          if player.Character and player.Character:FindFirstChild("Humanoid") then
             player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
          end
      else
          if player.Character and player.Character:FindFirstChild("Humanoid") then
             player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
          end
      end
   end,
})

-- ==========================================
-- ONGLET 4 : TELEPORT
-- ==========================================
local Tab4 = Window:CreateTab("Teleport", 117045890360282)

-- Nouvelle fonction pour se téléporter à des coordonnées exactes
local function TeleportToCoords(x, y, z)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

Tab4:CreateButton({
   Name = "🏝️ Retour Safe Zone",
   Callback = function()
      local char = player.Character
      local safePart = game.Workspace:FindFirstChild("DetectionPart", true) or game.Workspace:FindFirstChild("SpawnLocation", true)
      if char and char:FindFirstChild("HumanoidRootPart") and safePart then
          char.HumanoidRootPart.CFrame = safePart.CFrame + Vector3.new(0, 10, 0)
      end
   end,
})

Tab4:CreateSection("Zones de Téléportation1")

Tab4:CreateButton({ 
   Name = "📍 1.3x Boost de force", 
   Callback = function() 
       TeleportToCoords(3513, 685, 1273) 
   end 
})

Tab4:CreateButton({ 
   Name = "📍 1.2x Boost de force", 
   Callback = function() 
       TeleportToCoords(3174, 48, 1228) 
   end 
})

Tab4:CreateButton({ 
   Name = "📍 1.1x Boost de force", 
   Callback = function() 
       TeleportToCoords(4482, 16, 1115) 
   end 
})

Tab4:CreateButton({ 
   Name = "📍 1.1x Boost de force", 
   Callback = function() 
       TeleportToCoords(3360, 16, 796) 
   end 
})

Tab4:CreateButton({ 
   Name = "📍 1.2x Boost de force", 
   Callback = function() 
       TeleportToCoords(2115, 17, 1538) 
   end 
})

Tab4:CreateSection("Zones de Téléportation2")

Tab4:CreateButton({ 
   Name = "📍 1.35x Boost de force", 
   Callback = function() 
       TeleportToCoords(3546, 1067, 1039) 
   end 
})

Tab4:CreateButton({ 
   Name = "📍 1.2x Boost de force", 
   Callback = function() 
       TeleportToCoords(2748, 18, 280) 
   end 
})

Tab4:CreateButton({ 
   Name = "📍 1.2x Boost de force", 
   Callback = function() 
       TeleportToCoords(3699, 18, 1652) 
   end 
})
-- ==========================================
-- LOGIQUE TECHNIQUE (GÉRÉE PAR BOUTON MANUEL)
-- ==========================================

RunService.RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local hum = player.Character.Humanoid
        
        if godModeActive then
            hum.Health = hum.MaxHealth 
        end
        
        if speedHackActive then
            hum.WalkSpeed = chosenSpeed
            hum.JumpPower = chosenJump
            hum.UseJumpPower = true
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
   if jumpActive and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
      player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
   end
end)

soronice:Notify({
   Title = "Welcome to SORONICE HUB",
   Content = "I hope you will be satisfied with my script.",
   Duration = 6,
   Image = 101735923084464,
})
