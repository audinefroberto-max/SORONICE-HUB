local Soronice = loadstring(game:HttpGet("https://raw.githubusercontent.com/Audinay/Cr-ation-principale-de-mon-site-internet-et-de-mes-scripts./refs/heads/main/Scriptation%20professionell%20SORONICE.COM"))()

-- ====================================================
-- 1. SYSTÈME DE NETTOYAGE INTELLIGENT (VIP WALLS)
-- ====================================================
task.spawn(function()
    while true do
        local targetName = "VIPWalls"
        local found = false
        
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj.Name == targetName then
                obj:Destroy()
                found = true
            end
        end
        
        if found then
            Soronice:Notify({Title = "Nettoyage", Content = "VIP Walls supprimés.", Duration = 3})
        end
        
        task.wait(300) 
    end
end)

-- ====================================================
-- 2. CONFIGURATION DU HUB
-- ====================================================
local Window = Soronice:CreateWindow({
    Name = "SORONICE HUB - CROUCH FIXED",
    KeySystem = false,
    VersionTag = "V12 FIX",
    ShowDevice = true,
    ShowPing = true,
    ShowFPS = true,
    StatusIcons = {"rbxassetid://101516465585914", "rbxassetid://76095216033555"}
})

local MainTab = Window:CreateTab("Vitesse & Physique", 4483362458)

-- SERVICES
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- VARIABLES VITESSE ET SAUT
local speedToggleActive = false 
local chosenSpeed = 16          
local chosenJumpPower = 50 -- Nouvelle variable pour le saut

-- VARIABLES ACCROUPISSEMENT (CROUCH)
local crouchActive = false
-- On utilise des IDs "Sneak" plus génériques (R15)
local animIdle = Instance.new("Animation")
animIdle.AnimationId = "rbxassetid://507766388" -- Idle Furtif
local animWalk = Instance.new("Animation")
animWalk.AnimationId = "rbxassetid://507766666" -- Marche Furtive

local trackIdle = nil
local trackWalk = nil
local originalHipHeight = 2 -- Valeur par défaut (sera mise à jour)

-- FONCTION ANTI-GLISSADE
local function setAntiSlide(enabled)
    if not player.Character then return end
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    
    if root then
        if enabled then
            local physicalProps = PhysicalProperties.new(100, 100, 0, 100, 0)
            root.CustomPhysicalProperties = physicalProps
        else
            root.CustomPhysicalProperties = nil
        end
    end
end

-- ====================================================
-- 3. LOGIQUE VITESSE + SAUT + ACCROUPISSEMENT
-- ====================================================

-- TOGGLE PRINCIPAL (VITESSE + SAUT)
MainTab:CreateToggle({
    Name = "⚡ Speed Hack + Jump + Anti-Glissade",
    CurrentValue = false,
    Callback = function(Value)
        speedToggleActive = Value
        
        if speedToggleActive then
            setAntiSlide(true)
        else
            -- Réinitialisation quand on désactive
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 16
                player.Character.Humanoid.UseJumpPower = true
                player.Character.Humanoid.JumpPower = 50
            end
            setAntiSlide(false)
        end
    end,
})

MainTab:CreateSlider({
    Name = "Réglage Vitesse",
    Range = {16, 5000}, 
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        chosenSpeed = Value
    end,
})

-- NOUVEAU SLIDER POUR LE SAUT
MainTab:CreateSlider({
    Name = "Réglage Saut",
    Range = {50, 5000}, -- Tu peux augmenter le max si tu veux sauter encore plus haut
    Increment = 1,
    CurrentValue = 50,
    Callback = function(Value)
        chosenJumpPower = Value
    end,
})

-- TOGGLE ACCROUPISSEMENT (AMÉLIORÉ)
MainTab:CreateToggle({
    Name = "🥷 Mode Accroupi (Physique)",
    CurrentValue = false,
    Callback = function(Value)
        crouchActive = Value
        
        if not player.Character or not player.Character:FindFirstChild("Humanoid") then return end
        local hum = player.Character.Humanoid

        if crouchActive then
            -- Sauvegarde la hauteur d'origine
            originalHipHeight = hum.HipHeight
            -- Baisse la hauteur physique (Hitbox plus petite)
            hum.HipHeight = originalHipHeight - 1.5 
            -- Ralentit un peu pour le réalisme (optionnel, tu peux enlever)
            hum.WalkSpeed = 8 
        else
            -- Désactive : on remet la hauteur, la vitesse et on stop les anims
            hum.HipHeight = originalHipHeight
            hum.WalkSpeed = 16
            if trackIdle then trackIdle:Stop() end
            if trackWalk then trackWalk:Stop() end
        end
    end,
})

-- BOUCLE PRINCIPALE (Gère Vitesse + Saut + Animations)
RunService.RenderStepped:Connect(function()
    if player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        
        if hum and root then
            -- 1. GESTION VITESSE ET SAUT (Si Toggle est ON)
            if speedToggleActive then
                if hum.WalkSpeed ~= chosenSpeed then
                    hum.WalkSpeed = chosenSpeed
                end
                
                -- Application de la puissance de saut
                hum.UseJumpPower = true
                if hum.JumpPower ~= chosenJumpPower then
                    hum.JumpPower = chosenJumpPower
                end

                if root.CustomPhysicalProperties == nil then
                    setAntiSlide(true)
                end
            end

            -- 2. GESTION ACCROUPISSEMENT (Si Crouch est ON)
            -- Note: Si SpeedHack est ON aussi, il écrasera la vitesse de marche du crouch (ce qui est bien)
            if crouchActive then
                -- Chargement des animations si pas encore fait (ou après respawn)
                if not trackIdle or not trackWalk then
                     trackIdle = hum:LoadAnimation(animIdle)
                     trackIdle.Priority = Enum.AnimationPriority.Action
                     trackWalk = hum:LoadAnimation(animWalk)
                     trackWalk.Priority = Enum.AnimationPriority.Action
                end

                -- Détection du mouvement
                if hum.MoveDirection.Magnitude > 0 then
                    -- Le joueur bouge -> Animation Marche
                    if not trackWalk.IsPlaying then trackWalk:Play() end
                    if trackIdle.IsPlaying then trackIdle:Stop() end
                else
                    -- Le joueur est à l'arrêt -> Animation Idle
                    if not trackIdle.IsPlaying then trackIdle:Play() end
                    if trackWalk.IsPlaying then trackWalk:Stop() end
                end
            end
        end
    end
end)

-- GESTION DU RESPAWN (Reset des pistes d'animation)
player.CharacterAdded:Connect(function(newChar)
    task.wait(1)
    if speedToggleActive then setAntiSlide(true) end
    -- On reset les tracks pour qu'ils soient rechargés sur le nouveau perso
    trackIdle = nil
    trackWalk = nil
end)

MainTab:CreateButton({
    Name = "🗑️ Force Delete Walls",
    Callback = function()
        local count = 0
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj.Name == "VIPWalls" then
                obj:Destroy()
                count = count + 1
            end
        end
        Soronice:Notify({Title = "Action Manuelle", Content = count .. " murs supprimés.", Duration = 2})
    end,
})
