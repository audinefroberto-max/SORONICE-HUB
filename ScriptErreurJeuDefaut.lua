getgenv().Titre = "Alert message"
getgenv().Message = "Hello,We are writing to inform you that we have not created a script for this game. We are sorry for the inconvenience, but it will not work. We recommend checking our compatibility page to see the full list of games that work with our script, as this one is not in our library."
getgenv().Temps = 15

-- LES NOUVELLES OPTIONS DE TEXTE
getgenv().Police = 3          -- 3 = Style Minecraft (1 à 10 disponibles)
getgenv().Gras = true         -- true = Activer le gras (B), false = Désactiver
getgenv().Italique = true     -- true = Activer l'italique (slash), false = Désactiver
getgenv().CouleurTexte = 6    -- 6 = Jaune (1=Blanc, 2=Noir, 3=Rouge, etc.)

-- LES ANCIENNES OPTIONS QUI FONCTIONNENT TOUJOURS
getgenv().LD = 2              -- Contour Noir
getgenv().CouleurFond = 5     -- Fond Blanc
getgenv().ImageID = 86356189335165         -- 0 = Pas d'image
getgenv().ImageArrondi = 0    -- Pas d'arrondi

loadstring(game:HttpGet("https://raw.githubusercontent.com/Audinay/GUI-MESSAGES/refs/heads/main/.lua"))()
