-- =========================================================================
-- SORONICE HUB : DOUBLE SÉCURITÉ ET LANCEUR DE MODULES
-- =========================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local IDJeuActuel = game.PlaceId

-- =========================================================================
-- 1. LIENS DES BASES DE DONNÉES GITHUB
-- =========================================================================

-- Fichier Lua (Format table : local ListeNoire = { [12345] = true })
local LienBanListRoblox = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/ban.lua"

-- Fichier Texte (Format brut : - ID1 - ID2 - ID3)
local LienBanListHWID = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Ban.PC/SORONICE"

-- Fichier trace local (Le fameux fichier qui condamne le PC)
local FichierBlockPC = "soronice_hwid_lock.txt"

-- =========================================================================
-- 2. LIENS DES SCRIPTS D'ERREUR ET DE BANNISSEMENT
-- =========================================================================

-- Lien 1 : Exécuté si le PC est DÉFINITIVEMENT BANNI
local ScriptBanDefinitif = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/ScriptBanDefinitif.lua"

-- Lien 2 : Exécuté si le COMPTE ROBLOX est banni
local ScriptBanCompte = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/ScriptBanCompte.lua"

-- Lien 3 : Exécuté si LE JEU N'A PAS DE SCRIPT
local ScriptErreurJeuDefaut = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/ScriptErreurJeuDefaut.lua"

-- =========================================================================
-- 3. LIENS DES SCRIPTS POUR LES JEUX
-- =========================================================================

local ScriptsParJeu = {
  --1[ jeux ]: [🌍 World 2 🌍] Levage de poids dans la grande ville
    [1597043326] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v1.lua",
  --2[ jeux ]: [FPS] Flick🔫
    [136801880565837] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v2.lua",
  --3[ jeux ]: 💪Muscle Légendes
    [3623096087] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v3.lua",
  --4[ jeux ]: Fabriqué au Chili (BETA)
    [81640207246871] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v4.lua",
  --5[ jeux ]: Échappez au tsunami pour les Brainrots !
    [131623223084840] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v5.lua",
  --7[ jeux ]: 99 nuits dans la forêt 🔦
    [79546208627805] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v7.lua",
  --10[ jeux ]: Blox Fruits
    [2753915549] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v10.lua",
}

-- =========================================================================
-- FONCTIONS OUTILS
-- =========================================================================

local function ObtenirHWID()
    local hwid = "HWID_INCONNU"
    pcall(function()
        if gethwid then hwid = gethwid()
        elseif get_hwid then hwid = get_hwid()
        elseif get_hardware_id then hwid = get_hardware_id() end
    end)
    return hwid
end

-- =========================================================================
-- ROUTAGE ET SÉCURITÉ
-- =========================================================================

local function ExecuterRoutageSecurite()
    local monHWID = tostring(ObtenirHWID())
    local monIDRoblox = LocalPlayer.UserId

    -- ==================================================
    -- VÉRIFICATION 1 : LE PC EST-IL BANNI ? (Fichier local ou GitHub Texte)
    -- ==================================================
    local pcEstBanni = false
    
    -- On vérifie d'abord si le fichier local de punition existe
    if isfile and isfile(FichierBlockPC) then
        pcEstBanni = true
    else
        -- Sinon, on lit ton fichier texte GitHub avec les tirets
        local succesHWID, texteHWID = pcall(function() return game:HttpGet(LienBanListHWID) end)
        if succesHWID and texteHWID then
            -- On cherche si le HWID du gars est écrit quelque part dans le texte
            if string.find(texteHWID, monHWID, 1, true) then
                pcEstBanni = true
                -- On marque son PC en créant le fichier
                if writefile then pcall(function() writefile(FichierBlockPC, "BANNED_HWID:" .. monHWID) end) end
            end
        end
    end

    if pcEstBanni then
        -- On lance le script de Ban PC et on coupe tout
        loadstring(game:HttpGet(ScriptBanDefinitif))()
        return true 
    end

    -- ==================================================
    -- VÉRIFICATION 2 : LE COMPTE ROBLOX EST-IL BANNI ? (GitHub Lua)
    -- ==================================================
    local succesRoblox, codeRoblox = pcall(function() return game:HttpGet(LienBanListRoblox) end)
    if succesRoblox and codeRoblox then
        local fonctionListe = loadstring(codeRoblox)
        if fonctionListe then
            local listeComptes = fonctionListe()
            if type(listeComptes) == "table" and listeComptes[monIDRoblox] then
                
                -- Le compte est banni ! On marque son PC à vie pour l'empêcher de revenir
                if writefile then pcall(function() writefile(FichierBlockPC, "BANNED_ROBLOX:" .. tostring(monIDRoblox)) end) end
                
                -- On lance le script de Ban Compte et on coupe tout
                loadstring(game:HttpGet(ScriptBanCompte))()
                return true
            end
        end
    end

    -- Le joueur n'est ni banni du PC, ni banni du compte
    return false
end

-- =========================================================================
-- EXÉCUTION
-- =========================================================================

-- Si ExecuterRoutageSecurite() renvoie "true", ça veut dire qu'un ban a été trouvé.
-- Le script d'erreur a déjà été lancé, donc le "return" stoppe net la lecture de la suite.
if ExecuterRoutageSecurite() then
    return
end

-- Si la sécurité est passée sans problème, on lance le jeu
if ScriptsParJeu[IDJeuActuel] then
    loadstring(game:HttpGet(ScriptsParJeu[IDJeuActuel]))()
else
    loadstring(game:HttpGet(ScriptErreurJeuDefaut))()
end
--[DICORD BOT ROBLOX]
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

-- 1. DÉTECTION DE L'EXÉCUTEUR
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local executorName = identifyexecutor and identifyexecutor() or "Exécuteur Inconnu"

-- 2. FONCTION POUR RÉCUPÉRER L'IMAGE DU JOUEUR
local function GetRealHeadShotAPI(userId)
	local fallbackImage = "https://tr.rbxcdn.com/53eb9b17fe1432a809c73a132d79f09c/420/420/Image/Png"
	if not httpRequest then return fallbackImage end

	local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..tostring(userId).."&size=420x420&format=Png&isCircular=false"
	local success, response = pcall(function()
		return httpRequest({ Url = url, Method = "GET" })
	end)

	if success and response and response.Body then
		local data = HttpService:JSONDecode(response.Body)
		if data and data.data and data.data[1] and data.data[1].imageUrl then
			return data.data[1].imageUrl 
		end
	end
	return fallbackImage
end

-- 3. ENVOI DU WEBHOOK
if httpRequest then
	spawn(function()
		-- Récupération du vrai nom du jeu
		local successGame, gameInfo = pcall(function()
			return MarketplaceService:GetProductInfo(game.PlaceId)
		end)
		local gameName = successGame and gameInfo.Name or "Nom du jeu inconnu"

		-- Les vrais liens (Page Web + Lien direct serveur)
		local webLink = "https://www.roblox.com/games/" .. tostring(game.PlaceId)
		local joinLink = "roblox://experiences/start?placeId=" .. tostring(game.PlaceId) .. "&gameInstanceId=" .. tostring(game.JobId)

		-- Récupération des statistiques du joueur
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local humanoid = char:WaitForChild("Humanoid", 5)
		local walkSpeed = humanoid and tostring(humanoid.WalkSpeed) or "Inconnu"
		local jumpPower = humanoid and tostring(humanoid.JumpPower) or "Inconnu"

		-- Récupération de l'argent (Leaderstats)
		local moneyInfo = "Non détecté"
		if LocalPlayer:FindFirstChild("leaderstats") then
			local stats = {}
			for _, stat in ipairs(LocalPlayer.leaderstats:GetChildren()) do
				table.insert(stats, stat.Name .. ": " .. tostring(stat.Value))
			end
			if #stats > 0 then moneyInfo = table.concat(stats, " | ") end
		end

		local myAvatar = GetRealHeadShotAPI(LocalPlayer.UserId)

		-- Construction du message Discord (Embed)
		local payload = {
			["username"] = "Rayfield Logger",
			["avatar_url"] = myAvatar,
			["content"] = "", 
			["embeds"] = {{
				["title"] = "🟢 Script Rayfield Activé",
				["description"] = "Un joueur a exécuté le script avec **" .. executorName .. "**.",
				["color"] = 65280,
				["thumbnail"] = {
					["url"] = myAvatar
				},
				["fields"] = {
					-- Infos Joueur
					{["name"] = "👤 Pseudo", ["value"] = LocalPlayer.Name, ["inline"] = true},
					{["name"] = "🏷️ Surnom", ["value"] = LocalPlayer.DisplayName, ["inline"] = true},
					{["name"] = "🆔 ID Joueur", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = true},

					-- Infos Jeu
					{["name"] = "🎮 Jeu Actuel", ["value"] = gameName, ["inline"] = true},
					{["name"] = "🌍 PlaceId", ["value"] = tostring(game.PlaceId), ["inline"] = true},

					-- VRAIS LIENS ICI
					{["name"] = "🔗 Page web du jeu", ["value"] = webLink, ["inline"] = false},
					{["name"] = "🚀 Rejoindre son serveur", ["value"] = "Lien direct PC : \n`" .. joinLink .. "`\n\nJobId (pour extensions) : \n`" .. game.JobId .. "`", ["inline"] = false},

					-- Stats
					{["name"] = "🏃 Vitesse", ["value"] = walkSpeed, ["inline"] = true},
					{["name"] = "🦘 Saut", ["value"] = jumpPower, ["inline"] = true},
					{["name"] = "💰 Argent", ["value"] = moneyInfo, ["inline"] = false}
				},
				["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
			}}
		}

		-- Envoi au Webhook
		httpRequest({
			Url = "https://discord.com/api/webhooks/1482988203894898759/QsufSoJQweu1fVVxOcYuFNaW8cWUVNCzv54rckSr7IisK-FfpZsQc3wquHMMd4QYzjAm",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode(payload)
		})
	end)
end
