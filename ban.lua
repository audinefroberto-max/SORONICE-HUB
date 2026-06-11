-- =========================================================================
-- LISTE NOIRE DES COMPTES BANNIS
-- =========================================================================
-- Ce script est la base de données. Il doit être hébergé sur GitHub.
-- Le script principal viendra lire ces informations pour bloquer les joueurs.

local ListeNoire = {
    [123456789] = true,
}

-- Ne modifie pas cette partie. Elle permet au script principal 
-- de récupérer les informations de cette liste correctement.
return ListeNoire
