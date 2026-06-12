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
  --1[ jeux ]: [FPS] Flick🔫
    [136801880565837] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v2.lua",
  --1[ jeux ]: 💪Muscle Légendes
    [3623096087] = "https://raw.githubusercontent.com/audinefroberto-max/SORONICE-HUB/refs/heads/main/Contr%C3%B4le%20toute%20la%20cha%C3%AEne%20de%20distribution/v3.lua",
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
