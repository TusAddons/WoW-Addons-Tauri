local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "ptDE")
if not L then return end
-- TOC Note: Detektiert und warnt Sie auf das Vorhandensein der nähe befindlichen Gegner.

--Addon-Informationen
L["Spy"] = "Spy"
L["Version"] = "Version"
L["LoadDescription"] = "|cff9933ffSpy-Addon geladen. Geben Sie |cffffffff/spy|cff9933ff für Optionen."
L["SpyEnabled"] = "|cff9933ffSpy-Addon aktiviert."
L["SpyDisabled"] = "|cff9933ffSpy-Addon deaktiviert. Geben Sie |cffffffff/Spy enable|cff9933ff aktivieren."
L["UpgradeAvailable"] = "|cff9933ffEine neue Version von Spy ist verfügbar. Es kann von heruntergeladen werden: \n| cffffffffhttps://mods.curse.com/addons/wow/spy"

-- Configuration frame name
L["Spy Option"] = "Spy"

--Konfiguration Zeichenfolgen
L["Profiles"] = "Profile"

L["GeneralSettings"] = "Allgemeine Einstellungen"
L["SpyDescription1"] = [[
Spy ist ein Addon, das Sie auf das Vorhandensein von nahe gelegenen feindliche Spieler benachrichtigt.
]]
L["SpyDescription2"] = [[

|cffffd000In der Nähe Liste|cffffffff
Die nahe gelegenen Liste zeigt alle feindlichen Spieler, die in der Nähe gefunden wurden. Durch Klicken auf die Liste können Sie auf den Spieler, aber dies nur außerhalb des Kampfes funktioniert. Spieler werden aus der Liste entfernt, wenn sie nach einer gewissen Zeit nicht erkannt wurden.

Der löschen-Button in der Titelleiste kann verwendet werden, um die Liste zu löschen, und halten Control beim Löschen der Liste ermöglicht es Ihnen, schnell aktivieren/deaktivieren Spy.

|cffffd000Letzte Stunde-Liste|cffffffff
Die Letzte Stunde-Liste zeigt alle Feinde, die in der letzten Stunde festgestellt wurden.

|cffffd000Ignorierliste|cffffffff
Spieler, die die Ignorierliste hinzugefügt werden, werden nicht von Spy gemeldet. Sie können hinzufügen und Spieler zu/aus dieser Liste zu entfernen, mithilfe der Schaltfläche Dropdown-Menü oder halten die STRG-Taste beim Klicken auf die Schaltfläche.

|cffffd000Blick in die Liste zu töten|cffffffff
Spieler auf Ihre Kill auf Blick in die Liste dazu führen, dass einen Alarm zu klingen, wenn erkannt. Sie können hinzufügen und Spieler zu/aus dieser Liste zu entfernen, mithilfe der Schaltfläche Dropdown-Menü oder durch halten der Shift-Taste beim Klicken auf die Schaltfläche.

Dropdown-Menü kann auch verwendet werden, um die Gründe genannt, warum Sie jemanden töten-Anblick-Liste hinzugefügt haben. Möchten Sie einen bestimmten Grund eingeben, der nicht in der Liste ist, verwenden Sie "Geben Sie Ihren eigenen Grund...", in der Anderen Liste.


|cffffd000Autor: http://www.curse.com/users/slipjack |cffffffff

]]
L["EnableSpy"] = "Aktivieren Spy"
L["EnableSpyDescription"] = "aktiviert oder deaktiviert Spy sowohl jetzt als auch bei Login."
L["EnabledInBattlegrounds"] = "Aktivieren Spion in Schlachtfeldern"
L["EnabledInBattlegroundsDescription"] = "Aktiviert oder deaktiviert Spy, wenn Sie in ein Schlachtfeld sind."
L["EnabledInArenas"] = "Spy in Arenen aktivieren"
L["EnabledInArenasDescription"] = "Aktiviert oder deaktiviert Spy, wenn Sie in einer Arena sind."
L["EnabledInWintergrasp"] = "Spy in der Welt bekämpfen Zonen aktivieren"
L["EnabledInWintergraspDescription"] = "Aktiviert oder deaktiviert Spy, wenn Sie in der Welt bekämpfen Zonen wie Lake Tausendwinter in Nordend sind."
L["DisableWhenPVPUnflagged"] = "Disable Spy, wenn nicht für PVP geflaggt"
L["DisableWhenPVPUnflaggedDescription"] = "Aktiviert oder deaktiviert die Spy abhängig von Ihrem PVP-Status."
 
L["DisplayOptions"] = "Anzeigen"
L["DisplayOptionsDescription"] = [[
Spy kann angezeigt oder automatisch ausgeblendet werden.
]]
L["ShowOnDetection"] = "Karte Spy wenn feindliche Spieler erkannt werden"
L["ShowOnDetectionDescription"] = "Wählen Sie hier das Spy-Fenster und die nahe gelegenen Liste anzeigen, wenn Spy verborgen ist, wenn feindliche Spieler erkannt werden."
L["HideSpy"] = "Spy ausblenden, wenn keine feindliche Spieler erkannt werden"
L["HideSpyDescription"] = "Setzen Sie diese Spion ausgeblendet, wenn die nahe gelegenen Liste wird angezeigt, und es leer wird. Spion werden nicht versteckt werden, wenn die Liste manuell zu löschen."
L["ShowOnlyPvPFlagged"] = "Zeige nur gegnerische Spieler, die für PvP markiert sind"
L["ShowOnlyPvPFlaggedDescription"] = "Setze dies so, dass nur gegnerische Spieler, die für PvP markiert sind, in der Liste in der Nähe angezeigt werden."
L["LockSpy"] = "Sperren Fenster Spy"
L["LockSpyDescription"] = "Das Spy-Fenster im Ort sperrt, damit es sich nicht bewegt."
L["InvertSpy"] = "Fenster Spy umkehren"
L["InvertSpyDescription"] = "Kippt das Spy-Fenster auf den Kopf."
L["ResizeSpy"] = "Größe das Spy-Fenster automatisch"
L["ResizeSpyDescription"] = "Setzen dies automatisch die Spy Fenstergröße als feindliche Spieler hinzugefügt oder entfernt werden."
L["TooltipDisplayWinLoss"] = "Gewinn/Verlust Statistik im Tooltip anzeigen"
L["TooltipDisplayWinLossDescription"] = "Setzen das der Gewinn/Verlust Statistik eines Spielers in den Player QuickInfo anzeigen."
L["TooltipDisplayKOSReason"] = "Anzeige TÖTEN Gründen in Tooltip"
L["TooltipDisplayKOSReasonDescription"] = "Setzen das töten auf Sicht Gründe eines Spielers in den Player QuickInfo anzeigen."
L["TooltipDisplayLastSeen"] = "Details in QuickInfo anzeigen, die zuletzt gesehen"
L["TooltipDisplayLastSeenDescription"] = "Setzen das letzte bekannte Zeit und Ort eines Spielers in den Player QuickInfo anzeigen."
L["SelectFont"] = "Selekt und Font"
L["SelectFontDescription"] = "Wählen Sie eine Schriftart für das Spy-Fenster."
L["RowHeight"] = "Wählen Sie die Zeilenhöhe aus"
L["RowHeightDescription"] = "Wählen Sie die Zeilenhöhe für das Spy-Fenster aus."
 
L["AlertOptions"] = "Warnungen"
L["AlertOptionsDescription"] = [[
Sie können ankündigen, die Details auf eine Begegnung zu einem Chat-Kanal und Steuern wie Spy warnt Sie, wenn feindliche Spieler erkannt werden.
]]
L["Announce"] = "zu verkünden:"
L["None"] = "None"
L["NoneDescription"] = "nicht bekannt geben, wenn feindliche Spieler erkannt werden."
L["Self"] = "Selbst"
L["SelfDescription"] = "Announce selbst wenn feindliche Spieler erkannt werden."
L["Party"] = "Party"
L["PartyDescription"] = "Announce zu deiner Party, wenn feindliche Spieler erkannt werden."
L["Guild"] = "Gilde"
L["GuildDescription"] = "Announce zu eurer Gilde, wenn feindliche Spieler erkannt werden."
L["Raid"] = "Raid"
L["RaidDescription"] = "Announce auf Ihre Raid, wenn feindliche Spieler erkannt werden."
L["LocalDefense"] = "Lokale Verteidigung"
L["LocalDefenseDescription"] = "Announce an den lokalen Verteidigung-Kanal, wenn feindliche Spieler erkannt werden."
L["OnlyAnnounceKoS"] = "Nur verkünden Gegner, die Tötung auf Sichtweite sind"
L["OnlyAnnounceKoSDescription"] = "Stellen Sie hier nur verkünden, gegnerischen Spielern, die auf Ihrem TÖTEN Liste sind."
L["WarnOnStealth"] = "Über die Verstohlenheitsentdeckung bei"
L["WarnOnStealthDescription"] = "stellen Sie hier eine Warnung und Ton eine Warnung, wenn Sie einen feindlichen Spieler tarnt."
L["WarnOnKOS"] = "Über auf TÖTEN Erkennung."
L["WarnOnKOSDescription"] = "SStellen Sie hier eine Warnung und Ton eine Warnung, wenn ein Feind Player auf Ihrem TÖTEN Liste erkannt wird"
L["WarnOnKOSGuild"] = "Über auf TÖTEN Gilde Erkennung"
L["WarnOnKOSGuildDescription"] = "Stellen Sie hier eine Warnung und Ton eine Warnung, wenn ein Feind-Spieler in der gleichen Gilde wie jemand auf Ihrer TÖTEN Liste erkannt wird."
L["WarnOnRace"] = "Warnen Sie auf Völker Detektion"
L["WarnOnRaceDescription"] = "Setzen Sie diesen Wert einen Alarm ertönt, wenn die ausgewählte Völker detektiert wird"
L["SelectWarnRace"] = "Wählen Völker zur Detektion"
L["SelectWarnRaceDescription"] = "Wählen Sie ein Völker für Audio-Alarm"
L["WarnRaceNote"] = "Hinweis: Sie müssen den Feind mindestens einmal Ziel so ihre Völker in die Datenbank aufgenommen werden können. Bei der nächsten Detektion ertönt ein Alarm. Das funktioniert nicht, das gleiche wie Detektion von Gegnern in der Nähe im Kampf."
L["DisplayWarningsInErrorsFrame"] = "Anzeigen von Warnungen in der Fehler-Frame"
L["DisplayWarningsInErrorsFrameDescription"] = "Setzen dies mit der Fehler-Frame Warnungen anstelle von den grafischen Popup-Frames angezeigt."
L["EnableSound"] = "Audio-Warnungen aktivieren"
L["EnableSoundDescription"] = "setzen Sie diese auf Audio-Warnungen zu aktivieren, wenn feindliche Spieler erkannt werden. Verschiedene Warnungen klingen, wenn ein Feind Stealth-Spieler gewinnt oder wenn ein Feind Spieler auf deiner TÖTEN Liste."
L["OnlySoundKoS"] = "Nur Ton-Audio-Alerts für die TÖTEN Liste"
L["OnlySoundKoSDescription"] = "Stellen Sie dies so ein, dass nur Audiowarnungen wiedergegeben werden, wenn feindliche Spieler auf der TÖTEN Liste erkannt werden."
 
L["ListOptions"] = "In der Nähe von List"
L["ListOptionsDescription"] = [[
Sie können konfigurieren, wie Spy hinzufügt und entfernt feindliche Spieler zu und von der Nähe Liste.
]]
L["RemoveUndetected"] = "Entfernen Sie feindliche Spieler aus der Nähe Liste nach:"
L["1Min"] = "1 Minute"
L["1MinDescription"] = "Entferne eine feindliche Spieler, der seit über 1 Minute unentdeckt."
L["2Min"] = "2 Minuten"
L["2MinDescription"] = "Entferne eine feindliche Spieler, der seit mehr als 2 Minuten unentdeckt."
L["5 Minuten"] = "5 Minuten"
L["5MinDescription"] = "Entferne eine feindliche Spieler, der seit mehr als 5 Minuten unentdeckt."
L["10Min"] = "10 Minuten"
L["10MinDescription"] = "Entferne eine feindliche Spieler, der seit mehr als 10 Minuten unentdeckt."
L["15Min"] = "15 Minuten"
L["15MinDescription"] = "Entferne eine feindliche Spieler, der seit mehr als 15 Minuten unentdeckt."
L["Never"] = "Nicht entfernen"
L["NeverDescription"] = "Entfernen Sie niemals feindliche Spieler. Die Nähe Liste kann noch manuell gelöscht werden."
L["ShowNearbyList"] = "Auf die Nähe Liste auf feindlichen Spieler Erfassungsschalter"
L["ShowNearbyListDescription"] = "Stellen Sie hier die Nähe Liste anzuzeigen, wenn es nicht bereits sichtbar ist, wenn feindliche Spieler erkannt werden."
L["PrioritiseKoS"] = "Priorisierung TÖTEN feindliche Spieler in der Nähe Liste"
L["PrioritiseKoSDescription"] = "Stellen Sie diese, um immer auf Sicht töten feindliche Spieler zuerst in der Nähe Liste."
 
L["MinimapOptions"] = "Karte"
L["MinimapOptionsDescription"] = [[
Für Spieler, die humanoide verfolgen können, kann der Minikarte genutzt werden, um zusätzliche Features bereitzustellen.
 
Spieler, die humanoide verfolgen können gehören Jäger, Druiden und diejenigen, die die Fähigkeit mit anderen Mitteln wie ein Schwarzgebratenes Worgsteak essen erhalten haben.
]]
L["MinimapTracking"] = "Aktiviere Minimap-Tracking"
L["MinimapTrackingDescription"] = "auf der Minikarte verfolgen und Erkennung aktivieren gesetzt. Bekannte feindliche Spieler, die auf der Minikarte entdeckt werden die Nearby-Liste hinzugefügt werden."
L["MinimapDetails"] = "Stufe/Klasse Details in QuickInfos anzeigen"
L["MinimapDetailsDescription"] = "Setzen dies um die QuickInfos anzeigen zu aktualisieren, sodass Ebene/Klassendetails neben feindlichen Namen angezeigt werden."
L["DisplayOnMap"] = "Feindlichen Lage auf Karte anzeigen"
L["DisplayOnMapDescription"] = "Setzen dies auf die Weltkarte und Minikarte den Speicherort der Feinde, die von anderen Benutzern Spy in Ihrer Partei, Raid und Gilde erkannt angezeigt."
L["SwitchToZone"] = "Wechseln Sie in den aktuellen Zonenkarte  auf feindliche Erkennung"
L["SwitchToZoneDescription"] = "Wenn die Weltkarte  geöffnet ist, wird dies in der Karte auf den aktuellen Zonenkarte  Spieler ändern, wenn Feinde erkannt werden."
L["MapDisplayLimit"] = "Limit angezeigt Kartensymbole auf:"
L["LimitNone"] = "Überall"
L["LimitNoneDescription"] = "Fügt alle erkannt Feinde auf der Karte unabhängig von Ihrem aktuellen Standort."
L["LimitSameZone"] = "Derselben Zone"
L["LimitSameZoneDescription"] = "wird nur angezeigt erkannt Feinde auf der Karte, wenn Sie in der gleichen Zone befinden."
L["LimitSameContinent"] = "Demselben Kontinent"
L["LimitSameContinentDescription"] = "wird nur angezeigt erkannt Feinde auf der Karte, wenn Sie auf demselben Kontinent sind."
 
L["DataOptions"] = "Datenmanagement"
L["DataOptionsDescription"] = [[
Sie können konfigurieren, wie Spy unterhält und sammelt ihre Daten.
]]
L["PurgeData"] = "Purge unbemerkt feindliche Spieler-Daten nach:"
L["OneDay"] = "1 Tag"
L["OneDayDescription"] = "Bereinigung von Daten für feindliche Spieler, die seit 1 Tag unentdeckt."
L["FiveDays"] = "5 Tage"
L["FiveDaysDescription"] = "Bereinigung von Daten für feindliche Spieler, die seit 5 Tagen unentdeckt."
L["TenDays"] = "10 Tage"
L["TenDaysDescription"] = "Bereinigung von Daten für feindliche Spieler, die seit 10 Tagen unentdeckt."
L["ThirtyDays"] = "30 Tage"
L["ThirtyDaysDescription"] = "Bereinigung von Daten für feindliche Spieler, die seit 30 Tagen unentdeckt."
L["SixtyDays"] = "60 Tage"
L["SixtyDaysDescription"] = "Bereinigung von Daten für feindliche Spieler, die seit 60 Tagen unentdeckt."
L["NinetyDays"] = "90 Tage"
L["NinetyDaysDescription"] = "Bereinigung von Daten für feindliche Spieler, die seit 90 Tagen unentdeckt."
L["PurgeKoS"] = "Purge TÖTEN Liste Spieler basierend auf unentdeckt Zeit"
L["PurgeKoSDescription"] = "Setzen Sie diesen Wert TÖTEN Liste Spieler zu bereinigen, die unentdeckt Spieler auf der Basis der Zeiteinstellungen  unentdeckt wurden."
L["PurgeWinLossData"] = "Purge Sieg / Verlust Daten auf unentdeckt Zeit basiert."
L["PurgeWinLossDataDescription"] = "Setzen Sie diesen Wert Sieg / Verlust Daten Ihrer Gegner Begegnungen auf der Grundlage der Zeiteinstellungen für unentdeckt Spieler zu spülen."
L["ShareData"] = "Freigeben von Daten mit anderen Benutzern des Spy-Addon"
L["ShareDataDescription"] = "Setzen um die Details Ihrer feindliche Spieler-Begegnungen mit anderen Spy-Benutzern in Ihrer Partei, Raid und Gilde teilen."
L["UseData"] = "Daten aus andere Spy Addon Benutzer verwenden"
L["UseDataDescription"] = [[auf gesetzt von anderen Spy-Benutzern in Ihrer Partei, Raid und Gilde gesammelten Daten verwenden.
 
Wenn ein anderer Benutzer in Spy einen feindlichen Spieler erkennt wird dieser feindliche Spieler zur nahe gelegenen Liste hinzugefügt werden, falls Platz vorhanden ist.
]]
L["ShareKOSBetweenCharacters"] = "Aktie Kill auf Anblick Spieler zwischen den Zeichen"
L["ShareKOSBetweenCharactersDescription"] = "Wählen Sie hier die Spielern zu teilen, die Sie gekennzeichnet als Kill auf Anblick zwischen anderen Zeichen, die Sie auf dem gleichen Server spielen und Fraktion."
 
L["SlashCommand"] = "Slash Command"
L["SpySlashDescription"] = "diese Schaltflächen führen Sie die gleichen Funktionen wie die, die in den Schrägstrich Befehl /spy"
L["Enable"] = "Enable"
L["EnableDescription"] = "Ermöglicht Spy und zeigt das Hauptfenster."
L["Reset"] = "Reset"
L["ResetDescription"] = "Setzt die Position und die Darstellung des Hauptfensters."
L["Config"] = "Config"
L["ConfigDescription"] = "Öffnen Sie das Konfigurationsfenster Interface Addons für Spy."
L["KOS"] = "KOS"
L["KOSDescription"] = "Hinzufügen/entfernen Sie einen Spieler nach den Kill auf Blick in die Liste."
L["Ignore"] = "Ignore"
L["IgnoreDescription"] = "Hinzufügen/entfernen ein Spieler von der Ignorieren-Liste."
 
--Listen
L["Nearby"] = "In der Nähe"
L["LastHour"] = "Letzte Stunde"
L["Ignore"] = "Ignorieren"
L["KillOnSight"] = "Sofort zu Töten"
 
--Stats
--L["Last"] = "Last"
L["Time"] = "Zeit"	
L["List"] = "Liste"	
L["Show Only"] = "Zeige Nur"
L["Wins/Loses"] = "Gewann/Verloren"
L["Reason"] = "Grund"	
L["HonorKills"] = "Ehre Siege"
L["PvPDeatchs"] = "PvP Todes"

--++ Class descriptions
L["DEATHKNIGHT"] = "Todesritter"
L["DEMONHUNTER"] = "Dämonenjäger"
L["DRUID"] = "Druide"
L["HUNTER"] = "Jäger"
L["MAGE"] = "Magier"
L["MONK"] = "Mönch"
L["PALADIN"] = "Paladin"
L["PREIST"] = "Priester"
L["ROGUE"] = "Schurke"
L["SHAMAN"] = "Schamane"
L["WARLOCK"] = "Hexenmeister"
L["WARRIOR"] = "Krieger"
L["UNKNOWN"] = "Unbekannt"
 
 --++ Race descriptions
L["BLOOD ELF"] = "Blutelf"
L["DRAENEI"] = "Draenei"
L["DWARF"] = "Dwarf"
L["GOBLIN"] = "Goblin"
L["GNOME"] = "Gnom"
L["HUMAN"] = "Mensch"
L["NIGHT ELF"] = "Nachtelf"
L["ORC"] = "Orc"
L["PANDAREN"] = "Pandaren"
L["TAUREN"] = "Tauren"
L["TROLL"] = "Troll"
L["UNDEAD"] = "Untoter"
L["WORGEN"] = "Worgen"
L["VOID ELF"] = "Leerenelfen"
L["LIGHTFORGED DRAENEI"] = "Lichtgeschmiedete Draenei"
L["NIGHTBORNE"] = "Nachtgeborene"
L["HIGHMOUNTAIN TAUREN"] = "Hochbergtauren"
 
--++ Font descriptions
L["2002"] = "2002"
L["2002 BOLD"] = "2002 Bold"
L["ARIAL NARROW"] = "Arial Narrow" -- default chat font
L["FRIZ QUADRATA TT"] = "Friz Quadrata TT" -- default main UI font
L["FRIZQUADRATACTT"] = "FrizQuadrataCTT"
L["MOK"] = "MoK"
L["MORPHEUS"] = "Morpheus" -- default in game mail font
L["NIMROD MT"] = "Nimrod MT"
L["SKURRI"] = "Skurri" -- default unit frame combat font

 --Stealth Fähigkeiten
L["Stealth"] = "Verstohlenheit"
L["Prowl"] = "Schleichen"
 
--Kanalnamen
L["LocalDefenseChannelName"] = "LokaleVerteidigung"
 
--++ Minimap-Farbcodes
L["MinimapClassTextDEATHKNIGHT"] = "|cffc41e3a"
L["MinimapClassTextDEMONHUNTER"] = "|cffa330c9"
L["MinimapClassTextDRUID"] = "|cffff7c0a"
L["MinimapClassTextHUNTER"] = "|cffaad372"
L["MinimapClassTextMAGE"] = "|cff68ccef"
L["MinimapClassTextMONK"] = "|cff00ff96"
L["MinimapClassTextPALADIN"] = "|cfff48cba"
L["MinimapClassTextPRIEST"] = "|cffffffff"
L["MinimapClassTextROGUE"] = "|cfffff468"
L["MinimapClassTextSHAMAN"] = "|cff2359ff"
L["MinimapClassTextWARLOCK"] = "|cff9382c9"
L["MinimapClassTextWARRIOR"] = "|cffc69b6d"
L["MinimapClassTextUNKNOWN"] = "|cff191919"
L["MinimapGuildText"] = "|cffffffff"
 
--Ausgabemeldungen
L["AlertStealthTitle"] = "Getarnte Spieler erkannt!"
L["AlertKOSTitle"] = "töten Sie auf Anblick Spieler erkannt!"
L["AlertKOSGuildTitle"] = "töten Sie auf Anblick Spieler Gilde erkannt!"
L["AlertTitle_kosaway"] = "töten auf Anblick Spieler gelegen"
L["AlertTitle_kosguildaway"] = "töten auf Anblick Spieler Gilde gelegen"
L["StealthWarning"] = "|cff9933ffGetarnte Spieler erkannt: |cffffffff"
L["KOSWarning"] = "|cffff0000töten Sie auf Anblick Spieler erkannt: |cffffffff"
L["KOSGuildWarning"] = "|cffff0000töten Sie auf Anblick Spieler Gilde erkannt: |cffffffff"
L["SpySignatureColored"] = "|cff9933ff [Spy]"
L["PlayerDetectedColored"] = "Spieler erkannt: |cffffffff"
L["PlayersDetectedColored"] = "Spieler erkannt: |cffffffff"
L["KillOnSightDetectedColored"] = "töten Sie auf Anblick Spieler erkannt: |cffffffff"
L["PlayerAddedToIgnoreColored"] = "zusätzlichen Spieler ignorieren-Liste: |cffffffff"
L["PlayerRemovedFromIgnoreColored"] = "entfernt-Spielerin ignorieren-Liste: |cffffffff"
L["PlayerAddedToKOSColored"] = "Zusätzliche Spieler auf Blick in die Liste zu töten: |cffffffff"
L["PlayerRemovedFromKOSColored"] = "Entfernte Spieler aus Kill auf Blick in die Liste: |cffffffff"
L["PlayerDetected"] = "[Spy] Spieler erkannt:"
L["KillOnSightDetected"] = "[Spy] töten auf Anblick Spieler erkannt:"
L["Level"] = "Stufe"
L["LastSeen"] = "Zuletzt gesehen"
L["LessThanOneMinuteAgo"] = "vor weniger als einer minute"
L["MinutesAgo"] = "Stunden"
L["HoursAgo"] = "Tage"
L["DaysAgo"] = "Tage"
L["Close"] = "Schließen"
L["CloseDescription"] = "|cffffffffVerbirgt das Spy-Fenster. Standardmäßig wird wieder zeigen wenn der nächste feindliche Spieler erkannt wird."
L["Left/Right"] = "Links/Rechts"
L["Left/RightDescription"] = "|cffffffffNavigiert zwischen den in der Nähe, letzten Stunde, ignorieren und Blick in die Listen zu töten."
L["Clear"] = "Löschen"
L["ClearDescription"] = "|cffffffffLöscht die Liste der Spieler, die gefunden wurden. Strg-Klick wird aktivieren/deaktivieren-Spion während angezeigt."
L["NearbyCount"] = "In der Nähe von Count"
L["NearbyCountDescription"] = "|cffffffffSendet die Anzahl der in der Nähe Spieler chatten"
L["Statistics"] = "Statistiken"
L["StatsDescription"] = "|cffffffffZeigt eine Liste der feindlichen Spieler, die angetroffen werden, gewinnen / verlieren Aufzeichnungen und wo sie zuletzt gesehen wurden"
L["AddToIgnoreList"] = "Zu Ignorierliste hinzufügen"
L["AddToKOSList"] = "Abzutöten, Blick in die Liste hinzufügen"
L["RemoveFromIgnoreList"] = "Aus Liste entfernen"
L["RemoveFromKOSList"] = "Entfernen von Kill auf Blick in die Liste"
L["RemoveFromStatsList"] = "Aus der Statistikliste entfernen"   --++
L["AnnounceDropDownMenu"] = "Melden"
L["KOSReasonDropDownMenu"] = "Set Kill auf Anblick Grund"
L["PartyDropDownMenu"] = "Party"
L["RaidDropDownMenu"] = "Raid"
L["GuildDropDownMenu"] = "Gilde"
L["LocalDefenseDropDownMenu"] = "Lokale Verteidigung"
L["Player"] = "(Spieler)"
L["KOSReason"] = "sofort zu töten"
L["KOSReasonIndent"] = "    "
L["KOSReasonOther"] = "Geben Sie Ihren eigenen Grund..."
L["KOSReasonClear"] = "Löschen"
L["StatsWins"] = "|cff40ff00Gewinnt:"
L["StatsSeparator"] = ""
L["StatsLoses"] = "|cff0070ddVerliert:"
L["Located"] = "liegt:"
L["Yards"] = "m"
 
Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
	[1] = {
		["title"] = "Schritte Kampf";
		["content"] = {
			"Angegriffen mich ohne Grund",
			"Angegriffen mich an der Questgeber",
			"Angegriffen mich, während ich NSCs kämpfte",
			"Angegriffen mich, während ich in der Nähe einer Instanz gehen wollte",
			"Angegriffen mich, während ich weg war",
			"Angegriffen mich, während ich montiert/fliegen war",
			"Angegriffen mich, während ich hatten niedrige Gesundheit/Mana",
		};
	},
	[2] = {
		["title"] = "Stil des Kampfes";
		["content"] = {
			"Überfallen mich",
			"Immer mich attacks on Sight",
			"Getötet mich mit einem höheren Charakter",
			"Massakriert mich mit mehreren Feinden",
			"Nicht ohne Backup-Angriff",
			"Immer rufen um Hilfe",
			"Nutzt, um viel Kontrolle von Menschenmengen",
		};
	},
	[3] = {
		["title"] = "Zelten";
		["content"] = {
			"Kampierte mich",
			"Kampierte meine anderen Charakter",
			"lagerten untere Charaktere",
			"Lagerten aus Stealth",
			"Da Gildenmitglieder",
			"Kampierte Spiel NSCs/Ziele",
			"Eine stadt/ort kampierte",
		};
	},
	[4] = {
		["title"] = "Questen";
		["content"] = {
			"Angegriffen mir, während ich questen",
			"Griff mich, nachdem ich mit der Suche geholfen",
			"Mit einer Quest Ziel gestört",
			"Schritte eine Quest ich tun wollte",
			"Meine Fraktion NSCs getötet",
			"Eine Quest NSC getötet",
		};
	},
	[5] = {
		["title"] = "Stahl Ressourcen";
		["content"] = {
			"Gesammelte Kräuter wollte ich",
			"Gefundenen Mineralien wollte ich",
			"Gesammelten Ressourcen wollte ich",
			"Getötet mich und stahl meine Ziel/seltenen NSC",
			"Enthäutet meine Kills",
			"Meine Kills geborgen",
			"In meinem Pool gefischt",
		};
	},
	[6] = {
		["title"] = "Andere";
		["content"] = {
		"Für Spieler gegen Spieler vorgemerkt",
		"Schob mich von einer Klippe",
		"Engineering-Tricks verwendet",
		"Immer gelingt, zu entkommen",
		"Benutzt Gegenstände und Fähigkeiten um zu entkommen",
		"Exploits Spielmechanik",
		"Geben Sie Ihren eigenen Grund...",
		};
	},
}
 
StaticPopupDialogs ["Spy_SetKOSReasonOther"] = {
	PreferredIndex = STATICPOPUPS_NUMDIALOGS,--http://forums.wowace.com/showthread.php?p=320956
	text = "Geben Sie den Kill On Sight Grund für %s",
	button1 = "Setzen",
	button2 = "Abbrechen",
	timeout = 20,
	hasEditBox = 1,
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("");
	end,
		OnAccept = function(self)
		local reason = Self.editBox:GetText()
		Spy:SetKOSReason(self.playerName, "Geben Sie Ihren eigenen Grund...", reason)
	end,
};
 
Spy_AbilityList = {
 
-----------------------------------------------------------
--Ermöglicht eine Abschätzung der Rasse, Klasse und Niveau ein
--Spieler bestimmt, welche Fähigkeiten beobachtet werden
--im Kampflog angezeigt.
-----------------------------------------------------------
 
--++ Racials ++
	["Steingestalt"] = 		{race = "Dwarf", level = 1,},
	["Entfesselungskünstler"] = {race = "Gnome", level = 1,},
	["Jeder für sich"] = 	{race = "Human", level = 1,},
	["Schattenmimik"] = 	{race = "Night Elf", level = 1,},
	["Gabe der Naaru"] = 	{race = "Draenei", level = 1,},
	["Finstere Pfade"] = 	{race = "Worgen", level = 1,},
	["Zwei Gestalten"] = 	{race = "Worgen", level = 1,},
	["Wilde Hatz"] = 		{race = "Worgen", level = 1,},
	["Kochendes Blut"] = 	{race = "Orc", level = 1,},
	["Kriegsdonner"] = 		{race = "Tauren", level = 1,},
	["Berserker"] = 		{race = "Troll", level = 1,},
	["Wille der Verlassenen"] = {race = "Undead", level = 1,},
	["Kannibalismus"] = 	{race = "Undead", level = 1,},
	["Arkaner Strom"] = 	{race = "Blood Elf", level = 1,},
	["Raketensprung"] = 	{race = "Goblin", level = 1,},
	["Raketenbeschuss"] = 	{race = "Goblin", level = 1,},
	["Packhobgoblin"] = 	{race = "Goblin", level = 1,},
	["Bebende Handfläche"] = {race = "Pandaren", level = 1,},
 
--++ Death Knight Abilities ++
	["Frostatem"] = 			{ class = "DEATHKNIGHT", level = 1, },	--7
	["Leichenexplosion"] = 		{ class = "DEATHKNIGHT", level = 25, },	--7
	["Blutseuche"] = 			{ class = "DEATHKNIGHT", level = 55, }, 
	["Schwarzes Tor"] = 		{ class = "DEATHKNIGHT", level = 55, }, 
	["Todesgriff"] = 			{ class = "DEATHKNIGHT", level = 55, },
	["Todesstoß"] = 			{ class = "DEATHKNIGHT", level = 55, }, --7m  	
	["Frostfieber"] = 			{ class = "DEATHKNIGHT", level = 55, },	
	["Rune des schneidenden Eises"] = 		{ class = "DEATHKNIGHT", level = 55, },
	["Runenschmieden"] = 			{ class = "DEATHKNIGHT", level = 55, },  
	["Antimagische Hülle"] = 		{ class = "DEATHKNIGHT", level = 57, }, --7m
	["Dunkler Befehl"]  = 		{ class = "DEATHKNIGHT", level = 58, },	--7m
	["Der Tod reit'"] = 		{ class = "DEATHKNIGHT", level = 61, }, 
	["Gedankenfrost"] = 			{ class = "DEATHKNIGHT", level = 62, },  
	["Eisige Pfade"] = 		{ class = "DEATHKNIGHT", level = 66, }, 
	["Untote kontrollieren"] = 		{ class = "DEATHKNIGHT", level = 69, },  
	["Rune des gefallenen Kreuzfahrers"] = { class = "DEATHKNIGHT", level = 70, },	
 	["Verbündeten erwecken"] = 			{ class = "DEATHKNIGHT", level = 72, },
	["Rune des Steinhautgargoyles"] = { class = "DEATHKNIGHT", level = 72, },
--++ Death Knight Artifact Traits ++
	["Apokalypse"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n
	["Schwindsucht"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n
	["Sindragosas Furor"] = 	{ class = "DEATHKNIGHT", level = 100, }, --7n
--++ Death Knight Specialization ++
	--++ Blood/Frost/Unholy ++
 	["Gespensterwanderung"] = 			{ class = "DEATHKNIGHT", level = 60, }, --7n
	["Eisige Gegenwehr"] = 		{ class = "DEATHKNIGHT", level = 57, }, --7.2.5m	
	--++ Blood/Unholy ++	
	["Tod und Verfall"] = 		{ class = "DEATHKNIGHT", level = 56, }, --7m	
	--++ Frost/Unholy ++
	["Finsterer Beistand"] = 	{ class = "DEATHKNIGHT", level = 58, },	--7n
	["Eisketten"] = 			{ class = "DEATHKNIGHT", level = 63, }, --7m 	
	--++ Blood ++
--	["Ersticken"] = 			{ class = "DEATHKNIGHT", level = 1, }, --??	
	["Herzstoß"]  = 			{ class = "DEATHKNIGHT", level = 1, }, --7 
	["Markzerfetzer"]  = 		{ class = "DEATHKNIGHT", level = 55, }, --7n	
	["Siedendes Blut"] = 		{ class = "DEATHKNIGHT", level = 56, }, --7m
	["Tanzende Runenwaffe"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7m
	["Hand des Todes"] = 		{ class = "DEATHKNIGHT", level = 58, },	--7n	
	["Vampirblut"] = 			{ class = "DEATHKNIGHT", level = 60, },	--7.2.5m	
	["Veteran des Dritten Krieges"] = { class = "DEATHKNIGHT", level = 60, },
	["Scharlachrote Geißel"] = 		{ class = "DEATHKNIGHT", level = 84, },	
	["Blutschattens Griff"] = 	{ class = "DEATHKNIGHT", level = 64, }, --7m
--	["Ripsote"] = 				{ class = "DEATHKNIGHT", level = 76, }, --++ conflict	
	["Blutschild"] = 			{ class = "DEATHKNIGHT", level = 78, },
	--++ Frost ++ 
	["Runenauffrischung"] = 	{ class = "DEATHKNIGHT", level = 1, }, --7m??
	["Frostfieber"] = 			{ class = "DEATHKNIGHT", level = 55, },	--7n	
	["Froststoß"] = 			{ class = "DEATHKNIGHT", level = 55, },	  
	["Heulende Böe"] = 		{ class = "DEATHKNIGHT", level = 55, },	  
	["Auslöschen"] = 			{ class = "DEATHKNIGHT", level = 55, },	  
	["Tötungsmaschine"] = 		{ class = "DEATHKNIGHT", level = 56, },	  
 	["Runenwaffe verstärken"] = 	{ class = "DEATHKNIGHT", level = 57, },	--7n
	["Säule des Frosts"] = 		{ class = "DEATHKNIGHT", level = 57, },	
	["Raureif"] = 					{ class = "DEATHKNIGHT", level = 59, },
	["Gefrorenes Herz"] = 			{ class = "DEATHKNIGHT", level = 78, },	
	--++ Unholy ++  
	["Schwärende Wunde"] = 		{ class = "DEATHKNIGHT", level = 1, }, --7n	
	["Runenverderbnis"] = 		{ class = "DEATHKNIGHT", level = 1, }, --7m??	
	["Todesmantel"] = 			{ class = "DEATHKNIGHT", level = 55, }, --7m 
--	["Unaufhaltsamer Tod"] = 		{ class = "DEATHKNIGHT", level = 55, },	--7 Hotfix removed
	["Schwärender Stoß"] = 		{ class = "DEATHKNIGHT", level = 55, },
	["Ausbruch"] = 				{ class = "DEATHKNIGHT", level = 55, }, --7m	
	["Totenerweckung"] = 			{ class = "DEATHKNIGHT", level = 55, }, --7m
	["Geißelstoß"] = 		{ class = "DEATHKNIGHT", level = 55, },
	["Hereinbrechende Verdammnis"] = 			{ class = "DEATHKNIGHT", level = 64, },
	["Dunkle Transformation"] = 	{ class = "DEATHKNIGHT", level = 74, },	  
	["Gargoyle beschwören"] = 		{ class = "DEATHKNIGHT", level = 75, },	  
	["Schreckensklinge"] = 			{ class = "DEATHKNIGHT", level = 78, },
	["Armee der Toten"] = 		{ class = "DEATHKNIGHT", level = 82, }, --7m	
--++ Death Knight Talents ++
	--++ Blood ++
	["Bluttrinker"] = 			{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Blutwürmer"] = 			{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Herzbrecher"] = 			{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Schnelle Verwesung"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7n
--	["Seelensättigung"] = 			{ class = "DEATHKNIGHT", level = 57, }, --7n
	["Herz aus Eis"] = 			{ class = "DEATHKNIGHT", level = 57, }, --7.2.5n
	["Spektrale Abwehr"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7n
	["Antimagische Barriere"] = 	{ class = "DEATHKNIGHT", level = 58, }, --7n	
	["Blutwandlung"] = 			{ class = "DEATHKNIGHT", level = 58, }, --7m
	["Ossuarium"] = 				{ class = "DEATHKNIGHT", level = 58, }, --7n
	["Mal des Blutes"] = 		{ class = "DEATHKNIGHT", level = 60, }, --7n	
	["Roter Durst"] = 			{ class = "DEATHKNIGHT", level = 60, }, --7n	
	["Grabstein"] = 			{ class = "DEATHKNIGHT", level = 60, }, --7n	
	["Marsch der Verdammten"] = 	{ class = "DEATHKNIGHT", level = 75, }, --7n	
	["Enger Griff"] = 		{ class = "DEATHKNIGHT", level = 75, }, --7n	
	["Erzittert"] = 	{ class = "DEATHKNIGHT", level = 75, }, --7n	
	["Übles Bollwerk"] = 			{ class = "DEATHKNIGHT", level = 90, }, --7n	
	["Runenwandlung"] = 				{ class = "DEATHKNIGHT", level = 90, },	--7m
 	["Wille der Nekropole"] = { class = "DEATHKNIGHT", level = 90, }, --7m	
 	["Blutspiegel"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n
 	["Knochensturm"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n	
 	["Fegefeuer"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7m	
	--++ Frost ++ 
	["Eisige Klauen"] = 		{ class = "DEATHKNIGHT", level = 56, },	--7m	
	["Runischer Kreislauf"] = 	{ class = "DEATHKNIGHT", level = 56, }, --7.3m	
	["Zerschmetternde Stöße"] = { class = "DEATHKNIGHT", level = 56, }, --7n
	["Gefrierender Nebel"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7n
	["Horn des Winters"] = 		{ class = "DEATHKNIGHT", level = 57, }, --7m
	["Mörderische Effizienz"] = { class = "DEATHKNIGHT", level = 57, }, --7.3m	
	["Lawine"] = 				{ class = "DEATHKNIGHT", level = 58, }, --7n
	["Unaufhaltbarer Gletscher"] = { class = "DEATHKNIGHT", level = 58, }, --7.3m	
	["Eiskappe"] = 				{ class = "DEATHKNIGHT", level = 58, }, --7n
	["Stärke der Monstrosität"] = { class = "DEATHKNIGHT", level = 60, }, --7n
	["Blendender Eisregen"] = 	{ class = "DEATHKNIGHT", level = 60, }, --7n
	["Der Winter naht"] = 		{ class = "DEATHKNIGHT", level = 60, }, --7n
	["Erbarmungsloser Angriff"] = { class = "DEATHKNIGHT", level = 75, }, --7.3n	
	["Permafrost"] = 			{ class = "DEATHKNIGHT", level = 75, }, --7n
--	["Antimagische Rückkopplung"] = { class = "DEATHKNIGHT", level = 75, }, --7.3m
	["Weißer Wanderer"] = 		{ class = "DEATHKNIGHT", level = 75, }, --7n
	["Frostsichel"] = 			{ class = "DEATHKNIGHT", level = 90, }, --7n	
	["Gefrorener Impuls"] = 	{ class = "DEATHKNIGHT", level = 90, }, --7.3m	
	["Aufziehender Sturm"] = 	{ class = "DEATHKNIGHT", level = 90, }, --7n
	["Sindragosas Hauch"]=		{ class = "DEATHKNIGHT", level = 100, }, --7m
	["Hungernde Runenwaffe"] = 	{ class = "DEATHKNIGHT", level = 100, }, --7.3m		
	["Auslöschung"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n		
	--++ Unholy ++ 
	["Alle werden dienen"] =		{ class = "DEATHKNIGHT", level = 56, },--7n
	["Platzende Geschwüre"] =		{ class = "DEATHKNIGHT", level = 56, },--7n	
	["Schwarzes Fieber"] =			{ class = "DEATHKNIGHT", level = 56, },--7n	
	["Verseuchte Runenwaffe"] =	{ class = "DEATHKNIGHT", level = 57, },--7n	
	["Epidemie"] =			 	{ class = "DEATHKNIGHT", level = 57, },--7n	
	["Pestilenzpusteln"] =	{ class = "DEATHKNIGHT", level = 57, },--7n	
	["Züchtiger"] =			{ class = "DEATHKNIGHT", level = 58, },--7n	
	["Reißende Schatten"] =		{ class = "DEATHKNIGHT", level = 58, },--7n	
	["Unheilige Raserei"] = 		{ class = "DEATHKNIGHT", level = 58, },	--7m 
	["Ersticken"] = 			{ class = "DEATHKNIGHT", level = 60, },
	["Schwächende Verseuchung"] = { class = "DEATHKNIGHT", level = 60, },--7n
	["Schlickspucker"] =		{ class = "DEATHKNIGHT", level = 60, },--7n
	["Leichenschild"] =			{ class = "DEATHKNIGHT", level = 75, },--7n
	["Anhaltender Spuk"] =	{ class = "DEATHKNIGHT", level = 75, },--7n
	["Zauberfresser"] =			{ class = "DEATHKNIGHT", level = 75, },--7n
	["Infizierte Klauen"] =		{ class = "DEATHKNIGHT", level = 90, },--7n	
	["Nekrose"] = 				{ class = "DEATHKNIGHT", level = 90, },	--7m
	["Schattenmacht"] =		{ class = "DEATHKNIGHT", level = 90, },--7n	
	["Dunkle Richterin"] =			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Entweihen"] =			 	{ class = "DEATHKNIGHT", level = 100, },--7m
	["Seelenernter"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7m	
--++ Death Knight PvP Talents
	["Strangulieren"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Antimagisches Feld"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Dunkles Simulakrum"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Zersetzungsaura"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Wandernde Seuche"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Todeskette"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Tötungsmaschine"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Kettenunterkühlung"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Zombie erschaffen"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Nekrotischer Stoß"]=			{ class = "DEATHKNIGHT", level = 100, },--7n

--++ Demon Hunter Abilities ++
--	["Kritische Treffer"]=		{ class = "DEMONHUNTER", level = 98, }, Conflict
--	["Parieren"]=					{ class = "DEMONHUNTER", level = 98, }, Conflict
	["Chaosstoß"]=			{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Magie aufzehren"]=			{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Dämonenbiss"]=			{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Doppelsprung"]=			{ class = "DEMONHUNTER", level = 98, }, --7n+
--	["Energieregeneration"]=			{ class = "DEMONHUNTER", level = 98, }, --7n??
	["Augenstrahl"]=				{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Teufelsrausch"]=				{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Gleiten"]=					{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Geistersicht"]=			{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Gleve werfen"]=			{ class = "DEMONHUNTER", level = 98, }, --7n+
	["Metamorphose"]=			{ class = "DEMONHUNTER", level = 99, }, --7n+	
	["Annihilation"]=			{ class = "DEMONHUNTER", level = 99, }, --7n+  ??
	["Klingentanz"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Verschwimmen"]=					{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Chaosnova"]=				{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Dunkelheit"]=				{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Death Sweep"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+	??
	["Einkerkern"]=				{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Rachsüchtiger Rückzug"]=	{ class = "DEMONHUNTER", level = 100, }, --7n+
--++ Demon Hunter Artifact Traits ++
	["Zorn der Illidari"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
	["Seelenschnitzer"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
--++ Demon Hunter Specialization ++
	--++ Havoc/Vengeance ++	
	["Zerschmetterte Seelen"]=		{ class = "DEMONHUNTER", level = 98, }, --7n+
	--++ Havoc ++	
	["Dämonische Präsenz"]= 		{ class = "DEMONHUNTER", level = 98, }, --7n+
	--++ Vengeance ++	
	["Feuerbrandaura"]=		{ class = "DEMONHUNTER", level = 100, }, --7n+
--	["Erhöhte Bedrohung"]=		{ class = "DEMONHUNTER", level = 98, }, --7n ??
	["Infernoeinschlag"]=		{ class = "DEMONHUNTER", level = 100, }, --7n+
--	["Schmerz"]=					{ class = "DEMONHUNTER", level = 98, }, --7n ??
	["Folter"]=				{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Dämonenstachel"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Dämonischer Schutz"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Flammendes Brandmal"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Dämonenblut"]=	  			{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Abscheren"]=					{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Zeichen der Flamme"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+
	["Seelenspalter"]=			{ class = "DEMONHUNTER", level = 100, }, --7n+
--	["Riposte"]=				{ class = "DEMONHUNTER", level = 100, }, --7n+ Conflict
--	["Zeichen der Ketten"]=		{ class = "DEMONHUNTER", level = 100, }, --7n  ??
 	["Zeichen der Stille"]=		{ class = "DEMONHUNTER", level = 101, },  --7.1c 
	["Zauberschutze aufladen"]=			{ class = "DEMONHUNTER", level = 103, }, --7.1c 	
	["Zeichen des Elends"]=		{ class = "DEMONHUNTER", level = 105, }, --7.1c 	
	--++ Demon Hunter Talents ++
	["Seelenreißer"]=			{ class = "DEMONHUNTER", level = 104, },  --7n
	["Teufelseruption"]=			{ class = "DEMONHUNTER", level = 106, }, --7n
	--++ Havoc ++	
	["Blinder Jähzorn"]=				{ class = "DEMONHUNTER", level = 99, }, --7n 
	["Teufelsklinge"]=			{ class = "DEMONHUNTER", level = 99, }, --7.1.5m	
	["Chaosspalten"]=			{ class = "DEMONHUNTER", level = 102, }, --7.1.5c 
	["Teufelsmeisterschaft"]=			{ class = "DEMONHUNTER", level = 99, }, --7n 
	["Dämonenklingen"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Dämonischer Appetit"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
	["Vorbereitet"]=				{ class = "DEMONHUNTER", level = 100, }, --7n
	["Aderlass"]=				{ class = "DEMONHUNTER", level = 102, }, --7n
	["Erstes Blutvergießen"]=			{ class = "DEMONHUNTER", level = 102, }, --7n
	["Notinstinkte"]=	{ class = "DEMONHUNTER", level = 104, }, --7n
	["Netherwandeln"]=				{ class = "DEMONHUNTER", level = 104, }, --7n
	["Eifer des Gefechts"]=				{ class = "DEMONHUNTER", level = 106, }, --7n
	["Nemesis"]=				{ class = "DEMONHUNTER", level = 106, }, --7n
	["Glevenmeister"]=	{ class = "DEMONHUNTER", level = 108, }, --7n
	["Dämonische Wiedergeburt"]=			{ class = "DEMONHUNTER", level = 108, }, --7n
	["Entfesselte Macht"]=		{ class = "DEMONHUNTER", level = 108, }, --7n
	["Chaosklingen"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
	["Dämonisch"]=				{ class = "DEMONHUNTER", level = 110, }, --7n
	["Teufelsbeschuss"]=			{ class = "DEMONHUNTER", level = 110, },--7n
	--++ Vengeance ++
	["Abyssischer Schlag"]=			{ class = "DEMONHUNTER", level = 99, }, --7n
	["Peinigende Flammen"]=		{ class = "DEMONHUNTER", level = 99, }, --7n
	["Klingenstacheln"]=			{ class = "DEMONHUNTER", level = 99, }, --7n
	["Lebendig verbrannt"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Kollateralschaden"]=				{ class = "DEMONHUNTER", level = 100, }, --7n
	["Festmahl der Seelen"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Flammenschlag"]=			{ class = "DEMONHUNTER", level = 102, }, --7n
	["Maßlosigkeit"]=				{ class = "DEMONHUNTER", level = 102, }, --7n
	["Den Dämon füttern"]=			{ class = "DEMONHUNTER", level = 104, }, --7n
	["Fraktur"]=				{ class = "DEMONHUNTER", level = 104, }, --7n
 	["Konzentrierte Zeichen"]=	{ class = "DEMONHUNTER", level = 106, }, --7n
	["Beschleunigte Zeichen"]=		{ class = "DEMONHUNTER", level = 106, }, --7n
	["Klingenparade"]=			{ class = "DEMONHUNTER", level = 108, }, --7n
	["Dämonische Verwüstung"]=		{ class = "DEMONHUNTER", level = 108, }, --7n
	["Seelenbombe"]=			{ class = "DEMONHUNTER", level = 108, }, --7n
	["Dämonische Infusion"]=		{ class = "DEMONHUNTER", level = 108, }, --7.1.5n	
	["Verzweiflungstat"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
--	["Netherbindung"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
	["Seelenbarriere"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
--++ Demon Hunter PvP Talents ++
	["Manabrecher"]=				{ class = "DEMONHUNTER", level = 110, }, --7n
	["Magie umkehren"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
	["Dämonisches Trampeln"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Illidans Griff"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Auge von Leotheras"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Teuflischer Niederschlag"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Manariss"]=				{ class = "DEMONHUNTER", level = 110, }, --7.1.5n
	
--++ Druid Abilities ++
	["Katzengestalt"] = 				{ class = "DRUID", level = 1, },
--	["Humanoide aufspüren"] = 		{ class = "DRUID", level = 1, }, 7 Conflict
	["Katzenhafte Anmut"] = 			{ class = "DRUID", level = 6, },
	["Bärengestalt"] = 			{ class = "DRUID", level = 8, },
	["Freizaubern"] =	 		{ class = "DRUID", level = 10, },
	["Mondfeuer"] = 				{ class = "DRUID", level = 10, },
	["Knurren"] = 				{ class = "DRUID", level = 13, },
	["Traumwanderung"] = 			{ class = "DRUID", level = 14, }, --7n
	["Wiederbeleben"] = 				{ class = "DRUID", level = 14, },
	["Teleport: Mondlichtung"] = 	{ class = "DRUID", level = 14, },
	["Reisegestalt"] = 			{ class = "DRUID", level = 18, },
	["Sonnenfeuer"] = 				{ class = "DRUID", level = 18, },--7m??
	["Hauen"] = 		 		{ class = "DRUID", level = 18, }, --7??
	["Wucherwurzeln"] = 		{ class = "DRUID", level = 10, }, 
--	["Spurt"] = 					{ class = "DRUID", level = 24, }, 7 Conflict
	["Freund des Waldes"] = { class = "DRUID", level = 40, },	--7m
	["Flattern"] = 					{ class = "DRUID", level = 40, }, --7n	
	["Hirschgestalt"] = 			{ class = "DRUID", level = 40, }, --7n	
--	["Wildtiere aufspüren"] = 			{ class = "DRUID", level = 40, }, 7 Conflict	
	["Wiedergeburt"] = 				{ class = "DRUID", level = 56, },
	["Fluggestalt"] = 			{ class = "DRUID", level = 58, },
--++ Druid Artifact Traits ++
	["Ashamanes Raserei"] = 	{ class = "DRUID", level = 100, }, --7n	
	["Essenz von G'Hanir"] = 	{ class = "DRUID", level = 100, }, --7n	
	["Neumond"] = 				{ class = "DRUID", level = 100, }, --7n		
	["Zorn des Schläfers"] = 	{ class = "DRUID", level = 100, }, --7n	
--++ Druid Specialization ++
	--++ Balance/Feral/Guardian/Restoration ++
	["Schleichen"] = 				{ class = "DRUID", level = 5, }, --7m
	--++ Balance/Restoration ++
	["Anregen"] = 			{ class = "DRUID", level = 54, }, --7m	
	--++ Balance/Feral/Guardian ++
	["Nachwachsen"] = 				{ class = "DRUID", level = 5, }, --7.1n
	["Verderbnis entfernen"] = 	{ class = "DRUID", level = 18, },
	--++ Balance/Guardian/Restoration ++
	["Baumrinde"] = 				{ class = "DRUID", level = 36, }, --x Moved
	--++ Feral/Guardian ++
--	["Kritische Treffer"] = 		{ class = "DRUID", level = 1, }, --7m Conflict
	["Beschützerinstinkt"] = 	{ class = "DRUID", level = 10, },
	["Prankenhieb"] = 				{ class = "DRUID", level = 32, }, --7m
	["Überlebensinstinkte"] = 	{ class = "DRUID", level = 40, },
	["Schädelstoß"] = 			{ class = "DRUID", level = 64, },
	["Anstachelndes Gebrüll"] = 		{ class = "DRUID", level = 83, }, --7m	
	--++ Balance ++
	["Astraler Einfluss"] = 		{ class = "DRUID", level = 10, }, --7n	
	["Solarzorn"] = 			{ class = "DRUID", level = 10, }, --7n	??
	["Sternensog"] = 			{ class = "DRUID", level = 12, },
	["Lunarschlag"] = 			{ class = "DRUID", level = 12, }, --7n
	["Mondkingestalt"] = 			{ class = "DRUID", level = 16, },
	["Sonnenstrahl"] = 			{ class = "DRUID", level = 28, },
	["Sternenregen"] = 				{ class = "DRUID", level = 76, },
	["Himmlische Ausrichtung"] = 	{ class = "DRUID", level = 64, },	
	["Sternenlicht"] = 			{ class = "DRUID", level = 78, }, --7n
	--++ Feral ++
	["Schreddern"] = 				{ class = "DRUID", level = 1, },
	["Wilder Biss"] = 		{ class = "DRUID", level = 6, }, --7m	
	["Krallenhieb"] = 					{ class = "DRUID", level = 6, }, 	
	["Schnelligkeit der Wildnis"] = 		{ class = "DRUID", level = 10, }, --7m
	["Tigerfuror"] = 			{ class = "DRUID", level = 12, },
	["Zerfetzen"] = 					{ class = "DRUID", level = 20, }, 
	["Schnelligkeit des Raubtiers"] = 	{ class = "DRUID", level = 28, },
	["Omen der Klarsicht"] = 		{ class = "DRUID", level = 38, }, --7m ??
	["Infizierte Wunden"] = 		{ class = "DRUID", level = 40, }, --7m	
	["Berserker"] = 				{ class = "DRUID", level = 48, }, --7m
	["Zerfleddern"] = 					{ class = "DRUID", level = 72, }, 
	["Rasiermesserscharfe Krallen"] = 			{ class = "DRUID", level = 78, },
	--++ Guardian ++ 
	["Zerfleischen"] = 				{ class = "DRUID", level = 6, }, --7m
	["Zermalmen"] = 					{ class = "DRUID", level = 10, }, --x Moved
	["Dickes Fell"] = 			{ class = "DRUID", level = 10, }, 
	["Erschütterndes Gebrüll"] = 	{ class = "DRUID", level = 28, }, --7n	
	["Aufspießen"] = 					{ class = "DRUID", level = 34, }, --7n
	["Eisenfell"] = 				{ class = "DRUID", level = 44, }, --7n	
	["Rasende Regeneration"] = { class = "DRUID", level = 50, }, --7m
	["Mal von Ursol"] = 		{ class = "DRUID", level = 72, }, --7n	
	["Wächter der Natur"] = 	{ class = "DRUID", level = 78, }, 
	--++ Restoration ++  
	["Verjüngung"] = 			{ class = "DRUID", level = 12, }, --7m
	["Rasche Heilung"] = 			{ class = "DRUID", level = 12, }, 
	["Heilung der Natur"] = 		{ class = "DRUID", level = 18, },
	["Heilende Berührung"] = 		{ class = "DRUID", level = 26, }, --7.1m	
	["Samenkorn des Lebens"] = 			{ class = "DRUID", level = 28, },
	["Blühendes Leben"] = 			{ class = "DRUID", level = 32, },
	["Revitalisieren"] = 			{ class = "DRUID", level = 44, }, --7n	
	["Ursols Vortex"] = 		{ class = "DRUID", level = 48, }, --7m	
	["Eisenborke"] = 				{ class = "DRUID", level = 52, },
	["Wildwuchs"] = 			{ class = "DRUID", level = 64, },
	["Gelassenheit"] = 			{ class = "DRUID", level = 72, },
	["Harmonie"] = 				{ class = "DRUID", level = 78, },
	["Erblühen"] = 		{ class = "DRUID", level = 82, }, --7n	
	--++ Druid Talents ++
	["Wilde Attacke"] = 			{ class = "DRUID", level = 15, }, 
	["Massenumschlingung"] = 	{ class = "DRUID", level = 60, }, 
	["Mächtiger Hieb"] = 			{ class = "DRUID", level = 60, }, 
	["Taifun"] = 				{ class = "DRUID", level = 60, }, 	
	--++ Balance/Feral/Restoration ++
	["Wächteraffinität"] = 	{ class = "DRUID", level = 45, }, --7n ??
	["Phasenbestie"] = 		{ class = "DRUID", level = 30, }, 	
	--++ Balance/Feral/Guardian ++
	["Erneuerung"] = 				{ class = "DRUID", level = 30, },
	["Wiederherstellungsaffinität"] = 	{ class = "DRUID", level = 45, }, --7n
	["Seele des Waldes"] = 	{ class = "DRUID", level = 75, }, --??
	--++ Feral/Guardian ++
	["Gleichgewichtsaffinität"] = 		{ class = "DRUID", level = 45, }, --7n
	["Wildheitsaffinität"] = 		{ class = "DRUID", level = 45, }, --7n	
	--++ Balance ++	
	["Naturgewalt"] = 		{ class = "DRUID", level = 15, },
	["Sternenlord"] = 				{ class = "DRUID", level = 15, }, --7n
	["Krieger der Elune"] = 		{ class = "DRUID", level = 15, }, --7n
	["Inkarnation: Erwählter der Elune"] = { class = "DRUID", level = 75, }, --7n
	["Sterneneruption"] =		 	{ class = "DRUID", level = 75, }, 
	["Astrale Vereinigung"] = 		{ class = "DRUID", level = 90, }, --7m
	["Segen der Urtume"] = { class = "DRUID", level = 90, }, --7n
	["Sternschnuppen"] = 		{ class = "DRUID", level = 90, }, --7m
	["Zorn der Elune"] = 		{ class = "DRUID", level = 100, }, --7n
	["Gleichgewicht der Natur"] = 		{ class = "DRUID", level = 100, }, --7n
	["Stellarverschiebung"] = 		{ class = "DRUID", level = 100, }, --7n
	--++ Feral ++
	["Blut geleckt"] =			{ class = "DRUID", level = 15, }, --7n	
	["Mondinspiration"] =		{ class = "DRUID", level = 15, }, 	
	["Raubtier"] =				{ class = "DRUID", level = 15, }, --7n
	["Inkarnation: König des Dschungels"] = { class = "DRUID", level = 75, }, --7n
	["Reißwunden"] = 			{ class = "DRUID", level = 75, }, --7.3m	
	["Brutales Schlitzen"] = 	{ class = "DRUID", level = 90, }, --7.3m
	["Säbelzahn"] = 			{ class = "DRUID", level = 90, }, --7n
	["Wildes Brüllen"] = 		{ class = "DRUID", level = 90, }, --7.3m		
	["Blutkrallen"] = 			{ class = "DRUID", level = 100, }, 
	["Elunes Führung"] = 		{ class = "DRUID", level = 100, }, --7.3m
	--++ Guardian ++	
	["Blutraserei"] = 			{ class = "DRUID", level = 15, }, --7n	
	["Dornenranken"] = 				{ class = "DRUID", level = 15, }, --7n	
	["Gesträubtes Fell"] = 		{ class = "DRUID", level = 15, }, 
	["Kehlgebrüll"] = 		{ class = "DRUID", level = 30, }, --7n	
	["Einschüchterndes Gebrüll"] = 	{ class = "DRUID", level = 30, }, --7.1.5n	
	["Galaktischer Wächter"] = 	{ class = "DRUID", level = 75, }, --7n	
	["Inkarnation: Wächter von Ursoc"] = { class = "DRUID", level = 75, }, --7n
	["Erdenwächter"] = 			{ class = "DRUID", level = 90, }, --7n	
	["Wächter von Elune"] =	 	{ class = "DRUID", level = 90, }, 
	["Überleben des Stärkeren"] = { class = "DRUID", level = 90, }, --7m
	["Mondstrahl"] = 			{ class = "DRUID", level = 100, }, --7n	
	["Pulverisieren"] = 			{ class = "DRUID", level = 100, }, 
	["Beißen und Reißen"] = 		{ class = "DRUID", level = 100, }, --7n		
	--++ Restoration ++
	["Überfluss"] = 			{ class = "DRUID", level = 15, }, --7n	
	["Cenarischer Zauberschutz"] = 		{ class = "DRUID", level = 15, },
	["Üppigkeit"] = 			{ class = "DRUID", level = 15, }, --7n
	["Grüner Daumen"] = 			{ class = "DRUID", level = 75, }, --7n
	["Inkarnation: Baum des Lebens"] = { class = "DRUID", level = 75, }, --7n
	["Verschmelzung"] = 			{ class = "DRUID", level = 90, }, --7n	
	["Innerer Friede"] = 			{ class = "DRUID", level = 90, }, --7n
	["Frühlingsblüten"] = 		{ class = "DRUID", level = 90, }, --7n
	["Gedeihen"] = 				{ class = "DRUID", level = 100, }, --7n
	["Steinrinde"] = 			{ class = "DRUID", level = 100, }, --7n
	["Moment der Klarsicht"] =	 	{ class = "DRUID", level = 100, }, --7.`.5m	
--++ Druid PvP Talents ++
	["Wirbelsturm"] =				{ class = "DRUID", level = 100, }, --7n
--	["Demoralisierendes Gebrüll"] =		{ class = "DRUID", level = 100, }, --7n
--	["Rasendes Zerfleischen"] =		{ class = "DRUID", level = 100, }, --7.1.5r
	["Überrennen"] =				{ class = "DRUID", level = 100, }, --7n
--	["Fokussiertes Wachstum"] =		{ class = "DRUID", level = 100, }, --7n
	["Wildes Wachstum"] =			{ class = "DRUID", level = 100, }, --7n
	["Dornen"] =				{ class = "DRUID", level = 100, }, --7n
	["Feenschwarm"] =			{ class = "DRUID", level = 100, }, --7n
	["Dornen"] =				{ class = "DRUID", level = 100, }, --7.1.5n
	["Rasendes Zerfleddern"] =	{ class = "DRUID", level = 100, }, --7.1.5n
	
--++ Hunter Abilities ++
	["Begleiter 1 rufen"] = 			{ class = "HUNTER", level = 1, },
	["Im Visier"] = 			{ class = "HUNTER", level = 1, }, --7n	
	["Tier heilen"] = 				{ class = "HUNTER", level = 1, },	
	["Tier wiederbeleben"] = 			{ class = "HUNTER", level = 1, },
	["Aspekt des Geparden"] = { class = "HUNTER", level = 5, },
	["Begleiter 2 rufen"] = 			{ class = "HUNTER", level = 10 },
	["Begleiter kontrollieren"] = 			{ class = "HUNTER", level = 10, },	
	["Begleiter freigeben"] = 			{ class = "HUNTER", level = 10, },
	["Wildtier zähmen"] = 			{ class = "HUNTER", level = 10, },
	["Tier füttern"] = 				{ class = "HUNTER", level = 11, },
	["Wildtierkunde"] = 			{ class = "HUNTER", level = 12, },	
	["Adlerauge"] = 			{ class = "HUNTER", level = 16, },
	["Totstellen"] = 			{ class = "HUNTER", level = 32, },
	["Aufwachen"] = 				{ class = "HUNTER", level = 32, }, --7n	
	["Begleiter 3 rufen"] = 			{ class = "HUNTER", level = 42, },	
	["Leuchtfeuer"] = 				{ class = "HUNTER", level = 38, },
	["Aspekt des Chamäleons"] = { class = "HUNTER", level = 40, }, --7n
	["Hol' die Beute!"] = 				{ class = "HUNTER", level = 40, }, 
	["Feuerwerk"] = 			{ class = "HUNTER", level = 40, }, 	
	["Totstellen"] = 			{ class = "HUNTER", level = 40, }, --7n		
	["Aspekt der Schildkröte"] = 	{ class = "HUNTER", level = 50, }, 	--7n	
	["Begleiter 4 rufen"] = 			{ class = "HUNTER", level = 62, },
	["Begleiter 5 rufen"] = 			{ class = "HUNTER", level = 82, },
--++ Hunter Artifact Traits ++
	["Zorn des Adlers"] = 	{ class = "HUNTER", level = 100, }, --7n
	["Titanendonner"] = 		{ class = "HUNTER", level = 100, }, --7n
	["Windstoß"] = 			{ class = "HUNTER", level = 100, }, --7n
--++ Hunter Specialization ++
	--++ Beast Mastery/Marksmanship ++
	["Erschütternder Schuss"] = 		{ class = "HUNTER", level = 8, }, --7m	
	["Rückzug"] = 				{ class = "HUNTER", level = 45, }, --7.1.5c	
	["Gegenschuss"] = 			{ class = "HUNTER", level = 24, }, --7m
	["Mehrfachschuss"] = 			{ class = "HUNTER", level = 28, }, --7m
	["Irreführung"] = 			{ class = "HUNTER", level = 42, }, --7m
	--++ Beast Mastery/Marksmanship/Survival ++
	["Eiskältefalle"] = 		{ class = "HUNTER", level = 28, }, --7.1.5m	
	["Freudentaumel"] = 			{ class = "HUNTER", level = 36, }, --7m ??
	["Teerfalle"] = 				{ class = "HUNTER", level = 36, }, --7.1.5m
	--++ Beast Mastery ++
	["Kobraschuss"] = 			{ class = "HUNTER", level = 1, },	
	["Tötungsbefehl"] = 			{ class = "HUNTER", level = 3, },
	["Alphatier"] = 			{ class = "HUNTER", level = 10, }, --7mm
	["Exotenzähmer"] = 		{ class = "HUNTER", level = 10, },	
	["Aspekt der Wildnis"] = 	{ class = "HUNTER", level = 18, }, --7n
	["Wilder Ruf"] = 			{ class = "HUNTER", level = 22, }, --7n
	["Raubtierhiebe"] = 			{ class = "HUNTER", level = 29, },
	["Zorn des Wildtiers"] = 		{ class = "HUNTER", level = 40, },
	["Seelenverwandtschaft"] = 		{ class = "HUNTER", level = 44, },
	["Herr der Tiere"] = 		{ class = "HUNTER", level = 78, },
	--++ Marksmanship ++ 
	["Gezielter Schuss"] = 			{ class = "HUNTER", level = 10, },
	["Arkaner Schuss"] = 			{ class = "HUNTER", level = 10 }, --7m
	["Mal des Jägers"] = 		{ class = "HUNTER", level = 18, }, --7m
	["Im Visier"] = 			{ class = "HUNTER", level = 18, }, --7n	
	["Stoßfeuer"] = 		{ class = "HUNTER", level = 22, }, --7n		
	["Jagdtrupp"] = 		{ class = "HUNTER", level = 34, }, --7n
	["Volltreffer"] = 				{ class = "HUNTER", level = 39, }, --7n
	["Fokus des Schützen"] = 		{ class = "HUNTER", level = 44, }, --7.1.5n	
	["Bombardement"] = 			{ class = "HUNTER", level = 62, },
	["Heckenschützentraining"] = 		{ class = "HUNTER", level = 78, }, 
	--++ Survival ++  
	["Flankenangriff"] = 		{ class = "HUNTER", level = 10, }, --7n
	["Raptorstoß"] = 		{ class = "HUNTER", level = 10, }, --7n	
	["Zurechtstutzen"] = 			{ class = "HUNTER", level = 10, }, --7n	
	["Überlebenskünstler"] = 			{ class = "HUNTER", level = 16, }, --7.1.5n	
	["Mungobiss"] = 		{ class = "HUNTER", level = 18, }, --7n	
	["Kriegsbeilwurf"] = 			{ class = "HUNTER", level = 19, }, --7n	
	["Harpune"] = 				{ class = "HUNTER", level = 22, }, --7n	
	["Maulkorb"] = 				{ class = "HUNTER", level = 24, }, --7n
	["Aufschlitzen"] = 				{ class = "HUNTER", level = 26, }, --7	
	["Aspekt des Adlers"] = 	{ class = "HUNTER", level = 44, }, --7n	
	["Sprengfalle"] = 		{ class = "HUNTER", level = 48, }, --7m	
	["Zerlegen"] = 				{ class = "HUNTER", level = 54, }, --7n	
	["Jagdbegleiter"] = 	{ class = "HUNTER", level = 90, }, --7n
--++ Hunter Talents ++
	["Bahnbrecher"] = 			{ class = "HUNTER", level = 45, }, --7.1n
	["Impromptu"] = 			{ class = "HUNTER", level = 45, },
	--++ Beast Mastery/Marksmanship/Survival ++
	["Die Vögel"] = 	{ class = "HUNTER", level = 90, }, --??
	--++ Beast Mastery/Marksmanship ++
	["Weitschreiter"] = 			{ class = "HUNTER", level = 45, }, --7.1.5c 	
	["Bindender Schuss"] = 			{ class = "HUNTER", level = 75, }, 
	["Wyverngift"] = 			{ class = "HUNTER", level = 75, },	
	["Sperrfeuer"] = 				{ class = "HUNTER", level = 90, },
	["Salve"] = 				{ class = "HUNTER", level = 90, },	--7n
	--++ Beast Mastery/Survival ++
	["Aspect of the Beast"] = 	{ class = "HUNTER", level = 100, }, --7m
	--++ Marksmanship/Survival ++
	["Camouflage"] = 			{ class = "HUNTER", level = 75, }, --7m	
	--++ Beast Mastery ++	
	["Großwildjäger"] = 		{ class = "HUNTER", level = 15, }, --7n		
	["Alpharudel"] = 			{ class = "HUNTER", level = 15, }, --7n	
	["Weg der Kobra"] = 		{ class = "HUNTER", level = 15, }, --7n		
	["Schimärenschuss"] = 		{ class = "HUNTER", level = 30, }, --7m
	["Alpharaserei"] = 			{ class = "HUNTER", level = 30, }, --7n	
	["Stampfen"] = 				{ class = "HUNTER", level = 30, }, --7n	
	["Furor des Wildtiers"] = 			{ class = "HUNTER", level = 60, }, --7n	
	["Blinzelstöße"] = 		{ class = "HUNTER", level = 60, },
	["Eins mit dem Rudel"] = 	{ class = "HUNTER", level = 60, }, --7n		
	["Einschüchterung"] = 			{ class = "HUNTER", level = 75, },	
	["Abgerichtete Kobra"] = 			{ class = "HUNTER", level = 100, }, --7n		
	["Stampede"] = 				{ class = "HUNTER", level = 100, }, --7m	
	--++ Marksmanship ++
	["Sorgfältiges Zielen"] = 			{ class = "HUNTER", level = 15, }, --7m	
	["Einsamer Wolf"] =		 		{ class = "HUNTER", level = 15, }, 	
	["Beständiger Fokus"] = 			{ class = "HUNTER", level = 15, }, --7m
	["Schwarzer Pfeil"] = 			{ class = "HUNTER", level = 30, }, --7m
	["Sichern und Laden"] = 		{ class = "HUNTER", level = 30, }, --7m
	["Zielsicherheit"] = 				{ class = "HUNTER", level = 30, }, --7n
	["Explosivschuss"] = 		{ class = "HUNTER", level = 60, }, --7m
	["Geduldiger Scharfschütze"] =		{ class = "HUNTER", level = 60, }, --7n
	["Wachsamer Schütze"] = 				{ class = "HUNTER", level = 60, }, --7n	
	["Stichschuss"] = 		{ class = "HUNTER", level = 100, }, --7m
	["Zielsuchgeschosse"] = 			{ class = "HUNTER", level = 100, }, --7n
	["Gekonnter Schuss"] = 			{ class = "HUNTER", level = 100, }, --7n	
	--++ Survival ++
	["Tierinstinkte"] = 		{ class = "HUNTER", level = 15, }, --7n	
	["Wurfäxte"] = 		{ class = "HUNTER", level = 15, }, --7n	
	["Weg der Mok'Nathal"] = { class = "HUNTER", level = 15, }, --7n	
	["Die Vögel"] = 	{ class = "HUNTER", level = 30, }, --7n
	["Trauma"] = 		{ class = "HUNTER", level = 30, }, --7n	
	["Schlangenjäger"] = 			{ class = "HUNTER", level = 30, }, --7n	
	["Krähenfüße"] = 				{ class = "HUNTER", level = 60, }, --7n	
	["Verbesserte Fallen"] = 		{ class = "HUNTER", level = 60, }, --7n	
	["Stahlfalle"] = 			{ class = "HUNTER", level = 60, }, --7n	
	["Waldläufernetz"] = 			{ class = "HUNTER", level = 75, }, --7n	
	["Haftbombe"] = 			{ class = "HUNTER", level = 75, }, --7n	
	["Schlachten"] = 				{ class = "HUNTER", level = 90, }, --7n		
	["Drachenfeuergranate"] = 	{ class = "HUNTER", level = 90, }, --7n	
	["Schlangengift"] = 		{ class = "HUNTER", level = 90, }, --7m	
	["Fallenexperte"] = 		{ class = "HUNTER", level = 100, }, --7n		
	["Speiende Kobra"] = 		{ class = "HUNTER", level = 100, }, --7n	
--++ Hunter PvP Talents ++
	["Ruf des Meisters"] = 		{ class = "HUNTER", level = 100, }, --7n
	["Spinnengift"] = 			{ class = "HUNTER", level = 100, }, --7n
	["Heckenschützenschuss"] = 	{ class = "HUNTER", level = 100, }, --7n
	["Ableiten"] = 				{ class = "HUNTER", level = 100, }, --7.2.5n
	["Alphatier: Basilisk"] = 	{ class = "HUNTER", level = 100, }, --7n
	["Alphatier: Falke"] = 		{ class = "HUNTER", level = 100, }, --7n
--	["Eiskalter Pfeil"] = 		{ class = "HUNTER", level = 100, }, --7.1.5r
	["Hochexplosivfalle"] = 	{ class = "HUNTER", level = 100, }, --7.1.5n
	["Netz des Fährtenlesers"] = 		{ class = "HUNTER", level = 100, }, --7n
	["Heilender Verband"] = 		{ class = "HUNTER", level = 100, }, --7n
	["Streuschuss"] = 			{ class = "HUNTER", level = 100, }, --7n

--++ Mage Abilities ++
	["Illusion"] = 				{ class = "MAGE", level = 1, }, --7n?? Honor
	["Frostnova"] = 			{ class = "MAGE", level = 3, },
	["Blinzeln"] = 				{ class = "MAGE", level = 7, },
	["Verwandlung"] = 			{ class = "MAGE", level = 18, },
	["Erfrischungen herbeizaubern"] = 	{ class = "MAGE", level = 22, },
	["Langsamer Fall"] = 			{ class = "MAGE", level = 32, },
	["Wasserstrahl"] = 			{ class = "MAGE", level = 32, }, --7n	
	["Gegenzauber"] = 			{ class = "MAGE", level = 34, },	
	["Eisblock"] = 				{ class = "MAGE", level = 50, }, --7.1.5m	
	["Arkaner Linguist"] = 		{ class = "MAGE", level = 58, }, --7n	
	["Zeitkrümmung"] = 			{ class = "MAGE", level = 65, },	
	["Zauberraub"] = 			{ class = "MAGE", level = 72, },
	["Portal: Darnassus"] = 	{ class = "MAGE", level = 42, },
	["Portal: Exodar"] = 		{ class = "MAGE", level = 42, },
	["Portal: Eisenschmiede"] = 	{ class = "MAGE", level = 42, },
	["Portal: Orgrimmar"] = 	{ class = "MAGE", level = 42, },
	["Portal: Silbermond"] = 	{ class = "MAGE", level = 42, },
	["Portal: Sturmwind"] = 	{ class = "MAGE", level = 42, },
	["Portal: Theramore"] = 	{ class = "MAGE", level = 42, },
	["Portal: Donnerfels"] =	{ class = "MAGE", level = 42, },
	["Portal: Unterstadt"] = 	{ class = "MAGE", level = 42, },	
	["Portal: Steinard"] = 		{ class = "MAGE", level = 52, },	
	["Portal: Shattrath"] = 	{ class = "MAGE", level = 66, },	
	["Altes Portal: Dalaran"] = { class = "MAGE", level = 74, }, 
	["Portal: Dalaran - Verheerte Inseln"] = { class = "MAGE", level = 74, }, --7n	
	["Portal: Dalaran - Nordend"] = { class = "MAGE", level = 74, }, --7n	
	["Portal: Tol Barad"] = 	{ class = "MAGE", level = 85, },
	["Portal: Tal der Ewigen Blüten"] = { class = "MAGE", level = 90, },
	["Portal: Sturmschild"] = 	{ class = "MAGE", level = 92, }, --7n	
	["Portal: Kriegsspeer"] = 	{ class = "MAGE", level = 92, }, --7n	
	["Teleport: Halle des Wächters"] = { class = "MAGE", level = 14, }, --7n
	["Teleport: Darnassus"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Exodar"] = 		{ class = "MAGE", level = 17, },
	["Teleport: Eisenschmiede"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Orgrimmar"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Silbermond"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Sturmwind"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Theramore"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Donnerfels"] = { class = "MAGE", level = 17, },
	["Teleport: Unterstadt"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Steinard"] = 	{ class = "MAGE", level = 52, },	
	["Teleport: Shattrath"] = 	{ class = "MAGE", level = 62, },
	["Alter Teleport: Dalaran"] = { class = "MAGE", level = 71, }, 
	["Teleport: Dalaran - Verheerte Inseln"] = 	{ class = "MAGE", level = 71, }, --7n
	["Teleport: Dalaran - Nordend"] = 	{ class = "MAGE", level = 71, }, --7n	
	["Teleport: Tol Barad"] = 	{ class = "MAGE", level = 85, },
	["Teleport: Tal der Ewigen Blüten"] = { class = "MAGE", level = 90, }, 
	["Teleport: Sturmschild"] = { class = "MAGE", level = 92, }, --7n	
	["Teleport: Kriegsspeer"] = 	{ class = "MAGE", level = 92, }, --7n	
--++ Mage Artifact Traits ++
	["Mal von Aluneth"] = 		{ class = "MAGE", level = 100, }, --7n
	["Phönixflammen"] = 		{ class = "MAGE", level = 100, }, --7n
	["Schwarzblitz"] = 			{ class = "MAGE", level = 100, }, --7n
--++ Mage Specialization ++
	--++ Fire/Frost ++ 
	["Unsichtbarkeit"] = 		{ class = "MAGE", level = 50, }, --7m
	--++ Arcane ++
	["Arkanschlag"] = 			{ class = "MAGE", level = 10, }, 
	["Arkanbeschuss"] = 		{ class = "MAGE", level = 10, },	
	["Arkane Aufladung"] = 		{ class = "MAGE", level = 10, }, --7??
	["Arkane Geschosse"] = 		{ class = "MAGE", level = 14, },
	["Verzerrung"] = 			{ class = "MAGE", level = 24, }, --7n
	["Prismatische Barriere"] = { class = "MAGE", level = 26, }, --7.1.5n	
	["Arkane Explosion"] = 		{ class = "MAGE", level = 28, }, --x Moved
	["Verlangsamen"] = 					{ class = "MAGE", level = 36, },
	["Hervorrufung"] = 			{ class = "MAGE", level = 40, }, --x Moved
	["Arkane Macht"] = 			{ class = "MAGE", level = 44, },
	["Große Unsichtbarkeit"] = 	{ class = "MAGE", level = 50, }, --7m
	["Geistesgegenwart"] = 		{ class = "MAGE", level = 15, }, --7.1.5m	
--	["Magische Rüstung"] = 			{ class = "MAGE", level = 56, }, --7.1.5r
	["Koryphäe"] =			 	{ class = "MAGE", level = 78, }, --7n	
	--++ Fire ++ 
 	["Kritische Masse"] = 		{ class = "MAGE", level = 56, }, --7.1.5m
	["Feuerball"] = 				{ class = "MAGE", level = 10, },
	["Pyroschlag"] = 			{ class = "MAGE", level = 10, },
	["Feuerschlag"] = 			{ class = "MAGE", level = 11, }, --7m
	["Kampfeshitze"] = 			{ class = "MAGE", level = 12, }, --7n
	["Verstärktes Feuerwerk"] = { class = "MAGE", level = 14, }, --7n	
	["Drachenodem"] = 			{ class = "MAGE", level = 24, },
	["Blazing Barrier"] = 		{ class = "MAGE", level = 26, }, --7.1.5 	
	["Einäschern"] = 			{ class = "MAGE", level = 28, },
	["Glühende Rüstung"] = 		{ class = "MAGE", level = 36, },
	["Versengen"] = 			{ class = "MAGE", level = 40, }, 	
	["Flammenstoß"] = 			{ class = "MAGE", level = 44, }, --x Moved
	["Kauterisieren"] = 		{ class = "MAGE", level = 30, }, --7.1.5m	
	["Entzünden"] = 			{ class = "MAGE", level = 80, },
	--++ Frost ++ 
	["Frostblitz"] = 			{ class = "MAGE", level = 1, },
	["Eislanze"] = 			{ class = "MAGE", level = 5, }, --x Moved
	["Wasserelementar beschwören"] = { class = "MAGE", level = 10, },
	["Zertrümmern"] = 				{ class = "MAGE", level = 12, }, --x Moved
--	["Hagel"] = 				{ class = "MAGE", level = 12, }, 7n Conflict
	["Eisige Finger"] = 		{ class = "MAGE", level = 24, },
	["Eisbarriere"] = 			{ class = "MAGE", level = 26, }, --7.1.5m	
	["Hirnfrost"] = 			{ class = "MAGE", level = 28, },
	["Kältekegel"] = 			{ class = "MAGE", level = 28, }, --7m	
	["Eisige Adern"] = 			{ class = "MAGE", level = 40, },
	["Blizzard"] = 				{ class = "MAGE", level = 44, }, --x Moved
	["Kälteeinbruch"] = 		{ class = "MAGE", level = 52, }, --7.1.5m 	
--	["Frostrüstung"] = 			{ class = "MAGE", level = 56, }, --7.1.5r
	["Eiszapfen"] = 			{ class = "MAGE", level = 78, },	
	["Gefrorene Kugel"] = 		{ class = "MAGE", level = 83, },
--++ Mage Talents ++
	["Flimmern"] = 				{ class = "MAGE", level = 30, }, --7n
	["Fluss des Beschwörers"] = 		{ class = "MAGE", level = 45, }, --7n 
	["Spiegelbild"] = 			{ class = "MAGE", level = 45, }, 
	["Rune der Kraft"] = 		{ class = "MAGE", level = 45, }, 
	["Eisschutz"] = 				{ class = "MAGE", level = 75, }, 	
	["Ring des Frosts"] = 		{ class = "MAGE", level = 75, }, 
	["Instabile Magie"] = 		{ class = "MAGE", level = 90, }, 	
	--++ Arcane ++
	["Amplifikation"] = 		{ class = "MAGE", level = 15, }, --7.1.5n
	["Arkaner Familiar"] = 		{ class = "MAGE", level = 15, }, --7n
	["Worte der Macht"] = 		{ class = "MAGE", level = 15, }, --7n
	["Manaschild"] = 			{ class = "MAGE", level = 30, }, --7.1.5n
	["Fließende Energie"] = 	{ class = "MAGE", level = 30, }, --7.1.5n	
	["Aufgeladen"] = 			{ class = "MAGE", level = 60, }, --7n	
	["Resonanz"] = 				{ class = "MAGE", level = 60, }, --7n	
	["Supernova"] = 			{ class = "MAGE", level = 60, }, --x
	["Zeitumlenkung"] = 		{ class = "MAGE", level = 75, }, --7.1.5n	
	["Erosion"] = 				{ class = "MAGE", level = 90, }, --7n	
	["Netherorkan"] = 			{ class = "MAGE", level = 90, }, --7n	
	["Arkane Kugel"] = 			{ class = "MAGE", level = 100, }, --x
	["Viel zu stark"] = 		{ class = "MAGE", level = 100, }, --x
--	["Beflügelung"] = 			{ class = "MAGE", level = 100, }, --7.1.5r
	["Zeitflux"] = 				{ class = "MAGE", level = 100, }, --7.1.5n	
	--++ Fire ++ 
	["Großbrand"] =				{ class = "MAGE", level = 15, }, --7n
	["Feuerteufel"] =			{ class = "MAGE", level = 15, }, --7n	
	["Pyromane"] = 				{ class = "MAGE", level = 15, }, --7m
	["Druckwelle"] = 			{ class = "MAGE", level = 30, }, --7.1.5m
	["Lodernde Seele"] = 		{ class = "MAGE", level = 30, }, --7.1.5n	
	["Alexstraszas Zorn"] = 	{ class = "MAGE", level = 60, }, --7.1.5n	
	["Kontrolliertes Feuer"] =	{ class = "MAGE", level = 60, }, --7n
	["Flammeninferno"] =		{ class = "MAGE", level = 60, }, --7n
	["Frenetische Geschwindigkeit"] = { class = "MAGE", level = 75, }, --7.1.5n		
	["Flammenfeld"] =			{ class = "MAGE", level = 90, }, --7n	
	["Lebende Bombe"] = 		{ class = "MAGE", level = 90, },
	["Funkensturm"] =			{ class = "MAGE", level = 100, }, --7n
	["Zündeln"] = 				{ class = "MAGE", level = 100, }, --x
	["Meteor"] = 				{ class = "MAGE", level = 100, }, --x
	--++ Frost ++ 
	["Knochenkälte"] =			{ class = "MAGE", level = 15, }, --7n
	["Einsamer Winter"] =		{ class = "MAGE", level = 15, }, --7n	
	["Froststrahl"] =			{ class = "MAGE", level = 15, }, --7n
	["Gletscherpanzer"] = 		{ class = "MAGE", level = 30, }, --7.1.5n
	["Eisschollen"] = 			{ class = "MAGE", level = 30, }, --7.1.5m	
	["Eiskalte Berührung"] =	{ class = "MAGE", level = 60, }, --7n	
	["Eisnova"] =	 			{ class = "MAGE", level = 60, }, --x
	["Eisige Winde"] = 			{ class = "MAGE", level = 75, }, --7.1.5n	
	["Arktischer Sturm"] =		{ class = "MAGE", level = 90, }, --7n 	
	["Frostbombe"] = 			{ class = "MAGE", level = 90, },
	["Kometenhagel"] = 			{ class = "MAGE", level = 100, }, --x
	["Gletscherstachel"] =		{ class = "MAGE", level = 100, }, --7n	
	["Thermale Leere"] = 		{ class = "MAGE", level = 100, }, --x
--++ Mage PvP Talents ++
	["Temporaler Schild"] = 		{ class = "MAGE", level = 100, }, --7n
	["Eisform"] = 				{ class = "MAGE", level = 100, }, --7n
	["Massenunsichtbarkeit"] = 	{ class = "MAGE", level = 100, }, --7n
	["Großer Pyroschlag"] = 	{ class = "MAGE", level = 100, }, --7n

--++ Monk Abilities ++
--	["Parieren"]   = 				{ class = "MONK", level = 1, },	Conflict
	["Tigerklaue"]   = 			{ class = "MONK", level = 1, },	
	["Zenflug"] =   			{ class = "MONK", level = 1, },
	["Blackout-Tritt"]   = 		{ class = "MONK", level = 3, },
	["Rollen"]   = 				{ class = "MONK", level = 5, }, 
 	["Provokation"]   = 			{ class = "MONK", level = 13, },  
 	["Wiederbeleben"]   = 		{ class = "MONK", level = 14, },
	["Zenpilgerfahrt"]   = 		{ class = "MONK", level = 20, },  
	["Zenpilgerfahrt: Rückkehr"] = { class = "MONK", level = 30, },
	["Knisternder Jadeblitz"]  = { class = "MONK", level = 36, },  
	["Paralyse"]   = 			{ class = "MONK", level = 48, },  
	["Transzendenz"]   = 		{ class = "MONK", level = 87, },  
	["Transzendenz: Transfer"] = { class = "MONK", level = 87, },
--++ Monk Artifact Traits ++
	["Explodierendes Fässchen"] = { class = "MONK", level = 100, }, --7n
	["Sheiluns Gabe"] = 		{ class = "MONK", level = 100, }, --7n
	["Schlag des Windlords"] = { class = "MONK", level = 100, }, --7n
--++ Monk Specialization ++
	--++ Brewmaster/Mistweaver/Windwalker ++
	["Überschwang"]   = 				{ class = "MONK", level = 8, },	--7n
	["Entgiftung"]   = 				{ class = "MONK", level = 22, }, --7m
	--++ Brewmaster/Windwalker ++
--	["Kritische Treffer"] =		{ class = "MONK", level = 1, }, --x Conflict
	["Speerhandstoß"]   = 	{ class = "MONK", level = 32, }, --7m		
	--++ Mistweaver/Windwalker ++	
	["Tritt der aufgehenden Sonne"] = 		{ class = "MONK", level =  18, }, --7m	
	["Wirbelnder Kranichtritt"]   = { class = "MONK", level = 46, },  --7m	
	--++ Brewmaster ++ 
	["Blackout-Schlag"]   = 	{ class = "MONK", level = 3, },	 --7n
	["Fasshieb"]   = 			{ class = "MONK", level = 10, }, 
	["Staffeln"]   = 			{ class = "MONK", level = 10, }, --7n	
	["Feuerodem"]   = 		{ class = "MONK", level = 18, },
	["Schadensumleitung"]   = 			{ class = "MONK", level = 26, }, --7m 	
 	["Eisenhautgebräu"]   = 		{ class = "MONK", level = 28, }, --7n
	["Gabe des Ochsen"]   = 		{ class = "MONK", level = 40, }, 
	["Himmlisches Glück"]   = 	{ class = "MONK", level = 45, }, --7n
	["Reinigendes Gebräu"]   = 		{ class = "MONK", level = 54, }, 
	["Zenmeditation"]   = 		{ class = "MONK", level = 65, }, 	
	["Unantastbarer Kämpfer"]   = 	{ class = "MONK", level = 78, },
	--++ Mistweaver ++ 	
	["Einhüllender Nebel"]   = 	{ class = "MONK", level = 10, },
	["Beruhigender Nebel"]   = 		{ class = "MONK", level = 10, }, 
	["Lehren des Klosters"] = { class = "MONK", level = 10, }, 	
	["Erneuernder Nebel"]   = 		{ class = "MONK", level = 24, }, 
	["Lebenskokon"]   = 		{ class = "MONK", level = 28, }, 
	["Beleben"]   = 				{ class = "MONK", level = 32, }, --7n 
	["Wiedererwachen"]   = 			{ class = "MONK", level = 44, }, --7n 	
 	["Donnerfokustee"]   = 	{ class = "MONK", level = 54, },
	["Stärkendes Gebräu"]   = 	{ class = "MONK", level = 55, }, --7.2m 
	["Essenzborn"]   = 		{ class = "MONK", level = 40, }, --7.2m 	
	["Belebung"]   = 			{ class = "MONK", level = 65, }, 
	["Nebelschwall"]   = 		{ class = "MONK", level = 78, }, --7n 	
	--++ Windwalker ++ 
	["Der wilde Tiger"] = { class = "MONK", level = 1, }, --7n
	["Combobrecher"] = 		{ class = "MONK", level =  10, },
	["Fliegender Schlangentritt"] = 	{ class = "MONK", level =  10, },	
	["Wirbelschläge"] = 		{ class = "MONK", level =  12, }, --7n	
	["Windlaufen"] = 			{ class = "MONK", level =  12, }, --7n	 
	["Kampfkonditionierung"] = 	{ class = "MONK", level =  20, }, 
	["Karmaberührung"] = 		{ class = "MONK", level =  24, }, 
	["Berührung des Todes"]   = 		{ class = "MONK", level = 24, }, --7m
	["Lähmen"]   = 			{ class = "MONK", level = 25, }, --x Moved	
	["Leben nach dem Tode"] = 			{ class = "MONK", level =  26, }, 
	["Furorfäuste"] = 		{ class = "MONK", level =  28, }, 
	["Sturm, Erde und Feuer"] = { class = "MONK", level =  65, },
	["Comboschläge"] = 		{ class = "MONK", level =  78, }, --7n	
--++ Monk Talents ++
	["Chistoß"]  = 			{ class = "MONK", level = 15, },
	["Chiwelle"]  = 			{ class = "MONK", level = 15, }, --7.2m	
	["Schnelligkeit"]  = 			{ class = "MONK", level = 30, },  
	["Chitorpedo"] = 			{ class = "MONK", level = 30, },  
	["Tigerrausch"] =  		{ class = "MONK", level = 30, }, 
	["Fußfeger"]  = 			{ class = "MONK", level = 60, }, 
	["Ring des Friedens"]  = 		{ class = "MONK", level = 60, }, 
	["Schaden dämpfen"]  = 			{ class = "MONK", level = 75, },  
	--++ Brewmaster/Windwalker ++
	["Auge des Tigers"]  = 	{ class = "MONK", level = 15, }, --7n
	["Statue des Schwarzen Ochsen beschwören"] = { class = "MONK", level = 60, }, --7.1.5m 	
	["Rauschender Jadewind"]  = 	{ class = "MONK", level = 90, }, 	
	--++ Windwalker/Mistweaver ++ 	
	["Magiediffusion"]  = 		{ class = "MONK", level = 75, },  --7.1.5m
	--++ Brewmaster ++	
	["Schwarzochsengebräu"]  = 		{ class = "MONK", level = 45, }, --7n
	["Gabe der Nebel"]  = 	{ class = "MONK", level = 45, }, --7n
	["Leichtbrauweise"]  = 		{ class = "MONK", level = 45, }, --7n
	["Mystische Vitalität"]  = 	{ class = "MONK", level = 75, }, --7.1.5n	
	["Niuzao den schwarzen Ochsen beschwören"] = { class = "MONK", level = 90, }, --7n
	["Speziallieferung"]  = 	{ class = "MONK", level = 90, }, --7n
	["Blackout-Combo"]  = 		{ class = "MONK", level = 100, }, --7n
	["Flüchtiger Tanz"]  = 		{ class = "MONK", level = 100, }, --7n
	["Nehmerqualitäten"]  = 		{ class = "MONK", level = 100, }, --7n
	--++ Mistweaver ++ 
-- 	["Nebellauf"] = 				{ class = "MONK", level = 15, }, --7.2r 
	["Zenimpuls"] = 			{ class = "MONK", level = 15, }, --7n
	["Lebenszyklus"] = 			{ class = "MONK", level = 45, }, --7n
	["Nebelhülle"] = 			{ class = "MONK", level = 45, }, --7n
	["Geist des Kranichs"] = 	{ class = "MONK", level = 45, }, --7n	
	["Lied von Chi-Ji"] = 		{ class = "MONK", level = 60, }, --7n
	["Chi-Ji den roten Kranich beschwören"] = { class = "MONK", level = 90, }, --7n
	["Erquickender Jadewind"] = 	{ class = "MONK", level = 90, }, --7n
	["Statue der Jadeschlange beschwören"] = { class = "MONK", level = 90, }, --7m
	["Fokussierter Donner"] = 		{ class = "MONK", level = 100, }, --7n	
	["Manatee"]   = 			{ class = "MONK", level = 100, }, --7m 	
	["Anschwellender Donner"] = 		{ class = "MONK", level = 100, }, --7n
	--++ Windwalker ++ 	
	["Aszendenz"]  = 			{ class = "MONK", level = 45, }, 	
	["Energetisierendes Elixier"] = 	{ class = "MONK", level =  45, }, --7n
	["Kräftige Schläge"]  = 		{ class = "MONK", level = 45, },
--	["Schwindeltritte"]  = 		{ class = "MONK", level = 60, }, --7.1.5r
	["Treffercombo"]  =	 		{ class = "MONK", level = 90, }, --7n
	["Xuen den Weißen Tiger beschwören"] = { class = "MONK", level = 90, },
	["Chiorbit"]  = 			{ class = "MONK", level = 100, }, --7n	
	["Gleichmut"] = 				{ class = "MONK", level = 100, }, --x
	["Wirbelnder Drachenschlag"] = { class = "MONK", level = 100, }, --7n	
--++ Monk PvP Talents ++
	["Stärkendes Gebräu"] = 	{ class = "MONK", level = 100, }, --7.2m
--	["Wirbelnde Feuerblüte"] = { class = "MONK", level = 100, }, --7.2.5r
	["Tigeraugengebräu"] = 		{ class = "MONK", level = 100, }, --7.2.5n
	["Schutz"] = 		 		{ class = "MONK", level = 100, }, --7n
	["Fass aufmachen"] = 		{ class = "MONK", level = 100, }, --7n
	["Tritt des mächtigen Ochsen"] = 		{ class = "MONK", level = 100, }, --7n
	["Heilende Sphäre"] = 		{ class = "MONK", level = 100, }, --7n
	["Herstellen: Schlüpfriges Gebräu"] = 	{ class = "MONK", level = 100, }, --7n
	["Weg des Kranichs"] = 		{ class = "MONK", level = 100, }, --7n

--++ Paladin Abilities ++
--	["Blocken"] =			{ class = "PALADIN", level = 1, }, --7n Conflict
	["Grenzenloser Glaube"] = 	{ class = "PALADIN", level = 1, },	
	["Kreuzfahrerstoß"] = 		{ class = "PALADIN", level = 1, },
--	["Parieren"]=					{ class = "PALADIN", level = 1, }, 7 Conflict	
	["Richturteil"] = 				{ class = "PALADIN", level = 3, },	
	["Hand der Abrechnung"] = 	{ class = "PALADIN", level = 13, }, --7n
	["Erlösung"] = 			{ class = "PALADIN", level = 14, },
	["Gottesschild"] = 		{ class = "PALADIN", level = 18, },
	["Elekk des Exarchen beschwören"] = { class = "PALADIN", level = 20, },	--7n
	["Kodo der Sonnenläufer beschwören"] = { class = "PALADIN", level = 20, },	--7n
	["Thalassisches Schlachtross beschwören"] = { class = "PALADIN", level = 20, }, --7n
	["Schlachtross beschwören"] = 		{ class = "PALADIN", level = 20, },	--7n	
	["Handauflegung"] = 			{ class = "PALADIN", level = 22, },
	["Göttliches Ross"] = 			{ class = "PALADIN", level = 28, }, --7n Hotfix		
	["Nachsinnen"] = 		{ class = "PALADIN", level = 40, },
	["Herz des Kreuzfahrers"] = { class = "PALADIN", level = 40, },	
	["Streitross beschwören"] = 		{ class = "PALADIN", level = 40, },	--7n
	["Großen Elekk des Exarchen beschwören"] = { class = "PALADIN", level = 40, }, --7n
	["Großen Kodo der Sonnenläufer beschwören"] = { class = "PALADIN", level = 40, }, --7n
	["Thalassisches Streitross beschwören"] = { class = "PALADIN", level = 40, }, --7n
	["Segen der Freiheit"] = 	{ class = "PALADIN", level = 52, },	--7n
--++ Paladin Artifact Traits ++
	["Auge von Tyr"] = 		{ class = "PALADIN", level = 100, }, --7n
	["Tyrs Errettung"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Aschewelle"] = 		{ class = "PALADIN", level = 100, }, --7n
--++ Paladin Specialization ++
	--++ Holy/Protection/Retribution ++	
	["Hammer der Gerechtigkeit"] = 	{ class = "PALADIN", level = 5, }, --7m
	["Lichtblitz"] = 		{ class = "PALADIN", level = 8, }, --7m	
	["Segen des Schutzes"] = { class = "PALADIN", level = 48, }, --7n
	["Zornige Vergeltung"] = 		{ class = "PALADIN", level = 72, }, --7m
	--++ Holy/Retribution ++	
	["Göttlicher Schutz"] = 	{ class = "PALADIN", level = 26, }, --7m	
	["Weihe"] = 			{ class = "PALADIN", level = 32, }, --7m	
	["Segen der Aufopferung"] = { class = "PALADIN", level = 56, }, --7n
	--++ Protection/Retribution ++ 
	["Toxine läutern"] = 		{ class = "PALADIN", level = 21, }, --7n
	["Zurechtweisung"] = 				{ class = "PALADIN", level = 36, }, --7m
	--++ Holy ++
	["Licht des Märtyrers"] =  	{ class = "PALADIN", level = 1, }, --7n??
	["Heiliger Schock"] = 			{ class = "PALADIN", level = 10, },
	["Läuterung"] = 				{ class = "PALADIN", level = 21, }, --7m
	["Flamme des Glaubens"] = 		{ class = "PALADIN", level = 36, },
--	["Absolution"] = 			{ class = "PALADIN", level = 44, },	--7n Conflict
	["Lichtinfusion"] = 	{ class = "PALADIN", level = 50, },
	["Rechtschaffenheit"] = 		{ class = "PALADIN", level = 50, }, --7n
	["Heiliges Licht"] = 			{ class = "PALADIN", level = 54, },
	["Licht der Morgendämmerung"] = 		{ class = "PALADIN", level = 58, },
	["Aurenmeisterschaft"] = 			{ class = "PALADIN", level = 65, },	--7n
	["Lichtbringer"] = 			{ class = "PALADIN", level = 78, },	--7n
	--++ Protection ++ 
	["Schild des Rächers"] = 		{ class = "PALADIN", level = 10, },
	["Vom Licht behütet"] = 	{ class = "PALADIN", level = 10, },
	["Hammer der Rechtschaffenen"] = { class = "PALADIN", level = 10, },	
	["Zorn der Gerechtigkeit"] = 		{ class = "PALADIN", level = 10, }, --7m
	["Refugium"] = 			{ class = "PALADIN", level = 10, },	
	["Licht des Beschützers"] = { class = "PALADIN", level = 12, }, --7n
	["Richturteile des Weisen"] = { class = "PALADIN", level = 28, },
	["Schild der Rechtschaffenen"] = { class = "PALADIN", level = 38, },
	["Oberster Kreuzfahrer"] = 		{ class = "PALADIN", level = 50, },
	["Unermüdlicher Verteidiger"] = 		{ class = "PALADIN", level = 65, },	
--	["Riposte"] =		 		{ class = "PALADIN", level = 76, }, --7 Conflict
	["Göttliches Bollwerk"] = 		{ class = "PALADIN", level = 78, },
	["Wächter der Uralten Könige"] = { class = "PALADIN", level = 83, },		
	--++ Retribution ++  
	["Urteil des Templers"] = 	{ class = "PALADIN", level = 10, },
--	["Schwert des Lichts"] = 		{ class = "PALADIN", level = 12, },
	["Klinge der Gerechtigkeit"] = 		{ class = "PALADIN", level = 16, }, --7n
	["Schild der Vergeltung"] = 	{ class = "PALADIN", level = 24, }, --7n	
	["Hand der Hinderung"] = 	{ class = "PALADIN", level = 26, }, --7n
	["Göttlicher Sturm"] = 			{ class = "PALADIN", level = 32, },
--	["Großer Segen der Macht"] = { class = "PALADIN", level = 42, }, --7.1.5r
	["Großer Segen der Könige"] = { class = "PALADIN", level = 44, }, --7n	
	["Großer Segen der Weisheit"] = { class = "PALADIN", level = 46, }, --7n
	["Vergeltung"] =			{ class = "PALADIN", level = 56, }, --7n
	["Göttliches Urteil"] =		{ class = "PALADIN", level = 78, }, --7n
--++ Paladin Talents ++
--	["Hoch zu Ross"] = 				{ class = "PALADIN", level = 30, }, --7n hotfix 60 Prot, 90 Ret
	["Blendendes Licht"] = 		{ class = "PALADIN", level = 45, }, 
	["Buße"] = 			{ class = "PALADIN", level = 45, }, 
	["Richturteil des Lichts"] = 	{ class = "PALADIN", level = 90, }, --7.1.5m		
	--++ Holy/Protection ++ 
	["Faust der Gerechtigkeit"] = 		{ class = "PALADIN", level = 45, }, --7.1.5m
	--++ Holy ++	
	["Zuversicht verleihen"] = 			{ class = "PALADIN", level = 15, },	--7n
	["Macht des Kreuzfahrers"] = 		{ class = "PALADIN", level = 15, },	--7n
	["Hammer des Lichts"] = 		{ class = "PALADIN", level = 15, },
	["Herrschaft des Gesetzes"] =			{ class = "PALADIN", level = 30, },	--7n
	["Unbeugsamer Geist"] =	{ class = "PALADIN", level = 30, },
	["Aura der Gnade"] = 		{ class = "PALADIN", level = 60, }, --7n	
	["Aura der Opferung"] = 	{ class = "PALADIN", level = 60, }, --7n	
	["Aura der Hingabe"] = 		{ class = "PALADIN", level = 60, }, --7m
	["Göttliche Bestimmung"] = 		{ class = "PALADIN", level = 75, }, --7??
	["Heiliger Rächer"] = 			{ class = "PALADIN", level = 75, },
	["Heiliges Prisma"] = 			{ class = "PALADIN", level = 75, },
	["Fanatischer Märtyrer"] = 		{ class = "PALADIN", level = 90, }, --7n
	["Geweihter Zorn"] = 		{ class = "PALADIN", level = 90, },	
	["Flamme der Zuversicht"] =		{ class = "PALADIN", level = 100, }, --x
	["Flamme des Lichtbringers"] = { class = "PALADIN", level = 100, }, --7n
	["Leuchtfeuer der Tugend"] =		{ class = "PALADIN", level = 100, }, --7n
	--++ Protection ++ 
	["Bastion des Lichts"] = 		{ class = "PALADIN", level = 15, },	--7n
	["Richturteil des Kreuzfahrers"] = 	{ class = "PALADIN", level = 15, },	--7n
	["Erster Rächer"] = 		{ class = "PALADIN", level = 15, },	--7n
	["Gesegneter Hammer"] = 		{ class = "PALADIN", level = 30, },	--7n
	["Geweihter Hammer"] = 	{ class = "PALADIN", level = 30, },	--7n
	["Heiliger Schild"] = 			{ class = "PALADIN", level = 30, }, --x
	["Segen der Rettung"] = { class = "PALADIN", level = 60, },	--7n
	["Segen des Zauberschutzes"] =  { class = "PALADIN", level = 60, },	--7n
	["Aura der Vergeltung"] = 		{ class = "PALADIN", level = 60, },	--7n
	["Glanzstunde"] = 			{ class = "PALADIN", level = 75, },	--7n
	["Hand des Beschützers"] = { class = "PALADIN", level = 75, },	--7n	
	["Tempelritter"] = 		{ class = "PALADIN", level = 75, },	--7n
	["Aegis des Lichts"] = 		{ class = "PALADIN", level = 90, },	--7n
	["Geweihter Boden"] = 	{ class = "PALADIN", level = 90, },	--7n
	["Letzter Verteidiger"] = 		{ class = "PALADIN", level = 100, }, --7n
	["Beschützer der Rechtschaffenen"] = 	{ class = "PALADIN", level = 100, }, --7n 	
	["Seraphim"] = 				{ class = "PALADIN", level = 100, }, --x
	--++ Retribution ++ 	
	["Weihe"] = 					{ class = "PALADIN", level = 15, }, --7n
	["Richtspruch"] = 				{ class = "PALADIN", level = 15, },	
	["Letztes Urteil"] = 			{ class = "PALADIN", level = 15, }, --7n
	["Großes Richturteil"] = 		{ class = "PALADIN", level = 30, }, --7n
	["Die Feuer der Gerechtigkeit"] = 	{ class = "PALADIN", level = 30, }, --7n
	["Eifer"] = 					{ class = "PALADIN", level = 30, }, --7n
	["Faust der Gerechtigkeit"] = 	{ class = "PALADIN", level = 45, }, --7.1.5n		
	["Klinge des Zorns"] = 			{ class = "PALADIN", level = 60, }, --7n
	["Göttlicher Hammer"] = 		{ class = "PALADIN", level = 60, }, --7n
	["Klinge der Tugend"] = 		{ class = "PALADIN", level = 60, }, --7n
	["Auge um Auge"] = 				{ class = "PALADIN", level = 75, }, --7n
	["Rache des Rechtsprechers"] = 	{ class = "PALADIN", level = 75, }, --7n
	["Wort der Herrlichkeit"] = 	{ class = "PALADIN", level = 75, }, --7n
	["Göttlicher Eingriff"] = 		{ class = "PALADIN", level = 90, }, --7n
	["Richturteil des Lichts"] = 	{ class = "PALADIN", level = 90, }, --7.1.5n
--	["Siegel des Lichts"] = 		{ class = "PALADIN", level = 90, }, --7n
	["Kreuzzug"] = 					{ class = "PALADIN", level = 100, }, --7n	
	["Göttliche Bestimmung"] = 	 	{ class = "PALADIN", level = 100, }, --7n	
	["Heiliger Zorn"] = 			{ class = "PALADIN", level = 100, }, --7m
--++ Paladin PvP Talents ++
	["Hammer der Abrechnung"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Segen des Refugiums"] = { class = "PALADIN", level = 100, }, --7n
	["Göttliche Gunst"] = 			{ class = "PALADIN", level = 100, }, --7n
	["Schild der Tugend"] = 		{ class = "PALADIN", level = 100, }, --7n
	["Kreuzzug der Vergeltung"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Wächter der vergessenen Königin"] = { class = "PALADIN", level = 100, }, --7n

--++ Priest Abilities ++
	["Die Bußfertigen"] = 			{ class = "PRIEST", level = 1, }, --7.2.5m
	["Heilige Pein"] = 				{ class = "PRIEST", level = 1, },
	["Machtwort: Barriere"] = 	{ class = "PRIEST", level = 5, }, --7m??
	["Auferstehung"] = 			{ class = "PRIEST", level = 14, },
	["Magiebannung"] = 			{ class = "PRIEST", level = 26, },
	["Untote fesseln"] = 		{ class = "PRIEST", level = 32, },
	["Gedankenkontrolle"] = 			{ class = "PRIEST", level = 36, }, --7m
	["Verblassen"] = 					{ class = "PRIEST", level = 38, },
	["Massenbannung"] = 			{ class = "PRIEST", level = 72, },
--++ Priest Artifact Traits ++
	["Licht von T'uure"] = 		{ class = "PRIEST", level = 100, }, --7n
	["Zorn des Lichts"] = 		{ class = "PRIEST", level = 100, }, --7n
	["Leerenstrom"] = 			{ class = "PRIEST", level = 100, }, --7n
--++ Priest Specialization ++
	--++ Discipline/Holy/Shadow ++
	["Levitieren"] = 				{ class = "PRIEST", level = 28, }, --7m	
	--++ Discipline/Holy ++
	["Läutern"] = 				{ class = "PRIEST", level = 22, },
	["Fokussierter Wille"] = 			{ class = "PRIEST", level = 34, },
	["Massenwiederbelebung"] = 	{ class = "PRIEST", level = 44, }, --7n
	["Glaubenssprung"] = 		{ class = "PRIEST", level = 83, }, --7m
	--++ Discipline/Shadow ++
	["Schattenheilung"] = 			{ class = "PRIEST", level = 1, }, --7n		
	["Schattenwort: Schmerz"] = 	{ class = "PRIEST", level = 3, }, --7m
	["Machtwort: Schild"] = 	{ class = "PRIEST", level = 5, }, --7m	
	["Psychischer Schrei"] = 		{ class = "PRIEST", level = 12, }, --7m
	["Schattengeist"] = 			{ class = "PRIEST", level = 42, }, --7m	
	["Gedankensicht"] = 			{ class = "PRIEST", level = 42, }, --7m	
	--++ Discipline ++
	["Bittgebet"] = 					{ class = "PRIEST", level = 7, }, --7n	
	["Sühne"] = 				{ class = "PRIEST", level = 10, },
	["Abbitte"] = 			{ class = "PRIEST", level = 24, },
	["Machtwort: Glanz"] = 	{ class = "PRIEST", level = 46, }, --7n	
	["Euphorie"] = 				{ class = "PRIEST", level = 50, },	
	["Schmerzunterdrückung"] = 		{ class = "PRIEST", level = 56, },
	--++ Holy ++
	["Blitzheilung"] = 			{ class = "PRIEST", level = 10, }, --7m
	["Erneuerung"] = 				{ class = "PRIEST", level = 10, }, 
	["Heiliges Feuer"] = 			{ class = "PRIEST", level = 18, }, --7m	
	["Segenswort: Epiphanie"] = 	{ class = "PRIEST", level = 18, }, --7n	
	["Segenswort: Züchtigung"] = 	{ class = "PRIEST", level = 24, },
	["Geist der Erlösung"] = 	{ class = "PRIEST", level = 29, },
	["Heilung"] = 					{ class = "PRIEST", level = 34, },
	["Gebet der Heilung"] = 	{ class = "PRIEST", level = 40, },
	["Glücksfall"] = 			{ class = "PRIEST", level = 42, },	
	["Segenswort: Heiligung"] = 	{ class = "PRIEST", level = 50, }, --7n
	["Verzweifeltes Gebet"] = 		{ class = "PRIEST", level = 52, }, --7.1.5m
	["Schutzgeist"] = 		{ class = "PRIEST", level = 54, },	
	["Gebet der Besserung"] = 	{ class = "PRIEST", level = 58, }, --7m	
	["Heilige Nova"] = 			{ class = "PRIEST", level = 65, },
	["Gotteshymne"] = 			{ class = "PRIEST", level = 76, },
	["Echo des Lichts"] = 		{ class = "PRIEST", level = 78, },
	--++ Shadow ++
	["Gedankenschinden"] = 			{ class = "PRIEST", level = 10, },
	["Leerenblitz"] = 			{ class = "PRIEST", level = 10, }, --7n
	["Leereneruption"] = 		{ class = "PRIEST", level = 10, }, --7n
	["Leerengestalt"] = 				{ class = "PRIEST", level = 10, }, --7n
	["Schattengestalt"] = 			{ class = "PRIEST", level = 12, }, --7.1n
	["Gedankenschlag"] = 			{ class = "PRIEST", level = 16, }, 
	["Krankheit läutern"] = 		{ class = "PRIEST", level = 22, }, --7n
	["Vampirberührung"] = 		{ class = "PRIEST", level = 24, },
	["Gedankenexplosion"] = 			{ class = "PRIEST", level = 76, }, --7m	
	["Schattenwort: Tod"] = 	{ class = "PRIEST", level = 28, }, --7??	
	["Schattenhafte Erscheinungen"] = 	{ class = "PRIEST", level = 34, },
	["Stille"] = 				{ class = "PRIEST", level = 50, },
	["Dispersion"] = 			{ class = "PRIEST", level = 58, },
	["Vampirumarmung"] = 		{ class = "PRIEST", level = 65, },
	["Wahnsinn"] = 				{ class = "PRIEST", level = 78, }, --7n	
--++ Priest Talents ++
	--++ Discipline/Holy ++	
	["Engelsfeder"] = 		{ class = "PRIEST", level = 30, },	
	["Strahlende Kraft"] = 		{ class = "PRIEST", level = 45, }, --7n	
	["Göttlicher Stern"] = 			{ class = "PRIEST", level = 90, },	
	["Strahlenkranz"] = 					{ class = "PRIEST", level = 90, },	
	--++ Discipline/Shadow ++	
	["Körper und Geist"] = 		{ class = "PRIEST", level = 30, },
	["Selbstmarterung"] = 			{ class = "PRIEST", level = 30, }, --7n	
	["Dominanter Geist"] = 		{ class = "PRIEST", level = 45, },
	["Psychische Stimme"] = 		{ class = "PRIEST", level = 45, }, --7n
	["Geistbeuger"] = 			{ class = "PRIEST", level = 60, },	
	["Seele der Macht"] = 		{ class = "PRIEST", level = 75, },
	--++ Discipline ++	
	["Züchtigung"] = 			{ class = "PRIEST", level = 15, }, --7n
	["Schisma"] = 				{ class = "PRIEST", level = 15, }, --7n
	["Machtwort: Trost"] = 	{ class = "PRIEST", level = 60, }, --7n
	["Schilddisziplin"] = 	{ class = "PRIEST", level = 60, }, --7n
--	["Reue"] = 				{ class = "PRIEST", level = 75, }, --7.2.5r
	["Klarheit des Willens"] = 		{ class = "PRIEST", level = 75, }, 
	["Refugium"] = 				{ class = "PRIEST", level = 75, }, --7.2.5n		
	["Schattenbündnis"] = 		{ class = "PRIEST", level = 75, }, --7.2.5m	
	["Läuterung des Bösen"] = 	{ class = "PRIEST", level = 90, }, --7.2.5n	
	["Anmut"] = 				{ class = "PRIEST", level = 100, }, --7
	["Prediger"] = 				{ class = "PRIEST", level = 100, }, --7.2.5n
	--++ Shadow ++	
	["Schicksalshafte Wendung"] = 		{ class = "PRIEST", level = 75, },	
	--++ Holy ++
	["Anhaltende Erneuerung"] = 		{ class = "PRIEST", level = 15, }, --7n
	["Erleuchtung"] = 		{ class = "PRIEST", level = 15, }, --7m
	["Trail of Light"] = 		{ class = "PRIEST", level = 15, }, --7n
	["Körper und Geist"] = 		{ class = "PRIEST", level = 30, }, --7n
	["Beharrlichkeit"] = 		{ class = "PRIEST", level = 30, }, --7.1.5n	
	["Jenseits"] = 			{ class = "PRIEST", level = 45, }, --7n
	["Tadel"] = 				{ class = "PRIEST", level = 45, }, --7n
	["Schutzengel"] = 		{ class = "PRIEST", level = 60, }, --7n	
	["Licht der Naaru"] =	{ class = "PRIEST", level = 60, }, --7n	
	["Symbol der Hoffnung"] = 		{ class = "PRIEST", level = 60, }, --7n	
	["Verbindende Heilung"] = 			{ class = "PRIEST", level = 75, }, --7m
	["Frömmigkeit"] = 				{ class = "PRIEST", level = 75, }, --7n	
	["Woge des Lichts"] = 		{ class = "PRIEST", level = 75, }, --7n
	["Göttlichkeit"] = 				{ class = "PRIEST", level = 90, }, --7n
	["Apotheose"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Segnung"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Kreis der Heilung"] = 	{ class = "PRIEST", level = 100, }, --7m
	--++ Shadow ++
	["Festung des Geistes"] = 	{ class = "PRIEST", level = 15, }, --7n
	["Schattenwort: Leere"] = 	{ class = "PRIEST", level = 15, }, --7n
	["Manie"] = 				{ class = "PRIEST", level = 30, }, --7n
--	["Gedankenbombe"] = 			{ class = "PRIEST", level = 45, }, --7.1.5r
	["Bleibender Wahnsinn"] = 	{ class = "PRIEST", level = 60, }, --7.1.5n	
	["Seelensammler"] = 		{ class = "PRIEST", level = 60, }, --7n
--	["Leerenfürst"] = 			{ class = "PRIEST", level = 60, }, --7.1.5r
	["Leerenstrahl"] = 				{ class = "PRIEST", level = 60, }, --7n
	["Verheißungsvolle Geister"] = 	{ class = "PRIEST", level = 75, }, 
	["San'layn"] = 				{ class = "PRIEST", level = 75, }, --7n
	["Schattenhafte Einsicht"] = 		{ class = "PRIEST", level = 75, }, --7n
	["Elend"] = 				{ class = "PRIEST", level = 90, }, --7.1.5n		
	["Schattengeschoss"] = 			{ class = "PRIEST", level = 100, }, --7.1.5m
	["Vermächtnis der Leere"] = 	{ class = "PRIEST", level = 100, }, --7n
--	["Gedankenstachel"] = 			{ class = "PRIEST", level = 100, }, --7.1.5r
	["Abstieg in den Wahnsinn"] = 	{ class = "PRIEST", level = 100, }, --7n
--++ Priest PvP Talents ++
	["Leerenverschiebung"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Innerer Fokus"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Hoffnungsstrahl"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Erzengel"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Vorahnung"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Psychoschrecken"] = 				{ class = "PRIEST", level = 100, }, --7n
	["Machtwort: Seelenstärke"] = { class = "PRIEST", level = 100, }, --7n
	["Großes Verblassen"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Heiliger Zauberschutz"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Geist des Erlösers"] = { class = "PRIEST", level = 100, }, --7n

--++ Rogue Abilities ++
--	["Kritische Treffer"] = 		{ class = "DRUID", level = 1, }, --x Conflict
	["Aufdeckung"] = 			{ class = "ROGUE", level = 1, }, --7m
--	["Parieren"]=					{ class = "ROGUE", level = 1, }, 7 Conflict		
	["Blutrote Phiole"] = 			{ class = "ROGUE", level = 14, }, --7n	
	["Tritt"] = 					{ class = "ROGUE", level = 18, },
	["Schloss knacken"] = 			{ class = "ROGUE", level = 24, },
	["Sprinten"] = 				{ class = "ROGUE", level = 26, },
	["Fallen entdecken"] = 			{ class = "ROGUE", level = 42, },
	["Mantel der Schatten"] = 		{ class = "ROGUE", level = 58, },
	["Flinken Fußes"] = 			{ class = "ROGUE", level = 62, },
	["Sicheres Fallen"] = 			{ class = "ROGUE", level = 48, }, 	
	["Dolchfächer"] = 		{ class = "ROGUE", level = 66, }, --7??
	["Schurkenhandel"] = 	{ class = "ROGUE", level = 78, },
--++ Rogue Artifact Traits ++
	["Fluch der Schreckensklingen"] = { class = "ROGUE", level = 100, }, --7n
	["Blutschlunds Biss"] = 	{ class = "ROGUE", level = 100, }, --7n
	["Königsmord"] = 			{ class = "ROGUE", level = 100, }, --7n
--++ Rogue Specialization ++
	--++ Assassination/Outlaw/Subtlety ++  
	["Verstohlenheit"] = 				{ class = "ROGUE", level = 5, }, --7m	
	["Kopfnuss"] = 					{ class = "ROGUE", level = 12, }, --7m
	["Taschendiebstahl"] = 			{ class = "ROGUE", level = 16, }, --7m	
	["Blenden"] = 				{ class = "ROGUE", level = 24, }, --7.1.5m	
	["Ablenken"] = 				{ class = "ROGUE", level = 28, }, --7m	
	["Fieser Trick"] = 			{ class = "ROGUE", level = 30, }, --7m	
	["Verschwinden"] = 				{ class = "ROGUE", level = 32, }, --7m	
	--++ Assassination/Subtlety ++  
	["Entrinnen"] = 				{ class = "ROGUE", level = 8, }, --7m	
	["Schattenschritt"] = 			{ class = "ROGUE", level = 13, }, --7m
	["Nierenhieb"] = 			{ class = "ROGUE", level = 40, }, --7m	
	--++ Assassination ++  
	["Verstümmeln"] = 				{ class = "ROGUE", level = 1, },
	["Tödliches Gift"] = 		{ class = "ROGUE", level = 2, }, --7m
	["Vergiften"] = 				{ class = "ROGUE", level = 3, },
	["Entschlossenheit des Assassinen"] = 	{ class = "ROGUE", level = 10, },
	["Verbesserte Gifte"] = 		{ class = "ROGUE", level = 10, },
	["Giftdolch"] = 		{ class = "ROGUE", level = 10, }, --7n
	["In Stücke schneiden"] = 		{ class = "ROGUE", level = 20, }, 
	["Blutung"] = 				{ class = "ROGUE", level = 22, }, --7m	
	["Vergiftende Wunden"] = 		{ class = "ROGUE", level = 22, },
	["Wundgift"] = 			{ class = "ROGUE", level = 25, }, --7m	
	["Schicksal besiegeln"] = 			{ class = "ROGUE", level = 27, },
	["Verkrüppelndes Gift"] = 		{ class = "ROGUE", level = 38, }, --7.1.5m
	["Erdrosseln"] = 				{ class = "ROGUE", level = 48, }, --7m
	["Vendetta"] = 				{ class = "ROGUE", level = 72, },
	["Potente Gifte"] = 		{ class = "ROGUE", level = 78, },
	--++ Outlaw ++  	
--	["Ripsote"] = 				{ class = "ROGUE", level = 10, }, -- Conflict
	["Durchstoßen"] = 			{ class = "ROGUE", level = 10, }, --7n
	["Säbelhieb"] = 			{ class = "ROGUE", level = 10, }, --7n
	["Vitalität"] = 				{ class = "ROGUE", level = 10, },	
	["Pistolenschuss"] = 			{ class = "ROGUE", level = 12, }, --7n
	["Hinterhalt"] = 				{ class = "ROGUE", level = 14, }, --7m
	["Solarplexus"] = 				{ class = "ROGUE", level = 22, }, --7m	
	["Zwischen die Augen"] = 		{ class = "ROGUE", level = 25, }, --7n
	["Skrupellosigkeit"] = 			{ class = "ROGUE", level = 27, },
	["Kampfkraft"] = 		{ class = "ROGUE", level = 34, },
	["Schicksalswürfel"] = 		{ class = "ROGUE", level = 36, }, --7n
	["Klingenwirbel"] = 			{ class = "ROGUE", level = 48, },	
	["Ruhlose Klingen"] = 		{ class = "ROGUE", level = 50, },
	["Bestechung"] = 				{ class = "ROGUE", level = 54, }, --7n	
	["Adrenalinrausch"] = 		{ class = "ROGUE", level = 72, },
	["Parierdolch"] = 			{ class = "ROGUE", level = 78, },
	--++ Subtlety ++
	["Meucheln"] = 				{ class = "ROGUE", level = 10, },
	["Energetische Erholung"] = 	{ class = "ROGUE", level = 10, },
	["Ausweiden"] = 			{ class = "ROGUE", level = 10, }, --7m
	["Shurikenwurf"] = 		{ class = "ROGUE", level = 11, }, --7m
	["Schattenschlag"] = 		 	{ class = "ROGUE", level = 22, }, --7n
	["Schattentechniken"] = 	{ class = "ROGUE", level = 27, }, --7n
	["Symbole des Todes"] = 		{ class = "ROGUE", level = 34, }, --7n
	["Schattentanz"] = 			{ class = "ROGUE", level = 36, },
	["Wachsende Schatten"] = 	{ class = "ROGUE", level = 42, }, --7n
	["Nachtklinge"] = 			{ class = "ROGUE", level = 46, }, --7n	
	["Unerbittliche Stöße"] = 	{ class = "ROGUE", level = 50, }, 	
	["Shurikensturm"] = 		{ class = "ROGUE", level = 66, }, --7n
	["Shuriken-Combo"] = 		{ class = "ROGUE", level = 70, }, --7.2.5n		
	["Schattenklingen"] = 		{ class = "ROGUE", level = 72, }, --7m	
	["Scharfrichter"] = 		{ class = "ROGUE", level = 78, },
--++ Rogue Talents ++
	["Erwartung"] = 			{ class = "ROGUE", level = 45 }, 
	["Meisterlicher Stratege"] = 		{ class = "ROGUE", level = 45 }, --7n	
	["Lebenskraft"] = 				{ class = "ROGUE", level = 45 }, --7n	
	["Von der Schippe springen"] = 			{ class = "ROGUE", level = 60, }, 
	["Flüchtigkeit"] = 			{ class = "ROGUE", level = 60, }, 
	["Die Schwachen ausbeuten"] = 		{ class = "ROGUE", level = 75, }, 
	["Inbrunst"] = 				{ class = "ROGUE", level = 90, }, --7n
	["Tod von oben"] = 		{ class = "ROGUE", level = 100, },
	["Todesurteil"] =		{ class = "ROGUE", level = 100, }, 
	--++ Assassination/Subtlety ++  
	["Nachtpirscher"] = 			{ class = "ROGUE", level = 30, },
	["Schattenfokus"] = 			{ class = "ROGUE", level = 30, },	
	["Trickbetrug"] = 			{ class = "ROGUE", level = 30, },	
	--++ Assassination ++ 
	["Minuziöse Planung"] = 	{ class = "ROGUE", level = 15, }, --7n
	["Blutsturz"] = 			{ class = "ROGUE", level = 15, }, --7m	
	["Meister der Gifte"] = 		{ class = "ROGUE", level = 15, }, --7m
	["Egelgift"] = 		{ class = "ROGUE", level = 60, },
	["Interne Blutungen"] = 	{ class = "ROGUE", level = 75, }, --x
	["Komplott"] = 				{ class = "ROGUE", level = 75, }, --7n	
--	["Peinigendes Gift"] = 		{ class = "ROGUE", level = 90, }, --7.2.5r	
	["Ausbluten"] = 			{ class = "ROGUE", level = 90, }, --7n
	["Vergiftete Klinge"] = 	{ class = "ROGUE", level = 90, }, --7.2.5n		
	["Toxischer Rausch"] = 		{ class = "ROGUE", level = 100, }, --x
	--++ Outlaw ++ 	
	["Geisterhafter Stoß"] =	{ class = "ROGUE", level = 15, }, --7n
	["Pistolenheld"] = 			{ class = "ROGUE", level = 15, }, --7n
	["Schwertmeister"] = 			{ class = "ROGUE", level = 15, }, --7n
	["Akrobatische Attacken"] = 	{ class = "ROGUE", level = 30, }, --7n
	["Greifhaken"] = 		{ class = "ROGUE", level = 30, }, --7n
	["Drauf und weg"] = 			{ class = "ROGUE", level = 30, }, --7n
	["Eiserner Magen"] = 			{ class = "ROGUE", level = 60, }, --7n
	["Schmutzige Tricks"] = 			{ class = "ROGUE", level = 75, },
	["Parley"] = 				{ class = "ROGUE", level = 75, }, --7n
	["Kanonenkugelsalve"] = 	{ class = "ROGUE", level = 90, }, --7n
	["Mordlust"] = 		{ class = "ROGUE", level = 90, }, --7m
	["Zerhäckseln"] = 		{ class = "ROGUE", level = 100, }, --7m	
	--++ Subtlety ++  	
	["Düstere Klinge"] = 			{ class = "ROGUE", level = 15, }, --7n	
	["Meister des hinterhältigen Angriffs"] = 	{ class = "ROGUE", level = 15 }, --7m
	["Waffenmeister"] = 			{ class = "ROGUE", level = 15, }, --7n
	["Labende Finsternis"] = 	{ class = "ROGUE", level = 60, }, --7n
	["Schlag aus den Schatten"] = { class = "ROGUE", level = 75, }, --7n
	["Nachtranken"] = 			{ class = "ROGUE", level = 75 }, --7n
	["Dunkler Schatten"] = 		{ class = "ROGUE", level = 90 }, --7.2.5n	
	["Einhüllende Schatten"] = 	{ class = "ROGUE", level = 100, }, --7n
--	["Konzentration"] = 		{ class = "ROGUE", level = 90, }, --7.2.5r
	["Meister der Schatten"] = 	{ class = "ROGUE", level = 100, }, --7n
--++ Rogue PvP Talents ++
--	["In Stücke schneiden"] = 	{ class = "ROGUE", level = 100, }, --7.2.5r
	["Rüstung plündern"] = 		{ class = "ROGUE", level = 100, }, --7n
	["Neurotoxin"] = 			{ class = "ROGUE", level = 100, }, --7.2.5m
	["Schattenhaftes Duell"] = 	{ class = "ROGUE", level = 100, }, --7n
	["Zerlegen"] = 				{ class = "ROGUE", level = 100, }, --7n
	["Rauchbombe"] = 			{ class = "ROGUE", level = 100, }, --7n
	["Kaltblütigkeit"] = 		{ class = "ROGUE", level = 100, }, --7n
	["Tückische Klinge"] = 		{ class = "ROGUE", level = 100, }, --7.2.5m		

--++ Shaman Abilities ++
	["Totem deaktivieren"] = 	{ class = "SHAMAN", level = 1, }, --7n??
	["Geist der Ahnen"] = 		{ class = "SHAMAN", level = 14, },
	["Geisterwolf"] = 			{ class = "SHAMAN", level = 16, },
	["Wasserwandeln"] = 		{ class = "SHAMAN", level = 24, },
	["Fernsicht"] = 			{ class = "SHAMAN", level = 36, },
	["Verhexen"] = 				{ class = "SHAMAN", level = 42, },
	["Astraler Rückruf"] = 		{ class = "SHAMAN", level = 44, },	
	["Astralverschiebung"] = 	{ class = "SHAMAN", level = 52, },	
	["Reinigen"] = 				{ class = "SHAMAN", level = 58, },	
	["Kampfrausch"] = 			{ class = "SHAMAN", level = 65, },
	["Heldentum"] = 			{ class = "SHAMAN", level = 65, },
--++ Shaman Artifact Traits ++
	["Schicksalswinde"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Gabe der Königin"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Sturmhüter"] = 			{ class = "SHAMAN", level = 100, }, --7n
--++ Shaman Specialization ++
	--++ Elemental/Enhancement/Restoration ++
	["Blitzschlag"] = 		{ class = "SHAMAN", level = 1, }, --7m		
	["Heilende Woge"] = 		{ class = "SHAMAN", level = 7, }, --7m		
	["Windstoß"] = 			{ class = "SHAMAN", level = 22, }, --7m	
	--++ Elemental/Enhancement ++
	["Mahlstromsteuerung"] = 	{ class = "SHAMAN", level = 3, }, --7n??	
	["Geistläuterung"] = 		{ class = "SHAMAN", level = 18, }, --7m
	--++ Elemental/Restoration ++ 
	["Flammenschock"] = 			{ class = "SHAMAN", level = 3, }, --7m	
	["Lavaeruption"] = 			{ class = "SHAMAN", level = 12, },
	["Kettenblitzschlag"] = 		{ class = "SHAMAN", level = 28, }, --7m		
	["Lavasog"] = 			{ class = "SHAMAN", level = 38, },	
	--++ Elemental ++ 
	["Entladung"] = 			{ class = "SHAMAN", level = 1, },	
	["Erdschock"] = 			{ class = "SHAMAN", level = 3, }, --x 
	["Elementarfuror"] = 		{ class = "SHAMAN", level = 10, }, 
	["Spirituelle Einsicht"] = 	{ class = "SHAMAN", level = 10, },	
	["Gewitter"] = 			{ class = "SHAMAN", level = 16, },
	["Frostschock"] = 			{ class = "SHAMAN", level = 22, }, --7m
	["Elementarfokus"] = 		{ class = "SHAMAN", level = 40, }, 
	["Feuerelementar"] = 		{ class = "SHAMAN", level = 48, }, --7n	
	["Totem des Erdbebens"] = 		{ class = "SHAMAN", level = 52, }, --7n	 
	["Erdelementar"] = 		{ class = "SHAMAN", level = 72, }, --7n	
	["Elementarüberladung"] = 	{ class = "SHAMAN", level = 78, },
	--++ Enhancement ++
--	["Kritische Treffer"] = 		{ class = "DRUID", level = 1, }, --x Conflict
	["Lavapeitsche"] = 			{ class = "SHAMAN", level = 10, },
	["Felsbeißer"] = 			{ class = "SHAMAN", level = 10, }, --7n	
	["Flammenzunge"] = 			{ class = "SHAMAN", level = 12, }, --7n
	["Frostbrand"] = 			{ class = "SHAMAN", level = 19, }, --7n	
	["Sturmschlag"] = 			{ class = "SHAMAN", level = 26, },
	["Tobende Blitze"] = 		{ class = "SHAMAN", level = 28, }, --7n
	["Windzorn"] = 				{ class = "SHAMAN", level = 30, }, --7n
	["Sturmpeitsche"] = 			{ class = "SHAMAN", level = 38, }, --7n
	["Sturmbringerr"] = 			{ class = "SHAMAN", level = 40, }, --7n
	["Wildgeist"] = 			{ class = "SHAMAN", level = 48, }, --7n
	["Waffe des Mahlstroms"] = 		{ class = "SHAMAN", level = 52, },
	["Geisterpfoten"] = 			{ class = "SHAMAN", level = 72, },
	["Verstärkte Elemente"] = 	{ class = "SHAMAN", level = 78, },
	--++ Restoration ++
	["Springflut"] = 				{ class = "SHAMAN", level = 10, },
	["Totem des heilenden Flusses"] = 	{ class = "SHAMAN", level = 13, },	
	["Geistreinigung"] = 		{ class = "SHAMAN", level = 18, },
	["Kettenheilung"] = 			{ class = "SHAMAN", level = 26, }, --x Moved	
	["Rückstrom"] = 			{ class = "SHAMAN", level = 40, },
	["Vision der Ahnen"] = 		{ class = "SHAMAN", level = 44, }, --7n
	["Heilender Regen"] = 			{ class = "SHAMAN", level = 48, },
	["Flutwellen"] = 			{ class = "SHAMAN", level = 50, },
	["Totem der Heilungsflut"] = 	{ class = "SHAMAN", level = 54, }, 
	["Welle der Heilung"] = 			{ class = "SHAMAN", level = 56, },	
	["Totem der Geistverbindung"] = 	{ class = "SHAMAN", level = 62, },
	["Gunst des Geistwandlers"] = 	{ class = "SHAMAN", level = 72, }, 	
	["Tiefe Heilung"] = 			{ class = "SHAMAN", level = 78, },
--++ Shaman Talents ++
	["Totem des Windsturms"] = 		{ class = "SHAMAN", level = 30, }, --7n
	["Totem des Erdgriffs"] = 		{ class = "SHAMAN", level = 45, },
	["Totem der Blitzwoge"] = { class = "SHAMAN", level = 45, }, --7n
	["Voodoototem"] = 			{ class = "SHAMAN", level = 45, }, --7n
	["Aszendenz"] = 			{ class = "SHAMAN", level = 100, }, --7n	
	--++ Elemental/Enhancement ++
	["Schnelligkeit der Ahnen"] = 	{ class = "SHAMAN", level = 60, },	
	--++ Elemental/Restoration ++
	["Führung der Ahnen"] = 	{ class = "SHAMAN", level = 30, },
	["Rückenwind"] = 			{ class = "SHAMAN", level = 30, }, --7n
	["Echo der Elemente"] = 	{ class = "SHAMAN", level = 60, },	
	--++ Elemental ++	
	["Irdene Wut"] = 			{ class = "SHAMAN", level = 15, }, --7n
	["Weg der Flamme"] = 		{ class = "SHAMAN", level = 15, }, --7n
	["Totembeherrschung"] = 		{ class = "SHAMAN", level = 15, }, --7n
	["Nachbeben"] = 			{ class = "SHAMAN", level = 60, }, --7.1.5m
	["Elementarbeherrschung"] = 	{ class = "SHAMAN", level = 60, }, --7.1.5m	
	["Elementarschlag"] = 		{ class = "SHAMAN", level = 75, }, --7.1.5m
	["Elementare Fusion"] = 		{ class = "SHAMAN", level = 75, }, --x
	["Urelementarist"] = 	{ class = "SHAMAN", level = 75, },
	["Totem des flüssigen Magmas"] = 	{ class = "SHAMAN", level = 90, }, --7.1.5m
	["Sturmelementar"] = 		{ class = "SHAMAN", level = 90, }, --7n	
	["Eisfuror"] = 				{ class = "SHAMAN", level = 100, }, --7.1.5m	
	["Blitzableiter"] = 		{ class = "SHAMAN", level = 100, }, --7n	
	--++ Enhancement ++	
	["Heiße Hand"] = 				{ class = "SHAMAN", level = 15, }, --7n
	["Erdrutsch"] = 			{ class = "SHAMAN", level = 15, }, --7.2.5m	
	["Windweise"] = 			{ class = "SHAMAN", level = 15, }, --7n
	["Wildes Anspringen"] = 			{ class = "SHAMAN", level = 30, }, --7n
	["Regenschauer"] = 				{ class = "SHAMAN", level = 30, }, --7n
	["Hagelsturm"] = 			{ class = "SHAMAN", level = 60, }, --7n
	["Blitzschlagschild"] = 		{ class = "SHAMAN", level = 60, }, --7m
	["Machterfüllte Sturmpeitsche"] = 	{ class = "SHAMAN", level = 75, }, --7n
	["Überladen"] = 			{ class = "SHAMAN", level = 75, }, --7n
	["Sturmgewitter"] = 				{ class = "SHAMAN", level = 75, }, --7n
	["Tosender Sturm"] = 		{ class = "SHAMAN", level = 90, }, --7n
	["Zorn der Luft"] = 			{ class = "SHAMAN", level = 90, }, --7n
	["Zerschlagung"] = 			{ class = "SHAMAN", level = 90, }, --7n
	["Felsfaust"] = 			{ class = "SHAMAN", level = 100, }, --7.2.5m	
	["Irdener Stachel"] = 		{ class = "SHAMAN", level = 100, }, --7n
	--++ Restoration ++
	["Strom"] = 				{ class = "SHAMAN", level = 15, }, --7n
	["Wogen"] = 			{ class = "SHAMAN", level = 15, }, --7n
	["Agiler Geist"] = 		{ class = "SHAMAN", level = 30, }, --7n
	["Brandende Wellen"] = 		{ class = "SHAMAN", level = 60, }, --7n
	["Regenguss"] = 				{ class = "SHAMAN", level = 60, }, --7n
	["Totem des Schutzes der Ahnen"] = { class = "SHAMAN", level = 75, }, --7n
	["Seelenstärke der Ahnen"] = 		{ class = "SHAMAN", level = 75, }, --7n
	["Totem des irdenen Schilds"] = 	{ class = "SHAMAN", level = 75, }, --7n
	["Endlose Tiefe"] = 	{ class = "SHAMAN", level = 90, }, --7n
	["Totem des Wolkenbruchs"] = 		{ class = "SHAMAN", level = 90, }, --x
	["Hochwasser"] = 			{ class = "SHAMAN", level = 100, }, --x
	["Lebensquell"] = 			{ class = "SHAMAN", level = 100, }, --7n
--++ Shaman PvP Talents ++
	["Erdschild"] = 			{ class = "SHAMAN", level = 100, }, --7n
	["Geistverbindung"] = 			{ class = "SHAMAN", level = 100, }, --7n
	["Totem des Himmelszorns"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Totem des Gegenschlags"] = 	{ class = "SHAMAN", level = 100, }, --7n
	["Totem des Windzorns"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Totem der Erdung"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Donnerladung"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Kontrolle über Lava"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Blitzschlaglasso"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Astralgestalt"] = 		{ class = "SHAMAN", level = 100, }, --7n

--++ Warlock Abilities ++
	["Chaossperrfeuer"] = 		{ class = "WARLOCK", level = 1, }, --7n??
	["Seele entziehen"] = 			{ class = "WARLOCK", level = 1, },  --7m??
	["Chaosblitz"] = 			{ class = "WARLOCK", level = 1, }, --7m ??
	["Schattenblitz"] = 			{ class = "WARLOCK", level = 1, }, --7 ??
	["Seelensplitter"] = 		{ class = "WARLOCK", level = 1, }, --7.2.5n		
	["Wichtel beschwören"] = 			{ class = "WARLOCK", level = 1, },	
	["Gesundheitsstein herstellen"] = 	{ class = "WARLOCK", level = 5, },	
	["Leerwandler beschwören"] = 	{ class = "WARLOCK", level = 8, },
	["Dämon kontrollieren"] = 		{ class = "WARLOCK", level = 10, },
	["Furcht"] = 					{ class = "WARLOCK", level = 16, },
	["Seelenstein"] = 			{ class = "WARLOCK", level = 18, },
	["Lebenslinie"] = 		{ class = "WARLOCK", level = 19, },	
	["Teufelsross"] = 				{ class = "WARLOCK", level = 20, },	--7n 
	["Auge von Kilrogg"] = 		{ class = "WARLOCK", level = 22, },
	["Unendlicher Atem"] = 		{ class = "WARLOCK", level = 24, },
	["Sukkubus beschwören"] = 		{ class = "WARLOCK", level = 28, },	
	["Dämon kommandieren"] = 		{ class = "WARLOCK", level = 31, },	
	["Verbannen"] = 				{ class = "WARLOCK", level = 32, },	
	["Teufelsjäger beschwören"] = 		{ class = "WARLOCK", level = 35, },
	["Schreckensross"] = 			{ class = "WARLOCK", level = 40, },	--7n
	["Höllenbestie beschwören"] = 		{ class = "WARLOCK", level = 50, },
	["Dämonensklave"] = 		{ class = "WARLOCK", level = 54, },
	["Verdammniswache beschwören"] = 		{ class = "WARLOCK", level = 58, },
	["Erbarmungslose Entschlossenheit"] = 		{ class = "WARLOCK", level = 62, },
	["Seelenbrunnen erschaffen"] = 		{ class = "WARLOCK", level = 65, },
	["Ritual der Beschwörung"] = 	{ class = "WARLOCK", level = 72, },	
	["Dämonisches Tor"] = 		{ class = "WARLOCK", level = 87, }, 
--++ Warlock Artifact Traits ++
	["Dimensionsriss"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Seelen ernten"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Thal'kiels Verzehr"] = 	{ class = "WARLOCK", level = 100, }, --7n
--++ Warlock Specialization ++
	--++ Affliction/Demonology/Destruction ++	
	["Aderlass"] = 				{ class = "WARLOCK", level = 16, }, --x Moved
	--++ Affliction ++
	["Verderbnis"] = 			{ class = "WARLOCK", level = 3, }, --7m
	["Agonie"] = 				{ class = "WARLOCK", level = 10, },
	["Instabiles Gebrechen"] = 	{ class = "WARLOCK", level = 10, },
--	["Geheimnisse des Nekrolythen"] = 	{ class = "WARLOCK", level = 10, },	--7.1.5r
	["Blutsauger"] = 			{ class = "WARLOCK", level = 13, }, --7.1.5m
	["Seelendieb"] = 			{ class = "WARLOCK", level = 13, }, --7.1.5m	
	["Saat der Verderbnis"] = 	{ class = "WARLOCK", level = 38 },
	["Potente Gebrechen"] = 	{ class = "WARLOCK", level = 78, },
	--++ Demonology ++
	["Hand von Gul'dan"] = 		{ class = "WARLOCK", level = 10, },		
	["Dämonische Ermächtigung"] = 	{ class = "WARLOCK", level = 12, },	--7n
	["Schreckenspirscher rufen"] = 	{ class = "WARLOCK", level = 14, }, --7n
	["Verdammnis"] = 					{ class = "WARLOCK", level = 26, }, --x	
	["Dämonenzorn"] = 			{ class = "WARLOCK", level = 36, }, --7n
	["Teufelswache beschwören"] = 		{ class = "WARLOCK", level = 40, },
	["Seelenverbindung"] = 			{ class = "WARLOCK", level = 42, },	
	["Meister der Dämonologie"] = 	{ class = "WARLOCK", level = 78, },
	--++ Destruction ++
	["Feuerbrand"] = 				{ class = "WARLOCK", level = 10, },	
	["Verbrennen"] = 			{ class = "WARLOCK", level = 10, },
	["Feuersbrunst"] = 			{ class = "WARLOCK", level = 10, },
	["Feuerregen"] = 			{ class = "WARLOCK", level = 38, }, 
	["Verwüstung"] = 				{ class = "WARLOCK", level = 40, },
	["Chaotische Energien"] = 		{ class = "WARLOCK", level = 78, }, --7n
--++ Warlock Talents ++
	["Dämonischer Zirkel: Beschwörung"] = { class = "WARLOCK", level = 45, }, --7m	
	["Weltliche Ängste"] = 			{ class = "WARLOCK", level = 45, },
	["Seelenernte"] = 			{ class = "WARLOCK", level = 60, }, --7m	
	["Brennender Ansturm"] = 			{ class = "WARLOCK", level = 75, },
	["Dunkler Pakt"] = 			{ class = "WARLOCK", level = 75, }, --7n
	["Dämonenhaut"] = 			{ class = "WARLOCK", level = 75, }, --7n
	["Grimoire der Dienstbarkeit"] = 	{ class = "WARLOCK", level = 90, },
	["Grimoire der Überlegenheit"] = { class = "WARLOCK", level = 90, },
	["Seelenverbindung"] = 			{ class = "WARLOCK", level = 100, }, --7n
	--++ Affliction/Destruction ++
--	["Manadurst"] = 			{ class = "WARLOCK", level = 30, }, --7.1.5r
	["Mächtiger Aderlass"] = 	{ class = "WARLOCK", level = 30, }, --7.1.5n	
	["Grimoire der Opferung"] = { class = "WARLOCK", level = 90, },
	--++ Demonology/Destruction ++
	["Schattenfuror"] = 			{ class = "WARLOCK", level = 45, }, 	
	--++ Affliction ++	
	["Heimsuchung"] = 				{ class = "WARLOCK", level = 15, },	--7m
	["Bösartiger Griff"] = 		{ class = "WARLOCK", level = 15, },	--7.1.5n		
	["Höllenqual"] = 		{ class = "WARLOCK", level = 15, }, --7n
	["Absolute Verderbnis"] = 	{ class = "WARLOCK", level = 30, }, --7n 
	["Ansteckung"] = 			{ class = "WARLOCK", level = 30, }, --7n 
	["Schreckensgeheul"] = 		{ class = "WARLOCK", level = 45, }, --x 
	["Aussaat"] = 		{ class = "WARLOCK", level = 60, }, --7n 
	["Phantomsingularität"] = 	{ class = "WARLOCK", level = 60, }, --7.2.5m
	["Umarmung des Todes"] = 	{ class = "WARLOCK", level = 100, }, --7.2.5n 
	["Lebensentzug"] = 			{ class = "WARLOCK", level = 100, }, --7.2.5m	
--	["Seelenbildnis"] = 		{ class = "WARLOCK", level = 100, }, --7.2.5r 
	--++ Demonology ++
	["Dämonischer Ruf"] = 		{ class = "WARLOCK", level = 15, }, --7n 
	["Schattenflamme"] = 			{ class = "WARLOCK", level = 15, }, --7n
	["Schattenhafte Inspiration"] = 	{ class = "WARLOCK", level = 15, }, --7n 
	["Drohende Verdammnis"] = 		{ class = "WARLOCK", level = 30, }, --7n 
	["Implosion"] = 			{ class = "WARLOCK", level = 30, }, --7n 
	["Verbesserte Schreckenspirscher"] = { class = "WARLOCK", level = 30, }, --7n 
	["Hand der Verdammnis"] = 			{ class = "WARLOCK", level = 60, }, --7n 
	["Machtrausch"] = 			{ class = "WARLOCK", level = 60, }, --7n 
	["Grimoire der Synergie"] = 	{ class = "WARLOCK", level = 90, }, --x
	["Dämonenblitz"] = 			{ class = "WARLOCK", level = 100, }, --x
	["Dunkelblick beschwören"] = 		{ class = "WARLOCK", level = 100, }, --7n 
	--++ Destruction ++
	["Pyrolyse"] = 			{ class = "WARLOCK", level = 15 }, --7m
	["Loderndes Feuer"] = 		{ class = "WARLOCK", level = 15, }, --7n
	["Schattenbrand"] = 			{ class = "WARLOCK", level = 15, },
	["Ausrottung"] = 			{ class = "WARLOCK", level = 30, }, --7.1.5m
	["Entropieumkehrung"] = 		{ class = "WARLOCK", level = 30, }, --7n
	["Kataklysmus"] = 			{ class = "WARLOCK", level = 60, }, --7.1.5m
	["Feuer und Schwefel"] = 	{ class = "WARLOCK", level = 60, }, --7m
	["Dämonenfeuer kanalisieren"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Verwüstung anrichten"] = 			{ class = "WARLOCK", level = 100, }, --7n
--++ Warlock PvP Talents ++
--	["Seelentausch"] = 			{ class = "WARLOCK", level = 100, }, --7.1.5r
	["Fluch der Schatten"] = 		{ class = "WARLOCK", level = 100, }, --7.1.5n	
	["Fluch der Sprachen"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Fluch der Schwäche"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Fluch der Zerbrechlichkeit"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Fluch der Verwüstung"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Beobachter rufen"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Feuerstein"] = 			{ class = "WARLOCK", level = 100, }, --7n
	["Netherzauberschutz"] = 			{ class = "WARLOCK", level = 100, }, --7n
	["Teufelslord rufen"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Teufelsjäger rufen"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Magie versengen"] = 			{ class = "WARLOCK", level = 100, }, --7n
--	["Seelenbrand"] = 				{ class = "WARLOCK", level = 100, }, --7.1.5r
	["Seele brechen"] = 			{ class = "WARLOCK", level = 100, }, --7.1.5n	
	["Beschwörungskreis"] = 		{ class = "WARLOCK", level = 100, }, --7n

--++ Warrior Abilities ++
	["Angreifen"] = 				{ class = "WARRIOR", level = 1, }, --7n
--	["Blocken"] = 				{ class = "WARRIOR", level = 1, }, --7 Conflict
--	["Parieren"] = 				{ class = "WARRIOR", level = 1, }, --7 Conflict
	["Sturmangriff"] = 				{ class = "WARRIOR", level = 3, },
	["Spott"] = 				{ class = "WARRIOR", level = 14, },
	["Heldenhafter Wurf"] = 			{ class = "WARRIOR", level = 22, },
	["Zuschlagen"] = 				{ class = "WARRIOR", level = 24, },
	["Heldenhafter Sprung"] = 			{ class = "WARRIOR", level = 26, },	
	["Tiefe Wunden"] = 			{ class = "WARRIOR", level = 32, }, --x Moved
--++ Warrior Artifact Traits ++
	["Neltharions Zorn"] = 		{ class = "WARRIOR", level = 100, }, --7n
	["Odyns Zorn"] = 			{ class = "WARRIOR", level = 100, }, --7n
	["Kriegsbrecher"] = 		{ class = "WARRIOR", level = 100, }, --7n
--++ Warrior Specialization ++
	--++ Arms/Fury/Protection ++
	["Fokussierte Wut"] = 			{ class = "WARRIOR", level = 12, }, --7.1.5m
	["Berserkerwut"] = 		{ class = "WARRIOR", level = 40, }, --7m
	["Kampfschrei"] = 			{ class = "WARRIOR", level = 60, },	--7n
	--++ Arms/Fury ++
	["Hinrichten"] = 				{ class = "WARRIOR", level = 8, }, --7m
	["Wirbelwind"] = 			{ class = "WARRIOR", level = 28, },		
	["Drohruf"] = 	{ class = "WARRIOR", level = 70, }, --7m
	["Befehlsruf"] = 		{ class = "WARRIOR", level = 83, },	
	--++ Arms/Protection ++	
	["Siegesrausch"] = 			{ class = "WARRIOR", level = 10 }, --7m
	--++ Arms ++	
	["Zerschmettern"] = 					{ class = "WARRIOR", level = 1, },	
	["Tödlicher Stoß"] = 		{ class = "WARRIOR", level = 5, },
--	["Kampferfahrung"] = 		{ class = "WARRIOR", level = 10, },
	["Kolossales Schmettern"] = 		{ class = "WARRIOR", level = 18, }, --x Moved	
	["Taktiker"] = 			{ class = "WARRIOR", level = 18, }, --7n	
	["Spalten"] = 				{ class = "WARRIOR", level = 32 }, --7m
	["Kniesehne"] = 			{ class = "WARRIOR", level = 36, }, --7m
	["Durch das Schwert umkommen"] = 		{ class = "WARRIOR", level = 50, },
	["Klingensturm"] = 			{ class = "WARRIOR", level = 75, },	--7m ??
	["Kolossale Macht"] = 		{ class = "WARRIOR", level = 78, },	--7n
	--++ Fury ++
	["Blutdurst"] = 			{ class = "WARRIOR", level = 10, },
	["Wutanfall"] = 				{ class = "WARRIOR", level = 10, }, --x Moved	
	["Wütendes Schlitzen"] = 		{ class = "WARRIOR", level = 10, }, --7n		
	["Titanengriff"] = 			{ class = "WARRIOR", level = 10, }, 
	["Wütende Regeneration"] = 	{ class = "WARRIOR", level = 12, }, --7m
	["Wütender Schlag"] = 			{ class = "WARRIOR", level = 13, },
	["Toben"] = 				{ class = "WARRIOR", level = 18, },	 --7n
	["Durchdringendes Heulen"] = 		{ class = "WARRIOR", level = 26, }, --7m
	["Zielstrebiger Furor"] = 	{ class = "WARRIOR", level = 38, }, 
	["Metzger"] = 			{ class = "WARRIOR", level = 58, }, 
	["Ungezügelte Wut"] = 		{ class = "WARRIOR", level = 78, },
	--++ Protection ++  
	["Verteidigungshaltung"] = 		{ class = "WARRIOR", level = 9, }, --7m	 ??
--	["Resolve"] = 				{ class = "WARRIOR", level = 10, }, --x Conflict
	["Schildschlag"] = 			{ class = "WARRIOR", level = 10, },
	["Unnachgiebiger Wächter"] = 	{ class = "WARRIOR", level = 10, },
	["Verwüsten"] = 			{ class = "WARRIOR", level = 12, },
	["Donnerknall"] = 			{ class = "WARRIOR", level = 16, }, --x Moved	
	["Schildblock"] = 			{ class = "WARRIOR", level = 18, },	
	["Rache"] = 				{ class = "WARRIOR", level = 28, },
	["Zähne zusammenbeißen"] = 			{ class = "WARRIOR", level = 34, }, --7n
	["Letztes Gefecht"] = 			{ class = "WARRIOR", level = 36, },
	["Schildwall"] = 			{ class = "WARRIOR", level = 48, }, --x Moved
	["Demoralisierender Ruf"] = 	{ class = "WARRIOR", level = 50, },
	["Verteidigungsbastion"] = 	{ class = "WARRIOR", level = 60, },
	["Zauberreflexion"] = 		{ class = "WARRIOR", level = 65, }, --7m
	["Abfangen"] = 			{ class = "WARRIOR", level = 72, }, --7n
--	["Ripsote"] = 				{ class = "WARRIOR", level = 76, }, --7 Conflict
	["Kritisches Blocken"] = 		{ class = "WARRIOR", level = 78, },
--++ Warrior Talents ++
	--++ Arms/Fury/Protection ++	
	["Schockwelle"] = 			{ class = "WARRIOR", level = 15, }, --7??
	["Sturmblitz"] = 			{ class = "WARRIOR", level = 15, }, --7?? 
	["Riesenschritte"] = 		{ class = "WARRIOR", level = 60, }, --7n	
	--++ Arms/Fury ++	
	["Doppelt hält besser"] = 			{ class = "WARRIOR", level = 30, },	
	--++ Arms/Protection ++	
	["Aggressionsmanagement"] = 		{ class = "WARRIOR", level = 100, }, --x
	["Verheerer"] = 				{ class = "WARRIOR", level = 100, }, --x	
	--++ Arms ++
	["Unerschrocken"] = 			{ class = "WARRIOR", level = 15, }, --7n
	["Überwältigen"] = 			{ class = "WARRIOR", level = 15, }, --7m	
	["Weitreichende Stöße"] = 		{ class = "WARRIOR", level = 15, },
	["Verwunden"] =				 	{ class = "WARRIOR", level = 45, }, --7m	
	["Avatar"] = 				{ class = "WARRIOR", level = 45, },
	["Trauma"] = 				{ class = "WARRIOR", level = 45, }, --7.2.5m	
	["Kräfte sammeln"] = 			{ class = "WARRIOR", level = 60, },
	["Schlachteifer"] = 		{ class = "WARRIOR", level = 75, }, --7.2.5m	
	["Tödliche Combo"] = 			{ class = "WARRIOR", level = 75, }, --7n
	["Macht der Titanen"] = 		{ class = "WARRIOR", level = 75, }, --7.2.5m
	["Tödliche Gelassenheit"] = 			{ class = "WARRIOR", level = 90, }, --7n ??
	["Tödliche Gelassenheit"] = 			{ class = "WARRIOR", level = 90, }, --7.2.5m ??
	["Dem Tode geweiht"] = 		{ class = "WARRIOR", level = 90, }, --7.2.5m
	["Zusätzliche Angriffe"] = 	{ class = "WARRIOR", level = 100, }, --7n??
	--++ Fury ++
	["Kriegsmaschine"] = 			{ class = "WARRIOR", level = 15, }, --7n	
	["Endlose Wut"] = 			{ class = "WARRIOR", level = 15, }, --7n	
	["Frischfleisch"] = 			{ class = "WARRIOR", level = 15, }, --7n
	["Abrissbirne"] = 		{ class = "WARRIOR", level = 45, }, --7n
	["Wutausbruch"] = 				{ class = "WARRIOR", level = 45, }, --7n
	["Wütender Ansturm"] = 		{ class = "WARRIOR", level = 60, }, --7n
	["Kriegsbemalung"] = 				{ class = "WARRIOR", level = 60, }, --7n
	["Massaker"] = 				{ class = "WARRIOR", level = 75, }, --7n
	["Wutschäumender Berserker"] =	{ class = "WARRIOR", level = 75, }, --7n
	["Gemetzel"] = 				{ class = "WARRIOR", level = 75, }, --7n
	["Blutbad"] = 			{ class = "WARRIOR", level = 90, },
	["Raserei"] = 				{ class = "WARRIOR", level = 90, }, --7n
	["Innere Wut"] = 			{ class = "WARRIOR", level = 90, }, --7n
	["Waghalsigkeit"] = 		{ class = "WARRIOR", level = 100, }, --7n
	["Drachengebrüll"] = 			{ class = "WARRIOR", level = 100, }, 
	--++ Protection ++
	["Kriegstreiber"] = 			{ class = "WARRIOR", level = 15, }, 
	["Bevorstehender Sieg"] = 	{ class = "WARRIOR", level = 30, },
	["Inspirierende Präsenz"] = 	{ class = "WARRIOR", level = 30, }, --x	
	["Sicherung"] = 			{ class = "WARRIOR", level = 30, },
	["Rache ist süß"] = 		{ class = "WARRIOR", level = 45, }, --7.1.5m	
	["Erneuerte Wut"] = 			{ class = "WARRIOR", level = 45, }, --7n	
--	["Ultimatum"] = 			{ class = "WARRIOR", level = 45, }, --7.1.5r
	["Herausforderung des Kriegsherren"] = 	{ class = "WARRIOR", level = 60, }, --7n
	["Knisternder Donner"] = 	{ class = "WARRIOR", level = 60, }, --7n
	["Verwüster"] = 			{ class = "WARRIOR", level = 75, }, --7.1.5n
	["Unbezähmbar"] = 			{ class = "WARRIOR", level = 75, }, --7n
	["Blutrache"] = 			{ class = "WARRIOR", level = 90, }, --7m
	["Auf ins Getümmel"] = 		{ class = "WARRIOR", level = 90, }, --7n
	["Donnernde Stimme"] = 		{ class = "WARRIOR", level = 90, }, --7n
	["Heftige Rückwirkungen"] = 	{ class = "WARRIOR", level = 100, }, --x	
--++ Warrior PvP Talents ++
	["Entwaffnen"] = 			{ class = "WARRIOR", level = 100, }, --7.1.5n
	["Duell"] = 				{ class = "WARRIOR", level = 100, }, --7.1.5n
	["Abfangen"] = 				{ class = "WARRIOR", level = 100, }, --7n
	["Klinge schärfen"] = 		{ class = "WARRIOR", level = 100, }, --7n
	["Schildhieb"] = 			{ class = "WARRIOR", level = 100, }, --7n
	["Todeswunsch"] = 			{ class = "WARRIOR", level = 100, }, --7n
	["Ansturm des Drachen"] = 	{ class = "WARRIOR", level = 100, }, --7n
	["Leibwächter"] = 			{ class = "WARRIOR", level = 100, }, --7n
	["Massenzauberreflexion"] = { class = "WARRIOR", level = 100, }, --7n
	["Zauberreflexion"] = 		{ class = "WARRIOR", level = 100, }, --7n 
	["Kriegsbanner"] = 			{ class = "WARRIOR", level = 100, }, --7.1.5n	
};
