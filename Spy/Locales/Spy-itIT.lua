local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "ptIT")
if not L then return end


--Informazioni Addon
L ["Spy"] = "Spy"
L ["versione"] = "Versione"
L ["LoadDescription"] = "addon |cff9933ffSpy caricato. Tipo |cffffffff/spy|cff9933ff per le opzioni".
L ["SpyEnabled"] = "|cff9933ffSpy addon abilitato."
L ["SpyDisabled"] = "addon |cff9933ffSpy disabilitato. Tipo show|cff9933ff |cffffffff/spia per abilitare".
L ["UpgradeAvailable"] = "|cff9933ffA nuova versione di Spy è disponibile. Può essere scaricato da: \n| cffffffffhttps://mods.curse.com/addons/wow/spy"

--Stringhe di configurazione
L ["profili"] = "Profili"

L ["GeneralSettings"] = "Impostazioni generali"
L ["SpyDescription1"] = [[
Spy è un addon che vi avviserà della presenza di giocatori nemici nelle vicinanze.
]]
L ["SpyDescription2"] = [[
 
|cffffd000Nearby list|cffffffff
Nell'elenco nelle vicinanze vengono visualizzati eventuali giocatori nemici che sono stati rilevati nelle vicinanze. Facendo clic su elenco consente di indirizzare il giocatore, però questo funziona solo fuori di combattimento. I giocatori vengono rimossi dall'elenco se non sono stati rilevati dopo un periodo di tempo.

Il pulsante Annulla nella barra del titolo può essere utilizzato per cancellare l'elenco, e tenendo premuto Control mentre cancellare la lista vi permetterà di attivare o disattivare rapidamente Spy.

|cffffd000Last ore list|cffffffff
La lista di ultima ora Visualizza tutti i nemici che sono stati rilevati nell'ultima ora.

|cffffd000Ignore list|cffffffff
I giocatori che sono aggiunti alla lista Ignore non verranno segnalati da spia. È possibile aggiungere e rimuovere i giocatori da questo elenco utilizzando il menu a discesa del pulsante o tenendo premuto il tasto Control mentre si fa clic sul pulsante.

|cffffd000Kill in vista list|cffffffff
I giocatori nella tua lista di uccidere su vista causano un allarme sonoro quando rilevato. È possibile aggiungere e rimuovere i giocatori da questa lista utilizzando il menu a discesa del pulsante o tenendo premuto il tasto MAIUSC mentre si fa clic sul pulsante.

Utilizzabile anche il menu a discesa per impostare le ragioni perché hai qualcuno aggiunto all'elenco di uccidere su vista. Se volete inserire un motivo specifico che non è nell'elenco, quindi utilizzare il "Inserisci il tuo motivo..." in Altro elenco.
 
 
|cffffd000Author: http://www.curse.com/users/slipjack |cffffffff
 
]]
L ["EnableSpy"] = "Attiva spia"
L ["EnableSpyDescription"] = "attiva o disattiva Spy sia ora che anche in login".
L ["EnabledInBattlegrounds"] = "Attiva spia in campi di battaglia"
L ["EnabledInBattlegroundsDescription"] = "Attiva o disattiva la spia quando sei in un campo di battaglia."
L ["EnabledInArenas"] = "Attiva spia nelle arene"
L ["EnabledInArenasDescription"] = "Attiva o disattiva la spia quando siete in un arena."
L ["EnabledInWintergrasp"] = "Attiva spia in zone di combattimento mondiale"
L ["EnabledInWintergraspDescription"] = "Attiva o disattiva la spia quando si è in zone di combattimento mondiale quali Lake Wintergrasp in Northrend."
L ["DisableWhenPVPUnflagged"] = "Disable spia quando non contrassegnati per PVP"
L ["DisableWhenPVPUnflaggedDescription"] = "Attiva o disattiva la spia a seconda del tuo stato PVP."
 
L ["DisplayOptions"] = "Display"
L ["DisplayOptionsDescription"] = [[
Spia può essere visualizzata o nascosta automaticamente.
]]
L ["ShowOnDetection"] = "Visualizza Spy quando vengono rilevati i giocatori nemici"
L ["ShowOnDetectionDescription"] = "Imposta questo per visualizzare la finestra di Spy e l'elenco nelle vicinanze se la spia è nascosto quando vengono rilevati i giocatori nemici."
L ["HideSpy"] = "Nascondi Spy quando non vengono rilevati giocatori nemici"
L ["HideSpyDescription"] = "imposta questo nascondere Spy quando viene visualizzato l'elenco nelle vicinanze e diventa vuota. Spy sarà non nascosto se si cancella la lista manualmente."
L ["LockSpy"] = "Blocca la finestra spia"
L ["LockSpyDescription"] = "Blocca la finestra spia in posto così non si muove".
L ["InvertSpy"] = "Inverti la finestra spia"
L ["InvertSpyDescription"] = "Capovolge sottosopra la finestra spia."
L ["ResizeSpy"] = "Ridimensionare automaticamente la finestra spia"
L ["ResizeSpyDescription"] = "Imposta questo per ridimensionare automaticamente la finestra spia come giocatori nemici vengono aggiunti e rimossi".
L ["TooltipDisplayWinLoss"] = "Visualizza statistiche di vincita/perdita nel tooltip"
L ["TooltipDisplayWinLossDescription"] = "Imposta questo per visualizzare le statistiche di vincita/perdita di un giocatore nel tooltip del giocatore".
L ["TooltipDisplayKOSReason"] = "Motivi di Display di uccidere a vista nel tooltip"
L ["TooltipDisplayKOSReasonDescription"] = "Imposta questo per visualizzare il Kill su motivi di vista di un giocatore nel tooltip del giocatore".
L ["TooltipDisplayLastSeen"] = "Dettagli Display visto l'ultima volta nel tooltip"
L ["TooltipDisplayLastSeenDescription"] = "Imposta questo per visualizzare l'ultima volta di noto e la posizione di un giocatore nel tooltip del giocatore".
 
L ["AlertOptions"] = "Avvisi"
L ["AlertOptionsDescription"] = [[
Si può annunciare i dettagli su un incontro a una chat di canale e controllano come spia avvisa l'utente quando vengono rilevati i giocatori nemici.
]]
L ["annunciare"] = "annunciare a:"
L ["nessuno"] = "None"
L ["NoneDescription"] = "non annunciare quando vengono rilevati i giocatori nemici."
L ["Self"] = "Auto"
L ["SelfDescription"] = "Annuncio a te stesso quando vengono rilevati i giocatori nemici."
L ["Party"] = "Party"
L ["PartyDescription"] = "Annunciare al vostro partito quando vengono rilevati i giocatori nemici."
L ["Gilda"] = "Guild"
L ["GuildDescription"] = "Annuncio alla tua gilda quando vengono rilevati i giocatori nemici."
L ["Raid"] = "Raid"
L ["RaidDescription"] = "Annuncio a vostro raid quando vengono rilevati i giocatori nemici."
L ["LocalDefense"] = "Difesa locale"
L ["LocalDefenseDescription"] = "Annuncio per il canale di difesa locale quando vengono rilevati i giocatori nemici."
L ["OnlyAnnounceKoS"] = "Annunciare solo giocatori nemici che sono di uccidere a vista"
L ["OnlyAnnounceKoSDescription"] = "Imposta questo per annunciare solo giocatori nemici che sono sul tuo uccidere lista vista."
L ["WarnOnStealth"] = "Avvisa al momento della rilevazione stealth"
L ["WarnOnStealthDescription"] = "Imposta questo per visualizzare un avviso e suonare un allarme quando un giocatore nemico guadagna stealth."
L ["WarnOnKOS"] = "Avvisa su Kill su rilevazione vista"
L ["WarnOnKOSDescription"] = "Imposta questo per visualizzare un avviso e suonare un allarme quando viene rilevato un giocatore nemico sul tuo uccidere lista vista."
L ["WarnOnKOSGuild"] = "Avvisa a uccidere il rilevamento Gilda Sight"
L ["WarnOnKOSGuildDescription"] = "Imposta questo per visualizzare un avviso e suonare un allarme quando viene rilevato un giocatore nemico nella stessa gilda come qualcuno sul tuo uccidere lista vista."
L ["DisplayWarningsInErrorsFrame"] = "Visualizza avvisi nella cornice errori"
L ["DisplayWarningsInErrorsFrameDescription"] = "Imposta questo utilizzare la cornice di errori per visualizzare avvisi anziché utilizzare le cornici grafiche pop-up".
L ["EnableSound"] = "Attiva gli avvisi audio"
L ["EnableSoundDescription"] = "imposta questo comando per attivare gli avvisi audio quando vengono rilevati i giocatori nemici. Avvisi diversi sound se un giocatore nemico guadagna stealth o se un giocatore nemico è sulla vostra lista di uccidere su vista."
 
L ["ListOptions"] = "Nelle vicinanze di lista"
L ["ListOptionsDescription"] = [[
È possibile configurare come Spy aggiunge e rimuove i giocatori nemici da e per l'elenco nelle vicinanze.
]]
L ["RemoveUndetected"] = "rimuovere giocatori nemici dall'elenco nelle vicinanze dopo:"
L ["1Min"] = "1 minuto"
L ["1MinDescription"] = "Rimuovi un giocatore nemico che è stato non rilevato per più di 1 minuto".
L ["2Min"] = "2 minuti"
L ["2MinDescription"] = "Rimuovi un giocatore nemico che è stato non rilevato per oltre 2 minuti."
L ["5Min"] = "5 minuti"
L ["5MinDescription"] = "Rimuovi un giocatore nemico che è stato non rilevato per oltre 5 minuti."
L ["10Min"] = "10 minuti"
L ["10MinDescription"] = "Rimuovi un giocatore nemico che è stato non rilevato da più di 10 minuti."
L ["15Min"] = "15 minuti"
L ["15MinDescription"] = "Rimuovi un giocatore nemico che è stato non rilevato per oltre 15 minuti".
L ["mai"] = "Non rimuovere mai"
L ["NeverDescription"] = "non rimuovere mai giocatori nemici. L'elenco nelle vicinanze può ancora essere cancellato manualmente."
L ["ShowNearbyList"] = "Cambia l'elenco nelle vicinanze al momento della rilevazione del giocatore nemico"
L ["ShowNearbyListDescription"] = "Impostare questo per visualizzare l'elenco nelle vicinanze se non è già visibile quando vengono rilevati i giocatori nemici."
L ["PrioritiseKoS"] = "Kill Prioritise su giocatori nemici vista nell'elenco nelle vicinanze"
L ["PrioritiseKoSDescription"] = "Imposta questo per mostrare sempre uccidere su giocatori nemici vista prima nell'elenco nelle vicinanze".
 
L ["MinimapOptions"] = "Mappa"
L ["MinimapOptionsDescription"] = [[
Per i giocatori che possono rintracciare umanoidi minimappa può essere utilizzata per fornire funzionalità aggiuntive.
 
I giocatori che possono rintracciare umanoidi includono cacciatori, druidi e coloro che hanno ricevuto la capacità attraverso altri mezzi, come mangiare una bistecca di Worg annerito.
]]
L ["MinimapTracking"] = "Attiva rilevamento minimappa"
L ["MinimapTrackingDescription"] = "impostare questo per abilitare la minimappa tracciamento e rilevazione. Noti giocatori nemici rilevati sulla minimappa verranno aggiunto all'elenco nelle vicinanze."
L ["MinimapDetails"] = "Dettagli di classe a livello di Display nelle descrizioni comandi"
L ["MinimapDetailsDescription"] = "Imposta questo per aggiornare la mappa tooltips dettagli a livello di classe e vengono visualizzati accanto a nomi nemici."
L ["DisplayOnMap"] = "Posizione nemica di visualizzare su mappa"
L ["DisplayOnMapDescription"] = "Imposta questo per visualizzare sulla mappa del mondo e minimappa la posizione dei nemici, rilevato da altri utenti spia nel vostro partito, raid e Gilda".
L["SwitchToZone"] = "Switch to current zone map on enemy detection"
L["SwitchToZoneDescription"] = "If the World Map is open this will change the map to the players current zone map when enemies are detected."
L ["MapDisplayLimit"] = "limite visualizzato mappa delle icone:"
L ["LimitNone"] = "Ovunque"
L ["LimitNoneDescription"] = "Nemici Displayes tutte rilevato sulla mappa indipendentemente dalla vostra attuale posizione."
L ["LimitSameZone"] = "Stessa zona"
L ["LimitSameZoneDescription"] = "unico display rilevati nemici sulla mappa, se siete nella stessa zona".
L ["LimitSameContinent"] = "Stesso continente"
L ["LimitSameContinentDescription"] = "Visualizza solo rilevati i nemici sulla mappa se sei del continente stesso."
 
L ["DataOptions"] = "Gestione dati"
L ["DataOptionsDescription"] = [[
È possibile configurare come spia mantiene e raccoglie i suoi dati.
]]
L ["PurgeData"] = "Purge non rilevati dati giocatore nemico dopo:"
L ["OneDay"] = "1 giorno"
L ["OneDayDescription"] = "Elimina dati per giocatori nemici che sono stati rilevati per 1 giorno".
L ["FiveDays"] = "5 giorni"
L ["FiveDaysDescription"] = "Elimina dati per giocatori nemici che sono stati rilevati per 5 giorni".
L ["franchigia"] = "10 giorni"
L ["TenDaysDescription"] = "Elimina dati per giocatori nemici che sono stati rilevati per 10 giorni."
L ["ThirtyDays"] = "30 giorni"
L ["ThirtyDaysDescription"] = "Elimina dati per giocatori nemici che sono stati rilevati per 30 giorni."
L ["SixtyDays"] = "60 giorni"
L ["SixtyDaysDescription"] = "Elimina dati per giocatori nemici che sono stati rilevati per 60 giorni."
L ["NinetyDays"] = "90 giorni"
L ["NinetyDaysDescription"] = "Elimina dati per giocatori nemici che sono stati rilevati per 90 giorni".
L ["ShareData"] = "Condividere i dati con altri utenti di addon Spy"
L ["ShareDataDescription"] = "Imposta questo per condividere i dettagli del vostro giocatore nemico incontri con altri utenti spia nel vostro partito, raid e Gilda".
L ["UseData"] = "Usa dati da altri utenti di addon Spy"
L ["UseDataDescription"] = [[impostare questa opzione per utilizzare i dati raccolti da altri utenti spia nel vostro partito, raid e Gilda.
 
Se un altro utente spia rileva un giocatore nemico allora quel giocatore nemico verrà aggiunto alla tua lista vicina se c'è spazio.
]]
L ["ShareKOSBetweenCharacters"] = "Kill Condividi su giocatori vista tra i tuoi personaggi"
L ["ShareKOSBetweenCharactersDescription"] = "Imposta questo per condividere i giocatori si contrassegna come uccidere a vista tra fazione e altri personaggi che si gioca sul server stesso."
 
L ["SlashCommand"] = "Barra di comando"
L ["SpySlashDescription"] = "questi pulsanti eseguono le stesse funzioni di quelli il /spy comando slash"
L ["Enable"] = "Enable"
L ["EnableDescription"] = "Abilita Spy e mostra la finestra principale."
L ["Reset"] = "Reset"
L ["ResetDescription"] = "Reimposta la posizione e l'aspetto della finestra principale."
L ["Config"] = "Config"
L ["ConfigDescription"] = "Aprire la finestra di configurazione interfaccia Addons per spia."
L ["KO"] = "KOS"
L ["KOSDescription"] = "Aggiungi/Rimuovi un giocatore da/per l'uccidere lista vista."
L ["Ignore"] = "Ignore"
L ["IgnoreDescription"] = "Aggiungi/Rimuovi un giocatore da/per la lista Ignora."
 
--Elenchi
L ["Nearby"] = "Vicino"
L ["LastHour"] = "Ultima ora"
L ["Ignore"] = "Ignorare"
L ["KillOnSight"] = "Uccidere a vista"

--Stats
--L["Last"] = "Last"
L["Time"] = "Time"	
L["List"] = "List"	
L["Show Only"] = "Show Only"
L["Won/Lost"] = "Won/Lost"
L["Reason"] = "Reason"	 
L["HonorKills"] = "Honor Kills"
L["PvPDeatchs"] = "PvP Deaths"
 
--+ + Descrizioni di classe
L ["DEATHKNIGHT"] = "cavaliere della morte"
L ["DRUID"] = "Druido"
L ["HUNTER"] = "Cacciatore"
L ["MAGE"] = "Mago"
L ["MONK"] = "Monk"
L ["PALADIN"] = "Paladino"
L ["PRIEST"] = "Sacerdote"
L ["ROGUE"] = "Canaglia"
L ["SHAMAN"] = "Sciamano"
L ["WARLOCK"] = "Stregone"
L ["WARRIOR"] = "Guerriero"
L ["UNKNOWN"] = "Unknown"
 
--Abilità stealth
L ["Stealth"] = "Stealth"
L ["Prowl"] = "Agguato"
 
--I nomi dei canali
L ["LocalDefenseChannelName"] = "LocalDefense"
 
--++ Codici colore minimappa
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
 
--I messaggi di output
L ["AlertStealthTitle"] = "Rilevato furtivo giocatore!"
L ["AlertKOSTitle"] = "Uccidere Player vista rilevato!"
L ["AlertKOSGuildTitle"] = "Uccidere su Gilda di giocatore vista rilevato!"
L ["AlertTitle_kosaway"] = "trova giocatore uccidere su vista"
L ["AlertTitle_kosguildaway"] = "trova Gilda giocatore uccidere su vista"
L ["StealthWarning"] = "lettore di |cff9933ffStealthed rilevato: |cffffffff"
L ["KOSWarning"] = "|cffff0000Kill lettore di vista rilevati: |cffffffff"
L ["KOSGuildWarning"] = "|cffff0000Kill su Gilda di giocatore vista rilevato: |cffffffff"
L ["SpySignatureColored"] = "|cff9933ff [Spy]"
L ["PlayerDetectedColored"] = "lettore rilevato: |cffffffff"
L ["PlayersDetectedColored"] = "i giocatori rilevati: |cffffffff"
L ["KillOnSightDetectedColored"] = "uccidere Player vista rilevati: |cffffffff"
L ["PlayerAddedToIgnoreColored"] = "giocatore aggiunto alla lista Ignora: |cffffffff"
L ["PlayerRemovedFromIgnoreColored"] = "lettore rimosso dalla lista Ignora: |cffffffff"
L ["PlayerAddedToKOSColored"] = "giocatore aggiunto per uccidere lista vista: |cffffffff"
L ["PlayerRemovedFromKOSColored"] = "lettore rimosso da uccidere lista vista: |cffffffff"
L ["PlayerDetected"] = "[Spy] giocatore rilevato:"
L ["KillOnSightDetected"] = "lettore di uccidere [Spy] su vista rilevato:"
L ["livello"] = "Livello"
L ["LastSeen"] = "Visto l'ultima volta"
L ["LessThanOneMinuteAgo"] = "meno di un minuto fa"
L ["MinutesAgo"] = "minuti fa"
L ["HoursAgo"] = "ore"
L ["DaysAgo"] = "giorni fa"
L ["chiudere"] = "Chiudi"
L ["CloseDescription"] = "|cffffffffHides la finestra spia. Per impostazione predefinita mostrerà nuovamente quando viene rilevato il prossimo giocatore nemico."
L [destra/sinistra"] =" Destra/sinistra"
L ["sinistra/RightDescription"] = "|cffffffffNavigates tra nelle vicinanze, ultima ora, Ignore e Kill su liste di vista."
L ["Clear"] = "Cancella"
L ["ClearDescription"] = "|cffffffffClears la lista dei giocatori che sono stati rilevati. CTRL + clic sarà spia attiva/disattiva mentre visualizzato."
L ["NearbyCount"] = "È vicino a Conte"
L ["NearbyCountDescription"] = "il conteggio dei giocatori vicini alla chat di |cffffffffSends."
L ["AddToIgnoreList"] = "Aggiungi a lista Ignora"
L ["AddToKOSList"] = "Aggiungi a uccidere lista vista"
L ["RemoveFromIgnoreList"] = "Rimuovi dalla lista Ignora"
L ["RemoveFromKOSList"] = "Rimuovi da uccidere lista vista"
L ["AnnounceDropDownMenu"] = "Annunciare"
L ["KOSReasonDropDownMenu"] = "Set Kill sul motivo della vista"
L ["PartyDropDownMenu"] = "Party"
L ["RaidDropDownMenu"] = "Raid"
L ["GuildDropDownMenu"] = "Guild"
L ["LocalDefenseDropDownMenu"] = "Difesa locale"
L ["Player"] = "(giocatore)"
L ["KOSReason"] = "Uccidere a vista"
L ["KOSReasonIndent"] = ""
L ["KOSReasonOther"] = "Inserisci il tuo motivo..."
L ["KOSReasonClear"] = "Cancella"
L ["StatsWins"] = "|cff40ff00Wins:"
L ["StatsSeparator"] = ""
L ["StatsLoses"] = "|cff0070ddLoses:"
L ["situato"] = "trova:"
L ["cantieri"] = "cantieri"
 
--Spy_KOSReasonListLength = 13
Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
[1] = {
["title"] = "Started combattimento";
["content"] = {
--"Un'imboscata me",
--"Sempre mi attacca a vista",
"Mi attaccato senza motivo",
"Mi ha attaccato a un quest donatore",--++
"Mi attaccato mentre combattevo NPC",
"Attaccato me mentre stavo entrando/lasciando un'istanza",
"Mi attaccato mentre ero AFK",
--"Mi attaccato mentre ero in una battaglia dell'animale domestico",-- + +
"Mi attaccato mentre ero montato/volante",
"Mi attaccato mentre ho avuto scarsa salute/mana",
--"Steamrolled me con un gruppo di nemici",
--"Non attacca senza backup",
--"Osato sfidarmi",
                                };
                },
[2] = {
["title"] = "Stile di combattimento";
["content"] = {
"Un'imboscata me",
"Sempre mi attacca a vista",
"Mi ha ucciso me con un personaggio di livello superiore", --+ +
"Steamrolled me con un gruppo di nemici",
"Non attacca senza backup",
"Sempre chiede aiuto",
--"Mi ha spinto giù da una rupe",
--"Usi trucchi di ingegneria",
"Usi troppo folla controllo",
--"Una capacità di spam tutto il tempo",
--"Mi ha costretto a prendere danni di durata",
--"Mi ha ucciso e fuoriuscito dai miei amici",
--"Ran via allora un'imboscata me",
--"Riesce sempre a fuggire",
--"Focolari di bolla di fuggire",
--"Riesce a rimanere nella gamma di mischia",
--"Riesce a rimanere al kite gamma",
--"Assorbe troppi danni",
--"Troppo guarisce",
--"DPS s troppo",
                                };
                },
-- [3] = {
--["title"] = "Comportamento generale";
--["content"] = {
--"Fastidioso",
--"Maleducazione",
--"Codardia",
--"Arroganza",
--"Overconfidence",
--"Inaffidabile",
--"Emotes troppo",
--"Inseguito me / gli amici",
--"Finge di essere buona,"
--"Emotes 'non accadra'",
--"Addio onde presso salute bassa",
--"Tentò di placare me con un'onda",
--"Atti fallo eseguite sul mio cadavere»,
--	"Rise con me",
--"Sputato su di me",
--                             };
--             },
[3] = {
["title"] = "Camping";
["content"] = {
"Accampati me",
"Accampato un alt",
"Accampata lowbies",
"Accampati da stealth",
"Membri della Gilda accampata",
"Accampati giochi NPC/obiettivi",
"Accampato un sito di città",
--"Chiamato in aiuto al campo di me",
--"Made livellamento un incubo",
--"Mi ha costretto a logout",
--"Non vuole combattere il mio principale",
                                };
                },
[4] = {
["title"] = "Questing";
["content"] = {
"Mi attaccato mentre io stavo questua",
"Attaccato me dopo che aiutato con una missione",
"Ha interferito con gli obiettivi di missione",
"Ha iniziato una ricerca che volevo fare",
"Ha ucciso la NPC mia fazione",
"Ucciso una missione NPC",
                                };
                },
[5] = {
["title"] = "Ha rubato le risorse";
["content"] = {
"Erbe raccolte volevo",
"Minerali raccolti volevo",
"Risorse raccolte volevo",
--"Gas estratte da una nube che volevo",
"Mi ha ucciso e rubato la mia destinazione/rara NPC",
"Dalla pelle mia uccide",
"Salvato il mio uccide",
"Pescato nella mia piscina",
                                };
                },
--[[ [7] = {
["title"] = "Battlegrounds";
["content"] = {
"Sempre cadaveri saccheggia",
"Corridore bandiera molto buona",
"Backcaps flag o basi",
"Stealth Cappelli con bandiere o basi",
"Mi ha ucciso e ha preso la bandiera",
"Interferisce con gli obiettivi del campo di battaglia",
"Ha preso un power-up che ho voluto",
"Forzata serbatoio a perdere agro",
"Ha causato un wipe",
"Distrugge d'assedio",
"Gocce di bombe",
"Disarma bombe",
"Bombardiere della paura",
                                };
                },
[8] = {
["title"] = "Vita reale";
["content"] = {
"Amico nella vita reale",
"Nemico nella vita reale",
"Si diffonde voci su di me",
"Si lamenta sul forum",
"Spy per l'altra fazione",
"Traditore alla mia fazione",
"Rinnegato un affare",
"Pretenzioso nocciolo",
"Un altro saputella",
"Un altro Johnny-come-lately",
"Attraversare fazione trash talker",
                                };
                },
[9] = {
["title"] = "Difficoltà";
["content"] = {
"Impossibile da uccidere",
"Vince la maggior parte del tempo",
"Sembra una fiera partita",
"Perde la maggior parte del tempo",
"Divertimento uccidere",
"Facile onorare",
                                };
                },
[10] = {
["title"] = "Gara";
["content"] = {
"Odio la corsa del giocatore",
"Elfi del sangue sono narcisiste",
"Draenei sono calamari spazio viscido",
"I nani sono brevi battute Pelosi",
"Goblin avrebbe venduto le proprie madri per un profitto",
"Gnomi appartengono in un giardino",
"Gli esseri umani sono giusti ficcanaso",
"Notte Elfi abbracciano troppi alberi",
"Gli orchi sono guerrafondai barbari",
"Pandarens continuano a dirmi di rallentare",-- + +
"Tauren dovrebbe essere il mio hamburger",
"Troll dovrebbe stare sui forum web",
"Non-morti sono abominazioni innaturale",
"Worgen hanno troppe pulci",
                                };
                },
[11] = {
["title"] = "Classe";
["content"] = {
"Odio la classe del giocatore",
"I cavalieri della morte sono sopraffatto",
"I Druidi sono animali sporchi",
"Cacciatori sono easy mode",
"Maghi sono illusi intelletti",
"Monaci chi è debole",-- + +
"Paladini sono sciocchi bigotti",
"I sacerdoti sono pii predicatori",
"Ladri non hanno nessun onore",
"Sciamani parlare agli animali immaginari",
"Stregoni sono sadici necromantiche",
"Guerrieri hanno problemi di rabbia",
                                };
                },
[12] = {
["title"] = "Nome";
["content"] = {
"Ha un nome ridicolo",
"Nome pretenzioso",
"Variante di Legolas",
"Nome ha caratteri strani",
"Nome della Gilda è ridicolo",
"Nome Gilda utilizza solo lettere maiuscole",
"Nome Gilda usa lettere maiuscole e spazi",
"Nome Gilda afferma che odio la mia fazione",
                                };
                },]]--
-- [13] = {
[6] = {
["title"] = "Altro";
["content"] = {
--"Karma",
--"Rosso è morto",
--"Solo perché",
--"Ha esito negativo in PvP",
"Contrassegnati per PvP",
--"Non vuole PvP",
--"Perde sia il nostro tempo",
--"Questo giocatore è un noob",
--"Io odio davvero questo giocatore",
--"Non abbastanza veloce livello",
"Mi ha spinto giù da una rupe",
"Utilizza trucchi engineering",
"Riesce sempre a fuggire",
"Utilizza oggetti e abilità di fuga",
"Exploit meccanica di gioco",
--"Sospetto hacker",
--"Agricoltore",
--"Altro...",
"Inserisci il tuo motivo...",
		};
	},
}

StaticPopupDialogs ["Spy_SetKOSReasonOther"] = {
	preferredIndex = STATICPOPUPS_NUMDIALOGS,--http://forums.wowace.com/showthread.php?p=320956
	text = "Inserire il Kill sul motivo della vista per % s:",
	button1 = "Imposta",
	button2 = "Annulla",
	timeout = 20,
	hasEditBox = 1,
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("");
	end,
		OnAccept = function(self)
		local reason = self.editBox:GetText()
		Spy:SetKOSReason(self.playerName, "Other...", reason)
		Spy:SetKOSReason(self.playerName, "Inserisci il tuo motivo...", reason)
	end,
};
 
Spy_AbilityList = {
 
-----------------------------------------------------------
--Permette una stima del livello di razza, classe e un
--giocatore di essere determinato da quali abilità sono osservati
--nel registro di combattimento.
-----------------------------------------------------------
 
--+ + Racials + +
["Stoneform"] = {race = "Dwarf", level = 1,},
["Escape Artist"] = {race = "Gnome", level = 1,},
["Ognuno per sé"] = {race = "Human", level = 1,},
["Shadowmeld"] = {race = "Night Elf", level = 1,},
["Dono dei Naaru"] = {race = "Draenei", level = 1,},
["Darkflight"] = {race = "Worgen", level = 1,},
["Due forme"] = {race = "Worgen", level = 1,},
["Running Wild"] = {race = "Worgen", level = 1,},
["Furia del sangue"] = {race = "Orc", level = 1,},
["War Stomp"] = {race = "Tauren", level = 1,},
["Berserking"] = {race = "Troll", level = 1,},
["Saranno degli abbandonati"] = {race = "Undead", level = 1,},
["Cannibalizzare"] = {race = "Undead", level = 1,},
["Arcane Torrent"] = {race = "Blood Elf", level = 1,},
["Rocket Jump"] = {race = "Goblin", level = 1,},
["Rocket Barrage"] = {race = "Goblin", level = 1,},
["Pack Hobgoblin"] = {race = "Goblin", level = 1,},
["Palm tremando"] = {race = "Pandaren", level = 1,},
 
--+ + Abilità del cavaliere della morte + +
["Piaga di sangue"] = {class = "DEATHKNIGHT", level = 55,},
["Blood Strike"] = {class = "DEATHKNIGHT", level = 55,}, 
["Death Coil"] = {class = "DEATHKNIGHT", level = 55,}, 
["Porta della morte"] = {class = "DEATHKNIGHT", level = 55,}, 
["Death Grip"] = {class = "DEATHKNIGHT", level = 55,},
["Frost Fever"] = {class = "DEATHKNIGHT", level = 55,}, 
["Presenza di brina"] = {class = "DEATHKNIGHT", level = 55,}, 
["Icy Touch"] = {class = "DEATHKNIGHT", level = 55,}, 
["Peste Strike"] = {class = "DEATHKNIGHT", level = 55,}, 
["Runeforging"] = {class = "DEATHKNIGHT", level = 55,}, 
["Sangue bollire"] = {class = "DEATHKNIGHT", level = 56,}, 
["Death Strike"] = {class = "DEATHKNIGHT", level = 56,}, 
["Pestilenza"] = {class = "DEATHKNIGHT", level = 56,}, 
["Raise Dead"] = {class = "DEATHKNIGHT", level = 56,}, 
["Presenza di sangue"] = {class = "DEATHKNIGHT", level = 57,}, 
["Mind Freeze"] = {class = "DEATHKNIGHT", level = 57,}, 
["Catene di ghiaccio"] = {class = "DEATHKNIGHT", level = 58,}, 
["Strangulate"] = {class = "DEATHKNIGHT", level = 58,}, 
["Morte e distruzione"] = {class = "DEATHKNIGHT", level = 60,}, 
["Su un cavallo pallido"] = {class = "DEATHKNIGHT", level = 61,}, 
["Icebound Fortitude"] = {class = "DEATHKNIGHT", level = 62,},
["Presenza diabolica"] = {class = "DEATHKNIGHT", level = 64,}, 
["Corno d'inverno"] = {class = "DEATHKNIGHT", level = 65,}, 
["Percorso di gelo"] = {class = "DEATHKNIGHT", level = 66,}, 
["Anti-Magic Shell"] = {class = "DEATHKNIGHT", level = 69,}, 
["Controllo Undead"] = {class = "DEATHKNIGHT", level = 69,}, 
["Sollevare alleato"] = {class = "DEATHKNIGHT", level = 72,}, 
["Empower runa arma"] = {class = "DEATHKNIGHT", level = 76,}, 
["Esercito dei morti"] = {class = "DEATHKNIGHT", level = 80,}, 
["Scoppio"] = {class = "DEATHKNIGHT", level = 81,}, 
["Necrotico Strike"] = {class = "DEATHKNIGHT", level = 83,}, 
["Scuro simulacro"] = {class = "DEATHKNIGHT", level = 85,}, 
["Rune of Cinderglacier"] = {class = "DEATHKNIGHT", level = 55,},
["Runa di Fallen Crusader"] = {class = "DEATHKNIGHT", level = 70,}, 
["Runa del Lichbane"] = {class = "DEATHKNIGHT", level = 60,},
["Runa del Razorice"] = {class = "DEATHKNIGHT", level = 55,},
["Runa del Spellbreaking"] = {class = "DEATHKNIGHT", level = 57,},
["Runa del Spellshattering"] = {class = "DEATHKNIGHT", level = 57,},
["Rune of Swordbreaking"] = {class = "DEATHKNIGHT", level = 63,},
["Rune of Swordshattering"] = {class = "DEATHKNIGHT", level = 63,},
["Runa del Nerubian Carapace"] = {class = "DEATHKNIGHT", level = 72,},
["Runa della Stoneskin Gargoyle"] = {class = "DEATHKNIGHT", level = 72,},
--+ + Glifo abilità + +
["Esplosione di cadavere"] = {class = "DEATHKNIGHT", level = 25,}, 
--+ + Specializzazione di cavaliere della morte + +
--++ Blood/Frost/Unholy ++
["Soul Reaper"] = 			{ class = "DEATHKNIGHT", level = 87, }, 
--+ + Gelo/diabolica + +
["Unholy Aura"] = {class = "DEATHKNIGHT", level = 60,},
--+ + Sangue + +
["Riti di sangue"] = {class = "DEATHKNIGHT", level = 55,}, 
["Vendetta"] = {class = "DEATHKNIGHT", level = 55,}, 
["Veterano della terza guerra"] = {class = "DEATHKNIGHT", level = 55,}, 
["Comando scuro"] = {class = "DEATHKNIGHT", level = 58,}, 
["Sciopero del cuore"] = {class = "DEATHKNIGHT", level = 60,}, 
["Il profumo del sangue"] = {class = "DEATHKNIGHT", level = 62,}, 
["Migliorato la presenza di sangue"] = {class = "DEATHKNIGHT", level = 64,}, 
["Rune Tap"] = {class = "DEATHKNIGHT", level = 64,}, 
["Rune Strike"] = {class = "DEATHKNIGHT", level = 65,}, 
["Parassita del sangue"] = {class = "DEATHKNIGHT", level = 66,}, 
["Scarlattina"] = {class = "DEATHKNIGHT", level = 68,}, 
["Sarà della necropoli"] = {class = "DEATHKNIGHT", level = 70,}, 
["Sanguine Fortitude"] = {class = "DEATHKNIGHT", level = 72,}, 
["Dancing Rune arma"] = {class = "DEATHKNIGHT", level = 74,}, 
--["Ripsote"] = {class = "DEATHKNIGHT", level = 76,}, -- aggiunto in 5.4 Patch ma non attivato dal momento che i guerrieri hanno anche questa capacità 
["Vampiric Blood"] = {class = "DEATHKNIGHT", level = 76,}, 
["Bone Shield"] = {class = "DEATHKNIGHT", level = 78,},
["Scudo di sangue"] = {class = "DEATHKNIGHT", level = 80,},
["Crimson Scourge"] = {class = "DEATHKNIGHT", level = 84,}, --+ +
--+ + Frost + + 
["Sangue del Nord"] = {class = "DEATHKNIGHT", level = 55,}, 
["Frost Strike"] = {class = "DEATHKNIGHT", level = 55,}, 
["Howling Blast"] = {class = "DEATHKNIGHT", level = 55,}, 
["Icy Talons"] = {class = "DEATHKNIGHT", level = 55,}, 
["Obliterare"] = {class = "DEATHKNIGHT", level = 58,}, 
["Killing Machine"] = {class = "DEATHKNIGHT", level = 63,}, 
["Frost presenza migliorata"] = {class = "DEATHKNIGHT", level = 65,}, 
["Ossa fragili"] = {class = "DEATHKNIGHT", level = 66,}, 
["Pilastro di gelo"] = {class = "DEATHKNIGHT", level = 68,}, 
["Rima"] = {class = "DEATHKNIGHT", level = 70,}, 
["Potrebbe degli sprechi Frozen"] = {class = "DEATHKNIGHT", level = 74,}, 
["Minaccia di Thassarian"] = {class = "DEATHKNIGHT", level = 74,}, 
["Cuore congelato"] = {class = "DEATHKNIGHT", level = 80,}, 
--+ + Unholy + + 
["Maestro di ghoul"] = {class = "DEATHKNIGHT", level = 55,}, 
["Mietitura"] = {class = "DEATHKNIGHT", level = 55,}, 
["Unholy Might"] = {class = "DEATHKNIGHT", level = 55,}, 
["Flagello Strike"] = {class = "DEATHKNIGHT", level = 58,}, 
["Shadow infusione"] = {class = "DEATHKNIGHT", level = 60,}, 
["Festering Strike"] = {class = "DEATHKNIGHT", level = 62,}, 
["Doom improvviso"] = {class = "DEATHKNIGHT", level = 64,}, 
["Frenesia diabolica"] = {class = "DEATHKNIGHT", level = 66,}, 
["Ebon Plaguebringer"] = {class = "DEATHKNIGHT", level = 68,}, 
["Dark Transformation"] = {class = "DEATHKNIGHT", level = 70,}, 
["Convocare Gargoyle"] = {class = "DEATHKNIGHT", level = 74,}, 
["Migliorata presenza diabolica"] = {class = "DEATHKNIGHT", level = 75,}, 
["Dreadblade"] = {class = "DEATHKNIGHT", level = 80,}, 
--+ + Morte talenti cavaliere + +
["Roiling sangue"] = {class = "DEATHKNIGHT", level = 56,}, 
["Peste sanguisuga"] = {class = "DEATHKNIGHT", level = 56,}, 
["Unholy Blight"] = {class = "DEATHKNIGHT", level = 56,}, 
["Lichborne"] = {class = "DEATHKNIGHT", level = 57,}, 
["Zona anti-magia"] = {class = "DEATHKNIGHT", level = 57,}, 
["Purgatorio"] = {class = "DEATHKNIGHT", level = 57,}, 
["Anticipo di morte"] = {class = "DEATHKNIGHT", level = 58,}, 
["Geloni"] = {class = "DEATHKNIGHT", level = 58,}, 
["Asfissiare"] = {class = "DEATHKNIGHT", level = 58,}, 
["Patto di morte"] = {class = "DEATHKNIGHT", level = 60,}, 
["Morte sifone"] = {class = "DEATHKNIGHT", level = 60,}, 
["Conversione"] = {class = "DEATHKNIGHT", level = 60,}, 
["Blood Tap"] = {class = "DEATHKNIGHT", level = 75,}, 
["Runic Empowerment"] = {class = "DEATHKNIGHT", level = 75,}, 
["Corruzione runica"] = {class = "DEATHKNIGHT", level = 75,}, 
["Stretta su Gorefiend"] = {class = "DEATHKNIGHT", level = 90,}, 
["Inverno spietato"] = {class = "DEATHKNIGHT", level = 90,}, 
["Terra sconsacrata"] = {class = "DEATHKNIGHT", level = 90,}, 
 
--+ + Druido abilità + +
["Ira"] = {class = "DRUID", level = 1,}, 
["Moonfire"] = {class = "DRUID", level = 3,},
["Ringiovanimento"] = {class = "DRUID", level = 4,},
["Cat Form"] = {class = "DRUID", level = 6,},
["Grazia Felina"] = {class = "DRUID", level = 6,},
["Mangle"] = {class = "DRUID", level = 6,},
["Prowl"] = {class = "DRUID", level = 6,},
["Rake"] = {class = "DRUID", level = 6,},
["Morso feroce"] = {class = "DRUID", level = 6,},
["Bear Form"] = {class = "DRUID", level = 8,},
["Growl"] = {class = "DRUID", level = 8,},
["Maul"] = {class = "DRUID", level = 8,},
["Clearcasting"] = {class = "DRUID", level = 10,},
["Impiglianti radici"] = {class = "DRUID", level = 10,},
["Rivivere"] = {class = "DRUID", level = 12,},
["Teleport: Moonglade"] = {class = "DRUID", level = 14,},
["Viaggio forma"] = {class = "DRUID", level = 16,},
["Forma acquatica"] = {class = "DRUID", level = 18,},
["Devastare!"] = {class = "DRUID", level = 22,}, 
["Swipe"] = {class = "DRUID", level = 22,}, 
["Dash"] = {class = "DRUID", level = 24,},
["Healing Touch"] = {class = "DRUID", level = 26,},
["Faerie Fire"] = {class = "DRUID", level = 28,},
["Thrash"] = {class = "DRUID", level = 28,}, 
["Furia primitiva"] = {class = "DRUID", level = 30,},
["Pounce"] = {class = "DRUID", level = 32,},
["Track umanoidi"] = {class = "DRUID", level = 36,},
["Lacerare"] = {class = "DRUID", level = 38,},
["Tempesta astrale"] = {class = "DRUID", level = 42,}, 
["Hurricane"] = {class = "DRUID", level = 42,},
["Barkskin"] = {class = "DRUID", level = 44,},
["Stretta della natura"] = {class = "DRUID", level = 52,},
["Innervare"] = {class = "DRUID", level = 54,},
["Rinascita"] = {class = "DRUID", level = 56,},
["Forma di volo"] = {class = "DRUID", level = 58,},
["Lenire"] = {class = "DRUID", level = 60,},
["Mark del selvaggio"] = {class = "DRUID", level = 62,},
["Hibernate"] = {class = "DRUID", level = 66,},
["Frenetica rigenerazione"] = {class = "DRUID", level = 68,},
["Swift Flight Form"] = {class = "DRUID", level = 70,},
["Potrebbe di Ursoc"] = {class = "DRUID", level = 72,},
["Tranquillità"] = {class = "DRUID", level = 74,},
["Ciclone"] = {class = "DRUID", level = 78,},
["Mutilare"] = {class = "DRUID", level = 82,},
["Ruggito impazzita"] = {class = "DRUID", level = 84,},
["Simbiosi"] = {class = "DRUID", level = 87,}, 
--+ + Glifo abilità + +
["Fascino Woodland creatura"] = {class = "DRUID", level = 25,},
["Treant forma"] = {class = "DRUID", level = 25,}, 
--+ + Druido specializzazione + +
--+ + Equilibrio/restauro + +
["Insight naturale"] = {class = "DRUID", level = 10,}, 
["Rapidità di natura"] = {class = "DRUID", level = 30,}, 
["Killer Instinct"] = {class = "DRUID", level = 34,},
["Wild Mushroom"] = {class = "DRUID", level = 84,},
--+ + Equilibrio/Feral/tutore + +
["Rimuovere corruzione"] = {class = "DRUID", level = 22,},
--+ + Feral/tutore + +
["Rip"] = {class = "DRUID", level = 20,},
["Nutrimento istinto"] = {class = "DRUID", level = 34,},
["Le ferite infette"] = {class = "DRUID", level = 40,},
["Capo branco"] = {class = "DRUID", level = 46,},
["Berserk"] = {class = "DRUID", level = 48,},
["Devastare"] = {class = "DRUID", level = 54,},
["Istinto di sopravvivenza"] = {class = "DRUID", level = 56,},
["Skull Bash"] = {class = "DRUID", level = 64,},
--+ + Feral/Resoration + +
["Presagio di chiarezza"] = {class = "DRUID", level = 38,},
--+ + Equilibrio + +
["Equilibrio di potere"] = {class = "DRUID", level = 10,},
["Starfire"] = {class = "DRUID", level = 10,},
["Starsurge"] = {class = "DRUID", level = 12,},
["Moonkin Form"] = {class = "DRUID", level = 16,},
["Sunfire"] = {class = "DRUID", level = 18,},
["Comunione astrale"] = {class = "DRUID", level = 20,},
["Shooting Stars"] = {class = "DRUID", level = 26,},
["Raggio solare"] = {class = "DRUID", level = 28,},
["Euforia"] = {class = "DRUID", level = 38,},
["Owlkin Frenzy"] = {class = "DRUID", level = 48,},
["Allineamento celeste"] = {class = "DRUID", level = 68,},
["Starfall"] = {class = "DRUID", level = 76,},
["Total Eclipse"] = {class = "DRUID", level = 80,},
["Lunar Shower"] = {class = "DRUID", level = 82,},
["Wild Mushroom: detonare"] = {class = "DRUID", level = 84,},
--+ + Feral + +
["La furia della tigre"] = {class = "DRUID", level = 10,},
["Tagliuzzare"] = {class = "DRUID", level = 16,},
["Savage Roar"] = {class = "DRUID", level = 18,},
["Predatori Swiftness"] = {class = "DRUID", level = 26,},
["Artigli rasoio"] = {class = "DRUID", level = 80,},
--+ + Guardian + + 
["Difesa Savage"] = {class = "DRUID", level = 10,},
["Vendetta"] = {class = "DRUID", level = 10,},
["Nascondi spessore"] = {class = "DRUID", level = 14,},
["Abbraccio dell'orso"] = {class = "DRUID", level = 18,},
["Denti e artigli"] = {class = "DRUID", level = 32,}, 
["Imbestialire"] = {class = "DRUID", level = 76,},
["Guardiano della natura"] = {class = "DRUID", level = 80,},
--+ + Restauro + + 
["Naturalista"] = {class = "DRUID", level = 10,},
["Swiftmend"] = {class ="DRUID"，level = 10，}，
["Nutrire"] = {class = "DRUID", level = 12,},
["Meditazione"] = {class = "DRUID", level = 14,},
["Focus della natura"] = {class = "DRUID", level = 16,},
["Ricrescita"] = {class = "DRUID", level = 18,},
["Cura natura"] = {class = "DRUID", level = 22,},
["Seme vivente"] = {class = "DRUID", level = 28,},
["Lifebloom"] = {class = "DRUID", level = 36,},
["Ringiovanimento Swift"] = {class = "DRUID", level = 46,},
["Ironbark"] = {class = "DRUID", level = 64,},
["Crescita selvaggia"] = {class = "DRUID", level = 76,},
["Armonia"] = {class = "DRUID", level = 80,},
["Dono di Malfurion"] = {class = "DRUID", level = 82,},
["Wild Mushroom: Bloom"] = {class = "DRUID", level = 84,},
["Genesi"] = {class = "DRUID", level = 88,}, 
--+ + Druido talenti + +
["Rapidità Felina"] = {class = "DRUID", level = 15,},
["Bestia dislocatore"] = {class = "DRUID", level = 15,},
["Wild Charge"] = {class = "DRUID", level = 15,}, 
["Dono di Ysera"] = {class = "DRUID", level = 30,}, 
['Rinnovamento'] = {class = "DRUID", level = 30,},
["Cenarion Ward"] = {class = "DRUID", level = 30,}, 
["Faerie Swarm"] = {class = "DRUID", level = 45,},
["Massa Entanglement"] = {class = "DRUID", level = 45,},
["Typhoon"] = {class = "DRUID", level = 45,}, 
["Anima del bosco"] = {class = "DRUID", level = 60,},
["Incarnazione"] = {class = "DRUID", level = 60,},
["La forza della natura"] = {class = "DRUID", level = 60,},
["Disorienting ruggito"] = {class = "DRUID", level = 75,},
["Vortice di Ursol"] = {class = "DRUID", level = 75,},
["Possente Bash"] = {class = "DRUID", level = 75,}, 
["Cuore selvaggio"] = {class = "DRUID", level = 90,},
["Sogno di Cenarius"] = {class = "DRUID", level = 90,},
["Veglia della natura"] = {class = "DRUID", level = 90,}, 
 
--+ + Abilità Hunter + +
["Arcane Shot"] = {class = "HUNTER", level = 1,},
["Auto Shot"] = {class = "HUNTER", level = 1,},
["Pet 1 chiamare"] = {class = "HUNTER", level = 1,},
["Revive Pet"] = {class = "HUNTER", level = 1,},
["Scatto fisso"] = {class = "HUNTER", level = 3,},
["Tracking"] = {class = "HUNTER", level = 4,},
["Concussive Shot"] = {class = "HUNTER", level = 8,},
["Beast Lore"] = {class = "HUNTER", level = 10,},
["Respingere Pet"] = {class = "HUNTER", level = 10,},
["Serpent Sting"] = {class = "HUNTER", level = 10,},
["Tame Beast"] = {class = "HUNTER", level = 10,},
["Pet di controllo"] = {class = "HUNTER", level = 10,},
["Feed Pet"] = {class = "HUNTER", level = 11,},
["Aspect of the Hawk"] = {class = "HUNTER", level = 12,},
["Disimpegnarsi"] = {class = "HUNTER", level = 14,},
["Hunter Mark"] = {class = "HUNTER", level = 14,},
["Scatter Shot"] = {class = "HUNTER", level = 15,},
["Eagle Eye"] = {class = "HUNTER", level = 16,},
["Mend Pet"] = {class = "HUNTER", level = 16,},
["Pet 2 chiamare"] = {class = "HUNTER", level = 18,},
["Contrastare Shot"] = {class = "HUNTER", level = 22,}, 
["Aspetto del ghepardo"] = {class = "HUNTER", level = 24,},
["Multi-Shot"] = {class = "HUNTER", level = 24,},
["Congelamento trappola"] = {class = "HUNTER", level = 28,},
["Finta morte"] = {class = "HUNTER", level = 32,},
["Kill Shot"] = {class = "HUNTER", level = 35,},
["Tranquilizing Shot"] = {class = "HUNTER", level = 35,},
["Spaventare bestia"] = {class = "HUNTER", level = 36,},
["Trappola esplosiva"] = {class = "HUNTER", level = 38,},
["Flare"] = {class = "HUNTER", level = 38,},
["Trueshot Aura"] = {class = "HUNTER", level = 39,},
["Vedova veleno"] = {class = "HUNTER", level = 40,},
["Pet 3 chiamata"] = {class = "HUNTER", level = 42,},
["Trappola di ghiaccio"] = {class = "HUNTER", level = 46,},
["Trap Launcher"] = {class = "HUNTER", level = 48,},
["Distracting Shot"] = {class = "HUNTER", level = 52,},
["Rapid Fire"] = {class = "HUNTER", level = 54,},
["Aspetto del Pack"] = {class = "HUNTER", level = 56,},
["Pet 4 chiamare"] = {class = "HUNTER", level = 62,},
["Snake Trap"] = {class = "HUNTER", level = 66,},
["Chiamata del maestro"] = {class = "HUNTER", level = 74,},
["Misdirection"] = {class = "HUNTER", level = 76,},
["Deterrenza"] = {class = "HUNTER", level = 78,},
["Chiamare Pet 5"] = {class = "HUNTER", level = 82,},
["Camouflage"] = {class = "HUNTER", level = 85,},
["Stampede"] = {class = "HUNTER", level = 87,}, 
--+ + Glifo abilità + +
["Aspetto della bestia"] = {class = "HUNTER", level = 25,}, 
["Fetch"] = {class = "HUNTER", level = 25,}, 
["Fuochi d'artificio"] = {class = "HUNTER", level = 25,}, 
--+ + Specializzazione Hunter + +
--+ + Bestia padronanza/sopravvivenza + +
["Cobra Shot"] = {class = "HUNTER", level = 81,},
--+ + Padronanza Bestia + +
["Comando kill"] = {class = "HUNTER", level = 10,},
["Andare per la gola"] = {class = "HUNTER", level = 20,},
["Bestia Cleave"] = {class = "HUNTER", level = 24,},
["Frenzy"] = {class = "HUNTER", level = 30,},
["Focus fuoco"] = {class = "HUNTER", level = 32,},
["Bestial Wrath"] = {class = "HUNTER", level = 40,},
["Cobra colpisce"] = {class = "HUNTER", level = 43,},
["La bestia all'interno di"] = {class = "HUNTER", level = 50,},
["Kindred Spirits"] = {class = "HUNTER", level = 58,},
["Rinvigorimento"] = {class = "HUNTER", level = 63,},
["Bestie esotiche"] = {class = "HUNTER", level = 69,},
["Maestro delle bestie"] = {class = "HUNTER", level = 80,},
--+ + Tiro + + 
["Tiro mirato"] = {class = "HUNTER", level = 10,},
["Obiettivo attento"] = {class = "HUNTER", level = 20,},
["Silencing Shot"] = {class = "HUNTER", level = 30,}, 
["Sbarramento concussive"] = {class = "HUNTER", level = 30,},
["Bombardamento"] = {class = "HUNTER", level = 45,},
["Recupero rapido"] = {class = "HUNTER", level = 54,}, 
["Master Marksman"] = {class = "HUNTER", level = 58,},
["Chimera Shot"] = {class = "HUNTER", level = 60,},
["Fuoco fisso"] = {class = "HUNTER", level = 63,},
["Piercing colpi"] = {class = "HUNTER", level = 72,},
["Wild Quiver"] = {class = "HUNTER", level = 80,},
--+ + Sopravvivenza + + 
["Colpo esplosivo"] = {class = "HUNTER", level = 10,},
["Blocco e carico"] = {class = "HUNTER", level = 43,},
["Black Arrow"] = {class = "HUNTER", level = 50,},
["Entrapment"] = {class = "HUNTER", level = 55,},
["Veleno di vipera"] = {class = "HUNTER", level = 63,},
["Trappola padronanza"] = {class = "HUNTER", level = 64,},
["Serpent Spread"] = {class = "HUNTER", level = 68,},
["Migliorato Serpent Sting"] = {class = "HUNTER", level = 70,},
["Essenza del Viper"] = {class = "HUNTER", level = 80,},
--+ + Talenti Hunter + +
["Gran fretta"] = {class = "HUNTER", level = 15,},
["Fuga stretta"] = {class = "HUNTER", level = 15,},
["Crouching Tiger, Hidden Chimera"] = {class = "HUNTER", level = 15,}, 
["Associazione Shot"] = {class = "HUNTER", level = 30,}, 
["Wyvern Sting"] = {class = "HUNTER", level = 30,},
["Intimidazione"] = {class = "HUNTER", level = 30,}, 
["Euforia"] = {class = "HUNTER", level = 45,},
["Aspetto del ferro falco"] = {class = "HUNTER", level = 45,},
["Bond di spirito"] = {class = "HUNTER", level = 45,}, 
["Fervore"] = {class = "HUNTER", level = 60,},
["Bestia terribile"] = {class = "HUNTER", level = 60,},
["Il brivido della caccia"] = {class = "HUNTER", level = 60,}, 
["Un omicidio dei corvi"] = {class = "HUNTER", level = 75,},
["Blink scioperi"] = {class = "HUNTER", level = 75,},
["Lynx Rush"] = {class = "HUNTER", level = 75,}, 
["Glaive Toss"] = {class = "HUNTER", level = 90,},
["Powershot"] = {class = "HUNTER", level = 90,},
["Sbarramento"] = {class = "HUNTER", level = 90,}, 
 
--+ + Abilità di mago + +
["Frostfire Bolt"] = {class = "MAGE", level = 1,},
["Frost Nova"] = {class = "MAGE", level = 3,},
["Fire Blast"] = {class = "MAGE", level = 5,},
["Blink"] = {class = "MAGE", level = 7,},
["Contromagia"] = {class = "MAGE", level = 8,},
["Polimorfo"] = {class = "MAGE", level = 14,},
["Frantumarsi"] = {class = "MAGE", level = 16,},
["Esplosione arcano"] = {class = "MAGE", level = 18,},
["Lance di ghiaccio"] = {class = "MAGE", level = 22,},
["Blocco di ghiaccio"] = {class = "MAGE", level = 26,},
["Cono di freddo"] = {class = "MAGE", level = 28,},
["Rimuovi maledizione"] = {class = "MAGE", level = 29,},
["Caduta lenta"] = {class = "MAGE", level = 32,},
["Molten Armor"] = {class = "MAGE", level = 34,},
["Evocare rinfresco"] = {class = "MAGE", level = 38,},
["Evocazione"] = {class = "MAGE", level = 40,},
["Flamestrike"] = {class = "MAGE", level = 44,},
["Evocare Mana Gem"] = {class = "MAGE", level = 47,},
["Immagine speculare"] = {class = "MAGE", level = 49,},
["Stregoneria"] = {class = "MAGE", level = 50,},
["Blizzard"] = {class = "MAGE", level = 52,},
["Frost Armor"] = {class = "MAGE", level = 54,},
["Frost Bolt"] = {class = "MAGE", level = 54,}, 
["Invisibilità"] = {class = "MAGE", level = 56,},
["Arcane Brilliance"] = {class = "MAGE", level = 58,},
["Spellsteal"] = {class = "MAGE", level = 64,},
["Deep Freeze"] = {class = "MAGE", level = 66,},
["Migliorato contromagia"] = {class = "MAGE", level = 70,},
["Evocare tavolo ristoro"] = {class = "MAGE", level = 72,}, 
["Attunement nether"] = {class = "MAGE", level = 74,},
["Mage Bomb"] = {class = "MAGE", level = 75,},
["Dalaran Brilliance"] = {class = "MAGE", level = 80,}, 
["Mage Armor"] = {class = "MAGE", level = 80,},
["Burning Soul"] = {class = "MAGE", level = 82,},
["Time Warp"] = {class = "MAGE", level = 84,},
["Tempo Alter"] = {class = "MAGE", level = 87,}, 
["Polimorfo: Pig"] = {class = "MAGE", level = 60,},
["Polimorfo: coniglio"] = {class = "MAGE", level = 60,},
["Polimorfo: tartaruga"] = {class = "MAGE", level = 60,},
["Polimorfo: gatto nero"] = {class = "MAGE", level = 60,}, 
["Polimorfo: Turchia"] = {class = "MAGE", level = 60,}, 
["Antico portale: Dalaran"] = {class = "MAGE", level = 74,}, 
["Portale: Dalaran"] = {class = "MAGE", level = 74,},
["Portale: Darnassus"] = {class = "MAGE", level = 42,},
["Portal: Exodar"] = {class = "MAGE", level = 42,},
["Portale: Ironforge"] = {class = "MAGE", level = 42,},
["Portale: Orgrimmar"] = {class = "MAGE", level = 42,},
["Portale: Shattrath"] = {class = "MAGE", level = 66,},
["Portale: Silvermoon"] = {class = "MAGE", level = 42,},
["Portal: Stonard"] = {class = "MAGE", level = 52,},
["Portale: Stormwind"] = {class = "MAGE", level = 42,},
["Portale: Theramore"] = {class = "MAGE", level = 42,},
["Portale: Thunder Bluff"] = {class = "MAGE", level = 42,},
["Portale: Tol Barad"] = {class = "MAGE", level = 85,},
["Portale: Undercity"] = {class = "MAGE", level = 42,},
["Portale: Vale dell'eterna primavera"] = {class = "MAGE", level = 90,}, 
["Antico Teleport: Dalaran"] = {class = "MAGE", level = 71,}, 
["Teleport: Dalaran"] = {class = "MAGE", level = 71,},
["Teleport: Darnassus"] = {class = "MAGE", level = 17,},
["Teleport: Exodar"] = {class = "MAGE", level = 17,},
["Teleport: Ironforge"] = {class = "MAGE", level = 17,},
["Teleport: Orgrimmar"] = {class = "MAGE", level = 17,},
["Teleport: Shattrath"] = {class = "MAGE", level = 62,},
["Teleport: Silvermoon"] = {class = "MAGE", level = 17,},
["Teleport: Stonard"] = {class = "MAGE", level = 52,},
["Teleport: Stormwind"] = {class = "MAGE", level = 17,},
["Teleport: Theramore"] = {class = "MAGE", level = 17,},
["Teleport: Thunder Bluff"] = {class = "MAGE", level = 17,},
["Teleport: Tol Barad"] = {class = "MAGE", level = 85,},
["Teleport: Undercity"] = {class = "MAGE", level = 17,},
["Teleport: Vale dell'eterna primavera"] = {class = "MAGE", level = 90,}, 
--+ + Glifo abilità + +
["Evocare familiarità"] = {class = "MAGE", level = 25,},
["Illusione"] = {class = "MAGE", level = 25,},
--+ + Specializzazione MAGE + +
--+ + Arcano + +
["Arcane Blast"] = {class = "MAGE", level = 10,},
["Carica arcano"] = {class = "MAGE", level = 10,},
["Arcane Barrage"] = {class = "MAGE", level = 12,},
["Missili arcane"] = {class = "MAGE", level = 24,},
["Lento"] = {class = "MAGE", level = 36,},
["Potere arcano"] = {class = "MAGE", level = 62,},
["Adepto di mana"] = {class = "MAGE", level = 80,}, 
--+ + Fuoco + + 
["Pyroblast"] = {class = "MAGE", level = 10,},
["Fireball"] = {class = "MAGE", level = 12,},
["Inferno Blast"] = {class = "MAGE", level = 24,},
["Massa critica"] = {class = "MAGE", level = 36,},
["Scorch"] = {class = "MAGE", level = 48,}, 
["Respiro del drago"] = {class = "MAGE", level = 62,},
["Combustione"] = {class = "MAGE", level = 77,}, 
["Ignite"] = {class = "MAGE", level = 80,},
["Piromane"] = {class = "MAGE", level = 85,},
--+ + Frost + + 
["Evocare elementali dell'acqua"] = {class = "MAGE", level = 10,},
["Frostbolt"] = {class = "MAGE", level = 12,},
["Dita di gelo"] = {class = "MAGE", level = 24,},
["Vene ghiacciate"] = {class = "MAGE", level = 36,},
["Frozen Orb"] = {class = "MAGE", level = 62,},
["Brain Freeze"] = {class = "MAGE", level = 77,},
["Ghiaccioli"] = {class = "MAGE", level = 80,}, 
--+ + Mage talenti + +
["Presenza di spirito"] = {class = "MAGE", level = 15,},
["Blazing velocità"] = {class = "MAGE", level = 15,}, 
["Lastroni di ghiaccio"] = {class = "MAGE", level = 15,}, 
["Flameglow"] = {class = "MAGE", level = 30,},
["Scudo temporale"] = {class = "MAGE", level = 30,},
["Barriera di ghiaccio"] = {class = "MAGE", level = 30,}, 
["Anello di brina"] = {class = "MAGE", level = 45,},
["Ward di ghiaccio"] = {class = "MAGE", level = 45,},
["Frostjaw"] = {class = "MAGE", level = 45,}, 
["Maggiore invisibilità"] = {class = "MAGE", level = 60,},
["Cauterizzare"] = {class = "MAGE", level = 60,},
["Cold Snap"] = {class = "MAGE", level = 60,}, 
["Tempest nether"] = {class = "MAGE", level = 75,},
["Bomba vivente"] = {class = "MAGE", level = 75,},
["Frost Bomb"] = {class = "MAGE", level = 75,}, 
["Invocazione"] = {class = "MAGE", level = 90,},
["Rune del potere"] = {class = "MAGE", level = 90,},
["Ward di Incanter"] = {class = "MAGE", level = 90,}, 
 
--+ + Monaco abilità + +
["Jab"] = {class = "MONK", level = 1,},
["Posizione della tigre feroce"] = {class = "MONK", level = 1,}, 
["La via del Monaco"] = {class = "MONK", level = 1,}, 
["Palm tiger"] = {class = "MONK", level = 3,}, 
["Roll"] = {class = "MONK", level = 5,}, 
["Blackout Kick"] = {class = "MONK", level = 7,}, 
["Provocare"] = {class = "MONK", level = 14,}, 
["Resuscitare"] = {class = "MONK", level = 18,}, 
["Detox"] = {class = "MONK", level = 20,}, 
["Pellegrinaggio Zen"] = {class = "MONK", level = 20,}, 
["Eredità dell'imperatore"] = {class = "MONK", level = 22,}, 
["Tocco di morte"] = {class = "MONK", level = 22,}, 
["Riflessi di Swift"] = {class = "MONK", level = 23,}, 
["Fortificando Brew"] = {class = "MONK", level = 24,}, 
["Espellere danno"] = {class = "MONK", level = 26,}, 
["Disattivare"] = {class = "MONK", level = 28,},
["Agile Brew"] = {class = "MONK", level = 30,}, 
["Pellegrinaggio Zen: restituire"] = {class = "MONK", level = 30,}, 
["Lancia mano colpire"] = {class = "MONK", level = 32,}, 
["Paralisi"] = {class = "MONK", level = 44,}, 
["Spinning Kick gru"] = {class = "MONK", level = 46,}, 
["Scoppiettante Jade Lightning"] = {class = "MONK", level = 54,}, 
["Guarigione sfera"] = {class = "MONK", level = 64,}, 
["Arma di cimentarsi"] = {class = "MONK", level = 68,}, 
["Meditazione Zen"] = {class = "MONK", level = 82,}, 
["Trascendenza"] = {class = "MONK", level = 87,}, 
["Trascendenza: Transfer"] = {class = "MONK", level = 87,},
--+ + Glifo abilità + +
["Leer del bue"] = {class = "MONK", level = 25,},
["Volo Zen"] = {class = "MONK", level = 25,}, 
--+ + Specializzazione Monaco + +
--+ + Mistweaver/Windwalker + + 
["Tigre colpisce"] = {class = "MONK", level = 10,}, 
--+ + Mastro birraio + + 
["Atteggiamento del robusto bue"] = {class = "MONK", level = 10,}, 
["Vertiginosa Haze"] = {class = "MONK", level = 10,}, 
["Vendetta"] = {class = "MONK", level = 10,}, 
["Barile Smash"] = {class = "MONK", level = 11,}, 
["Clash"] = {class = "MONK", level = 18,}, 
["Respiro di fuoco"] = {class = "MONK", level = 18,}, 
["Guardia"] = {class = "MONK", level = 26,}, 
["Formazione del mastro birraio"] = {class = "MONK", level = 34,}, 
["Brew sfuggente"] = {class = "MONK", level = 36,}, 
["Della birra: birra sfuggente"] = {class = "MONK", level = 36,}, 
["Misure disperate"] = {class = "MONK", level = 45,}, 
["Evitare danni"] = {class = "MONK", level = 48,}, 
["Dono del bue"] = {class = "MONK", level = 56,}, 
["Convocare statua Ox nero"] = {class = "MONK", level = 70,}, 
["Purificante Brew"] = {class = "MONK", level = 75,}, 
["Brawler sfuggente"] = {class = "MONK", level = 80,},
--+ + Mistweaver + + 
["Posizione del serpente saggio"] = {class = "MONK", level = 10,}, 
["Lenitivo nebbia"] = {class = "MONK", level = 10,}, 
["Meditazione di mana"] = {class = "MONK", level = 10,},
["Avvolgente nebbia"] = {class = "MONK", level = 16,}, 
["Medicina interna"] = {class = "MONK", level = 20,}, 
["Memoria muscolare"] = {class = "MONK", level = 20,}, --+ +
["Surging nebbia"] = {class = "MONK", level = 32,}, 
["Insegnamenti del monastero"] = {class = "MONK", level = 34,}, 
["Rinnovando nebbia"] = {class = "MONK", level = 42,}, 
["Demateralize"] = {class = "MONK", level = 45,}, 
["Vita bozzolo"] = {class = "MONK", level = 50,}, 
["Tè di mana"] = {class = "MONK", level = 56,}, 
["Brewing: tè di Mana"] = {class = "MONK", level = 56,}, 
["Uplift"] = {class = "MONK", level = 62,}, 
["Tuono fuoco tè"] = {class = "MONK", level = 66,}, 
["Convocare Jade statua serpente"] = {class = "MONK", level = 70,}, 
["Revival"] = {class = "MONK", level = 78,}, 
["Dono del serpente"] = {class = "MONK", level = 80,}, 
--+ + Windwalker + + 
["Pugni di furia"] = {class = "MONK", level = 10,}, 
["Combo Breaker"] = {class = "MONK", level = 15,}, 
["Flying Serpent Kick"] = { class = "MONK", level = 18, }, 
["Combat Conditioning"] = { class = "MONK", level = 20, }, 
["Touch of Karma"] = { class = "MONK", level = 22, }, 
["Afterlife"] = { class = "MONK", level = 26, }, 
["Energizing Brew"] = { class = "MONK", level = 36, }, 
["Sparring"] = { class = "MONK", level = 42, }, 
["Adaptation"] = { class = "MONK", level = 45, }, 
["Spinning Fire Blossom"] = { class = "MONK", level = 48, }, 
["Rising Sun Kick"] = { class = "MONK", level = 56, }, 
["Tigereye Brew"] = { class = "MONK", level = 56, }, 
["Brewing: Tigereye Brew"] = { class = "MONK", level = 56, }, 
["Storm, Earth and Fire"] = { class = "MONK", level = 75, }, 
["Bottled Fury"] = { class = "MONK", level = 80, }, 
["Legacy of the White Tiger"] = { class = "MONK", level = 81, }, 
--++ Monk Talents ++
["Celerity"] = { class = "MONK", level = 15, }, 
["Tiger's Lust"] = { class = "MONK", level = 15, }, 
["Momentum"] = { class = "MONK", level = 15, }, 
["Chi Wave"] = { class = "MONK", level = 30, }, 
["Zen Sphere"] = { class = "MONK", level = 30, }, 
["Chi Burst"] = { class = "MONK", level = 30, }, 
["Power Strikes"] = { class = "MONK", level = 45, }, 
["Ascension"] = { class = "MONK", level = 45, }, 
["Chi Brew"] = { class = "MONK", level = 45, }, 
["Ring of Peace"] = { class = "MONK", level = 60, },
["Charging Ox Wave"] = { class = "MONK", level = 60, }, 
["Leg Sweep"] = { class = "MONK", level = 60, }, 
["Healing Elixirs"] = { class = "MONK", level = 75, }, 
["Dampen Harm"] = { class = "MONK", level = 75, }, 
["Diffuse Magic"] = { class = "MONK", level = 75, }, 
["Rushing Jade Wind"] = { class = "MONK", level = 90, }, 
["Invoke Xuen, the White Tiger"] = { class = "MONK", level = 90, }, 
["Chi Torpedo"] = { class = "MONK", level = 90, }, 
 
--++ Paladin Abilities ++
["Crusader Strike"] = { class = "PALADIN", level = 1, },
["Seal of Command"] = { class = "PALADIN", level = 3, },
["Judgment"] = { class = "PALADIN", level = 5, },
["Hammer of Justice"] = { class = "PALADIN", level = 7, },
["Harsh Word"] = { class = "PALADIN", level = 9, },
["Word of Glory"] = { class = "PALADIN", level = 9, },
["Righteous Fury"] = { class = "PALADIN", level = 12, },
["Redemption"] = { class = "PALADIN", level = 13, },
["Flash of Light"] = { class = "PALADIN", level = 14, },
["Reckoning"] = { class = "PALADIN", level = 15, }, 
["Lay on Hands"] = { class = "PALADIN", level = 16, },
["Divine Shield"] = { class = "PALADIN", level = 18, },
["Cleanse"] = { class = "PALADIN", level = 20, },
["Seal of Truth"] = { class = "PALADIN", level = 24, },
["Divine Protection"] = { class = "PALADIN", level = 26, },
["Blessing of Kings"] = { class = "PALADIN", level = 30, },
["Seal of Insight"] = { class = "PALADIN", level = 32, },
["Supplica"] = {class = "PALADIN", level = 34,},
["Rimprovero"] = {class = "PALADIN", level = 36,},
["Martello d'ira"] = {class = "PALADIN", level = 38,},
["Sigillo della giustizia"] = {class = "PALADIN", level = 42,},
["Cuore del crociato"] = {class = "PALADIN", level = 44,},
["Girata male"] = {class = "PALADIN", level = 46,},
["Mano di protezione"] = {class = "PALADIN", level = 48,},
["Mano della libertà"] = {class = "PALADIN", level = 52,},
["Santità della battaglia"] = {class = "PALADIN", level = 58,},
["Aura di devozione"] = {class = "PALADIN", level = 60,},
["La mano della salvezza"] = {class = "PALADIN", level = 66,},
["Avenging Wrath"] = {class = "PALADIN", level = 72,},
["La mano del sacrificio"] = {class = "PALADIN", level = 80,},
["Benedizione della forza"] = {class = "PALADIN", level = 81,},
["Boundless convinzione"] = {class = "PALADIN", level = 85,},
["Luce accecante"] = {class = "PALADIN", level = 87,},
--+ + Glifo abilità + +
["Contemplazione"] = {class = "PALADIN", level = 25,},
--+ + Specializzazione paladino + +
--+ + Protezione/retribuzione + + 
["Martello dei giusti"] = {class = "PALADIN", level = 20,},
--+ + Santo/Protection/Retribution + + 
["Guardiano degli antichi re"] = {class = "PALADIN", level = 75,}, 
--+ + Santa + +
["Holy Shock"] = {class = "PALADIN", level = 10,},
["Insight Santo"] = {class = "PALADIN", level = 10,},
["Denunciare"] = {class = "PALADIN", level = 20,},
["Sacred Cleansing"] = {class = "PALADIN", level = 20,}, 
["Holy Radiance"] = {class = "PALADIN", level = 28,},
["Holy Light"] = {class = "PALADIN", level = 34,},
["Faro di luce"] = {class = "PALADIN", level = 39,},
["Motivo divino"] = {class = "PALADIN", level = 46,},
["Infusione di luce"] = {class = "PALADIN", level = 50,},
["Luce divina"] = {class = "PALADIN", level = 54,},
["Alba"] = {class = "PALADIN", level = 56,},
["Favore divino"] = {class = "PALADIN", level = 62,},
["Tower of Radiance"] = {class = "PALADIN", level = 64,},
["Luce dell'alba"] = {class = "PALADIN", level = 70,},
["Illuminated Healing"] = {class = "PALADIN", level = 80,}, 
--+ + Protezione + + 
["Scudo avenger"] = {class = "PALADIN", level = 10,},
["Custodito dalla luce"] = {class = "PALADIN", level = 10,},
["Vendetta"] = {class = "PALADIN", level = 10,},
["Holy Wrath"] = {class = "PALADIN", level = 20,},
["Sentenze del saggio"] = {class = "PALADIN", level = 28,},
["Consacrazione"] = {class = "PALADIN", level = 34,},
["Scudo dei giusti"] = {class ="PALADIN", level = 40,},
["Grand Crusader"] = {class = "PALADIN", level = 50,},
["Santuario"] = {class = "PALADIN", level = 64,},
["Difensore ardente"] = {class = "PALADIN", level = 70,},
["Divino baluardo"] = {class = "PALADIN", level = 80,},
--+ + Retribution + + 
["Verdetto templare"] = {class = "PALADIN", level = 10,},
["La spada di luce"] = {class = "PALADIN", level = 10,},
["Sentenze di the Bold"] = {class = "PALADIN", level = 28,},
["Divine Storm"] = {class = "PALADIN", level = 34,},
["Esorcismo"] = {class = "PALADIN", level = 46,},
["L'arte della guerra"] = {class = "PALADIN", level = 50,},
["Emancipare"] = {class = "PALADIN", level = 54,},
["Sigillo della giustizia"] = {class = "PALADIN", level = 70,},
["Assolvo"] = {class = "PALADIN", level = 80,}, --+ +
["La mano di luce"] = {class = "PALADIN", level = 80,},
["Inquisizione"] = {class = "PALADIN", level = 81,}, 
--+ + Paladino talenti + +
["La velocità della luce"] = {class = "PALADIN", level = 15,},
["Braccio lungo della legge"] = {class = "PALADIN", level = 15,},
["La ricerca della giustizia"] = {class = "PALADIN", level = 15,}, 
["Pugno di giustizia"] = {class = "PALADIN", level = 30,},
["Pentimento"] = {class = "PALADIN", level = 30,},
["Il male è un punto di vista"] = {class = "PALADIN", level = 30,}, 
["Guaritore altruista"] = {class = "PALADIN", level = 45,},
["Fiamma eterna"] = {class = "PALADIN", level = 45,},
["Sacred Shield"] = {class = "PALADIN", level = 45,}, 
["Mano di purezza"] = {class = "PALADIN", level = 60,},
["Spirito indistruttibile"] = {class = "PALADIN", level = 60,},
["Clemenza"] = {class = "PALADIN", level = 60,}, 
["Sacro vendicatore"] = {class = "PALADIN", level = 75,},
["Sanctified Wrath"] = { class = "PALADIN", level = 75, },
["Divine Purpose"] = { class = "PALADIN", level = 75, }, 
["Holy Prism"] = { class = "PALADIN", level = 90, },
["Light's Hammer"] = { class = "PALADIN", level = 90, },
["Execution Sentence"] = { class = "PALADIN", level = 90, },
 
--++ Priest Abilities ++
["Smite"] = { class = "PRIEST", level = 1, },
["Shadow Word: Pain"] = { class = "PRIEST", level = 3, },
["Power Word: Shield"] = { class = "PRIEST", level = 5, },
["Flash Heal"] = { class = "PRIEST", level = 7, },
["Inner Fire"] = { class = "PRIEST", level = 9, },
["Divine Focus"] = { class = "PRIEST", level = 10, },
["Psychic Scream"] = { class = "PRIEST", level = 12, },
["Resurrection"] = { class = "PRIEST", level = 18, },
["Power Word: Fortitude"] = { class = "PRIEST", level = 22, },
["Fade"] = { class = "PRIEST", level = 24, },
["Dispel Magic"] = { class = "PRIEST", level = 26, },
["Renew"] = { class = "PRIEST", level = 26, },
["Shackle Undead"] = { class = "PRIEST", level = 32, },
["Levitate"] = { class = "PRIEST", level = 34, },
["Mind Vision"] = { class = "PRIEST", level = 42, },
["Shadowfiend"] = { class = "PRIEST", level = 42, },
["Shadow Word: Death"] = { class = "PRIEST", level = 46, },
["Binding Heal"] = { class = "PRIEST", level = 48, },
["Mysticism"] = { class = "PRIEST", level = 50, },
["Fear Ward"] = { class = "PRIEST", level = 54, },
["Hymn of Hope"] = { class = "PRIEST", level = 66, },
["Prayer of Mending"] = { class = "PRIEST", level = 68, },
["Mass Dispel"] = { class = "PRIEST", level = 72, },
["Mind Sear"] = { class = "PRIEST", level = 76, },
["Inner Will"] = { class = "PRIEST", level = 80, },
["Leap of Faith"] = { class = "PRIEST", level = 84, },
["Void Shift"] = { class = "PRIEST", level = 87, },
--++ Glyph Abilities ++
["Holy Nova"] = { class = "PRIEST", level = 25, },
["Confession"] = { class = "PRIEST", level = 25, },
--++ Priest Specialization ++
--++ Discipline/Holy ++
["Meditation"] = { class = "PRIEST", level = 10, },
["Spiritual Healing"] = { class = "PRIEST", level = 10, }, 
["Holy Fire"] = { class = "PRIEST", level = 18, },
["Purify"] = { class = "PRIEST", level = 22, },
["Heal"] = { class = "PRIEST", level = 28, },
["Focused Will"] = { class = "PRIEST", level = 28, }, 
["Greater Heal"] = { class = "PRIEST", level = 34, },
["Evangelism"] = { class = "PRIEST", level = 44, },
["Prayer of Healing"] = { class = "PRIEST", level = 46, },
--++ Discipline ++
["Rapture"] = { class = "PRIEST", level = 10, },
["Penance"] = { class = "PRIEST", level = 10, },
["Divine Aegis"] = { class = "PRIEST", level = 24, },
["Spirit Shell"] = { class = "PRIEST", level = 28, },
["Inner Focus"] = { class = "PRIEST", level = 36, },
["Atonement"] = { class = "PRIEST", level = 38, }, 
["Grace"] = { class = "PRIEST", level = 45, },
                ["Archangel"] =                                                 { class = "PRIEST", level = 50, },
                ["Strength of Soul"] =                    { class = "PRIEST", level = 52, },
                ["Pain Suppression"] =                  { class = "PRIEST", level = 58, },
                ["Borrowed Time"] =                      { class = "PRIEST", level = 62, },
                ["Power Word: Barrier"] =           { class = "PRIEST", level = 70, },
                ["Train of Thought"] =                    { class = "PRIEST", level = 78, },
                ["Shield Discipline"] =     { class = "PRIEST", level = 80, },
                --++ Holy ++
                ["Holy Word: Chastise"] =            { class = "PRIEST", level = 10, },
                ["Spirit of Redemption"] =           { class = "PRIEST", level = 30, },
                ["Serendipity"] =                                              { class = "PRIEST", level = 34, },
                ["Lightwell"] =                                   { class = "PRIEST", level = 36, }, --Added in Patch 5.4 
                ["Circle of Healing"] =     { class = "PRIEST", level = 50, },
                ["Chakra: Chastise"] =                    { class = "PRIEST", level = 56, },
                ["Chakra: Sanctuary"] =                 { class = "PRIEST", level = 56, },
                ["Chakra: Serenity"] =                    { class = "PRIEST", level = 56, },
                ["Rapid Renewal"] =                       { class = "PRIEST", level = 64, },
                ["Guardian Spirit"] =                       { class = "PRIEST", level = 70, },
                ["Divine Hymn"] =                                           { class = "PRIEST", level = 78, },
                ["Echo of Light"] =                           { class = "PRIEST", level = 80, },
                --++ Shadow ++
                ["Mind Flay"] =                                                 { class = "PRIEST", level = 10, },
                ["Spiritual Precision"] =                 { class = "PRIEST", level = 10, }, --changed
                ["Devouring Plague"] =                                 { class = "PRIEST", level = 21, },
                ["Mind Blast"] =                                                { class = "PRIEST", level = 21, },
                ["Shadow Orbs"] =                                          { class = "PRIEST", level = 21, },
                ["Shadowform"] =                                           { class = "PRIEST", level = 24, },
                ["Vampiric Touch"] =                      { class = "PRIEST", level = 28, },
                ["Shadowy Apparitions"] =          { class = "PRIEST", level = 42, },
                ["Mind Spike"] =                                              { class = "PRIEST", level = 44, },
                ["Silence"] =                                                       { class = "PRIEST", level = 52, },
                ["Dispersion"] =                                                { class = "PRIEST", level = 60, },
                ["Psychic Horror"] =                        { class = "PRIEST", level = 74, },
                ["Vampiric Embrace"] =                                 { class = "PRIEST", level = 78, },
                ["Shadowy Recall"] =                      { class = "PRIEST", level = 80, },
--++ Priest Talents ++
                ["Void Tendrils"] =                           { class = "PRIEST", level = 15, },
                ["Psyfiend"] =                                                   { class = "PRIEST", level = 15, },
                ["Dominate Mind"] =                     { class = "PRIEST", level = 15, }, 
                ["Body and Soul"] =                        { class = "PRIEST", level = 30, },
                ["Angelic Feather"] =                     { class = "PRIEST", level = 30, },
                ["Phantasm"] =                                                                 { class = "PRIEST", level = 30, }, 
                ["From Darkness, Comes Light"] = { class = "PRIEST", level = 45, },
                ["Mindbender"] =                                           { class = "PRIEST", level = 45, },
                ["Solace and Insanity"] =              { class = "PRIEST", level = 45, }, 
                ["Desperate Prayer"] =                                 { class = "PRIEST", level = 60, },
                ["Spectral Guise"] =                        { class = "PRIEST", level = 60, },
                ["Angelic Bulwark"] =                     { class = "PRIEST", level = 60, }, 
                ["Twist of Fate"] =                           { class = "PRIEST", level = 75, },
                ["Power Infusion"] =                      { class = "PRIEST", level = 75, },
                ["Divine Insight"] =                          { class = "PRIEST", level = 75, }, 
                ["Cascade"] =                                                    { class = "PRIEST", level = 90, },
                ["Divine Star"] =                                               { class = "PRIEST", level = 90, },
                ["Halo"] =                                                                            { class = "PRIEST", level = 90, },
 
--++ Rogue Abilities ++
                ["Sinister Strike"] =                         { class = "ROGUE", level = 1, },
                ["Eviscerate"] =                                                { class = "ROGUE", level = 3, },
                ["Stealth"] =                                                       { class = "ROGUE", level = 5, },
                ["Ambush"] =                                                    { class = "ROGUE", level = 6, },
                ["Evasion"] =                                                      { class = "ROGUE", level = 8, },
                ["Deadly Poison"] =                        { class = "ROGUE", level = 10, },
                ["Sap"] =                                                                              { class = "ROGUE", level = 12, },
                ["Slice and Dice"] =                          { class = "ROGUE", level = 14, },
                ["Pick Pocket"] =                                              { class = "ROGUE", level = 15, },
                ["Recuperate"] =                                             { class = "ROGUE", level = 16, },
                ["Kick"] =                                                                             { class = "ROGUE", level = 18, },
                ["Crippling Poison"] =                     { class = "ROGUE", level = 20, },
                ["Gouge"] =                                                       { class = "ROGUE", level = 22, },
                ["Pick Lock"] =                                   { class = "ROGUE", level = 24, },
                ["Sprint"] =                                                         { class = "ROGUE", level = 26, },
                ["Distract"] =                                                      { class = "ROGUE", level = 28, },
                ["Mind-numbing Poison"] =        { class = "ROGUE", level = 28, },
                ["Cheap Shot"] =                                              { class = "ROGUE", level = 30, },
                ["Wound Poison"] =                                       { class = "ROGUE", level = 30, },
                ["Swiftblade's Cunning"] =           { class = "ROGUE", level = 30, },
                ["Vanish"] =                                                       { class = "ROGUE", level = 34, },
                ["Expose Armor"] =                                        { class = "ROGUE", level = 36, },
                ["Blind"] =                                                           { class = "ROGUE", level = 38, },
                ["Kidney Shot"] =                                             { class = "ROGUE", level = 40, },
                ["Detect Traps"] =                                           { class = "ROGUE", level = 42, },
                ["Feint"] =                                                           { class = "ROGUE", level = 44, },
                ["Rupture"] =                                                    { class = "ROGUE", level = 46, },
                ["Garrote"] =                                                     { class = "ROGUE", level = 48, },
                ["Safe Fall"] =                                    { class = "ROGUE", level = 48, },
                ["Dismantle"] =                                                 { class = "ROGUE", level = 52, },
                ["Relentless Strikes"] =                 { class = "ROGUE", level = 54, },
                ["Disarm Trap"] =                                             { class = "ROGUE", level = 56, },
                ["Cloak of Shadows"] =                                 { class = "ROGUE", level = 58, },
                ["Fleet Footed"] =                                           { class = "ROGUE", level = 62, },
                ["Master Poisoner"] =                   { class = "ROGUE", level = 64, },
                ["Fan of Knives"] =                          { class = "ROGUE", level = 66, },
                ["Preparation"] =                                             { class = "ROGUE", level = 68, },
                ["Shadow Walk"] =                                          { class = "ROGUE", level = 72, },
                ["Shiv"] =                                                                             { class = "ROGUE", level = 74, },
--             ["Shroud of Concealment"] = { class = "ROGUE", level = 76, }, not activated
                ["Tricks of the Trade"] =                { class = "ROGUE", level = 78, },
                ["Redirect"] =                                                    { class = "ROGUE", level = 81, },
                ["Crimson Tempest"] =                                 { class = "ROGUE", level = 83, },
                ["Smoke Bomb"] =                                          { class = "ROGUE", level = 85, },
                ["Shadow Blades"] =                      { class = "ROGUE", level = 87, },
                --++ Glyph Abilities ++
                ["Detection"] =                                                 { class = "ROGUE", level = 25, },  
--++ Rogue Specialization ++
                --++ Assassination ++  
                ["Assassin's Resolve"] =                { class = "ROGUE", level = 10, },
                ["Improved Poisons"] =                                { class = "ROGUE", level = 10, },
                ["Mutilate"] =                                                    { class = "ROGUE", level = 10, },
                ["Envenom"] =                                                  { class = "ROGUE", level = 20, },
                ["Seal Fate"] =                                   { class = "ROGUE", level = 30, },
                ["Dispatch"] =                                                    { class = "ROGUE", level = 40, },
                ["Venomous Wounds"] =                             { class = "ROGUE", level = 50, },
                ["Cut to the Chase"] =                   { class = "ROGUE", level = 60, },
                ["Blindside"] =                                   { class = "ROGUE", level = 70, },
                ["Vendetta"] =                                                  { class = "ROGUE", level = 80, },
                ["Potent Poisons"] =                      { class = "ROGUE", level = 80, },
                --++ Combat ++  
                ["Ambidexterity"] =                        { class = "ROGUE", level = 10, },
                ["Vitality"] =                                                       { class = "ROGUE", level = 10, },
                ["Blade Flurry"] =                                             { class = "ROGUE", level = 10, },
                ["Revealing Strike"] =                     { class = "ROGUE", level = 20, },
                ["Combat Potency"] =                   { class = "ROGUE", level = 30, },
                ["Ruthlessness"] =                                          { class = "ROGUE", level = 32, }, -- Added in Patch 5.4
                ["Adrenaline Rush"] =                    { class = "ROGUE", level = 40, },
                ["Restless Blades"] =                      { class = "ROGUE", level = 50, },
                ["Bandit's Guile"] =                         { class = "ROGUE", level = 60, },
                ["Killing Spree"] =                            { class = "ROGUE", level = 80, },
                ["Main Gauche"] =                                          { class = "ROGUE", level = 80, },
                --++ Subtlety ++
                ["Hemorrhage"] =                                           { class = "ROGUE", level = 10, },
                ["Master of Subtlety"] =               { class = "ROGUE", level = 10, },
                ["Sinister Calling"] =                        { class = "ROGUE", level = 10, },
                ["Find Weakness"] =                      { class = "ROGUE", level = 20, },
                ["Premeditation"] =                        { class = "ROGUE", level = 30, },
                ["Backstab"] =                                                   { class = "ROGUE", level = 40, },
                ["Honor Among Thieves"] =        { class = "ROGUE", level = 50, },
                ["Sanguinary Vein"] =                    { class = "ROGUE", level = 60, },
                ["Energetic Recovery"] =              { class = "ROGUE", level = 70, },
                ["Shadow Dance"] =                                       { class = "ROGUE", level = 80, },
                ["Executioner"] =                                             { class = "ROGUE", level = 80, }, 
--++ Rogue Talents ++
                ["Nightstalker"] =                                            { class = "ROGUE", level = 15, },
                ["Subterfuge"] =                                              { class = "ROGUE", level = 15, },
                ["Shadow Focus"] =                                        { class = "ROGUE", level = 15, },
                ["Deadly Throw"] =                                         { class = "ROGUE", level = 30, },
                ["Nerve Strike"] =                                            { class = "ROGUE", level = 30, },
                ["Combat Readiness"] =                               { class = "ROGUE", level = 30, }, 
                ["Cheat Death"] =                                            { class = "ROGUE", level = 45, },
                ["Leeching Poison"] =                    { class = "ROGUE", level = 45, },
                ["Elusiveness"] =                                              { class = "ROGUE", level = 45, }, 
                ["Shadowstep"] =                                            { class = "ROGUE", level = 60, },
                ["Burst of Speed"] =                       { class = "ROGUE", level = 60, }, 
                ["Cloak and Dagger"] =                  { class = "ROGUE", level = 60, }, 
                ["Prey on the Weak"] =                                 { class = "ROGUE", level = 75, },
                ["Paralytic Poison"] =                     { class = "ROGUE", level = 75, },
                ["Dirty Tricks"] =                                               { class = "ROGUE", level = 75, }, 
                ["Shuriken Toss"] =                         { class = "ROGUE", level = 90, },
                ["Marked for Death"] =                 { class = "ROGUE", level = 90, },
                ["Anticipation"] =                                             { class = "ROGUE", level = 90, },
 
--++ Shaman Abilities ++
                ["Lightning Bolt"] =                          { class = "SHAMAN", level = 1, },
                ["Primal Strike"] =                            { class = "SHAMAN", level = 3, },
                ["Earth Shock"] =                                             { class = "SHAMAN", level = 6, },
                ["Healing Surge"] =                         { class = "SHAMAN", level = 7, },
                ["Lightning Shield"] =                     { class = "SHAMAN", level = 8, },
                ["Flametongue Weapon"] =        { class = "SHAMAN", level = 10, },
                ["Flame Shock"] =                                            { class = "SHAMAN", level = 12, },
                ["Purge"] =                                                         { class = "SHAMAN", level = 12, },
                ["Ancestral Spirit"] =                       { class = "SHAMAN", level = 14, },
                ["Ghost Wolf"] =                                              { class = "SHAMAN", level = 15, },
                ["Searing Totem"] =                        { class = "SHAMAN", level = 16, },
                ["Wind Shear"] =                                              { class = "SHAMAN", level = 16, },
                ["Cleanse Spirit"] =                          { class = "SHAMAN", level = 18, },
                ["Water Shield"] =                                           { class = "SHAMAN", level = 20, },
                ["Frost Shock"] =                                              { class = "SHAMAN", level = 22, },
                ["Water Walking"] =                       { class = "SHAMAN", level = 24, },
                ["Earthbind Totem"] =                   { class = "SHAMAN", level = 26, },
                ["Chain Lightning"] =                      { class = "SHAMAN", level = 28, },
                ["Healing Stream Totem"] =        { class = "SHAMAN", level = 30, },
                ["Totemic Recall"] =                        { class = "SHAMAN", level = 30, },
                ["Reincarnation"] =                         { class = "SHAMAN", level = 32, },
                ["Astral Recall"] =                             { class = "SHAMAN", level = 34, },
                ["Far Sight"] =                                    { class = "SHAMAN", level = 36, },
                ["Magma Totem"] =                                       { class = "SHAMAN", level = 36, },
                ["Grounding Totem"] =                                 { class = "SHAMAN", level = 38, },
                ["Burning Wrath"] =                        { class = "SHAMAN", level = 40, },
                ["Chain Heal"] =                                                { class = "SHAMAN", level = 44, },
                ["Frostbrand Weapon"] =            { class = "SHAMAN", level = 46, },
                ["Tremor Totem"] =                                        { class = "SHAMAN", level = 54, },
                ["Earth Elemental Totem"] = { class = "SHAMAN", level = 58, },
                ["Healing Rain"] =                                            { class = "SHAMAN", level = 60, },
                ["Capacitor Totem"] =                    { class = "SHAMAN", level = 63, },
                ["Healing Tide Totem"] =              { class = "SHAMAN", level = 65, }, 
                ["Fire Elemental Totem"] =          { class = "SHAMAN", level = 66, },
                ["Heroism"] =                                                    { class = "SHAMAN", level = 70, },
                ["Bloodlust"] =                                  { class = "SHAMAN", level = 70, },
                ["Bind Elemental"] =                       { class = "SHAMAN", level = 72, },
                ["Hex"] =                                                                             { class = "SHAMAN", level = 75, },
                ["Rockbiter Weapon"] =                               { class = "SHAMAN", level = 75, },
                ["Stormlash Totem"] =                  { class = "SHAMAN", level = 78, },
                ["Grace of Air"] =                                             { class = "SHAMAN", level = 80, },
                ["Unleash Elements"] =                                { class = "SHAMAN", level = 81, },
                ["Spiritwalker's Grace"] =             { class = "SHAMAN", level = 85, },
                ["Ascendance"] =                                            { class = "SHAMAN", level = 87, },
--++ Shaman Specialization ++
                --++ Elemental/Restoration ++ 
                ["Spiritual Insight"] =      { class = "SHAMAN", level = 10, },
                ["Lava Burst"] =                                                { class = "SHAMAN", level = 34, },
                --++ Elemental/Enhancement ++
                ["Shamanistic Rage"] =                  { class = "SHAMAN", level = 65, },              
                --++ Elemental ++ 
                ["Elemental Fury"] =                       { class = "SHAMAN", level = 10, },
                ["Elemental Precision"] =             { class = "SHAMAN", level = 10, },
                ["Elemental Reach"] =                   { class = "SHAMAN", level = 10, },
                ["Shamanism"] =                                              { class = "SHAMAN", level = 10, },
                ["Thunderstorm"] =                                        { class = "SHAMAN", level = 10, },
                ["Rolling Thunder"] =                     { class = "SHAMAN", level = 20, },
                ["Fulmination"] =                                             { class = "SHAMAN", level = 20, }, --changed
                ["Elemental Focus"] =                    { class = "SHAMAN", level = 40, },
                ["Lava Surge"] =                                               { class = "SHAMAN", level = 50, },
                ["Elemental Oath"] =                      { class = "SHAMAN", level = 55, },
                ["Earthquake"] =                                              { class = "SHAMAN", level = 60, },
                ["Elemental Overload"] =             { class = "SHAMAN", level = 80, },
                --++ Enhancement ++
                ["Lava Lash"] =                                  { class = "SHAMAN", level = 10, },
                ["Mental Quickness"] =                                 { class = "SHAMAN", level = 10, },
                ["Primal Wisdom"] =                       { class = "SHAMAN", level = 10, }, 
                ["Flurry"] =                                                         { class = "SHAMAN", level = 20, },
                ["Stormstrike"] =                                             { class = "SHAMAN", level = 26, },
                ["Windfury Weapon"] =                                { class = "SHAMAN", level = 30, },
                ["Searing Flames"] =                       { class = "SHAMAN", level = 34, },
                ["Static Shock"] =                                             { class = "SHAMAN", level = 40, },
                ["Fire Nova"] =                                  { class = "SHAMAN", level = 44, },
                ["Maelstrom Weapon"] =                            { class = "SHAMAN", level = 50, },
                ["Unleashed Rage"] =                    { class = "SHAMAN", level = 55, },
                ["Feral Spirit"] =                                                { class = "SHAMAN", level = 60, },
                ["Spirit Walk"] =                                                { class = "SHAMAN", level = 60, },
                ["Enhanced Elements"] =             { class = "SHAMAN", level = 80, },
                --++ Restoration ++
                ["Meditation"] =                                              { class = "SHAMAN", level = 10, },
                ["Purification"] =                                              { class = "SHAMAN", level = 10, },
                ["Riptide"] =                                                       { class = "SHAMAN", level = 10, },
                ["Purify Spirit"] =                              { class = "SHAMAN", level = 18, },              --++
                ["Healing Wave"] =                                         { class = "SHAMAN", level = 20, },
                ["Earth Shield"] =                                             { class = "SHAMAN", level = 26, },
                ["Earthliving Weapon"] =              { class = "SHAMAN", level = 30, },
                ["Ancestral Awakening"] =          { class = "SHAMAN", level = 34, },
                ["Resurgence"] =                                             { class = "SHAMAN", level = 40, },
                ["Tidal Waves"] =                                             { class = "SHAMAN", level = 50, },
                ["Mana Tide Totem"] =                                 { class = "SHAMAN", level = 56, },
                ["Greater Healing Wave"] =        { class = "SHAMAN", level = 60, },
                ["Spirit Link Totem"] =   { class = "SHAMAN", level = 70, },
                ["Deep Healing"] =                                          { class = "SHAMAN", level = 80, }, 
--++ Shaman Talents ++
                ["Nature's Guardian"] =                { class = "SHAMAN", level = 15, },
                ["Stone Bulwark Totem"] =         { class = "SHAMAN", level = 15, },
                ["Astral Shift"] =                                               { class = "SHAMAN", level = 15, }, 
                ["Frozen Power"] =                                         { class = "SHAMAN", level = 30, },
                ["Earthgrab Totem"] =                   { class = "SHAMAN", level = 30, },
                ["Windwalk Totem"] =                   { class = "SHAMAN", level = 30, }, 
                ["Call of the Elements"] =             { class = "SHAMAN", level = 45, },
                ["Totemic Persistence"] =            { class = "SHAMAN", level = 45, },
                ["Totemic Projection"] =               { class = "SHAMAN", level = 45, }, 
                ["Elemental Mastery"] =               { class = "SHAMAN", level = 60, },
                ["Ancestral Swiftness"] =             { class = "SHAMAN", level = 60, },
                ["Echo of the Elements"] =          { class = "SHAMAN", level = 60, }, 
                ["Rushing Streams"] =                   { class = "SHAMAN", level = 75, },
                ["Ancestral Guidance"] =              { class = "SHAMAN", level = 75, },
                ["Conductivity"] =                                            { class = "SHAMAN", level = 75, }, 
                ["Unleashed Fury"] =                     { class = "SHAMAN", level = 90, },
                ["Primal Elementalist"] =              { class = "SHAMAN", level = 90, },
                ["Elemental Blast"] =                      { class = "SHAMAN", level = 90, },
 
--++ Warlock Abilities ++
                ["Shadow Bolt"] =                                            { class = "WARLOCK", level = 1, },
                ["Demonic Slash"] =                        { class = "WARLOCK", level = 1, }, -- Dark Apotheosis Ability
                ["Siphon Life"] =                                               { class = "WARLOCK", level = 1, }, --++
                ["Summon Imp"] =                                          { class = "WARLOCK", level = 1, },
                ["Corruption"] =                                               { class = "WARLOCK", level = 3, },
                ["Drain Life"] =                                  { class = "WARLOCK", level = 7, },
                ["Summon Voidwalker"] =           { class = "WARLOCK", level = 8, },
                ["Create Healthstone"] =             { class = "WARLOCK", level = 9, },
                ["Control Demon"] =                      { class = "WARLOCK", level = 10, },
                ["Health Funnel"] =                         { class = "WARLOCK", level = 11, },
                ["Fear"] =                                                                            { class = "WARLOCK", level = 14, },
                ["Sleep"] =                                                          { class = "WARLOCK", level = 14, }, -- Dark Apotheosis Ability
                ["Life Tap"] =                                                     { class = "WARLOCK", level = 16, },
                ["Curse of Enfeeblement"] = { class = "WARLOCK", level = 17, },
                ["Soulstone"] =                                                 { class = "WARLOCK", level = 18, },
                ["Summon Succubus"] =                               { class = "WARLOCK", level = 20, },
                ["Eye of Kilrogg"] =                          { class = "WARLOCK", level = 22, },
                ["Unending Breath"] =                  { class = "WARLOCK", level = 24, },
                ["Soul Harvest"] =                                            { class = "WARLOCK", level = 27, },
                ["Summon Felhunter"] =                              { class = "WARLOCK", level = 29, },
                ["Howl of Terror"] =                        { class = "WARLOCK", level = 30, }, --Added in Patch 5.4 
                ["Enslave Demon"] =                      { class = "WARLOCK", level = 31, },
                ["Banish"] =                                                        { class = "WARLOCK", level = 32, },
                ["Twilight Ward"] =                         { class = "WARLOCK", level = 34, },
                ["Fury Ward"] =                                                { class = "WARLOCK", level = 34, }, -- Dark Apotheosis Ability
                ["Fel Armor"] =                                                 { class = "WARLOCK", level = 38, },
                ["Ritual of Summoning"] =           { class = "WARLOCK", level = 42, },
                ["Summon Infernal"] =                  { class = "WARLOCK", level = 49, },
                ["Nethermancy"] =                                         { class = "WARLOCK", level = 50, },
                ["Curse of the Elements"] = { class = "WARLOCK", level = 51, },
                ["Command Demon"] =                                { class = "WARLOCK", level = 56, },
                ["Summon Doomguard"] =                          { class = "WARLOCK", level = 58, },
                ["Unending Resolve"] =                                { class = "WARLOCK", level = 64, },
                ["Soulshatter"] =                                              { class = "WARLOCK", level = 66, },
                ["Provocation"] =                                             { class = "WARLOCK", level = 66, }, -- Dark Apotheosis Ability
                ["Create Soulwell"] =                     { class = "WARLOCK", level = 68, },
                ["Demonic Circle: Summon"] = { class = "WARLOCK", level = 76, },
                ["Demonic Circle: Teleport"] = { class = "WARLOCK", level = 76, },
                ["Fel Flame"] =                                  { class = "WARLOCK", level = 77, },
                ["Dark Intent"] =                                              { class = "WARLOCK", level = 82, },
                ["Demonic Gateway"] =                                { class = "WARLOCK", level = 87, },
                ["Pandemic"] =                                                                 { class = "WARLOCK", level = 90, }, 
                --++ Glyph Abilities ++
                ["Dark Apotheosis"] =                    { class = "WARLOCK", level = 25, },
                ["Imp Swarm"] =                                              { class = "WARLOCK", level = 25, },
--++ Warlock Specialization ++
                --++ Affliction/Destruction ++
                ["Rain of Fire"] =                                              { class = "WARLOCK", level = 21, },
                --++ Affliction ++
                ["Unstable Affliction"] =               { class = "WARLOCK", level = 10, },
                ["Drain Soul"] =                                                 { class = "WARLOCK", level = 19, },
                ["Soulburn"] =                                                   { class = "WARLOCK", level = 19, },
                ["Soulburn: Health Funnel"] = { class = "WARLOCK", level = 27, },
                ["Curse of Exhaustion"] =             { class = "WARLOCK", level = 32, },
                ["Agony"] =                                                        { class = "WARLOCK", level = 36, },
                ["Malefic Grasp"] =                         { class = "WARLOCK", level = 42, },
                ["Nightfall"] =                                    { class = "WARLOCK", level = 54, },
                ["Seed of Corruption"] =              { class = "WARLOCK", level = 60, },
                ["Haunt"] =                                                         { class = "WARLOCK", level = 62, },
                ["Soulburn: Seed of Corruption"] = { class = "WARLOCK", level = 62, },
                ["Improved Fear"] =                       { class = "WARLOCK", level = 69, },
                ["Soulburn: Curse"] =                     { class = "WARLOCK", level = 73, },
                ["Soul Swap"] =                                                { class = "WARLOCK", level = 79, },
                ["Soulburn: Soul Swap"] =            { class = "WARLOCK", level = 79, },            --++
                ["Potent Afflictions"] = { class = "WARLOCK", level = 80, },
                ["Dark Soul: Misery"] = { class = "WARLOCK", level = 84, },
                ["Soulburn: Demonic Circle: Teleport"] = { class = "WARLOCK", level = 86, },
                --++ Demonology ++
                ["Demonic Fury"] =                                         { class = "WARLOCK", level = 10, },
                ["Metamorphosis"] =                     { class = "WARLOCK", level = 10, },
                ["Demonic Leap"] =                                        { class = "WARLOCK", level = 12, },
                ["Soul Fire"] =                                    { class = "WARLOCK", level = 13, },
                ["Hand of Gul'dan"] =                    { class = "WARLOCK", level = 19, },
                ["Hellfire"] =                                                      { class = "WARLOCK", level = 22, },
                ["Metamorphosis: Touch of Chaos"] = { class = "WARLOCK", level = 25, }, --changed
                ["Nether Plating"] =                        { class = "WARLOCK", level = 27, },
                ["Wild Imps"] =                                                 { class = "WARLOCK", level = 32, },
                ["Metamorphosis: Doom"] =      { class = "WARLOCK", level = 36, }, --changed
                ["Summon Felguard"] =                                { class = "WARLOCK", level = 42, },
                ["Carrion Swarm"] =                       { class = "WARLOCK", level = 47, },
                ["Demonic Rebirth"] =                   { class = "WARLOCK", level = 54, },
                ["Metamorphosis: Immolation Aura"] = { class = "WARLOCK", level = 62, }, --changed
                ["Metamorphosis: Cursed Auras"] = { class = "WARLOCK", level = 67, }, --changed
                ["Molten Core"] =                                           { class = "WARLOCK", level = 69, },
                ["Decimation"] =                                              { class = "WARLOCK", level = 73, },
                ["Metamorphosis: Chaos Wave"] = { class = "WARLOCK", level = 79, },
                ["Master Demonologist"] =         { class = "WARLOCK", level = 80, },
                ["Dark Soul: Knowledge"] =         { class = "WARLOCK", level = 84, },
                ["Metamorphosis: Void Ray"] = { class = "WARLOCK", level = 85, }, --changed
                --++ Destruction ++
                ["Chaotic Energy"] =                       { class = "WARLOCK", level = 10, },
                ["Conflagrate"] =                                             { class = "WARLOCK", level = 10, },
                ["Incinerate"] =                                                { class = "WARLOCK", level = 10, },
                ["Immolate"] =                                                                 { class = "WARLOCK", level = 12, },
                ["Backlash"] =                                                    { class = "WARLOCK", level = 32, },
                ["Havoc"] =                                                         { class = "WARLOCK", level = 36, },
                ["Chaos Bolt"] =                                                { class = "WARLOCK", level = 42, },
                ["Ember Tap"] =                                               { class = "WARLOCK", level = 42, },
                ["Burning Embers"] =                     { class = "WARLOCK", level = 42, },
                ["Shadowburn"] =                                           { class = "WARLOCK", level = 47, },
                ["Fire and Brimstone"] =               { class = "WARLOCK", level = 54, },
                ["Aftermath"] =                                                { class = "WARLOCK", level = 54, },
                ["Backdraft"] =                                  { class = "WARLOCK", level = 69, },
                ["Flames of Xoroth"] =                  { class = "WARLOCK", level = 79, },
                ["Emberstorm"] =                                            { class = "WARLOCK", level = 80, },
                ["Dark Soul: Instability"] = { class = "WARLOCK", level = 84, },
                ["Pyroclasm"] =                                                { class = "WARLOCK", level = 86, },
--++ Warlock Talents ++
                ["Dark Regeneration"] =               { class = "WARLOCK", level = 15, },
                ["Soul Leech"] =                                               { class = "WARLOCK", level = 15, },
                ["Harvest Life"] =                                             { class = "WARLOCK", level = 15, }, 
                ["Demonic Breath"] =                    { class = "WARLOCK", level = 30, }, --Added in Patch 5.4
                ["Mortal Coil"] =                                               { class = "WARLOCK", level = 30, },
                ["Shadowfury"] =                                            { class = "WARLOCK", level = 30, }, 
                ["Soul Link"] =                                   { class = "WARLOCK", level = 45, },
                ["Sacrificial Pact"] =                         { class = "WARLOCK", level = 45, },
                ["Dark Bargain"] =                                            { class = "WARLOCK", level = 45, }, 
                ["Blood Horror"] =                                           { class = "WARLOCK", level = 60, }, --changed
                ["Burning Rush"] =                                          { class = "WARLOCK", level = 60, },
                ["Unbound Will"] =                                         { class = "WARLOCK", level = 60, }, 
                ["Grimoire of Supremacy"] = { class = "WARLOCK", level = 75, },
                ["Grimoire of Service"] =              { class = "WARLOCK", level = 75, },
                ["Grimoire of Sacrifice"] = { class = "WARLOCK", level = 75, }, 
                ["Archimonde's Darkness"] = { class = "WARLOCK", level = 90, }, --Removed in Patch 5.4
                ["Kil'jaeden's Cunning"] =            { class = "WARLOCK", level = 90, },
                ["Mannoroth's Fury"] =                                 { class = "WARLOCK", level = 90, }, 
 
--++ Warrior Abilities ++
                ["Battle Stance"] =                          { class = "WARRIOR", level = 1, },
                ["Heroic Strike"] =                           { class = "WARRIOR", level = 1, },
                ["Charge"] =                                                       { class = "WARRIOR", level = 3, },
                ["Victory Rush"] =                                            { class = "WARRIOR", level = 5, },
                ["Execute"] =                                                     { class = "WARRIOR", level = 7, },
                ["Defensive Stance"] =                  { class = "WARRIOR", level = 9, },
                ["Taunt"] =                                                         { class = "WARRIOR", level = 12, },
                ["Enrage"] =                                                       { class = "WARRIOR", level = 14, },
                ["Sunder Armor"] =                                        { class = "WARRIOR", level = 16, },
                ["Thunder Clap"] =                                          { class = "WARRIOR", level = 20, },
                ["Heroic Throw"] =                                          { class = "WARRIOR", level = 22, },
                ["Pummel"] =                                                    { class = "WARRIOR", level = 24, },
                ["Disarm"] =                                                       { class = "WARRIOR", level = 28, },
                ["Deep Wounds"] =                                        { class = "WARRIOR", level = 32, },
                ["Berserker Stance"] =                  { class = "WARRIOR", level = 34, },
                ["Hamstring"] =                                                { class = "WARRIOR", level = 36, },
                ["Battle Shout"] =                                            { class = "WARRIOR", level = 42, },
                ["Cleave"] =                                                       { class = "WARRIOR", level = 44, },
                ["Shield Wall"] =                                               { class = "WARRIOR", level = 48, },
                ["Intimidating Shout"] =                { class = "WARRIOR", level = 52, },
                ["Berserker Rage"] =                      { class = "WARRIOR", level = 54, },
                ["Recklessness"] =                                          { class = "WARRIOR", level = 62, },
                ["Spell Reflection"] =                      { class = "WARRIOR", level = 66, },
                ["Commanding Shout"] =                             { class = "WARRIOR", level = 68, },
                ["Intervene"] =                                                 { class = "WARRIOR", level = 72, },
                ["Shattering Throw"] =                  { class = "WARRIOR", level = 74, },
--             ["Ripsote"] =                                                      { class = "WARRIOR", level = 76, }, --Added in Patch 5.4 but not activated since Death Knights also have this ability
                ["Rallying Cry"] =                                              { class = "WARRIOR", level = 83, },
                ["Heroic Leap"] =                                             { class = "WARRIOR", level = 85, },
                ["Demoralizing Banner"] =           { class = "WARRIOR", level = 87, },
                ["Mocking Banner"] =                    { class = "WARRIOR", level = 87, },
                ["Skull Banner"] =                                            { class = "WARRIOR", level = 87, },
--++ Warrior Specialization ++
                --++ Arms/Fury ++
                ["Whirlwind"] =                                                { class = "WARRIOR", level = 26, },
                ["Die by the Sword"] =                  { class = "WARRIOR", level = 56, },
                ["Unbridled Wrath"] =                   { class = "WARRIOR", level = 56, }, --++
                ["Colossus Smash"] =                     { class = "WARRIOR", level = 81, },
                --++ Arms/Protection ++              
                ["Blood and Thunder"] =              { class = "WARRIOR", level = 46, },
                --++ Arms ++
                ["Mortal Strike"] =                           { class = "WARRIOR", level = 10, },
                ["Seasoned Soldier"] =                  { class = "WARRIOR", level = 10, },
                ["Slam"] =                                                                           { class = "WARRIOR", level = 18, },
                ["Overpower"] =                                              { class = "WARRIOR", level = 30, },
                ["Taste for Blood"] =                      { class = "WARRIOR", level = 30, },
                ["Sweeping Strikes"] =                  { class = "WARRIOR", level = 60, },
                ["Strikes of Opportunity"] = { class = "WARRIOR", level = 80, },
                ["Sudden Death"] =                                        { class = "WARRIOR", level = 81, },
                --++ Fury ++
                ["Bloodthirst"] =                                               { class = "WARRIOR", level = 10, },
                ["Crazed Berserker"] =                  { class = "WARRIOR", level = 10, },
                ["Wild Strike"] =                                               { class = "WARRIOR", level = 18, },
                ["Raging Blow"] =                                             { class = "WARRIOR", level = 30, },
                ["Titan's Grip"] =                                              { class = "WARRIOR", level = 38, },
                ["Single-Minded Fury"] =             { class = "WARRIOR", level = 38, },
                ["Bloodsurge"] =                                              { class = "WARRIOR", level = 50, },
                ["Meat Cleaver"] =                                          { class = "WARRIOR", level = 58, },
                ["Flurry"] =                                                         { class = "WARRIOR", level = 60, },
                ["Unshackled Fury"] =                   { class = "WARRIOR", level = 80, },
                --++ Protection ++  
                ["Shield Slam"] =                                              { class = "WARRIOR", level = 10, },
                ["Unwavering Sentinel"] =           { class = "WARRIOR", level = 10, },
                ["Vengeance"] =                                              { class = "WARRIOR", level = 10, },
                ["Shield Block"] =                                             { class = "WARRIOR", level = 18, },
                ["Devastate"] =                                                { class = "WARRIOR", level = 26, },
                ["Revenge"] =                                                   { class = "WARRIOR", level = 30, },
                ["Last Stand"] =                                                { class = "WARRIOR", level = 38, },
                ["Sword and Board"] =                  { class = "WARRIOR", level = 50, },
                ["Demoralizing Shout"] =              { class = "WARRIOR", level = 56, },
                ["Ultimatum"] =                                               { class = "WARRIOR", level = 58, },
                ["Bastion of Defense"] =              { class = "WARRIOR", level = 60, },
                ["Critical Block"] =                            { class = "WARRIOR", level = 80, },
                ["Shield Barrier"] =                          { class = "WARRIOR", level = 81, },
                --++ Warrior Talents ++
                ["Juggernaut"] =                                              { class = "WARRIOR", level = 15, },
                ["Double Time"] =                                           { class = "WARRIOR", level = 15, },
                ["Warbringer"] =                                              { class = "WARRIOR", level = 15, }, 
                ["Enraged Regeneration"] =        { class = "WARRIOR", level = 30, },
                ["Second Wind"] =                                          { class = "WARRIOR", level = 30, },
                ["Impending Victory"] =                { class = "WARRIOR", level = 30, }, 
                ["Staggering Shout"] =                   { class = "WARRIOR", level = 45, },
                ["Piercing Howl"] =                          { class = "WARRIOR", level = 45, },
                ["Disrupting Shout"] =                   { class = "WARRIOR", level = 45, },
                ["Bladestorm"] =                                              { class = "WARRIOR", level = 60, },
                ["Shockwave"] =                                              { class = "WARRIOR", level = 60, },
                ["Dragon Roar"] =                                            { class = "WARRIOR", level = 60, }, 
                ["Mass Spell Reflection"] = { class = "WARRIOR", level = 75, },
                ["Safeguard"] =                                                { class = "WARRIOR", level = 75, },
                ["Vigilance"] =                                   { class = "WARRIOR", level = 75, }, 
                ["Avatar"] =                                                        { class = "WARRIOR", level = 90, },
                ["Bloodbath"] =                                                { class = "WARRIOR", level = 90, },
                ["Storm Bolt"] =                                                { class = "WARRIOR", level = 90, },
};
