local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "ptFR")
if not L then return end


--Addon information
L ["Spy"] = "Spy"
L ["Version"] = "Version"
L ["LoadDescription"] = "Add |cff9933ffSpy chargé. Type |cffffffff/spy|cff9933ff pour les options."
L ["SpyEnabled"] = "Add |cff9933ffSpy activé."
L ["SpyDisabled"] = "Add |cff9933ffSpy désactivé. Tapez show|cff9933ff |cffffffff/espion pour permettre."
L ["UpgradeAvailable"] = "nouvelle version de |cff9933ffA d'espion est disponible. Il peut être téléchargé à partir : \n| cffffffffhttps://mods.curse.com/addons/wow/spy"
 
--Cordes configuration
L ["profils"] = "Profils"
 
L ["GeneralSettings"] = "Paramètres généraux"
L ["SpyDescription1"] = [[
Espion est un addon qui vous signalera la présence de joueurs ennemis à proximité.
]]
L ["SpyDescription2"] = [[
 
|cffffd000Nearby list|cffffffff
La liste dans les environs affiche tout les joueurs ennemis qui ont été détectés à proximité. En cliquant sur la liste vous permet de cibler le joueur, mais cela ne fonctionne pas. Les joueurs sont supprimés de la liste si elles n'ont pas été détectés après un laps de temps.
 
Le bouton effacer dans la barre de titre peut être utilisé pour effacer la liste, et la holding de contrôle lors du nettoyage de la liste vous permettra d'activer/désactiver rapidement le Spy.
 
|cffffd000Last heure list|cffffffff
La liste de la dernière heure affiche tous les ennemis qui ont été détectés dans la dernière heure.
 
|cffffd000Ignore list|cffffffff
Les joueurs qui sont ajoutés à la liste des exclusions ne sont pas signalés par Spy. Vous pouvez ajouter et supprimer des joueurs à partir de cette liste à l'aide du menu déroulant du bouton ou en maintenant la touche Contrôle enfoncée tout en cliquant sur le bouton.
 
|cffffd000Kill on Sight list|cffffffff
Joueurs sur votre liste de Kill On Sight rendre une alarme sonne quand détecté. Vous pouvez ajouter et supprimer des joueurs à partir de cette liste à l'aide du menu déroulant du bouton ou en tenant la touche Maj enfoncée tout en cliquant sur le bouton.
 
Le menu déroulant peut également servir à définir les raisons pourquoi vous avez quelqu'un ajouté à la liste de Kill On Sight. Si vous voulez entrer une raison particulière qui n'est pas dans la liste, puis utilisez la "Entrez votre propre raison..." dans L'autre liste.
 
 
|cffffd000Author : http://www.curse.com/users/slipjack |cffffffff
 
]]
L ["EnableSpy"] = "Activer le Spy"
L ["EnableSpyDescription"] = "active ou désactive Spy fois maintenant, mais aussi sur ouverture de session".
L ["EnabledInBattlegrounds"] = "Activer l'espion en champ de bataille"
L ["EnabledInBattlegroundsDescription"] = "Active ou désactive les espion lorsque vous êtes dans un champ de bataille."
L ["EnabledInArenas"] = "Activer l'espion dans les arènes"
L ["EnabledInArenasDescription"] = "Active ou désactive les espion lorsque vous êtes dans une arène."
L ["EnabledInWintergrasp"] = "Activer l'espion dans les zones de combat mondial"
L ["EnabledInWintergraspDescription"] = "Active ou désactive les espion lorsque vous êtes dans les zones de combat de monde comme le lac Joug-d'hiver en Norfendre."
L ["DisableWhenPVPUnflagged"] = "Disable espion lorsque le ne pas pour le PVP"
L ["DisableWhenPVPUnflaggedDescription"] = "Active ou désactive le Spy selon votre statut de PVP."
 
L ["DisplayOptions"] = "Affichage"
L ["DisplayOptionsDescription"] = [[
Espion peut être affichée ou masquée automatiquement.
]]
L ["ShowOnDetection"] = "Voir la Spy lorsque les joueurs ennemis sont détectés"
L ["ShowOnDetectionDescription"] = "DΘfinir ceci pour afficher la fenêtre Espion et la liste dans les environs si espion est masquée lorsque les joueurs ennemis sont détectés."
L ["HideSpy"] = "Hide espion lorsque aucun joueurs ennemis ne sont détectés"
L ["HideSpyDescription"] = "mettre à la masquer Spy lorsque la liste dans les environs s'affiche et il devient vide. Espion ne sera pas cachée si vous effacez la liste manuellement."
L ["LockSpy"] = "Verrouiller la fenêtre Espion"
L ["LockSpyDescription"] = "Bloquer la fenêtre Espion en place donc il ne bouge pas."
L ["InvertSpy"] = "Inverser la fenêtre Espion"
L ["InvertSpyDescription"] = "Renverse la fenêtre Espion à l'envers."
L ["ResizeSpy"] = "Redimensionner la fenêtre Espion automatiquement"
L ["ResizeSpyDescription"] = "Mettre à la redimensionner automatiquement la fenêtre Espion, comme les joueurs ennemis sont ajoutés et supprimés."
L ["TooltipDisplayWinLoss"] = "Afficher les statistiques de victoires/défaites dans l'info-bulle"
L ["TooltipDisplayWinLossDescription"] = "DΘfinir ceci pour afficher les statistiques de victoires/défaites d'un joueur dans l'info-bulle du joueur."
L ["TooltipDisplayKOSReason"] = "Affichage Kill On Sight raisons dans l'info-bulle"
L ["TooltipDisplayKOSReasonDescription"] = "DΘfinir ceci pour afficher la mise à mort sur les raisons de la vue d'un joueur dans l'info-bulle du joueur."
L ["TooltipDisplayLastSeen"] = "Détails Visualisez la dernière fois dans l'info-bulle"
L ["TooltipDisplayLastSeenDescription"] = "DΘfinir ceci pour afficher la dernière fois connue et l'emplacement d'un joueur dans l'info-bulle du joueur."
 
L ["AlertOptions"] = "Alertes"
L ["AlertOptionsDescription"] = [[
Vous pouvez annoncer les détails sur une rencontre sur un chat canaliser et contrôlent comment espion vous avertit lorsque les joueurs ennemis sont détectés.
]]
L ["Announce"] = "annoncer à:"
L ["None"] = "None"
L ["NoneDescription"] = "N'annoncent pas lorsque les joueurs ennemis sont détectées".
L ["Self"] = "Auto"
L ["SelfDescription"] = "Annonce à vous-même lorsque les joueurs ennemis sont détectés."
L ["Party"] = "Partie"
L ["PartyDescription"] = "Annonce à votre partie lorsque les joueurs ennemis sont détectés."
L ["Guild"] = "Guilde"
L ["GuildDescription"] = "Annonce à votre guilde lorsque les joueurs ennemis sont détectés."
L ["Raid"] = "Raid"
L ["RaidDescription"] = "Annonce à votre raid lorsque les joueurs ennemis sont détectés."
L ["LocalDefense"] = "La défense locale"
L ["LocalDefenseDescription"] = "Annonce sur le canal de défense locale lorsque les joueurs ennemis sont détectés."
L ["OnlyAnnounceKoS"] = "Seulement annoncer les joueurs ennemis qui sont tuer à vue"
L ["OnlyAnnounceKoSDescription"] = "Mettre à n'annoncer que les joueurs ennemis qui se trouvent sur votre Kill sur liste vue."
L ["WarnOnStealth"] = "Avertir en cas de détection furtif"
L ["WarnOnStealthDescription"] = "DΘfinir ceci pour afficher un avertissement et déclenche une alerte lorsque gains d'un joueur ennemi furtif."
L ["WarnOnKOS"] = "Avertir sur Kill sur la détection de la vue"
L ["WarnOnKOSDescription"] = "DΘfinir ceci pour afficher un avertissement et déclenche une alerte lorsqu'un joueur ennemi sur votre Kill sur liste vue est détecté."
L ["WarnOnKOSGuild"] = "Avertir sur Kill sur détection de guilde de vue"
L ["WarnOnKOSGuildDescription"] = "DΘfinir ceci pour afficher un avertissement et déclenche une alerte lorsqu'un joueur ennemi dans la même guilde que quelqu'un sur votre Kill sur liste vue est détecté."
L ["DisplayWarningsInErrorsFrame"] = "Afficher les mises en garde dans le cadre d'Erreurs"
L ["DisplayWarningsInErrorsFrameDescription"] = "DΘfinir cette option pour utiliser la trame d'erreurs pour afficher les avertissements au lieu d'utiliser les cadres popup graphique."
L ["EnableSound"] = "Activer les alertes audio"
L ["EnableSoundDescription"] = "mettre à activer les alertes audio lorsque les joueurs ennemis sont détectés. Différentes alertes sonores si un joueur ennemi acquiert le stealth ou si un joueur ennemi est sur votre liste de Kill On Sight."
 
L ["ListOptions"] = "À proximité de liste"
L ["ListOptionsDescription"] = [[
Vous pouvez configurer Comment espion ajoute et supprime des joueurs ennemis vers et à partir de la liste dans les environs.
]]
L ["RemoveUndetected"] = "supprimer les joueurs ennemis dans la liste dans les environs après:"
L ["1Min"] = "1 minute"
L ["1MinDescription"] = "Supprimer un joueur ennemi non détecté depuis plus d'une minute".
L ["2Min"] = "2 minutes"
L ["2MinDescription"] = "Supprimer un joueur ennemi qui a été non détecté pendant plus de 2 minutes".
L ["5Min"] = "5 minutes"
L ["5MinDescription"] = "Supprimer un joueur ennemi non détecté depuis plus de 5 minutes".
L ["10Min"] = "10 minutes"
L ["10MinDescription"] = "Supprimer un joueur ennemi non détecté depuis plus de 10 minutes".
L ["15Min"] = "15 minutes"
L ["15MinDescription"] = "Supprimer un joueur ennemi qui est depuis plus de 15 minutes non détecté".
L ["Never"] = "Jamais supprimer"
L ["NeverDescription"] = "ne jamais retirer les joueurs ennemis. La liste dans les environs peut encore être éliminée manuellement."
L ["ShowNearbyList"] = "Passer à la liste dans les environs lors de la détection de joueur ennemi"
L ["ShowNearbyListDescription"] = "DΘfinir ceci pour afficher la liste dans les environs, si ce n'est pas déjà visible lorsque les joueurs ennemis sont détectés."
L ["PrioritiseKoS"] = "Hiérarchisation Kill sur les joueurs ennemis vue dans la liste dans les environs"
L ["PrioritiseKoSDescription"] = "DΘfinir ce pour toujours montrer Kill sur les joueurs ennemis vue premier dans la liste dans les environs."
 
L ["MinimapOptions"] = "Carte"
L ["MinimapOptionsDescription"] = [[
Pour les joueurs qui peuvent suivre les humanoïdes de la minicarte peut être utilisée pour fournir des fonctionnalités supplémentaires.
 
Parmi les joueurs qui peuvent suivre les humanoïdes, chasseurs, les druides et ceux qui ont reçu la capacité par d'autres moyens tels que manger un Steak de Worg noirci.
]]
L ["MinimapTracking"] = "Activer le suivi de la minicarte"
L ["MinimapTrackingDescription"] = "dΘfinir ceci afin de permettre la minicarte suivi et détection. Les joueurs ennemis connus détectés sur la minicarte seront ajouteront à la liste dans les environs."
L ["MinimapDetails"] = "Afficher les détails niveau/classe dans les info-bulles"
L ["MinimapDetailsDescription"] = "Mettre à la mettre à jour les info-bulles de carte afin que le niveau/classe détails s'affichent aux côtés de noms ennemis."
L ["DisplayOnMap"] = "Afficher l'emplacement de l'ennemi sur la carte"
L ["DisplayOnMapDescription"] = "Mettre à afficher sur la carte du monde et de la minicarte l'emplacement des ennemis détectés par d'autres utilisateurs d'espion dans votre parti, le raid et la Guilde."
L["SwitchToZone"] = "Switch to current zone map on enemy detection"
L["SwitchToZoneDescription"] = "If the World Map is open this will change the map to the players current zone map when enemies are detected."
L ["MapDisplayLimit"] = "limite affiche des icônes de carte pour:"
L ["LimitNone"] = "Partout"
L ["LimitNoneDescription"] = "Affiche tous les détecté les ennemis sur la carte quel que soit votre lieu de résidence actuel".
L ["LimitSameZone"] = "Zone de même"
L ["LimitSameZoneDescription"] = "affiche seulement détecté ennemis sur la carte si vous êtes dans la même zone."
L ["LimitSameContinent"] = "Même continent"
L ["LimitSameContinentDescription"] = "affiche seulement détecté ennemis sur la carte si vous êtes sur le même continent."
 
L ["DataOptions"] = "Gestion des données"
L ["DataOptionsDescription"] = [[
Vous pouvez configurer Comment espion entretient et recueille ses données.
]]
L ["PurgeData"] = "Purge sans être détectés données joueur ennemi après:"
L ["OneDay"] = "1 jour"
L ["OneDayDescription"] = "Purger les données pour les joueurs ennemis qui ont été détectées pendant 1 jour."
L ["FiveDays"] = "5 jours"
L ["FiveDaysDescription"] = "Purger les données pour les joueurs ennemis qui ont été détectées pendant 5 jours."
L ["TenDays"] = "10 jours"
L ["TenDaysDescription"] = "Purger les données pour les joueurs ennemis qui ont été détectées pendant 10 jours."
L ["ThirtyDays"] = "30 jours"
L ["ThirtyDaysDescription"] = "Purger les données pour les joueurs ennemis qui ont été détectées pendant 30 jours."
L ["SixtyDays"] = "60 jours"
L ["SixtyDaysDescription"] = "Purger les données pour les joueurs ennemis qui ont été détectées pendant 60 jours".
L ["NinetyDays"] = "90 jours"
L ["NinetyDaysDescription"] = "Purger les données pour les joueurs ennemis qui ont été détectées pendant 90 jours".
L ["ShareData"] = "Partager des données avec d'autres utilisateurs d'addon de Spy"
L ["ShareDataDescription"] = "Mettre à partager les détails de votre joueur ennemi des rencontres avec d'autres utilisateurs d'espion dans votre parti, le raid et la Guilde."
L ["UseData"] = "Utiliser les données d'autres utilisateurs d'addon de Spy"
L ["UseDataDescription"] = [[définir cette option pour utiliser les données recueillies par d'autres utilisateurs d'espion dans votre parti, le raid et la Guilde.
 
Si un autre utilisateur d'espion détecte un joueur ennemi alors que le joueur ennemi s'ajouteront à votre liste de voisin si il y a place.
]]
L ["ShareKOSBetweenCharacters"] = "Part tuer sur les joueurs de vue entre vos personnages"
L ["ShareKOSBetweenCharactersDescription"] = "Mettre à partager les joueurs vous marquer comme Kill On Sight entre autres personnages que vous jouez sur le même serveur et de la faction."
 
L ["SlashCommand"] = "Barre oblique commande"
L ["SpySlashDescription"] = "ces boutons exécutent les mêmes fonctions que celles de la /spy de commande de barre oblique"
L ["Enable"] = "Enable"
L ["EnableDescription"] = "Permet Spy et montre la fenêtre principale."
L ["Reset"] = "Reset"
L ["ResetDescription"] = "Réinitialise la position et l'apparence de la fenêtre principale."
L ["Config"] = "Config"
L ["ConfigDescription"] = "Ouvrir la fenêtre de configuration d'Interface Addons pour espionnage."
L ["KOS"] = "KOS"
L ["KOSDescription"] = "Ajouter/supprimer un joueur à/de la tuer sur liste vue."
L ["Ignore"] = "Ignore"
L ["IgnoreDescription"] = "Ajouter/supprimer un joueur vers/depuis la liste des ignorés."
 
--Listes
L ["Nearby"] = "À proximité"
L ["LastHour"] = "Dernière heure"
L ["Ignore"] = "Ignore"
L ["KillOnSight"] = "Tuer à vue"
 
--Stats
--L["Last"] = "Last"
L["Time"] = "Time"	
L["List"] = "List"	
L["Show Only"] = "Show Only"
L["Won/Lost"] = "Won/Lost"
L["Reason"] = "Reason"	 
L["HonorKills"] = "Honor Kills"
L["PvPDeatchs"] = "PvP Deaths"

--++ Class descriptions
L ["DEATHKNIGHt"] =" chevalier de la mort "
L ["DRUID"] = "Druide"
L ["HUNTER"] = "Chasseur"
L ["MAGE"] = "Mage"
L ["MONK"] = "Monk"
L ["PALADIN"] = "Paladin"
L ["PRIEST"] = "Prêtre"
L ["ROGUE"] = "Rogue"
L ["SHAMAN"] = "Chaman"
L ["WARLOCK"] = "Warlock"
L ["WARRIOR"] = "Guerrier"
L ["UNKNOWN"] = "Inconnu"
 
--Capacités stealth
L ["Stealth"] = "Stealth"
L ["Prowl"] = "Vagabondage"
 
--Les noms de canal
L ["LocalDefenseChannelName"] = "LocalDefense"
 
--++ Codes couleurs minimap
L ["MinimapClassTextDEATHKNIGHT"] = "|cffc41e3a"
L ["MinimapClassTextDRUID"] = "|cffff7c0a"
L ["MinimapClassTextHUNTER"] = "|cffaad372"
L ["MinimapClassTextMAGE"] = "|cff68ccef"
L ["MinimapClassTextMONK"] = "|cff00ff96"
L ["MinimapClassTextPALADIN"] = "|cfff48cba"
L ["MinimapClassTextPRIEST"] = "|cffffffff"
L ["MinimapClassTextROGUE"] = "|cfffff468"
L ["MinimapClassTextSHAMAN"] = "|cff2359ff"
L ["MinimapClassTextWARLOCK"] = "|cff9382c9"
L ["MinimapClassTextWARRIOR"] = "|cffc69b6d"
L ["MinimapClassTextUNKNOWN"] = "|cff191919"
L ["MinimapGuildText"] = "|cffffffff"
 
--Les messages de sortie
L ["AlertStealthTitle"] = "Camouflé lecteur détecté!"
L ["AlertKOSTitle"] = "Tuer le joueur vue détecté!"
L ["AlertKOSGuildTitle"] = "Kill sur guild de joueur de vue détecté!"
L ["AlertTitle_kosaway"] = "player Kill On Sight placé par"
L ["AlertTitle_kosguildaway"] = "guilde player Kill On Sight placé par"
L ["StealthWarning"] = "|cff9933ffStealthed lecteur détecté : |cffffffff"
L ["KOSWarning"] = "|cffff0000Kill le joueur de vue détecté : |cffffffff"
L ["KOSGuildWarning"] = "|cffff0000Kill sur la Guilde de joueur de vue détecté : |cffffffff"
L ["SpySignatureColored"] = "|cff9933ff [Spy]"
L ["PlayerDetectedColored"] = "lecteur détecté : |cffffffff"
L ["PlayersDetectedColored"] = "joueurs détectés : |cffffffff"
L ["KillOnSightDetectedColored"] = "tuer le joueur vue détecté : |cffffffff"
L ["PlayerAddedToIgnoreColored"] = "joueur ajoutée à la liste des ignorés : |cffffffff"
L ["PlayerRemovedFromIgnoreColored"] = "lecteur supprimé de la liste des ignorés : |cffffffff"
L ["PlayerAddedToKOSColored"] = "joueur Added to Kill sur liste vue : |cffffffff"
L ["PlayerRemovedFromKOSColored"] = "Removed joueuse de Kill sur liste vue : |cffffffff"
L ["PlayerDetected"] = "[Spy] lecteur détecté:"
L ["KillOnSightDetected"] = "joueur [Spy] Kill On Sight détecté:"
L ["Level"] = "Niveau"
L ["LastSeen"] = "Dernière visite"
L ["LessThanOneMinuteAgo"] = "moins d'une minute il y a"
L ["MinutesAgo"] = "il y a des minutes"
L ["HoursAgo"] = "heures"
L ["DaysAgo"] = "jours"
L ["Close"] = "Fermer"
L ["CloseDescription"] = "|cffffffffHides la fenêtre Espion. Par défaut apparait de nouveau quand le prochain joueur ennemi est détecté."
L ["Left/Right"] = "Left/Right"
L ["Left/RightDescription"] = "|cffffffffNavigates entre dans les environs, dernière heure, ignorer et tuer sur les listes de la vue."
L ["Clear"] = "Clear"
L ["ClearDescription"] = "|cffffffffClears la liste des joueurs qui ont été détectés. CTRL-clic will Enable/Disable Spy alors qu'affichés."
L ["NearbyCount"] = "À proximité de Count"
L ["NearbyCountDescription"] = "|cffffffffSends le nombre de joueurs à proximité de chat."
L ["AddToIgnoreList"] = "Ajouter à la liste des ignorés"
L ["AddToKOSList"] = "Add to Kill sur liste vue"
L ["RemoveFromIgnoreList"] = "Supprimer de la liste des ignorés"
L ["RemoveFromKOSList"] = "Supprimer du Kill sur liste vue"
L ["AnnounceDropDownMenu"] = "Annoncer"
L ["KOSReasonDropDownMenu"] = "Set Kill sur la raison de la vue"
L ["PartyDropDownMenu"] = "Partie"
L ["RaidDropDownMenu"] = "Raid"
L ["GuildDropDownMenu"] = "Guilde"
L ["LocalDefenseDropDownMenu"] = "La défense locale"
L ["Player"] = "(joueur)"
L ["KOSReason"] = "Tuer à vue"
L ["KOSReasonIndent"] = ""
L ["KOSReasonOther"] = "Entrez votre propre raison..."
L ["KOSReasonClear"] = "Clear"
L ["StatsWins"] = "|cff40ff00Wins:"
L ["StatsSeparator"] = ""
L ["StatsLoses"] = "|cff0070ddLoses:"
L ["Located"] = "situé:"
L ["Yards"] = "mètres"
 
--Spy_KOSReasonListLength = 13
Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
[1] = {
["title"] = "Démarrer combat" ;
["content"] = {
--"Dans une embuscade de moi",
--"Toujours m'attaque à vue",
"M'a attaqué sans raison",
"M'a attaqué à un donneur de quête",--++
"M'a attaqué alors que je me battais PNJs",
"M'a attaqué alors que j'étais entrée/sortie d'une instance",
"M'a attaqué alors que j'étais AFK",
--"M'a attaqué alors que j'étais dans une bataille pour animaux de compagnie",--++
"M'a attaqué alors que j'étais monté/flying",
"M'a attaqué alors que j'avais faible santé/mana",
--"Écrasé me avec un groupe d'ennemis",
--"N'attaque pas sans sauvegarde",
--"Osé me défier",
                                };
                },
[2] = {
["title"] = "Style de combat" ;
["content"] = {
"Dans une embuscade de moi",
"Toujours m'attaque à vue",
"M'a tué moi avec un personnage de niveau plus élevé",--++
"Écrasé me avec un groupe d'ennemis ",
"N'attaque pas sans sauvegarde",
"Appelle toujours de l'aide",
--"M'a poussé une falaise",
--"Utilisations astuces d'ingénierie",
"Utilisations trop crowd control",
--"Spams en permanence une capacité",
--"M'a forcé à prendre des dégâts de durabilité",
--"M'a tué et mes amis ont fui",
--"Ran away puis tombé dans une embuscade me",
--"Parvient toujours à s'échapper",
--"Foyers de bulle à s'échapper",
--"Parvient à rester dans la plage de mêlée",
--"Parvient à rester au cerf-volant de plage",
--"Absorbe trop de dégâts",
--"Guérit trop",
--"DPS est trop",
                                };
                },
-- [3] = {
--["title"] = "Comportement général" ;
--["content"] = {}
--"Ennuyeux",
--"Grossièreté",
--"Lâcheté",
--"L'arrogance",
--"Excès de confiance",
--"Non fiable",
--"Emotes trop",
--"Pédonculées me / amis ",
--"Fait semblant d'être bon",
--"Emotes "qui ne va ne pas se produire"",
--"Goodbye de vagues à faible santé",
--"Essayé de me calmer avec une vague",
--"Actes fétide effectués sur mon cadavre",
--"Ri de moi",
--"Craché sur moi",
--                             };
--             },
[3] = {
["title"] = "Camping" ;
["content"] = {
"Campé me",
"Campé un alt",
"Campée lowbies",
"Campé de stealth",
"Membres de la Guilde campée",
"Campé jeu PNJ/objectifs",
"Campé un ville/site",
--"Appelé en aide me camper",
--"Fait un cauchemar de nivellement",
--"M'a forcé à se déconnecter",
--"Ne sera pas battre mon principal",
                                };
                },
[4] = {
["title"] = "Quêtes" ;
["content"] = {
"M'a attaqué alors que j'étais quêtes",
"M'a attaqué après que j'ai aidé avec une quête",
"Interféré avec les objectifs de quête",
"A commencé une quête que je voulais faire",
"Tué le PNJ de la faction",
"Tué une PNJ de quête",
                                };
                },
[5] = {
["title"] = "A volé les ressources" ;
["content"] = {
"Herbes recueillies je voulais",
"Minéraux réunis je voulais",
"Les ressources collectées je voulais",
--"Gaz extrait d'un nuage, j'ai voulu",
"M'a tué et a volé ma cible/rares NPC",
"Mon tue la peau",
"Récupéré mon Tue",
"Pêché dans ma piscine",
                                };
                },
--[[ [7] = {
["title"] = "Champs de bataille;"
["content"] = {
"Toujours les cadavres de loots",
"Coureur de très bon indicateur",
"Backcaps drapeaux ou bases",
"Stealth casquettes drapeaux ou bases",
"M'a tué et a pris le drapeau",
"Interfère avec les objectifs du champ de bataille",
"A pris un power-up, que j'ai voulu",
"Citerne forcé de perdre agro",
"Causé une lingette",
"Détruit les engins de siège",
"Chute des bombes",
"Désarme les bombes",
"Bombardier de la peur",
                                };
                },
[8] = {
["title"] = "Vraie vie" ;
["content"] = {
"Un ami dans la vraie vie",
"L'ennemi dans la vraie vie",
"Se répand les rumeurs à propos de moi",
"Se plaint sur les forums",
"Spy pour l'autre faction"
"Traître à ma faction",
"Revenue sur un accord",
"Nub prétentieux",
"Un autre Omniscient",
"Une autre Johnny-come-lately",
"Cross faction corbeille automate vocal",
                                };
                },
[9] = {
["title"] = "Difficulté" ;
["content"] = {
"Impossible de tuer",
"La plupart du temps des victoires",
"Semble être un match équitable",
"Perd la plupart du temps",
"Plaisir de tuer",
"Facile d'honneur",
                                };
                },
[10] = {}
["title"] = "Race" ;
["content"] = {
"Hate de course du joueur",
"Les elfes de sang sont narcissiques",
"Draeneï sont calmars espace visqueux",
"Les nains sont butées poilues courtes",
"Lutins vendraient leur propre mère pour un bénéfice",
"Gnomes appartiennent dans un jardin",
"Les humains sont intrigantes justes",
"Les elfes de la nuit embrasser trop d'arbres",
"Orcs sont barbares belliciste",
"Pandarens garder me disait de ralentir",--++
"Tauren devrait être sur mon burger",
"Trolls devraient rester sur les forums web",
"Morts-vivants sont des abominations contre naturels",
"Les worgens ont trop de puces",
                                };
                },
[11] = {}
["title"] = "Classe" ;
["content"] = {
"Classe du joueur de haine",
"Les Chevaliers de la mort sont maîtrisés",
"Les druides sont sales animaux",
"Les chasseurs sont mode facile",
"Mages sont trompés intellects",
"Chi de moines est faible",--++
"Les paladins sont des imbéciles moralisateurs"
"Les prêtres sont des prédicateurs pieux",
"Les voleurs n'ont aucun honneur",
"Chamans parlent aux animaux imaginaires",
"Les démonistes sont sadiques Nécromanciens",
"Guerriers ont des problèmes de colère",
                                };
                },
[12] = {}
["title"] = "Nom" ;
["content"] = {
"A un nom ridicule",
"Nom prétentieux",
"Variante de Legolas",
"Nom a des caractères bizarres",
"Nom de guilde est ridicule",
"Nom de guilde utilise uniquement des lettres majuscules",
"Nom de guilde utilise les majuscules et les espaces",
"Nom de guilde déclare qu'ils détestent ma faction",
                                };
                },]]--
-- [13] = {
[6] = {
["title"] = "Autre" ;
["content"] = {
--"Karma",
--"Rouge est mort",
--"Juste parce que",
--"Échoue au PvP",
"Marqué pour le PvP",
--"Ne veut pas PvP",
--"Perd les deux de notre temps",
--"Ce joueur est un noob",
--"Je déteste vraiment ce joueur",
--"N'est pas de niveau assez rapidement",
"M'a poussé une falaise",
"Utilise des astuces techniques",
"Toujours parvient à s'échapper",
"Utilise les éléments et les compétences pour échapper",
"Mécanismes de jeu exploits",
--"Hacker présumé",
--"Fermier",
--"Autre...",
"Entrez votre propre raison...",
                                };
                },
}
 
StaticPopupDialogs ["Spy_SetKOSReasonOther"] = {
	preferredIndex = STATICPOPUPS_NUMDIALOGS,--http://forums.wowace.com/showthread.php?p=320956
	text = "Entrez le tuer sur le motif de la vue de %s:",
	button1 = "Valeur",
	button2 = "Annuler",
	timeout = 20,
	hasEditBox = 1,
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("") ;
	end,
		OnAccept = function(self)
		local reason = self.editBox:GetText()
--		Spy:SetKOSReason(self.playerName, "Other...", reason)
		Spy:SetKOSReason(self.playerName, "Entrez votre propre raison...", reason)
	end,
};
 
Spy_AbilityList = {
 
-----------------------------------------------------------
--Permet une estimation de la course, la classe et le niveau d'un
--joueur à être désigné de quelles capacités sont observés
--dans le journal de combat.
-----------------------------------------------------------
 
--++ Racials ++
["Racial"] = {race = "Dwarf", level = 1,},
["Artiste de l'évasion"] = {race = "Gnome", level = 1,},
["Chacun pour soi"] = {race = "Human", level = 1,},
["Shadowmeld"] = {race = "Night Elf", level = 1,},
["Don des Naaru"] = {race = "Draenei", level = 1,},
["Darkflight"] = {race = "Worgen", level = 1,},
["Deux formes"] = {race = "Worgen", level = 1,},
["Running Wild"] = {race = "Worgen", level = 1,},
["Fureur sanguinaire"] = {race = "Orc", level = 1,},
["War Stomp"] = {race = "Tauren", level = 1,},
["Berserker"] = {race = "Troll", level = 1,},
["Volonté des réprouvés"] = {race = "Undead", level = 1,},
["Cannibaliser"] = {race = "Undead", level = 1,},
["Torrent arcanique"] = {race = "Blood Elf", level = 1,},
["Rocket Jump"] = {race = "Goblin", level = 1,},
["Rocket Barrage"] = {race = "Goblin", level = 1,},
["Pack Hobgoblin"] = {race = "Goblin", level = 1,},
["Palm quaking"] = {race = "Pandaren", level = 1,},
 
--++ Chevalier de la mort de capacités ++
["Peste de sang"] = {class = "DEATHKNIGHT", level = 55,},
["Grève du sang"] = {class = "DEATHKNIGHT", level = 55,},
["Death Coil"] = {class = "DEATHKNIGHT", level = 55,}, 
["Porte de la mort"] = {class = "DEATHKNIGHT", level = 55,}, 
["Death Grip"] = {class = "DEATHKNIGHT", level = 55,},
["Fièvre de givre"] = {class = "DEATHKNIGHT", level = 55,},
["Présence de givre"] = {class = "DEATHKNIGHT", level = 55,}, 
["Icy Touch"] = {class = "DEATHKNIGHT", level = 55,}, 
["Peste Strike"] = {class = "DEATHKNIGHT", level = 55,}, 
["Runeforging"] = {class = "DEATHKNIGHT", level = 55,}, 
["Sang bouillir"] = {class = "DEATHKNIGHT", level = 56,},
["Frappe de mort"] = {class = "DEATHKNIGHT", level = 56,}, 
["Pestilence"] = {class = "DEATHKNIGHT", level = 56,}, 
["Ressusciter les morts"] = {class = "DEATHKNIGHT", level = 56,}, 
["Présence de sang"] = {class = "DEATHKNIGHT", level = 57,}, 
["Mind Freeze"] = {class = "DEATHKNIGHT", level = 57,}, 
["Chaînes de glace"] = {class = "DEATHKNIGHT", level = 58,}, 
["Étrangler"] = {class = "DEATHKNIGHT", level = 58,}, 
["Mort et décomposition"] = {class = "DEATHKNIGHT", level = 60,}, 
["Sur un cheval pâle"] = {class = "DEATHKNIGHT", level = 61,}, 
["Icebound Fortitude"] = {class = "DEATHKNIGHT", level = 62,},
["Présence impie"] = {class = "DEATHKNIGHT", level = 64,},
["Cor de l'hiver"] = {class = "DEATHKNIGHT", level = 65,}, 
["Chemin de givre"] = {class = "DEATHKNIGHT", level = 66,}, 
["Anti-magie"] = {class = "DEATHKNIGHT", level = 69,}, 
["Maîtrise des morts-vivants"] = {class = "DEATHKNIGHT", level = 69,}, 
["Raise allié"] = {class = "DEATHKNIGHT", level = 72,}, 
["Autonomiser arme runique"] = {class = "DEATHKNIGHT", level = 76,}, 
["L'armée des morts"] = {class = "DEATHKNIGHT", level = 80,}, 
["Éclosion"] = {class = "DEATHKNIGHT", level = 81,}, 
["Frappe nécrotique"] = {class = "DEATHKNIGHT", level = 83,}, 
["Sombre simulacre"] = {class = "DEATHKNIGHT", level = 85,}, 
["Rune de Cinderglacier"] = {class = "DEATHKNIGHT", level = 55,},
["Rune de la Fallen Crusader"] = {class = "DEATHKNIGHT", level = 70,}, 
["Rune de Lichbane"] = {class = "DEATHKNIGHT", level = 60,},
["Rune de Trancheglace"] = {class = "DEATHKNIGHT", level = 55,},
["Rune de Spellbreaking"] = {class = "DEATHKNIGHT", level = 57,},
["Rune de Spellshattering"] = {class = "DEATHKNIGHT", level = 57,},
["Rune de Swordbreaking"] = {class = "DEATHKNIGHT", level = 63,},
["Rune de Swordshattering"] = {class = "DEATHKNIGHT", level = 63,},
["Rune de la Carapace nérubienne"] = {class = "DEATHKNIGHT", level = 72,},
["Rune de la gargouille peau"] = {class = "DEATHKNIGHT", level = 72,},
--++ Glyphe capacités ++
["Corpse Explosion"] = {class = "DEATHKNIGHT", level = 25,}, 
--++ Chevalier de la mort de spécialisation ++
--++ Blood/Frost/Unholy ++
["Soul Reaper"] = 			{ class = "DEATHKNIGHT", level = 87, },
--++ Givre/impie ++
["Aura impie"] = {class = "DEATHKNIGHT", level = 60,},
--++ Sang ++
["Rites de sang"] = {class = "DEATHKNIGHT", level = 55,}, 
["Vengeance"] = {class = "DEATHKNIGHT", level = 55,}, 
["Vétéran de la troisième guerre"] = {class = "DEATHKNIGHT", level = 55,}, 
["Dark Command"] = {class = "DEATHKNIGHT", level = 58,}, 
["Coeur Strike"] = {class = "DEATHKNIGHT", level = 60,}, 
["L'odeur du sang"] = {class = "DEATHKNIGHT", level = 62,}, 
["Présence de sang améliorée"] = {class = "DEATHKNIGHT", level = 64,}, 
["Rune Tap"] = {class = "DEATHKNIGHT", level = 64,}, 
["Rune Strike"] = {class = "DEATHKNIGHT", level = 65,}, 
["Parasite de sang"] = {class = "DEATHKNIGHT", level = 66,}, 
["La scarlatine"] = {class = "DEATHKNIGHT", level = 68,}, 
["Volonté de la nécropole"] = {class = "DEATHKNIGHT", level = 70,}, 
["Fortitude optimiste"] = {class = "DEATHKNIGHT", level = 72,}, 
["Dancing arme runique"] = {class = "DEATHKNIGHT", level = 74,}, 
--["Ripsote"] = {class = "DEATHKNIGHT", level = 76,},--ajouté au Patch 5.4 mais pas activé puisque les Warriors ont aussi cette capacité 
["Sang vampirique"] = {class = "DEATHKNIGHT", level = 76,}, 
["Bouclier d'OS"] = {class = "DEATHKNIGHT", level = 78,},
["Bouclier de sang"] = {class = "DEATHKNIGHT", level = 80,},
["Fléau cramoisi"] = {class = "DEATHKNIGHT", level = 84,},
--++ Gel ++ 
["Sang du Nord"] = {class = "DEATHKNIGHT", level = 55,}, 
["Frost Strike"] = {class = "DEATHKNIGHT", level = 55,}, 
["Howling Blast"] = {class = "DEATHKNIGHT", level = 55,}, 
["Serres de glace"] = {class = "DEATHKNIGHT", level = 55,}, 
["Effacer"] = {class = "DEATHKNIGHT", level = 58,}, 
["Machine à tuer"] = {class = "DEATHKNIGHT", level = 63,}, 
["Présence de givre améliorée"] = {class = "DEATHKNIGHT", level = 65,}, 
["Fragilité osseuse"] = {class = "DEATHKNIGHT", level = 66,}, 
["Pilier de givre"] = {class = "DEATHKNIGHT", level = 68,}, 
["Rime"] = {class = "DEATHKNIGHT", level = 70,}, 
["Peut-être des"] = {class = "DEATHKNIGHT", level = 74,}, 
["Menace de Thassarian"] = {class = "DEATHKNIGHT", level = 74,}, 
["Cœur gelé"] = {class = "DEATHKNIGHT", level = 80,}, 
--++ Impie ++ 
["Maître des goules"] = {class = "DEATHKNIGHT", level = 55,}, 
["Récolter"] = {class = "DEATHKNIGHT", level = 55,}, 
["Might impie"] = {class = "DEATHKNIGHT", level = 55,}, 
["Fléau Strike"] = {class = "DEATHKNIGHT", level = 58,}, 
["Infusion d'ombre"] = {class = "DEATHKNIGHT", level = 60,}, 
["Frappe purulente"] = {class = "DEATHKNIGHT", level = 62,}, 
["Doom soudaine"] = {class = "DEATHKNIGHT", level = 64,}, 
["Frénésie impie"] = {class = "DEATHKNIGHT", level = 66,}, 
["Ebon porte-peste"] = {class = "DEATHKNIGHT", level = 68,}, 
["Sombre Transformation"] = {class = "DEATHKNIGHT", level = 70,}, 
["Summon gargouille"] = {class = "DEATHKNIGHT", level = 74,}, 
["Présence impie améliorée"] = {class = "DEATHKNIGHT", level = 75,}, 
["Dreadblade"] = {class = "DEATHKNIGHT", level = 80,}, 
--++ Death Knight Talents ++
["Sang mouvante"] = {class = "DEATHKNIGHT", level = 56,}, 
["Peste sangsue"] = {class = "DEATHKNIGHT", level = 56,}, 
["Unholy Blight"] = {class = "DEATHKNIGHT", level = 56,}, 
["Changeliche"] = {class = "DEATHKNIGHT", level = 57,}, 
["Anti-Magic Zone"] = {class = "DEATHKNIGHT", level = 57,}, 
["Purgatoire"] = {class = "DEATHKNIGHT", level = 57,}, 
["Avance de la mort"] = {class = "DEATHKNIGHT", level = 58,}, 
["Engelures"] = {class = "DEATHKNIGHT", level = 58,}, 
["Asphyxier"] = {class = "DEATHKNIGHT", level = 58,}, 
["Pacte de mort"] = {class = "DEATHKNIGHT", level = 60,}, 
["Siphon de mort"] = {class = "DEATHKNIGHT", level = 60,}, 
["Conversion"] = {class = "DEATHKNIGHT", level = 60,}, 
["Blood Tap"] = {class = "DEATHKNIGHT", level = 75,}, 
["Renforcement runique"] = {class = "DEATHKNIGHT", level = 75,}, 
["La Corruption runique"] = {class = "DEATHKNIGHT", level = 75,}, 
["De Fielsang Grasp"] = {class = "DEATHKNIGHT", level = 90,}, 
["Hiver impitoyable"] = {class = "DEATHKNIGHT", level = 90,}, 
["Terre profanée"] = {class = "DEATHKNIGHT", level = 90,}, 
 
--++ Druide capacités ++
["La colère"] = {class = "DRUID", level = 1,}, 
["Moonfire"] = {class = "DRUID", level = 3,},
["Rajeunissement"] = {class = "DRUID", level = 4},
["Cat Form"] = {class = "DRUID", level = 6,},
["Félin grâce"] = {class = "DRUID", level = 6,},
["Mangle"] = {class = "DRUID", level = 6,},
["Vagabondage"] = {class = "DRUID", level = 6,},
["Rake"] = {class = "DRUID", level = 6,},
["Morsure féroce"] = {class = "DRUID", level = 6,},
["Bear forme"] = {class = "DRUID", level = 8,},
["Growl"] = {class = "DRUID", level = 8,},
["Maul"] = {class = "DRUID", level = 8,},
["Déflagration"] = {class = "DRUID", level = 10,},
["Racines emmêlant"] = {class = "DRUID", level = 10,},
["Revive"] = {class = "DRUID", level = 12,},
["Teleport : Moonglade"] = {class = "DRUID", level = 14,},
["Formulaire de voyage"] = {class = "DRUID", = level 16,},
["Forme aquatique"] = {class = "DRUID", level = 18,},
["Ravager!"] = {class = "DRUID", level = 22,},
["Swipe"] = {class = "DRUID", level = 22,}, 
["Dash"] = {class = "DRUID", level = 24,},
["Healing Touch"] = {class = "DRUID", level = 26,},
["Faerie Fire"] = {class = "DRUID", level = 28,},
["Thrash"] = {class = "DRUID", level = 28,},
["Primal Fury"] = {class = "DRUID", level = 30,},
["Bondir"] = {class = "DRUID", level = 32,},
["Suivi d'humanoïdes"] = {class = "DRUID", level = 36,},
["Lacérer"] = {class = "DRUID", level = 38,},
["Astral Storm"] = {class = "DRUID", level = 42,},
["Hurricane"] = {class = "DRUID", level = 42,},
["Ecorce"] = {class = "DRUID", level = 44,},
["Emprise de la nature"] = {class = "DRUID", level = 52,},
["Innervent"] = {class = "DRUID", level = 54,},
["Rebirth"] = {class = "DRUID", level = 56,},
["Forme de vol"] = {class = "DRUID", level = 58,},
["Apaiser"] = {class = "DRUID", level = 60,},
["Mark of the Wild"] = {class = "DRUID", level = 62,},
["Hiberner"] = {class = "DRUID", level = 66,},
["Régénération frénétique"] = {class = "DRUID", level = 68,},
["Forme de vol rapide"] = {class = "DRUID", level = 70,},
["Pourrait d'Ursoc"] = {class = "DRUID", level = 72,},
["Tranquillité"] = {class = "DRUID", level = 74,},
["Cyclone"] = {class = "DRUID", level = 78,},
["Mutiler"] = {class = "DRUID", level = 82,},
["Ruée Roar"] = {class = "DRUID", level = 84,},
["Symbiose"] = {class = "DRUID", level = 87,}, 
--++ Glyphe capacités ++
["Créature des bois charm"] = {class = "DRUID", level = 25,},
["Form treant"] = {class = "DRUID", level = 25,}, 
--++ Druide spécialisation ++
--++ Balance/restauration ++
["Insight naturel"] = {class = "DRUID", level = 10,},
["Rapidité de la nature"] = {class = "DRUID", level = 30,},
["Killer Instinct"] = {class = "DRUID", level = 34,},
["Champignon sauvage"] = {class = "DRUID", level = 84,},
--++ Balance/Feral/Guardian ++
["Supprimer la Corruption"] = {class = "DRUID", level = 22,},
--++ Feral/Guardian ++
["Rip"] = {class = "DRUID", level = 20,},
["Nurturing Instinct"] = {class = "DRUID", level = 34,},
["Plaies infectées"] = {class = "DRUID", level = 40,},
["Leader of the Pack"] = {class = "DRUID", level = 46,},
["Berserk"] = {class = "DRUID", level = 48,},
["Ravager"] = {class = "DRUID", level = 54,},
["Instinct de survie"] = {class = "DRUID", level = 56,},
["Coup de crâne"] = {class = "DRUID", level = 64,},
--++ Feral/rétablissement ++
["Augure de clarté"] = {class = "DRUID", level = 38,},
--++ Équilibre ++
["Équilibre des pouvoirs"] = {class = "DRUID", level = 10,},
["Starfire"] = {class = "DRUID", level = 10,},
["Mes"] = {class = "DRUID", level = 12,},
["Forme de sélénien"] = {class = "DRUID", = level 16,},
["Sunfire"] = {class = "DRUID", level = 18,},
["Communion astrale"] = {class = "DRUID", level = 20,},
["Shooting Stars"] = {class = "DRUID", level = 26,},
["Faisceau solaire"] = {class = "DRUID", level = 28,},
["Euphoria"] = {class = "DRUID", level = 38,},
["Frénésie du chouettide"] = {class = "DRUID", level = 48,},
["Alignement céleste"] = {class = "DRUID", level = 68,},
["Starfall"] = {class = "DRUID", level = 76,},
["Total Eclipse"] = {class = "DRUID", level = 80,},
["Douche lunaire"] = {class = "DRUID", level = 82,},
["Champignon sauvage : faire exploser"] = {class = "DRUID", level = 84,},
--++ Feral ++
["La fureur du tigre"] = {class = "DRUID", level = 10,},
["Shred"] = {class = "DRUID", = level 16,},
["Savage Roar"] = {class = "DRUID", level = 18,},
["Rapidité prédatrice"] = {class = "DRUID", level = 26,},
["Razor Claws"] = {class = "DRUID", level = 80,},
--++ Guardian ++ 
["Défense sauvage"] = {class = "DRUID", level = 10,},
["Vengeance"] = {class = "DRUID", level = 10,},
["Peau épaisse"] = {class = "DRUID", level = 14,},
["Bear Hug"] = {class = "DRUID", level = 18,},
["Bec et ongles"] = {class = "DRUID", level = 32,},
["Enragé"] = {class = "DRUID", level = 76,},
["Gardien de la nature"] = {class = "DRUID", level = 80,},
--++ Restauration ++ 
["Naturaliste"] = {class = "DRUID", level = 10,},
["Prompte guérison"] = {class = "DRUID", level = 10,},
["Nourrir"] = {class = "DRUID", level = 12,},
["Méditation"] = {class = "DRUID", level = 14,},
["Focus de la nature"] = {class = "DRUID", = level 16,},
["Repousse"] = {class = "DRUID", level = 18,},
["Remède de la nature"] = {class = "DRUID", level = 22,},
["Graine de vie"] = {class = "DRUID", level = 28,},
["Fleur de vie"] = {class = "DRUID", level = 36,},
["Rajeunissement de Swift"] = {class = "DRUID", level = 46,},
["Ironbark"] = {class = "DRUID", level = 64,},
["Croissance sauvage"] = {class = "DRUID", level = 76,},
["Harmonie"] = {class = "DRUID", level = 80,},
["Don de Malfurion"] = {class = "DRUID", level = 82,},
["Champignon sauvage : Bloom"] = {class = "DRUID", level = 84,},
["Genesis"] = {class = "DRUID", level = 88,},
--++ Talents druide ++
["Célérité féline"] = {class = "DRUID", level = 15,},
["Bête de piston"] = {class = "DRUID", level = 15,},
["Charge sauvage"] = {class = "DRUID", level = 15,}, 
["Don d'Ysera"] = {class = "DRUID", level = 30,},
["Renouveau"] = {class = "DRUID", level = 30,},
["Cenarion Ward"] = {class = "DRUID", level = 30,}, 
["Essaim faerie"] = {class = "DRUID", level = 45,},
["Enchevêtrement de masse"] = {class = "DRUID", level = 45,},
["Typhon"] = {class = "DRUID", level = 45,}, 
["L'âme de la forêt"] = {class = "DRUID", level = 60,},
["Incarnation"] = {class = "DRUID", level = 60,},
["La force de la Nature"] = {class = "DRUID", level = 60,},
["Désoriente Roar"] = {class = "DRUID", level = 75,},
["Vortex de Ursol"] = {class = "DRUID", level = 75,},
["Mighty Bash"] = {class = "DRUID", level = 75,}, 
["Heart of the Wild"] = {class = "DRUID", level = 90,},
["Rêve de Cénarius"] = {class = "DRUID", level = 90,},
["Vigile de la nature"] = {class = "DRUID", level = 90,}, 
 
--++ Hunter capacités ++
["Tir des arcanes"] = {class = "HUNTER", level = 1,},
["Auto Shot"] = {class = "HUNTER", level = 1,},
["Call Pet 1"] = {class = "HUNTER", level = 1,},
["Revive Pet"] = {class = "HUNTER", level = 1,},
["Steady Shot"] = {class = "HUNTER", level = 3,},
["Tracking"] = {class = "HUNTER", level = 4},
["Coup de trait de choc"] = {class = "HUNTER", level = 8,},
["Beast Lore"] = {class = "HUNTER", level = 10,},
["Animal de compagnie de licencier"] = {class = "HUNTER", level = 10,},
["Piqûre de serpent"] = {class = "HUNTER", level = 10,},
["Dompter la bête"] = {class = "HUNTER", level = 10,},
["Maîtrise des Pet"] = {class = "HUNTER", level = 10,},
["Animal feed"] = {class = "HUNTER", level = 11,},
["Aspect du faucon"] = {class = "HUNTER", level = 12,},
["Débrayer"] = {class = "HUNTER", level = 14,},
["Marque du chasseur"] = {class = "HUNTER", level = 14,},
["Dispersion Shot"] = {class = "HUNTER", level = 15,},
["Eagle Eye"] = {class = "HUNTER", = level 16,},
["Mend Pet"] = {class = "HUNTER", = level 16,},
["Call Pet 2"] = {class = "HUNTER", level = 18,},
["Counter Shot"] = {class = "HUNTER", level = 22,},
["Aspect du guépard"] = {class = "HUNTER", level = 24,},
["En rafale"] = {class = "HUNTER", level = 24,},
["Piège de gel"] = {class = "HUNTER", level = 28,},
["Feindre la mort"] = {class = "HUNTER", level = 32,},
["Kill Shot"] = {class = "HUNTER", level = 35,},
["Tir tranquillisant"] = {class = "HUNTER", level = 35,},
["Scare Beast"] = {class = "HUNTER", level = 36,},
["Piège explosif"] = {class = "HUNTER", level = 38,},
["Flare"] = {class = "HUNTER", level = 38,},
["Aura de précision"] = {class = "HUNTER", level = 39,},
["Venin de la veuve"] = {class = "HUNTER", level = 40,},
["Call Pet 3"] = {class = "HUNTER", level = 42,},
["Piège de glace"] = {class = "HUNTER", level = 46,},
["Piège lanceur"] = {class = "HUNTER", level = 48,},
["Distraire Shot"] = {class = "HUNTER", level = 52,},
["Rapid Fire"] = {class = "HUNTER", level = 54,},
["L'aspect de la meute"] = {class = "HUNTER", level = 56,},
["Call Pet 4"] = {class = "HUNTER", level = 62,},
["Piège à serpent"] = {class = "HUNTER", level = 66,},
["Appel du maître"] = {class = "HUNTER", level = 74,},
["Détournement"] = {class = "HUNTER", level = 76,},
["Dissuasion"] = {class = "HUNTER", level = 78,},
["Call Pet 5"] = {class = "HUNTER", level = 82,},
["Camouflage"] = {class = "HUNTER", level = 85,},
["Stampede"] = {class = "HUNTER", level = 87,}, 
--++ Glyphe capacités ++
["Aspect de la bête"] = {class = "HUNTER", level = 25,}, 
["Va chercher"] = {class = "HUNTER", level = 25,}, 
["Fireworks"] = {class = "HUNTER", level = 25,}, 
--++ Chasseur spécialisation ++
--++ Beast Mastery/survie ++
["Cobra jet"] = {class = "HUNTER", level = 81,},
--++ Maîtrise des bêtes ++
["Commande kill"] = {class = "HUNTER", level = 10,},
["Aller à la gorge"] = {class = "HUNTER", level = 20,},
["Bête Cleave"] = {class = "HUNTER", level = 24,},
["Frenzy"] = {class = "HUNTER", level = 30,},
["Focus feu"] = {class = "HUNTER", level = 32,},
["Courroux bestial"] = {class = "HUNTER", level = 40,},
["Cobra Strikes"] = {class = "HUNTER", level = 43,},
["La bête intérieure"] = {class = "HUNTER", level = 50,},
["Kindred Spirits"] = {class = "HUNTER", level = 58,},
["Dynamisation"] = {class = "HUNTER", level = 63,},
["Bêtes exotiques"] = {class = "HUNTER", level = 69,},
["Maître des bêtes"] = {class = "HUNTER", level = 80,},
--++ Au tir ++ 
["Visant Shot"] = {class = "HUNTER", level = 10,},
["Objectif prudent"] = {class = "HUNTER", level = 20,},
["Bâillon"] = {class = "HUNTER", level = 30,},
["Tir de Barrage commotion"] = {class = "HUNTER", level = 30,},
["Bombardement"] = {class = "HUNTER", level = 45,},
["Récupération rapide"] = {class = "HUNTER", level = 54,},
["Maître tireur d'élite"] = {class = "HUNTER", level = 58,},
["Tir de la chimère"] = {class = "HUNTER", level = 60,},
["Steady Focus"] = {class = "HUNTER", level = 63,},
["Piercing Shots"] = {class = "HUNTER", level = 72,},
["Carquois sauvage"] = {class = "HUNTER", level = 80,},
--++ Survie ++ 
["Tir explosif"] = {class = "HUNTER", level = 10,},
["Lock et charge"] = {class = "HUNTER", level = 43,},
["Black Arrow"] = {class = "HUNTER", level = 50,},
["Policière"] = {class = "HUNTER", level = 55,},
["Venin de vipère"] = {class = "HUNTER", level = 63,},
["Maîtrise de piéger"] = {class = "HUNTER", level = 64,},
["Serpent Spread"] = {class = "HUNTER", level = 68,},
["Improved Serpent Sting"] = {class = "HUNTER", level = 70,},
["L'essence de la vipère"] = {class = "HUNTER", level = 80,},
--++ Hunter Talents ++
["Toute hâte"] = {class = "HUNTER", level = 15,},
["Escape étroit"] = {class = "HUNTER", level = 15,},
["Crouching Tiger, Hidden chimère"] = {class = "HUNTER", level = 15,}, 
["Binding Shot"] = {class = "HUNTER", level = 30,},
["Piqûre de wyverne"] = {class = "HUNTER", level = 30,},
["Intimidation"] = {class = "HUNTER", level = 30,},
["Euphorie"] = {class = "HUNTER", level = 45,},
["Aspect du faucon fer"] = {class = "HUNTER", level = 45,},
["Engagement spirituel"] = {class = "HUNTER", level = 45,}, 
["Ferveur"] = {class = "HUNTER", level = 60,},
["Bête de dire"] = {class = "HUNTER", level = 60,},
["Frisson de la chasse"] = {class = "HUNTER", level = 60,}, 
["Une Murder of Crows"] = {class = "HUNTER", level = 75,},
["Blink grèves"] = {class = "HUNTER", level = 75,},
["Lynx Rush"] = {class = "HUNTER", level = 75,}, 
["Glaive Toss"] = {class = "HUNTER", level = 90,},
["Powershot"] = {class = "HUNTER", level = 90,},
["Barrage"] = {class = "HUNTER", level = 90,}, 
 
--++ Capacités Mage ++
["Givrefeu"] = {class = "MAGE", level = 1,},
["Nova de givre"] = {class = "MAGE", level = 3,},
["Fire Blast"] = {class = "MAGE", level = 5,},
["Blink"] = {class = "MAGE", level = 7,},
["Contresort"] = {class = "MAGE", level = 8,},
["Métamorphose"] = {class = "MAGE", level = 14,},
["Éclater"] = {class = "MAGE", = level 16,},
["Arcane Explosion"] = {class = "MAGE", level = 18,},
["Lance de glace"] = {class = "MAGE", level = 22,},
["Bloc de glace"] = {class = "MAGE", level = 26,},
["Cône de froid"] = {class = "MAGE", level = 28,},
["Supprimer la malédiction"] = {class = "MAGE", level = 29,},
["Chute lente"] = {class = "MAGE", level = 32,},
["Armure de la fournaise"] = {class = "MAGE", level = 34,},
["Conjure rafraîchissement"] = {class = "MAGE", level = 38,},
["Évocation"] = {class = "MAGE", level = 40,},
["Enflammé"] = {class = "MAGE", level = 44,},
["Conjure Gem de Mana"] = {class = "MAGE", level = 47,},
["Reflet"] = {class = "MAGE", level = 49,},
["Magie"] = {class = "MAGE", level = 50,},
["Blizzard"] = {class = "MAGE", level = 52,},
["Armure de givre"] = {class = "MAGE", level = 54,},
["Frost Bolt"] = {class = "MAGE", level = 54,},
["Invisibilité"] = {class = "MAGE", level = 56,},
["Arcanes"] = {class = "MAGE", level = 58,},
["Arcanes"] = {class = "MAGE", level = 64,},
["Deep Freeze"] = {class = "MAGE", level = 66,},
["Contresort amélioré"] = {class = "MAGE", level = 70,},
["Conjure rafraîchissement Table"] = {class = "MAGE", level = 72,}, 
["Nether Attunement"] = {class = "MAGE", level = 74,},
["Bombe de Mage"] = {class = "MAGE", level = 75,},
["Dalaran Brilliance"] = {class = "MAGE", level = 80,}, 
["Armure du Mage"] = {class = "MAGE", level = 80,},
["Burning Soul"] = {class = "MAGE", level = 82,},
["Time Warp"] = {class = "MAGE", level = 84,},
["Temps altérer"] = {class = "MAGE", level = 87,}, 
["Métamorphose : cochon"] = {class = "MAGE", level = 60,},
["Polymorphe : lapin"] = {class = "MAGE", level = 60,},
["Métamorphose : tortue"] = {class = "MAGE", level = 60,},
["Polymorphe : Black Cat"] = {class = "MAGE", level = 60,}, 
["Polymorphe : Turquie"] = {class = "MAGE", level = 60,}, 
["Ancien portail : Dalaran"] = {class = "MAGE", level = 74,},
["Portail : Dalaran"] = {class = "MAGE", level = 74,},
["Portail : Darnassus"] = {class = "MAGE", level = 42,},
["Portail : Exodar"] = {class = "MAGE", level = 42,},
["Portail : Forgefer "] = {class = "MAGE", level = 42,},
["Portail : Orgrimmar "] = {class = "MAGE", level = 42,},
["Portail : Shattrath "] = {class = "MAGE", level = 66,},
["Portail : Lune d'argent"] = {class = "MAGE", level = 42,},
["Portail : Pierrêche"] = {class = "MAGE", level = 52,},
["Portail : Hurlevent"] = {class = "MAGE", level = 42,},
["Portail : Theramore "] = {class = "MAGE", level = 42,},
["Portail : Thunder Bluff"] = {class = "MAGE", level = 42,},
["Portail : Tol Barad "] = {class = "MAGE", level = 85,},
["Portail : Fossoyeuse"] = {class = "MAGE", level = 42,},
["Portail : Vale de fleurs éternelles"] = {class = "MAGE", level = 90,}, 
["Teleport antique : Dalaran"] = {class = "MAGE", level = 71,},
["Teleport : Dalaran"] = {class = "MAGE", level = 71,},
["Teleport : Darnassus"] = {class = "MAGE", level = 17,},
["Teleport : Exodar"] = {class = "MAGE", level = 17,},
["Teleport : Forgefer"] = {class = "MAGE", level = 17,},
["Teleport : Orgrimmar"] = {class = "MAGE", level = 17,},
["Teleport : Shattrath"] = {class = "MAGE", level = 62,},
["Teleport : Silvermoon"] = {class = "MAGE", level = 17,},
["Teleport : Pierrêche"] = {class = "MAGE", level = 52,},
["Teleport : Hurlevent"] = {class = "MAGE", level = 17,},
["Teleport : Theramore"] = {class = "MAGE", level = 17,},
["Teleport : Thunder Bluff"] = {class = "MAGE", level = 17,},
["Teleport : Tol Barad"] = {class = "MAGE", level = 85,},
["Teleport : Fossoyeuse"] = {class = "MAGE", level = 17,},
["Teleport : Vale de fleurs éternelles"] = {class = "MAGE", level = 90,},
--++ Glyphe capacités ++
["Conjure familier"] = {class = "MAGE", level = 25,},
["Illusion"] = {class = "MAGE", level = 25,},
--++ Mage spécialisation ++
--++ Arcanes ++
["Déflagration des arcanes"] = {class = "MAGE", level = 10,},
["Charge arcane"] = {class = "MAGE", level = 10,},
["Barrage arcanique"] = {class = "MAGE", level = 12,},
["Projectiles des arcanes"] = {class = "MAGE", level = 24,},
["Lent"] = {class = "MAGE", level = 36,},
["Magie des arcanes"] = {class = "MAGE", level = 62,},
["Adepte du mana"] = {class = "MAGE", level = 80,}, 
--++ Feu ++ 
["Pyrotechnique"] = {class = "MAGE", level = 10,},
["Fireball"] = {class = "MAGE", level = 12,},
["Blast inferno"] = {class = "MAGE", level = 24,},
["Masse critique"] = {class = "MAGE", level = 36,},
["Scorch"] = {class = "MAGE", level = 48,},
["Souffle du Dragon"] = {class = "MAGE", level = 62,},
["Combustion"] = {class = "MAGE", level = 77,},
["Ignite"] = {class = "MAGE", level = 80,},
["Pyromane"] = {class = "MAGE", level = 85,},
--++ Gel ++ 
["Convoquer l'eau élémentaire"] = {class = "MAGE", level = 10,},
["Eclair de givre"] = {class = "MAGE", level = 12,},
["Doigts de givre"] = {class = "MAGE", level = 24,},
["Veines glaciales"] = {class = "MAGE", level = 36,},
["Frozen Orb"] = {class = "MAGE", level = 62,},
["Protège la caboche"] = {class = "MAGE", level = 77,},
["Glaçons"] = {class = "MAGE", level = 80,},
--++ Mage Talents ++
["Présence d'esprit"] = {class = "MAGE", level = 15,},
["Vitesse foudroyante"] = {class = "MAGE", level = 15,},
["Banquises"] = {class = "MAGE", level = 15,}, 
["Flameglow"] = {class = "MAGE", level = 30,},
["Bouclier temporelle"] = {class = "MAGE", level = 30,},
["Barrière"] = {class = "MAGE", level = 30,}, 
["Anneau de givre"] = {class = "MAGE", level = 45,},
["Glace Ward"] = {class = "MAGE", level = 45,},
["Frostjaw"] = {class = "MAGE", level = 45,}, 
["Plus grande invisibilité"] = {class = "MAGE", level = 60,},
["Cautériser"] = {class = "MAGE", level = 60,},
["Vague de froid"] = {class = "MAGE", level = 60,}, 
["Tempête du néant"] = {class = "MAGE", level = 75,},
["Bombe vivante"] = {class = "MAGE", level = 75,},
["Bombe de givre"] = {class = "MAGE", level = 75,}, 
["Invocation"] = {class = "MAGE", level = 90,},
["Rune du pouvoir"] = {class = "MAGE", level = 90,},
["De l'incantateur Ward"] = {class = "MAGE", level = 90,}, 
 
--++ Capacités Monk ++
["Jab"] = {class = "MONK", level = 1,},
["Posture du tigre féroce"] = {class = "MONK", level = 1,}, 
["La voie du moine"] = {class = "MONK", level = 1,}, 
["Tiger Palm"] = {class = "MONK", level = 3,}, 
["Roll"] = {class = "MONK", level = 5,}, 
["Coup de pied de blackout"] = {class = "MONK", level = 7,}, 
["Provoquer"] = {class = "MONK", level = 14,}, 
["Réanimer"] = {class = "MONK", level = 18,}, 
["Detox"] = {class = "MONK", level = 20,}, 
["Pèlerinage de Zen"] = {class = "MONK", level = 20,}, 
["Héritage de l'empereur"] = {class = "MONK", level = 22,}, 
["Touch of Death"] = {class = "MONK", level = 22,}, 
["Réflexes de Swift"] = {class = "MONK", level = 23,}, 
["Fortifiant Brew"] = {class = "MONK", level = 24,}, 
["Expulser un préjudice"] = {class = "MONK", level = 26,}, 
["Désactiver"] = {class = "MONK", level = 28,},
["Brassage agile"] = {class = "MONK", level = 30,},
["Pèlerinage Zen : Return"] = {class = "MONK", level = 30,},
["Empaler main Strike"] = {class = "MONK", level = 32,}, 
["Paralysie"] = {class = "MONK", level = 44,}, 
["Spinning coup de pied de grue"] = {class = "MONK", level = 46,}, 
["Crépitement Jade Lightning"] = {class = "MONK", level = 54,}, 
["Guérison sphère"] = {class = "MONK", level = 64,}, 
["Arme grappin"] = {class = "MONK", level = 68,}, 
["La méditation Zen"] = {class = "MONK", level = 82,}, 
["Transcendance"] = {class = "MONK", level = 87,}, 
["Transcendance : transfert"] = {class = "MONK", level = 87,},
--++ Glyphe capacités ++
["Leer du bœuf"] = {class = "MONK", level = 25,},
["Vol de Zen"] = {class = "MONK", level = 25,}, 
--++ Moine spécialisation ++
--++ Mistweaver/Windwalker ++ 
["Tiger Strikes"] = {class = "MONK", level = 10,}, 
--++ Brasseur ++ 
["La position du boeuf robuste"] = {class = "MONK", level = 10,}, 
["Vertigineux Haze"] = {class = "MONK", level = 10,}, 
["Vengeance"] = {class = "MONK", level = 10,}, 
["Smash keg"] = {class = "MONK", level = 11,}, 
["Clash"] = {class = "MONK", level = 18,}, 
["Breath of Fire"] = {class = "MONK", level = 18,}, 
["Garde"] = {class = "MONK", level = 26,}, 
["Formation de maître-brasseur"] = {class = "MONK", level = 34,}, 
["Brassage insaisissable"] = {class = "MONK", level = 36,}, 
["Infusion : infusion insaisissable"] = {class = "MONK", level = 36,}, 
["Desperate Measures"] = {class = "MONK", level = 45,}, 
["Éviter un préjudice"] = {class = "MONK", level = 48,}, 
["Don du bœuf"] = {class = "MONK", level = 56,}, 
["Black Ox Statue invoquer"] = {class = "MONK", level = 70,}, 
["Infusion purifiant"] = {class = "MONK", level = 75,}, 
["Brawler insaisissable"] = {class = "MONK", level = 80,},
--++ Mistweaver ++ 
["La position du Serpent sage"] = {class = "MONK", level = 10,}, 
["Brume apaisante"] = {class = "MONK", level = 10,}, 
["Méditation de mana"] = {class = "MONK", level = 10,},
["Brouillard enveloppant"] = {class = "MONK", = level 16,}, 
["Médecine interne"] = {class = "MONK", level = 20,}, 
["Mémoire musculaire"] = {class = "MONK", level = 20,},
["Déferlante Mist"] = {class = "MONK", level = 32,}, 
["Enseignements du monastère"] = {class = "MONK", level = 34,}, 
["Renewing Mist"] = {class = "MONK", level = 42,}, 
["Demateralize"] = {class = "MONK", level = 45,}, 
["Cocon de vie"] = {class = "MONK", level = 50,}, 
["Thé de mana"] = {class = "MONK", level = 56,}, 
["Infusion : thé de Mana"] = {class = "MONK", level = 56,}, 
["Soulèvement"] = {class = "MONK", level = 62,}, 
["Thé Focus thunder"] = {class = "MONK", level = 66,}, 
["Summon Jade Statue de Serpent"] = {class = "MONK", level = 70,}, 
["Revival"] = {class = "MONK", level = 78,}, 
["Don du Serpent"] = {class = "MONK", level = 80,}, 
--++ Windwalker ++ 
["Fists of Fury"] = {class = "MONK", level = 10,}, 
["Combo Breaker"] = {class = "MONK", level = 15,}, 
["Flying Kick Serpent"] = {class = "MONK", level = 18,}, 
["Combat conditionné"] = {class = "MONK", level = 20,}, 
["Touch of Karma"] = {class = "MONK", level = 22,}, 
["Afterlife"] = {class = "MONK", level = 26,}, 
["Énergisant Brew"] = {class = "MONK", level = 36,}, 
["Sparring"] = {class = "MONK", level = 42,}, 
["Adaptation"] = {class = "MONK", level = 45,}, 
["Spinning fleur de feu"] = {class = "MONK", level = 48,}, 
["Rising Sun Kick"] = {class = "MONK", level = 56,}, 
["Tigereye Brew"] = {class = "MONK", level = 56,}, 
["Infusion : infusion Tigereye"] = {class = "MONK", level = 56,}, 
["Tempête, terre et feu"] = {class = "MONK", level = 75,}, 
["Embouteillée Fury"] = {class = "MONK", level = 80,}, 
["Legacy of the White Tiger"] = {class = "MONK", level = 81,}, 
--++ Moine Talents ++
["Célérité"] = {class = "MONK", level = 15,}, 
["Lust de tigre"] = {class = "MONK", level = 15,}, 
["Momentum"] = {class = "MONK", level = 15,}, 
["Vague de chi"] = {class = "MONK", level = 30,}, 
["Sphère Zen"] = {class = "MONK", level = 30,}, 
["Chi Burst"] = {class = "MONK", level = 30,}, 
["Power grèves"] = {class = "MONK", level = 45,}, 
["Ascension"] = {class = "MONK", level = 45,}, 
["Chi Brew"] = {class = "MONK", level = 45,}, 
["Anneau de paix"] = {class = "MONK", level = 60,},
["Charge Ox Wave"] = {class = "MONK", level = 60,}, 
["Leg Sweep"] = {class = "MONK", level = 60,}, 
["Élixirs de guérison"] = {class = "MONK", level = 75,}, 
["Amortir les méfaits"] = {class = "MONK", level = 75,}, 
["Magic diffuse"] = {class = "MONK", level = 75,}, 
["Précipitation vent Jade"] = {class = "MONK", level = 90,}, 
["Appeler jose arnaud serges, le tigre blanc"] = {class = "MONK", level = 90,}, 
["Chi torpille"] = {class = "MONK", level = 90,}, 
 
--++ Techniques de paladin ++
["Inquisition"] = {class = "PALADIN", level = 1,},
["Sceau de commandement"] = {class = "PALADIN", level = 3,},
["Jugement"] = {class = "PALADIN", level = 5,},
["Hammer of Justice"] = {class = "PALADIN", level = 7,},
["Parole dure"] = {class = "PALADIN", level = 9,},
["Word of Glory"] = {class = "PALADIN", level = 9,},
["Fureur vertueuse"] = {class = "PALADIN", level = 12,},
["Redemption"] = {class = "PALADIN", level = 13,},
["Flash de lumière"] = {class = "PALADIN", level = 14,},
["Reckoning"] = {class = "PALADIN", level = 15,},
["Lay sur les mains"] = {class = "PALADIN", = level 16,},
["Bouclier divin"] = {class = "PALADIN", level = 18,},
["Nettoyer"] = {class = "PALADIN", level = 20,},
["Sceau de la vérité"] = {class = "PALADIN", level = 24,},
["Protection divine"] = {class = "PALADIN", level = 26,},
["Bénédiction des rois"] = {class = "PALADIN", level = 30,},
["Sceau d'Insight"] = {class = "PALADIN", level = 32,},
["Supplication"] = {class = "PALADIN", level = 34,},
["Réprimander"] = {class = "PALADIN", level = 36,},
["Hammer of Wrath"] = {class = "PALADIN", level = 38,},
["Sceau de la justice"] = {class = "PALADIN", level = 42,},
["Heart of the Crusader"] = {class = "PALADIN", level = 44,},
["Mal tourner"] = {class = "PALADIN", level = 46,},
["La main de Protection"] = {class = "PALADIN", level = 48,},
["La main de liberté"] = {class = "PALADIN", level = 52,},
["L'inviolabilité de la bataille"] = {class = "PALADIN", level = 58,},
["Aura de dévotion"] = {class = "PALADIN", level = 60,},
["Main de Salut"] = {class = "PALADIN", level = 66,},
["Avenging Wrath"] = {class = "PALADIN", level = 72,},
["La main de Sacrifice"] = {class = "PALADIN", level = 80,},
["Bénédiction de puissance"] = {class = "PALADIN", level = 81,},
["Condamnation sans bornes"] = {class = "PALADIN", level = 85,},
["Lumière aveuglant"] = {class = "PALADIN", level = 87,},
--++ Glyphe capacités ++
["Contemplation"] = {class = "PALADIN", level = 25,},
--++ Spécialisation paladin ++
--++ Protection/vindicte ++ 
["Marteau des justes"] = {class = "PALADIN", level = 20,},
--++ Saint/Protection/vindicte ++ 
["Gardien des anciens rois"] = {class = "PALADIN", level = 75,},
--++ Sainte ++
["Horion sacré"] = {class = "PALADIN", level = 10,},
["Holy Insight"] = {class = "PALADIN", level = 10,},
["Dénoncer"] = {class = "PALADIN", level = 20,},
["Purification sacrée"] = {class = "PALADIN", level = 20,},
["Radiance sacrée"] = {class = "PALADIN", level = 28,},
["Lumière sacrée"] = {class = "PALADIN", level = 34,},
["Phare de lumière"] = {class = "PALADIN", level = 39,},
["Divine Plea"] = {class = "PALADIN", level = 46,},
["Infusion de lumière"] = {class = "PALADIN", level = 50,},
["Lumière divine"] = {class = "PALADIN", level = 54,},
["Daybreak"] = {class = "PALADIN", level = 56,},
["Faveur divine"] = {class = "PALADIN", level = 62,},
["Tour de Radiance"] = {class = "PALADIN", level = 64,},
["Lumière de l'aube"] = {class = "PALADIN", level = 70,},
["Illuminated Healing"] = {class = "PALADIN", level = 80,}, 
--++ Protection ++ 
["Bouclier du vengeur"] = {class = "PALADIN", level = 10,},
["Gardé par la lumière"] = {class = "PALADIN", level = 10,},
["Vengeance"] = {class = "PALADIN", level = 10,},
["Colère divine"] = {class = "PALADIN", level = 20,},
["Jugements des sages"] = {class = "PALADIN", level = 28,},
["Consécration"] = {class = "PALADIN", level = 34,},
["Bouclier des justes"] = {class = "PALADIN", level = 40,},
["Grand croisé"] = {class = "PALADIN", level = 50,},
["Sanctuaire"] = {class = "PALADIN", level = 64,},
["Ardent défenseur"] = {class = "PALADIN", level = 70,},
["Rempart de divine"] = {class = "PALADIN", level = 80,},
--++ Retribution ++ 
["Verdict du Templier"] = {class = "PALADIN", level = 10,},
["L'épée de lumière"] = {class = "PALADIN", level = 10,},
["Jugements du téméraire"] = {class = "PALADIN", level = 28,},
["Tempête divine"] = {class = "PALADIN", level = 34,},
["Exorcisme"] = {class = "PALADIN", level = 46,},
["The Art of War"] = {class = "PALADIN", level = 50,},
["Émanciper"] = {class = "PALADIN", level = 54,},
["Sceau de la Justice"] = {class = "PALADIN", level = 70,},
["Absoudre"] = {class = "PALADIN", level = 80,},
["Main de lumière"] = {class = "PALADIN", level = 80,},
["Inquisition"] = {class = "PALADIN", level = 81,}, 
--++ Paladin Talents ++
["Vitesse de la lumière"] = {class = "PALADIN", level = 15,},
["Long bras de la Loi"] = {class = "PALADIN", level = 15,},
["La poursuite de la Justice"] = {class = "PALADIN", level = 15,}, 
["Poing de la Justice"] = {class = "PALADIN", level = 30,},
["Repentance"] = {class = "PALADIN", level = 30,},
["Le mal est un Point de vue"] = {class = "PALADIN", level = 30,},
["Guérisseur désintéressé"] = {class = "PALADIN", level = 45,},
["Eternal Flame"] = {class = "PALADIN", level = 45,},
["Bouclier sacré"] = {class = "PALADIN", level = 45,}, 
["La main de pureté"] = {class = "PALADIN", level = 60,},
["Esprit incassable"] = {class = "PALADIN", level = 60,},
["Clémence"] = {class = "PALADIN", level = 60,}, 
["Holy Avenger"] = {class = "PALADIN", level = 75,},
["Courroux sanctifié"] = {class = "PALADIN", level = 75,},
["But divine"] = {class = "PALADIN", level = 75,}, 
["Prisme Sainte"] = {class = "PALADIN", level = 90,},
["Marteau de lumière"] = {class = "PALADIN", level = 90,},
["Phrase d'exécution"] = {class = "PALADIN", level = 90,},
 
--++ Prêtre capacités ++
["Frapper"] = {class = "PRIEST", level = 1,},
["Mot de l'ombre : douleur"] = {class = "PRIEST", level = 3,},
["Mot de pouvoir : bouclier"] = {class = "PRIEST", level = 5,},
["Flash Heal"] = {class = "PRIEST", level = 7,},
["Feu intérieur"] = {class = "PRIEST", level = 9,},
["Focus divine"] = {class = "PRIEST", level = 10,},
["Psychic Scream"] = {class = "PRIEST", level = 12,},
["Résurrection"] = {class = "PRIEST", level = 18,},
["Power Word : Fortitude"] = {class = "PRIEST", level = 22,},
["Fade"] = {class = "PRIEST", level = 24,},
["Dissiper la magie"] = {class = "PRIEST", level = 26,},
["Renouveler"] = {class = "PRIEST", level = 26,},
["Morts-vivants de Manille"] = {class = "PRIEST", level = 32,},
["Lévitation"] = {class = "PRIEST", level = 34,},
["Mind Vision"] = {class = "PRIEST", level = 42,},
["Ombrefiel"] = {class = "PRIEST", level = 42,},
["Mot de l'ombre : mort"] = {class = "PRIEST", level = 46,},
["Binding Heal"] = {class = "PRIEST", level = 48,},
["Mysticisme"] = {class = "PRIEST", level = 50,},
["Crains Ward"] = {class = "PRIEST", level = 54,},
["Hymn of Hope"] = {class = "PRIEST", level = 66,},
["Prière de guérison"] = {class = "PRIEST", level = 68,},
["Masse dissiper"] = {class = "PRIEST", level = 72,},
["Mind Sear"] = {class = "PRIEST", level = 76,},
["Inner sera"] = {class = "PRIEST", level = 80,},
["Leap of Faith"] = {class = "PRIEST", level = 84,},
["Void Maj"] = {class = "PRIEST", level = 87,},
--++ Glyphe capacités ++
["Nova sacrée"] = {class = "PRIEST", level = 25,},
["Confession"] = {class = "PRIEST", level = 25,},
--++ Prêtre spécialisation ++
--++ Discipline/Sainte ++
["Méditation"] = {class = "PRIEST", level = 10,},
["Guérison spirituelle"] = {class = "PRIEST", level = 10,},
["Fureur divine"] = {class = "PRIEST", = level 16,},
["Holy Fire"] = {class = "PRIEST", level = 18,},
["Purifier"] = {class = "PRIEST", level = 22,},
["Guérir"] = {class = "PRIEST", level = 28,},
["Axé sur la volonté"] = {class = "PRIEST", level = 28,},
["Greater Heal"] = {class = "PRIEST", level = 34,},
["L'évangélisation"] = {class = "PRIEST", level = 44,},
["La prière de guérison"] = {class = "PRIEST", level = 46,},
--++ Discipline ++
["Rapture"] = {class = "PRIEST", level = 10,},
["Pénitence"] = {class = "PRIEST", level = 10,},
["Égide divine"] = {class = "PRIEST", level = 24,},
["Esprit Shell"] = {class = "PRIEST", level = 28,},
["Inner Focus"] = {class = "PRIEST", level = 36,},
["Expiation"] = {class = "PRIEST", level = 38,},
["Grace"] = {class = "PRIEST", level = 45,},
["L'archange"] = {class = "PRIEST", level = 50,},
["Force d'âme"] = {class = "PRIEST", level = 52,},
["Suppression de la douleur"] = {class = "PRIEST", level = 58,},
["Borrowed Time"] = {class = "PRIEST", level = 62,},
["Mot de pouvoir : barrière"] = {class = "PRIEST", level = 70,},
["Train de la pensée"] = {class = "PRIEST", level = 78,},
["Shield Discipline"] = {class = "PRIEST", level = 80,},
--++ Sainte ++
["Mot sacré : châtier"] = {class = "PRIEST", level = 10,},
["Esprit de rédemption"] = {class = "PRIEST", level = 30,},
["Serendipity"] = {class = "PRIEST", level = 34,},
["Lightwell"] = {class = "PRIEST", level = 36,}, 
["Le cercle de guérison"] = {class = "PRIEST", level = 50,},
["Chakra : châtier"] = {class = "PRIEST", level = 56,},
["Chakra : sanctuaire"] = {class = "PRIEST", level = 56,},
["Chakra : sérénité"] = {class = "PRIEST", level = 56,},
["Renouvellement rapide"] = {class = "PRIEST", level = 64,},
["Esprit gardien"] = {class = "PRIEST", level = 70,},
["Hymne divin"] = {class = "PRIEST", level = 78,},
["Echo de la lumière"] = {class = "PRIEST", level = 80,},
--++ Shadow ++
["Mind Flay"] = {class = "PRIEST", level = 10,},
["Précision spirituelle"] = {class = "PRIEST", level = 10,},
["Peste dévorante"] = {class = "PRIEST", level = 21,},
["Mind Blast"] = {class = "PRIEST", level = 21,},
["Orbes d'ombre"] = {class = "PRIEST", level = 21,},
["Ombre"] = {class = "PRIEST", level = 24,},
["Toucher vampirique"] = {class = "PRIEST", level = 28,},
["Shadowy Apparitions"] = {class = "PRIEST", level = 42,},
["Mind Spike"] = {class = "PRIEST", level = 44,},
["Silence"] = {class = "PRIEST", level = 52,},
["Dispersion"] = {class = "PRIEST", level = 60,},
["Psychic Horror"] = {class = "PRIEST", level = 74,},
["Etreinte"] = {class = "PRIEST", level = 78,},
["Rappel ténébreux"] = {class = "PRIEST", level = 80,},
--++ Prêtre Talents ++
["Void vrilles"] = {class = "PRIEST", level = 15,},
["Psyfiend"] = {class = "PRIEST", level = 15,},
["Esprit de dominer"] = {class = "PRIEST", level = 15,}, 
["Corps et âme"] = {class = "PRIEST", level = 30,},
["Angélique" plume"] = {class = "PRIEST", level = 30,},
["Phantasm"] = {class = "PRIEST", level = 30,}, 
["De l'obscurité, lumière vient"] = {class = "PRIEST", level = 45,},
["Mindbender"] = {class = "PRIEST", level = 45,},
["Solace et folie"] = {class = "PRIEST", level = 45,},
["La prière désespérée"] = {class = "PRIEST", level = 60,},
["Spectral couvert"] = {class = "PRIEST", level = 60,},
["Rempart Angélique"] = {class = "PRIEST", level = 60,}, 
["Twist of Fate"] = {class = "PRIEST", level = 75,},
["Power Infusion"] = {class = "PRIEST", level = 75,},
["Insight divine"] = {class = "PRIEST", level = 75,}, 
["Cascade"] = {class = "PRIEST", level = 90,},
["Star divine"] = {class = "PRIEST", level = 90,},
["Halo"] = {class = "PRIEST", level = 90,},
 
--++ Rogue capacités ++
["Sinister Strike"] = {class = "ROGUE", level = 1,},
["Éviscérer"] = {class = "ROGUE", level = 3,},
["Stealth"] = {class = "ROGUE", level = 5,},
["Embuscade"] = {class = "ROGUE", level = 6,},
["Evasion"] = {class = "ROGUE", level = 8,},
["Poison mortel"] = {class = "ROGUE", level = 10,},
["Sap"] = {class = "ROGUE", level = 12,},
["Tranche et dés"] = {class = "ROGUE", level = 14,},
["Pick Pocket"] = {class = "ROGUE", level = 15,},
["Recouvrer"] = {class = "ROGUE", = level 16,},
["Kick"] = {class = "ROGUE", level = 18,},
["Poison paralysant"] = {class = "ROGUE", level = 20,},
["Gouge"] = {class = "ROGUE", level = 22,},
["Lock pick"] = {class = "ROGUE", level = 24,},
["Sprint"] = {class = "ROGUE", level = 26,},
["Distraire"] = {class = "ROGUE", level = 28,},
["Abrutissante Poison"] = {class = "ROGUE", level = 28,},
["Coup bas"] = {class = "ROGUE", level = 30,},
["Poison de blesser"] = {class = "ROGUE", level = 30,},
["Ruse de Swiftblade"] = {class = "ROGUE", level = 30,},
["Disparaissent"] = {class = "ROGUE", level = 34,},
["Exposer armure"] = {class = "ROGUE", level = 36,},
["Blind"] = {class = "ROGUE", level = 38,},
["Coup de rein"] = {class = "ROGUE", level = 40,},
["Détecter les pièges"] = {class = "ROGUE", level = 42,},
["Feinte"] = {class = "ROGUE", level = 44,},
["Rupture"] = {class = "ROGUE", level = 46,},
["Garrote"] = {class = "ROGUE", level = 48,},
["Automne sécuritaire"] = {class = "ROGUE", level = 48,},
["Démanteler"] = {class = "ROGUE", level = 52,},
["Frappes implacables"] = {class = "ROGUE", level = 54,},
["Désarmer piège"] = {class = "ROGUE", level = 56,},
["Cape d'ombre"] = {class = "ROGUE", level = 58,},
["À pieds de la flotte"] = {class = "ROGUE", level = 62,},
["Maître empoisonneur"] = {class = "ROGUE", level = 64,},
["Fan de couteaux"] = {class = "ROGUE", level = 66,},
["Préparation"] = {class = "ROGUE", level = 68,},
["Fantôme à pied"] = {class = "ROGUE", level = 72,},
["Shiv"] = {class = "ROGUE", level = 74,},
["Trucs du métier"] = {class = "ROGUE", level = 78,},
["Rediriger"] = {class = "ROGUE", level = 81,},
["Crimson Tempest"] = {class = "ROGUE", level = 83,},
["Bombe fumigène"] = {class = "ROGUE", level = 85,},
["Lames d'ombre"] = {class = "ROGUE", level = 87,},
--++ Glyphe capacités ++
["Détection"] = {class = "ROGUE", level = 25,}, 
--++ Rogue spécialisation ++
--++ Assassinat ++ 
["Assassin Resolve"] = {class = "ROGUE", level = 10,},
["Poisons améliorés"] = {class = "ROGUE", level = 10,},
["Mutiler"] = {class = "ROGUE", level = 10,},
["Envenimer"] = {class = "ROGUE", level = 20,},
["Sceller sort"] = {class = "ROGUE", level = 30,},
["Dispatch"] = {class = "ROGUE", level = 40,},
["Plaies venimeuses"] = {class = "ROGUE", level = 50,},
["Cut to the Chase"] = {class = "ROGUE", level = 60,},
["Blindside"] = {class = "ROGUE", level = 70,},
["Vendetta"] = {class = "ROGUE", level = 80,},
["Puissants Poisons"] = {class = "ROGUE", level = 80,},
--++ Combat ++ 
["Ambidextrie"] = {class = "ROGUE", level = 10,},
["Vitalité"] = {class = "ROGUE", level = 10,},
["Lame Flurry"] = {class = "ROGUE", level = 10,},
["Révélant la grève"] = {class = "ROGUE", level = 20,},
["Puissance de combat"] = {class = "ROGUE", level = 30,},
["Cruauté"] = {class = "ROGUE", level = 32,},
["Adrenaline Rush"] = {class = "ROGUE", level = 40,},
["Lames agités"] = {class = "ROGUE", level = 50,},
["Ruse du bandit"] = {class = "ROGUE", level = 60,},
["Tuerie"] = {class = "ROGUE", level = 80,},
["Main Gauche"] = {class = "ROGUE", level = 80,},
--++ Subtilité ++
["Hémorragie"] = {class = "ROGUE", level = 10,},
["Maître de subtilité"] = {class = "ROGUE", level = 10,},
["Appel sinistre"] = {class = "ROGUE", level = 10,},
["Trouver la faiblesse"] = {class = "ROGUE", level = 20,},
["Préméditation"] = {class = "ROGUE", level = 30,},
["Backstab"] = {class = "ROGUE", level = 40,},
["Honor Among Thieves"] = {class = "ROGUE", level = 50,},
["Veine sanguinaire"] = {class = "ROGUE", level = 60,},
["Valorisation énergétique"] = {class = "ROGUE", level = 70,},
["Danse de l'ombre"] = {class = "ROGUE", level = 80,},
["Bourreau"] = {class = "ROGUE", level = 80,}, 
--++ Rogue Talents ++
["Nightstalker"] = {class = "ROGUE", level = 15,},
["Subterfuge"] = {class = "ROGUE", level = 15,},
["Mise au point d'ombre"] = {class = "ROGUE", level = 15,},
["Deadly jeter"] = {class = "ROGUE", level = 30,},
["Nerf Strike"] = {class = "ROGUE", level = 30,},
["Combat Readiness"] = {class = "ROGUE", level = 30,}, 
["Tromper la mort"] = {class = "ROGUE", level = 45,},
["Poison de sangsues"] = {class = "ROGUE", level = 45,},
["Insaisissable"] = {class = "ROGUE", level = 45,}, 
["Téléporte"] = {class = "ROGUE", level = 60,},
"[Burst de vitesse"] = {class = "ROGUE", level = 60,}, 
["Cape et épée"] = {class = "ROGUE", level = 60,}, 
["Nourrissent les faibles"] = {class = "ROGUE", level = 75,},
["Poison paralytique"] = {class = "ROGUE", level = 75,},
["Dirty Tricks"] = {class = "ROGUE", level = 75,}, 
["Shuriken Toss"] = {class = "ROGUE", level = 90,},
["Marqué pour la mort"] = {class = "ROGUE", level = 90,},
["Anticipation"] = {class = "ROGUE", level = 90,},
 
--++ Chaman capacités ++
["Lightning Bolt"] = {class = "SHAMAN", level = 1,},
["Grève primal"] = {class = "SHAMAN", level = 3,},
["Horion de terre"] = {class = "SHAMAN", level = 6,},
["Healing Surge"] = {class = "SHAMAN", level = 7,},
["Bouclier de foudre"] = {class = "SHAMAN", level = 8,},
["Arme éclair"] = {class = "SHAMAN", level = 10,},
["Choc de flamme"] = {class = "SHAMAN", level = 12,},
["Purger"] = {class = "SHAMAN", level = 12,},
["Esprit ancestral"] = {class = "SHAMAN", level = 14,},
["Ghost Wolf"] = {class = "SHAMAN", level = 15,},
["Totem brûlantes"] = {class = "SHAMAN", = level 16,},
["Cisaillement"] = {class = "SHAMAN", = level 16,},
["Esprit de nettoyer"] = {class = "SHAMAN", level = 18,},
["Water Shield"] = {class = "SHAMAN", level = 20,},
["Frost Shock"] = {class = "SHAMAN", level = 22,},
["Water Walking"] = {class = "SHAMAN", level = 24,},
["Earthbind Totem"] = {class = "SHAMAN", level = 26,},
["Chain Lightning"] = {class = "SHAMAN", level = 28,},
["Healing Stream Totem"] = {class = "SHAMAN", level = 30,},
["Rappel totémique"] = {class = "SHAMAN", level = 30,},
["Réincarnation"] = {class = "SHAMAN", level = 32,},
["Rappel astral"] = {class = "SHAMAN", level = 34,},
["Bien vue"] = {class = "SHAMAN", level = 36,},
["Totem de magma"] = {class = "SHAMAN", level = 36,},
["Grounding Totem"] = {class = "SHAMAN", level = 38,},
["Burning colère"] = {class = "SHAMAN", level = 40,},
["Chaîne guérir"] = {class = "SHAMAN", level = 44,},
["Frostbrand arme"] = {class = "SHAMAN", level = 46,},
["Tremblements Totem"] = {class = "SHAMAN", level = 54,},
["Totem élémentaire de terre"] = {class = "SHAMAN", level = 58,},
["Healing Rain"] = {class = "SHAMAN", level = 60,},
["Condensateur Totem"] = {class = "SHAMAN", level = 63,},
["Totem de vague de guérison"] = {class = "SHAMAN", level = 65,},
["Totem élémentaire de feu"] = {class = "SHAMAN", level = 66,},
["Héroïsme"] = {class = "SHAMAN", level = 70,},
["Soif de sang"] = {class = "SHAMAN", level = 70,},
["Bind Elemental"] = {class = "SHAMAN", level = 72,},
["Hex"] = {class = "SHAMAN", level = 75,},
["Arme croque"] = {class = "SHAMAN", level = 75,},
["Stormlash Totem"] = {class = "SHAMAN", level = 78,},
["Grace of Air"] = {class = "SHAMAN", level = 80,},
["Libérer les éléments"] = {class = "SHAMAN", level = 81,},
["De Spiritwalker Grace"] = {class = "SHAMAN", level = 85,},
["Ascendance"] = {class = "SHAMAN", level = 87,},
--++ Spécialisation chaman ++
--++ Élémentaire/restauration ++ 
["Clairvoyance spirituelle"] = {class = "SHAMAN", level = 10,},
["Explosion de lave"] = {class = "SHAMAN", level = 34,},
--++ Élémentaire/amélioration ++
["Rage chamanique"] = {class = "SHAMAN", level = 65,}, 
--++ Élémentaire ++ 
["La fureur élémentaire"] = {class = "SHAMAN", level = 10,},
["Précision élémentaire"] = {class = "SHAMAN", level = 10,},
["Reach élémentaire"] = {class = "SHAMAN", level = 10,},
["Chamanisme"] = {class = "SHAMAN", level = 10,},
["Orage"] = {class = "SHAMAN", level = 10,},
["Rolling Thunder"] = {class = "SHAMAN", level = 20,},
["Fulmination"] = {class = "SHAMAN", level = 20,},
["Focus élémentaire"] = {class = "SHAMAN", level = 40,},
["Lave Surge"] = {class = "SHAMAN", level = 50,},
["Serment élémentaire"] = {class = "SHAMAN", level = 55,},
["Séisme"] = {class = "SHAMAN", level = 60,},
["Surcharge élémentaire"] = {class = "SHAMAN", level = 80,},
--++ Enhancement ++
["Coup de fouet de lave"] = {class = "SHAMAN", level = 10,},
["Rapidité mentale"] = {class = "SHAMAN", level = 10,},
["Sagesse primordiale"] = {class = "SHAMAN", level = 10,},
["Rafale"] = {class = "SHAMAN", level = 20,},
["Tempête"] = {class = "SHAMAN", level = 26,},
["Arme furie"] = {class = "SHAMAN", level = 30,},
["Searing Flames"] = {class = "SHAMAN", level = 34,},
["Static Shock"] = {class = "SHAMAN", level = 40,},
["Nova de feu"] = {class = "SHAMAN", level = 44,},
["Arme du maelström"] = {class = "SHAMAN", level = 50,},
["Unleashed Rage"] = {class = "SHAMAN", level = 55,},
["Esprit sauvage"] = {class = "SHAMAN", level = 60,},
["Esprit Walk"] = {class = "SHAMAN", level = 60,},
["Amélioré les éléments"] = {class = "SHAMAN", level = 80,},
--++ Restauration ++
["Méditation"] = {class = "SHAMAN", level = 10,},
["Purification"] = {class = "SHAMAN", level = 10,},
["Riptide"] = {class = "SHAMAN", level = 10,},
["Esprit de purifier"] = {class = "SHAMAN", level = 18,},
["Vague de guérison"] = {class = "SHAMAN", level = 20,},
["Bouclier de la terre"] = {class = "SHAMAN", level = 26,},
["Qui arme"] = {class = "SHAMAN", level = 30,},
["Réveil ancestral"] = {class = "SHAMAN", level = 34,},
["Résurgence"] = {class = "SHAMAN", level = 40,},
["Raz-de-marée"] = {class = "SHAMAN", level = 50,},
["Mana Tide Totem"] = {class = "SHAMAN", level = 56,},
["Une plus grande vague de soins"] = {class = "SHAMAN", level = 60,},
["Totem de lien de l'esprit"] = {class = "SHAMAN", level = 70,},
["La guérison profonde"] = {class = "SHAMAN", level = 80,}, 
--++ Talents chaman ++
["Gardien de la nature"] = {class = "SHAMAN", level = 15,},
["Pierre rempart Totem"] = {class = "SHAMAN", level = 15,},
["Shift astral"] = {class = "SHAMAN", level = 15,}, 
["Surgelé Power"] = {class = "SHAMAN", level = 30,},
["Earthgrab Totem"] = {class = "SHAMAN", level = 30,},
["Windwalk Totem"] = {class = "SHAMAN", level = 30,}, 
["Appel des éléments"] = {class = "SHAMAN", level = 45,},
["Persistance totémique"] = {class = "SHAMAN", level = 45,},
["Projection totémique"] = {class = "SHAMAN", level = 45,}, 
["Maîtrise élémentaire"] = {class = "SHAMAN", level = 60,},
["Rapidité ancestrale"] = {class = "SHAMAN", level = 60,},
["Echo des éléments"] = {class = "SHAMAN", level = 60,}, 
["Précipitation Streams"] = {class = "SHAMAN", level = 75,},
["Guidance ancestrale"] = {class = "SHAMAN", level = 75,},
["Conductivité"] = {class = "SHAMAN", level = 75,}, 
["Fury unleashed"] = {class = "SHAMAN", level = 90,},
["Primal élémentaliste"] = {class = "SHAMAN", level = 90,},
["Elemental Blast"] = {class = "SHAMAN", level = 90,},
 
--++ Démoniste capacités ++
["Shadow Bolt"] = {class = "WARLOCK", level = 1,},
["Slash démoniaque"] = {class = "WARLOCK", level = 1,},--Dark apothéose capacité
["Siphonner vie"] = {class = "WARLOCK", level = 1,},--++
["Summon Imp"] = {class = "WARLOCK", level = 1,},
["Corruption"] = {class = "WARLOCK", level = 3,},
["Drain de vie"] = {class = "WARLOCK", level = 7,},
["Summon marcheur du vide"] = {class = "WARLOCK", level = 8,},
["Soin de créer"] = {class = "WARLOCK", level = 9,},
["Maîtrise Demon"] = {class = "WARLOCK", level = 10,},
["Health Funnel"] = {class = "WARLOCK", level = 11,},
["Peur"] = {class = "WARLOCK", level = 14,},
["Sleep"] = {class = "WARLOCK", level = 14,},--Dark apothéose capacité
["Life Tap"] = {class = "WARLOCK", = level 16,},
["Malédiction de faiblesse"] = {class = "WARLOCK", level = 17,},
["Sort"] = {class = "WARLOCK", level = 18,},
["Summon succube"] = {class = "WARLOCK", level = 20,},
["Eye of Kilrogg"] = {class = "WARLOCK", level = 22,},
["Souffle sans fin"] = {class = "WARLOCK", level = 24,},
["Moisson d'âme"] = {class = "WARLOCK", level = 27,},
["Summon Felhunter"] = {class = "WARLOCK", level = 29,},
["Hurler de terreur"] = {class = "WARLOCK", level = 30,},
["Enslave Demon"] = {class = "WARLOCK", level = 31,},
["Bannir"] = {class = "WARLOCK", level = 32,},
["Twilight Ward"] = {class = "WARLOCK", level = 34,},
["Fury Ward"] = {class = "WARLOCK", level = 34,},--Dark apothéose capacité
["Armure de Fel"] = {class = "WARLOCK", level = 38,},
["Rituel d'invocation"] = {class = "WARLOCK", level = 42,},
["Invocation infernale"] = {class = "WARLOCK", level = 49,},
["Nethermancy"] = {class = "WARLOCK", level = 50,},
["La malédiction des éléments"] = {class = "WARLOCK", level = 51,},
["Commande Demon"] = {class = "WARLOCK", level = 56,},
["Summon Doomguard"] = {class = "WARLOCK", level = 58,},
["Resolve interminable"] = {class = "WARLOCK", level = 64,},
["Âme"] = {class = "WARLOCK", level = 66,},
["Provocation"] = {class = "WARLOCK", level = 66,},--Dark apothéose capacité
["Créer Soulwell"] = {class = "WARLOCK", level = 68,},
["Cercle démoniaque : invocation"] = {class = "WARLOCK", level = 76,},
["Cercle démoniaque : téléportation"] = {class = "WARLOCK", level = 76,},
["Gangreflamme"] = {class = "WARLOCK", level = 77,},
["Sombre intention"] = {class = "WARLOCK", level = 82,},
["Porte démoniaque"] = {class = "WARLOCK", level = 87,},
["Pandémie"] = {class = "WARLOCK", level = 90,}, 
--++ Glyphe capacités ++
["L'apothéose sombre"] = {class = "WARLOCK", level = 25,},
["Imp essaim"] = {class = "WARLOCK", level = 25,},
--++ Démoniste spécialisation ++
--++ Affliction/Destruction ++
["Pluie de feu"] = {class = "WARLOCK", level = 21,},
--++ Affliction ++
["Affliction instable"] = {class = "WARLOCK", level = 10,},
["Drain Soul"] = {class = "WARLOCK", level = 19,},
["Soulburn"] = {class = "WARLOCK", level = 19,},
["Soulburn : Health Funnel "] = {class = "WARLOCK", level = 27,},
["La malédiction d'épuisement"] = {class = "WARLOCK", level = 32,},
["Agonie"] = {class = "WARLOCK", level = 36,},
["Emprise maléfique"] = {class = "WARLOCK", level = 42,},
["Nightfall"] = {class = "WARLOCK", level = 54,},
["Graine de Corruption"] = {class = "WARLOCK", level = 60,},
["Hanter"] = {class = "WARLOCK", level = 62,},
["Soulburn : graine de Corruption"] = {class = "WARLOCK", level = 62,},
["Peur améliorée"] = {class = "WARLOCK", level = 69,},
["Soulburn : malédiction"] = {class = "WARLOCK", level = 73,},
["Soul Swap"] = {class = "WARLOCK", level = 79,},
["Soulburn : Soul Swap"] = {class = "WARLOCK", level = 79,},
["Puissantes Afflictions"] = {class = "WARLOCK", level = 80,},
["Dark Soul : misère"] = {class = "WARLOCK", level = 84,},
["Soulburn : cercle démoniaque : téléportation"] = {class = "WARLOCK", level = 86,},
--++ Démonologie ++
["La fureur démoniaque"] = {class = "WARLOCK", level = 10,},
["Metamorphosis"] = {class = "WARLOCK", level = 10,},
["Bond démoniaque"] = {class = "WARLOCK", level = 12,},
["Soul Fire"] = {class = "WARLOCK", level = 13,},
["La main de Gul'dan"] = {class = "WARLOCK", level = 19,},
["Hellfire"] = {class = "WARLOCK", level = 22,},
["Métamorphose : Touch of Chaos"] = {class = "WARLOCK", level = 25,},
["Nether Plating"] = {class = "WARLOCK", level = 27,},
["Lutins sauvages"] = {class = "WARLOCK", level = 32,},
["Métamorphose : Doom"] = {class = "WARLOCK", level = 36,},
["Summon annihilateurs"] = {class = "WARLOCK", level = 42,},
["Essaim charogne"] = {class = "WARLOCK", level = 47,},
["Renaissance démoniaque"] = {class = "WARLOCK", level = 54,},
["Métamorphose : Aura d'Immolation"] = {class = "WARLOCK", level = 62,},
["Métamorphose : maudit Auras"] = {class = "WARLOCK", level = 67,},
["Molten Core"] = {class = "WARLOCK", level = 69,},
["Décimation"] = {class = "WARLOCK", level = 73,},
["Métamorphose : vague de Chaos"] = {class = "WARLOCK", level = 79,},
["Maître Démonologue"] = {class = "WARLOCK", level = 80,},
["Dark Soul : connaissances"] = {class = "WARLOCK", level = 84,},
["Métamorphose : Disloqueur"] = {class = "WARLOCK", level = 85,},
--++ Destruction ++
["Énergie chaotique"] = {class = "WARLOCK", level = 10,},
["Conflagrate"] = {class = "WARLOCK", level = 10,},
["Incinération"] = {class = "WARLOCK", level = 10,},
["Immolate"] = {class = "WARLOCK", level = 12,},
["Backlash"] = {class = "WARLOCK", level = 32,},
["Havoc"] = {class = "WARLOCK", level = 36,},
["Chaos Bolt"] = {class = "WARLOCK", level = 42,},
["Ember Tap"] = {class = "WARLOCK", level = 42,},
["Braises ardentes"] = {class = "WARLOCK", level = 42,},
["Shadowburn"] = {class = "WARLOCK", level = 47,},
["Feu et soufre"] = {class = "WARLOCK", level = 54,},
["Aftermath"] = {class = "WARLOCK", level = 54,},
["Backdraft"] = {class = "WARLOCK", level = 69,},
["Flammes de Xoroth"] = {class = "WARLOCK", level = 79,},
["Emberstorm"] = {class = "WARLOCK", level = 80,},
["Dark Soul : instabilité"] = {class = "WARLOCK", level = 84,},
["Pyrolyse"] = {class = "WARLOCK", level = 86,},
--++ Démoniste Talents ++
["Régénération sombre"] = {class = "WARLOCK", level = 15,},
["Soul Leech"] = {class = "WARLOCK", level = 15,},
["Vie de moisson"] = {class = "WARLOCK", level = 15,}, 
["Souffle démoniaque"] = {class = "WARLOCK", level = 30,},
["Mortal Coil"] = {class = "WARLOCK", level = 30,},
["Shadowfury"] = {class = "WARLOCK", level = 30,}, 
["Soul Link"] = {class = "WARLOCK", level = 45,},
["Pacte sacrificiel"] = {class = "WARLOCK", level = 45,},
["Marché noir"] = {class = "WARLOCK", level = 45,}, 
["Horreur du sang"] = {class = "WARLOCK", level = 60,},
["Burning Rush"] = {class = "WARLOCK", level = 60,},
["Unbound volonté"] = {class = "WARLOCK", level = 60,}, 
["Le Grimoire de suprématie"] = {class = "WARLOCK", level = 75,},
["Grimoire of Service"] = {class = "WARLOCK", level = 75,},
["Grimoire du Sacrifice"] = {class = "WARLOCK", level = 75,}, 
["Archimonde Darkness"] = {class = "WARLOCK", level = 90,},
["De jaeden ruse"] = {class = "WARLOCK", level = 90,},
["La fureur de Mannoroth"] = {class = "WARLOCK", level = 90,}, 
 
--++ Guerrier capacités ++
["Battle Stance"] = {class = "WARRIOR", level = 1,},
["Frappe héroïque"] = {class = "WARRIOR", level = 1,},
["Charge"] = {class = "WARRIOR", level = 3,},
["Ivresse de la victoire"] = {class = "WARRIOR", level = 5,},
["Execute"] = {class = "WARRIOR", level = 7,},
["Position défensive"] = {class = "WARRIOR", level = 9,},
["Narguer"] = {class = "WARRIOR", level = 12,},
["Enragé"] = {class = "WARRIOR", level = 14,},
["Sunder Armor"] = {class = "WARRIOR", = level 16,},
["Thunder Clap"] = {class = "WARRIOR", level = 20,},
["Throw héroïque"] = {class = "WARRIOR", level = 22,},
["Pummel"] = {class = "WARRIOR", level = 24,},
["Désarmer"] = {class = "WARRIOR", level = 28,},
["Blessures profondes"] = {class = "WARRIOR", level = 32,},
["Posture berserker"] = {class = "WARRIOR", level = 34,},
["Cuisse"] = {class = "WARRIOR", level = 36,},
["Cri"] = {class = "WARRIOR", level = 42,},
["Cleave"] = {class = "WARRIOR", level = 44,},
["Mur bouclier"] = {class = "WARRIOR", level = 48,},
["Cri intimidant"] = {class = "WARRIOR", level = 52,},
["Rage berserker"] = {class = "WARRIOR", level = 54,},
["Insouciance"] = {class = "WARRIOR", level = 62,},
["Spell Reflection"] = {class = "WARRIOR", level = 66,},
["Commandant Shout"] = {class = "WARRIOR", level = 68,},
["Intervenir"] = {class = "WARRIOR", level = 72,},
["Lancer fracassant"] = {class = "WARRIOR", level = 74,},
--["Ripsote"] = {class = "WARRIOR", level = 76,},--ajouté au Patch 5.4 mais pas activé puisque les Chevaliers de la mort ont aussi cette capacité
["Cri de ralliement"] = {class = "WARRIOR", level = 83,},
["Acte héroïque"] = {class = "WARRIOR", level = 85,},
["Démoraliser la bannière"] = {class = "WARRIOR", level = 87,},
["Bannière moqueur"] = {class = "WARRIOR", level = 87,},
["Crâne Banner"] = {class = "WARRIOR", level = 87,},
--++ Guerrier spécialisation ++
--++ Armes/fureur ++
["Whirlwind"] = {class = "WARRIOR", level = 26,},
["Mourir par l'épée"] = {class = "WARRIOR", level = 56,},
["Colère débridée"] = {class = "WARRIOR", level = 56,},
["Colossus Smash"] = {class = "WARRIOR", level = 81,},
--++ Bras/Protection ++ 
["Sang et tonnerre"] = {class = "WARRIOR", level = 46,},
--++ Bras ++
["Mortal Strike"] = {class = "WARRIOR", level = 10,},
["Assaisonné de soldat"] = {class = "WARRIOR", level = 10,},
["Slam"] = {class = "WARRIOR", level = 18,},
["Dominer"] = {class = "WARRIOR", level = 30,},
["Taste for Blood"] = {class = "WARRIOR", level = 30,},
["Balayer les grèves"] = {class = "WARRIOR", level = 60,},
["Strikes d'occasion"] = {class = "WARRIOR", level = 80,},
["Mort subite"] = {class = "WARRIOR", level = 81,},
--++ Fury ++
["Soif de sang"] = {class = "WARRIOR", level = 10,},
["Berserker fou"] = {class = "WARRIOR", level = 10,},
["Grève sauvage"] = {class = "WARRIOR", level = 18,},
["Raging Blow"] = {class = "WARRIOR", level = 30,},
["Grip de Titan"] = {class = "WARRIOR", level = 38,},
["La fureur farouche"] = {class = "WARRIOR", level = 38,},
["Bloodsurge"] = {class = "WARRIOR", level = 50,},
["Couperet à viande"] = {class = "WARRIOR", level = 58,},
["Rafale"] = {class = "WARRIOR", level = 60,},
["Unshackled Fury"] = {class = "WARRIOR", level = 80,},
--++ Protection ++ 
["Bouclier Slam"] = {class = "WARRIOR", level = 10,},
["Sentinelle inébranlable"] = {class = "WARRIOR", level = 10,},
["Vengeance"] = {class = "WARRIOR", level = 10,},
["Bouclier bloc"] = {class = "WARRIOR", level = 18,},
["Dévaster"] = {class = "WARRIOR", level = 26,},
["Revenge"] = {class = "WARRIOR", level = 30,},
["Last Stand"] = {class = "WARRIOR", level = 38,},
["Sword and Board"] = {class = "WARRIOR", level = 50,},
["Cri démoralisant"] = {class = "WARRIOR", level = 56,},
["Ultimatum"] = {class = "WARRIOR", level = 58,},
["Bastion de défense"] = {class = "WARRIOR", level = 60,},
["Bloc critique"] = {class = "WARRIOR", level = 80,},
["Bouclier barrière"] = {class = "WARRIOR", level = 81,},
--++ Guerrier Talents ++
["Juggernaut"] = {class = "WARRIOR", level = 15,},
["Temps Double"] = {class = "WARRIOR", level = 15,},
["Porteguerre"] = {class = "WARRIOR", level = 15,}, 
["Régénération enragé"] = {class = "WARRIOR", level = 30,},
["Second souffle"] = {class = "WARRIOR", level = 30,},
["La victoire imminente"] = {class = "WARRIOR", level = 30,}, 
["Démarche chambranlante Shout"] = {class = "WARRIOR", level = 45,},
["Piercing Howl"] = {class = "WARRIOR", level = 45,},
["Shout perturbant"] = {class = "WARRIOR", level = 45,},
["Bladestorm"] = {class = "WARRIOR", level = 60,},
["Shockwave"] = {class = "WARRIOR", level = 60,},
["Dragon Roar"] = {class = "WARRIOR", level = 60,}, 
["Masse Spell Reflection"] = {class = "WARRIOR", level = 75,},
["Sauvegarde"] = {class = "WARRIOR", level = 75,},
["Vigilance"] = {class = "WARRIOR", level = 75,}, 
["Avatar"] = {class = "WARRIOR", level = 90,},
["Bain de sang"] = {class = "WARRIOR", level = 90,},
["Boulon storm"] = {class = "WARRIOR", level = 90,}, 
};
