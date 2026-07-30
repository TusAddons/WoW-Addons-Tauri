local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "ptBR")
if not L then return end


-- Addon information
L["Spy"] = "Spy"
L["Version"] = "Versão"
L["LoadDescription"] = "|cff9933ffSpy foi carregado. Digite |cffffffff/spy|cff9933ff para opções."
L["SpyEnabled"] = "|cff9933ffSpy addon ativado."
L["SpyDisabled"] = "|cff9933ffSpy addon desativado. Digite |cffffffff/spy enable|cff9933ff para ativar."
L["UpgradeAvailable"] = "|cff9933ffA nova versão do Spy está disponivel. Baixe-o em:\n|cffffffffhttps://mods.curse.com/addons/wow/spy"

-- Configuration frame name
L["Spy Option"] = "Spy"

-- Configuration strings
L["Profiles"] = "Perfis"

L["GeneralSettings"] = "Configurações Gerais"
L["SpyDescription1"] = [[
Spy é um addon que vai alerta-lo da presença de jogadores inimigos nas proximidades.
]]
L["SpyDescription2"] = [[

|cffffd000Lista de Proximidades|cffffffff
A lista de Proximidades mostra qualquer inimigo detectado nas proximidades. Clicando na lista você irá mirar no jogador, mas isso só funciona fora de combate. Jogadores são removidos da lista se não forem mais detectados após um certo período de tempo.

O botão limpar na barra de titulo é usado para limpar a lista, e segurando Ctrl enquanto limpa a lista permite a você rapidamente ativar/desativar o Spy.

|cffffd000Lista da Última Hora|cffffffff
A Lista da Última Hora mostra todos os inimigos detectados na ultima hora.

|cffffd000Lista de Ignorados|cffffffff
Jogadores que são adicionados à lista de Ignorados não serão reportados pelo Spy. Você pode adicionar ou remover jogadores dessa lista usando o menu de contexto ou segurando Ctrl enquanto clicando no botão.

|cffffd000Lista Negra|cffffffff
Jogadores que são adicionados à Lista Negra são reportados pelo Spy através de um alarme sonoro.  Você pode adicionar ou remover jogadores dessa lista usando o menu de contexto ou segurando Shift enquanto clica no botão.

O menu de contexto também permite que você justifique as razões que o levou a colocar determinada pessoa na Lista Negra. Se quiser colocar uma motivo especifico que não tenha na lista, em seguida, use "Digite seu próprio motivo..." em Outra lista..


|cffffd000Autor: http://www.curse.com/users/slipjack |cffffffff

]]
L["EnableSpy"] = "Ativar Spy"
L["EnableSpyDescription"] = "Ativa ou desativa o Spy."
L["EnabledInBattlegrounds"] = "Ativar Spy em CB"
L["EnabledInBattlegroundsDescription"] = "Ativa ou desativa o Spy em Campos de Batalha."
L["EnabledInArenas"] = "Ativar Spy em Arenas"
L["EnabledInArenasDescription"] = "Ativa ou desativa o Spy em Arenas."
L["EnabledInWintergrasp"] = "Ativar Spy em Zonas de Combate"
L["EnabledInWintergraspDescription"] = "Ativa ou desativa o Spy em locais como Invérnia."
L["DisableWhenPVPUnflagged"] = "Desativar Spy quando PVP estiver desativado"
L["DisableWhenPVPUnflaggedDescription"] = "Ativa ou desativa o Spy dependendo se o seu status de PVP estiver ativado ou desativado."

L["DisplayOptions"] = "Exibição"
L["DisplayOptionsDescription"] = [[
Spy pode ser mostrado e escondido automaticamente.
]]
L["ShowOnDetection"] = "Mostrar Spy quando um inimigo for detectado"
L["ShowOnDetectionDescription"] = "Marque isso para que o Spy mostre a lista de Proximidades quando um inimigo for detectado."
L["HideSpy"] = "Esconder Spy quando nenhum inimigo for detectado"
L["HideSpyDescription"] = "Marque isso para que o Spy seja escondido quando a lista de Proximidades estiver sendo mostrada e ficar vazia. Spy não será escondido se você limpar a lista manualmente."
L["ShowOnlyPvPFlagged"] = "Mostrar apenas jogadores inimigos sinalizados para PvP"
L["ShowOnlyPvPFlaggedDescription"] = "Defina isto para mostrar apenas jogadores inimigos marcados para PvP na lista Proximidades.."
L["LockSpy"] = "Travar a janela do Spy"
L["LockSpyDescription"] = "Trava a janela para que ela não possa ser movida."
L["InvertSpy"] = "Inverter a janela de Spy"
L["InvertSpyDescription"] = "Inverte a janela de Spy de cabeça para baixo."
L["ResizeSpy"] = "Redimensionar janela do Spy automaticamente"
L["ResizeSpyDescription"] = "Marque isso para que a janela do Spy seja redimensionada a medida que novos jogadores são adicionados ou removidos."
L["TooltipDisplayWinLoss"] = "Mostar estastica de Vitória/Derrota nas dicas"
L["TooltipDisplayWinLossDescription"] = "Marque isso para que seja mostrado na dicas do jogador, as estasticas de Vitória/Derrota daquele um jogador."
L["TooltipDisplayKOSReason"] = "Mostrar motivos da Lista Negra nas dicas"
L["TooltipDisplayKOSReasonDescription"] = "Marque isso para que seja mostrado na dicas do jogador os motivos da Lista Negra daquele jogador."
L["TooltipDisplayLastSeen"] = "Mostrar detalhes da ultima vez visto nas dicas"
L["TooltipDisplayLastSeenDescription"] = "Marque isso para que seja mostrado nas dicas de jogador o ultimo local e hora em que aquele jogador foi visto."
L["SelectFont"] = "Selekt e Font"
L["SelectFontDescription"] = "Selecione um tipo de letra para o Spy mostre ."
L["RowHeight"] = "Selecione a altura da linha"
L["RowHeightDescription"] = "Selecione a altura da linha para a janela do espião."

L["AlertOptions"] = "Alertas"
L["AlertOptionsDescription"] = [[
Você pode anunciar em qualquer canal do chat os detalhes de um encontro e controlar como o Spy te alerta quando um inimigo é detectado.
]]
L["Announce"] = "Anunciar Para:"
L["None"] = "Ninguem"
L["NoneDescription"] = "Não anunciar quando jogadores inimigos forem detectados."
L["Self"] = "Você"
L["SelfDescription"] = "Anunciar para si mesmo quando jogadores inimigos forem detectados"
L["Party"] = "Grupo"
L["PartyDescription"] = "Anunciar para o grupo quando jogadores inimigos forem detectados."
L["Guild"] = "Guilda"
L["GuildDescription"] = "Anunciar para a guilda quando jogadores inimigos forem detectados."
L["Raid"] = "Raide"
L["RaidDescription"] = "Anunciar para a raide quando jogadores inimigos forem detectados."
L["LocalDefense"] = "Defesa Local"
L["LocalDefenseDescription"] = "Anunciar para a Defesa Local quando jogadores inimigos forem detectados."
L["OnlyAnnounceKoS"] = "Anunciar inimigos da Lista Negra"
L["OnlyAnnounceKoSDescription"] = "Marque isso para anunciar apenas inimigos que estejam na Lista Negra."
L["WarnOnStealth"] = "Alertar ao detectar invisibilidade"
L["WarnOnStealthDescription"] = "Marque isso para alertar com texto e som quando um inimigo ficar invisivel."
L["WarnOnKOS"] = "Alertar ao detectar inimigos da Lista Negra"
L["WarnOnKOSDescription"] = "Marque isso para alertar com texto e som quando um inimigo da Lista Negra for detectado."
L["WarnOnKOSGuild"] = "Alertar ao detectar Guildie de Lista Negra"
L["WarnOnKOSGuildDescription"] = "Marque isso para alertar com texto e som quando for detectado um integrante da guilda de alguem que esteja na Lista Negra."
L["WarnOnRace"] = "Avisar após a detecção raça"
L["WarnOnRaceDescription"] = "Defina esta opção para soar um alerta quando a raça selecionada é detectado."
L["SelectWarnRace"] = "Selecione Raça para a detecção"
L["SelectWarnRaceDescription"] = "Selecione uma raça para alerta de áudio."
L["WarnRaceNote"] = "Nota: Você deve atingir o inimigo, pelo menos uma vez para que sua raça pode ser adicionado ao banco de dados. Na próxima detecção um alerta será emitido. Isso não funciona o mesmo que detectar os inimigos próximos em combate."
L["DisplayWarningsInErrorsFrame"] = "Mostrar alertas no campo de erros"
L["DisplayWarningsInErrorsFrameDescription"] = "Marque isso para usar o campo de erros para mostrar alertas ao invés de usar os popups graficos."
L["EnableSound"] = "Ativar alertas sonoros"
L["EnableSoundDescription"] = "marque isso para ativar alertas sonoros quando um inimigo for detectado. Os sons são diferentes para Lista Negra e inimigos que ficam invisiveis."
L["OnlySoundKoS"] = "Somente alertas sonoros de áudio para a lista Negra"
L["OnlySoundKoSDescription"] = "Defina esta opção para reproduzir apenas alertas de áudio quando forem detectados jogadores inimigos na lista Negra."

L["ListOptions"] = "Lista de Proximidades"
L["ListOptionsDescription"] = [[
Você pode configurar como o Spy adiciona e remove inimigos da lista de Proximidades.
]]
L["RemoveUndetected"] = "Remover jogadores não detectados da lista de Proximidades após:"
L["1Min"] = "1 minuto"
L["1MinDescription"] = "Remove jogadores que não forem mais detectados após 1 minuto."
L["2Min"] = "2 minutos"
L["2MinDescription"] = "Remove jogadores que não forem mais detectados após 2 minutos."
L["5Min"] = "5 minutos"
L["5MinDescription"] = "Remove jogadores que não forem mais detectados após 5 minutos."
L["10Min"] = "10 minutos"
L["10MinDescription"] = "Remove jogadores que não forem mais detectados após 10 minutos."
L["15Min"] = "15 minutos"
L["15MinDescription"] = "Remove jogadores que não forem mais detectados após 15 minutos."
L["Never"] = "Nunca Remover"
L["NeverDescription"] = "Nunca remover jogadores inimigos. A lista de Proximidades ainda pode ser limpa manualmente."
L["ShowNearbyList"] = "Trocar para a lista de Proximidades ao detectar jogador inimigo"
L["ShowNearbyListDescription"] = "Marque isso para que ao detectar jogadores inimigos, seja mostrada a lista de Proximidades se já não estiver sendo mostrada."
L["PrioritiseKoS"] = "Piorizar inimigos da Lista Negra na lista de Proximidades"
L["PrioritiseKoSDescription"] = "Marque isso para sempre motrar primeiro inimigos da Lista Negra na lista de Proximidades."

L["MinimapOptions"] = "Mapa"
L["MinimapOptionsDescription"] = [[
Para jogadores que podem rastrear humanóides o minimapa pode ser utilizado para fornecer recursos adicionais.

Jogadores que podem rastrear humanóides incluem caçadores, druidas e aqueles que recebem a habilidade por outros meios como por exemplo comendo Filé de Worg Esturricado.
]]
L["MinimapTracking"] = "Ativar rastreamento no minimapa"
L["MinimapTrackingDescription"] = "Marque isso para ativar rastreamento e detecção no minimapa. Jogadores inimigos detectados no minimapa serão adicionados à lista de Proximidades."
L["MinimapDetails"] = "Mostrar detalhes de level/classe nas dicas"
L["MinimapDetailsDescription"] = "Marque isso para atualizar as dicas do mapa para que o level e a classe sejam mostrados juntamente com o nome dos inimigos."
L["DisplayOnMap"] = "Mostrar localização do inimigo no mapa"
L["DisplayOnMapDescription"] = "Marque isso para que seja mostrado no mapa-múndi e no minimapa a localização dos inimigos detectados por outros usuários do Spy em seu grupo, raide e guilda."
L["SwitchToZone"] = "Mudar para o mapa actual zona de detecção de inimigo"
L["SwitchToZoneDescription"] = "Se o mapa do mundo está aberto isso vai mudar o mapa para o jogadores mapa da zona atual quando são detectados inimigos."
L["MapDisplayLimit"] = "Limitar icones mostrados no mapa para:"
L["LimitNone"] = "Todos os lugares"
L["LimitNoneDescription"] = "Mostrar no mapa todos os inimigos detectados independente da sua atual localização."
L["LimitSameZone"] = "Mesma Zona"
L["LimitSameZoneDescription"] = "Mostrar no mapa somente inimigos que estejam na mesma zona que você."
L["LimitSameContinent"] = "Mesmo Continente"
L["LimitSameContinentDescription"] = "Mostrar no mapa somente inimigos que estejam no mesmo continente que você."

L["DataOptions"] = "Gerenciamento de Dados"
L["DataOptionsDescription"] = [[
Você pode configurar como o Spy coleta e mantem os dados.
]]
L["PurgeData"] = "Limpar dados de inimigos não detectados após:"
L["OneDay"] = "1 dia"
L["OneDayDescription"] = "Limpa os dados de inimigos que não foram detectados a mais de 1 dia."
L["FiveDays"] = "5 dias"
L["FiveDaysDescription"] = "Limpa os dados de inimigos que não foram detectados a mais de 5 dias dias."
L["TenDays"] = "10 dias"
L["TenDaysDescription"] = "Limpa os dados de inimigos que não foram detectados a mais de 10 dias."
L["ThirtyDays"] = "30 dias"
L["ThirtyDaysDescription"] = "Limpa os dados de inimigos que não foram detectados a mais de 30 dias."
L["SixtyDays"] = "60 dias"
L["SixtyDaysDescription"] = "Limpa os dados de inimigos que não foram detectados a mais de 60 dias."
L["NinetyDays"] = "90 dias"
L["NinetyDaysDescription"] = "Limpa os dados de inimigos que não foram detectados a mais de 90 dis."
L["PurgeKoS"] = "Purgar jogadores Lista Negra com base no tempo sem ser detectado."
L["PurgeKoSDescription"] = "Defina esta opção para purgar os jogadores da Lista Negra que foram não detectados com base nas configurações de tempo para os jogadores não detectados."
L["PurgeWinLossDate"] = "Eliminar dados win / perda com base no tempo sem ser detectado."
L["PurgeWinLossDateDescription"] = "Defina esta opção para limpar os dados win / perda de seu inimigo encontros com base nas configurações de tempo para os jogadores não detectados."
L["ShareData"] = "Compartilhar dados com outros usuários do Spy"
L["ShareDataDescription"] = "Marque isso para compartilhar os dados dos inimigos encontrados com outros usuários do Spy em seu grupo, raide e guilda."
L["UseData"] = "Usar dados de outros usuários do Spy"
L["UseDataDescription"] = [[Marque isso para usar dados coletados por outros usuários do Spy em seu grupo, raide e guilda.

Se outro usuário do Spy detectar um jogador inimigo ele será adicionado a sua lista de Proximidades se ela não estiver cheia
]]
L["ShareKOSBetweenCharacters"] = "Compartilhar Lista Negra entre todos os seus personagens"
L["ShareKOSBetweenCharactersDescription"] = "Marque isso para que a Lista Negra seja compartilhada entre todos os seus personagens do mesmo reino e facção."

L["SlashCommand"] = "Slash Command"
L["SpySlashDescription"] = "Esses botões executam as mesmas funções que aquelas vistas no slash command /spy"
L["Enable"] = "Enable"
L["EnableDescription"] = "Permite que o Spy e mostra a janela principal."
L["Reset"] = "Reset"
L["ResetDescription"] = "Reseta a posição e aparencia da janela principal."
L["Config"] = "Config"
L["ConfigDescription"] = "Abre a janela de configuração do Spy."
L["KOS"] = "Lista Negra"
L["KOSDescription"] = "Adicionar/remover jogadores na Lista Negra."
L["Ignore"] = "Ignore"
L["IgnoreDescription"] = "Adicionar/remover um jogador de/para a lista de ignorados."

-- Lists
L["Nearby"] = "Proximidades"
L["LastHour"] = "Ultima Hora"
L["Ignore"] = "Ignorados"
L["KillOnSight"] = "Lista Negra"

--Stats
--L["Last"] = "Last"
L["Time"] = "Tempo"	
L["List"] = "Lista"	
L["Show Only"] = "Spenas Mostrar"
L["Wins/Loses"] = "Ganhou/Perdeu"
L["Reason"] = "Motivo"
L["HonorKills"] = "Honra Mata"
L["PvPDeatchs"] = "Mortes PvP"	

--++ Class descriptions
L["DEATHKNIGHT"] = "Cavaleiro da Morte"
L["DEMONHUNTER"] = "Caçador de Demonios"
L["DRUID"] = "Druida"
L["HUNTER"] = "Caçador"
L["MAGE"] = "Mago"
L["MONK"] = "Monge"
L["PALADIN"] = "Paladino"
L["PRIEST"] = "Sacerdote"
L["ROGUE"] = "Ladino"
L["SHAMAN"] = "Xamã"
L["WARLOCK"] = "Bruxo"
L["WARRIOR"] = "Guerreiro"
L["UNKNOWN"] = "Desconhecido"

--++ Race descriptions
L["BLOOD ELF"] = "Elfo Sangrento"
L["DRAENEI"] = "Draenei"
L["DWARF"] = "Anão"
L["GOBLIN"] = "Goblin"
L["GNOME"] = "Gnomo"
L["HUMAN"] = "Humano"
L["NIGHT ELF"] = "Elfo Noturno"
L["ORC"] = "Orc"
L["PANDAREN"] = "Pandaren"
L["TAUREN"] = "Tauren"
L["TROLL"] = "Troll"
L["UNDEAD"] = "Morto-vivo"
L["WORGEN"] = "Worgen"
L["VOID ELF"] = "Void Elf"	
L["LIGHTFORGED DRAENEI"] = "Lightforged Draenei"
L["NIGHTBORNE"] = "Nightborne"
L["HIGHMOUNTAIN TAUREN"] = "Highmountain Tauren"

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

-- Stealth abilities
L["Stealth"] = "Furtividade"
L["Prowl"] = "Espreitar"

-- Channel names
L["LocalDefenseChannelName"] = "DefesaLocal"

--++ Minimap color codes
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

-- Output messages
L["AlertStealthTitle"] = "Jogador invisivel detectado!"
L["AlertKOSTitle"] = "Jogador na Lista Negra detectado!"
L["AlertKOSGuildTitle"] = "Guildie de Lista Negra detectado!"
L["AlertTitle_kosaway"] = "Jogador na Lista Negra localizado por "
L["AlertTitle_kosguildaway"] = "Guildie de Lista Negra localizado por "
L["StealthWarning"] = "|cff9933ffJogador invisivel detectado: |cffffffff"
L["KOSWarning"] = "|cffff0000Jogador na Lista Negra detectado: |cffffffff"
L["KOSGuildWarning"] = "|cffff0000Guildie de Lista Negra detectado: |cffffffff"
L["SpySignatureColored"] = "|cff9933ff[Spy] "
L["PlayerDetectedColored"] = "Jogador detectado: |cffffffff"
L["PlayersDetectedColored"] = "Jogadores detectados: |cffffffff"
L["KillOnSightDetectedColored"] = "Jogador na Lista Negra detectado: |cffffffff"
L["PlayerAddedToIgnoreColored"] = "Jogador adicionado à lista de Ignorados: |cffffffff"
L["PlayerRemovedFromIgnoreColored"] = "Jogador removido da lista de Ignorados: |cffffffff"
L["PlayerAddedToKOSColored"] = "Jogador adicionado à Lista Negra: |cffffffff"
L["PlayerRemovedFromKOSColored"] = "Jogador removido da Lista Negra: |cffffffff"
L["PlayerDetected"] = "[Spy] Jogador Detectado: "
L["KillOnSightDetected"] = "[Spy] Jogador na Lista Negra detectado: "
L["Level"] = "Level"
L["LastSeen"] = "Visto há"
L["LessThanOneMinuteAgo"] = "menos de um minuto"
L["MinutesAgo"] = "minutos atrás"
L["HoursAgo"] = "hóras atrás"
L["DaysAgo"] = "dias atrás"
L["Close"] = "Fechar"
L["CloseDescription"] = "|cffffffffEsconde a janela do Spy. Por defeito ela irá ser mostrada novamante quando um jogador inimigo for detectado."
L["Left/Right"] = "Direita/Esquerda"
L["Left/RightDescription"] = "|cffffffffNavega entre as listas de Proximidades, Ultima Hora, Ignorados e Lista Negra."
L["Clear"] = "Limpar"
L["ClearDescription"] = "|cffffffffLimpa a lista de inimigos detectados. Ctrl e click Ativa/Desativa o Spy."
L["NearbyCount"] = "Contador de Inimigos"
L["NearbyCountDescription"] = "|cffffffffMostra no chat o contatdor de inimigos nas proximidades."
L["Statistics"] = "Estatística"
L["StatsDescription"] = "|cffffffffMostra uma lista de jogadores inimigos encontrados, registros de vitória / perda e onde eles foram vistos pela última vez"
L["AddToIgnoreList"] = "Adicionar à lista de Ignorados"
L["AddToKOSList"] = "Adicionar à Lista Negra"
L["RemoveFromIgnoreList"] = "Remover da lista de Ignorados"
L["RemoveFromKOSList"] = "Remover da Lista Negra"
L["RemoveFromStatsList"] = "Remover da Lista de Estatísticas"   --++
L["AnnounceDropDownMenu"] = "Anunciar"
L["KOSReasonDropDownMenu"] = "Determinar motivo de estar na Lista Negra"
L["PartyDropDownMenu"] = "Grupo"
L["RaidDropDownMenu"] = "Raide"
L["GuildDropDownMenu"] = "Guilda"
L["LocalDefenseDropDownMenu"] = "Defesa Local"
L["Player"] = " (Jogador)"
L["KOSReason"] = "Lista Negra"
L["KOSReasonIndent"] = "    "
L["KOSReasonOther"] = "Digite seu próprio motivo..."
L["KOSReasonClear"] = "Limpar"
L["StatsWins"] = "|cff40ff00Vitórias: "
L["StatsSeparator"] = "  "
L["StatsLoses"] = "|cff0070ddDerrotas: "
L["Located"] = "localizado:"
L["Yards"] = "jardas"

Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
	[1] = {
		["title"] = "Iniciou combate";
		["content"] = {
			"Me atacou sem motivos",
			"Me atacou no recrutador", --++
			"Me atacou enquanto eu lutava com NPCs",
			"Me atacou enquanto eu estava perto de uma masmorra",
			"Me atacou quando eu estava LDT",
			"Me atacou enquanto eu estava montado/voando",
			"Me atacou enquanto eu tinha pouca vida/mana",
		};
	},
	[2] = {
		["title"] = "Estilo de Combate";
		["content"] = {
			"Me emboscou",
			"Ataca sempre que me vê",
			"Me matou com um personagem de nível superior", 
			"Me massacrou junto de vários inimigos",
			"Só ataca em bando",
			"Sempre pede ajuda",
			"Usa muito controle de multidão",
		};
	},
	[3] = {
		["title"] = "Campando";
		["content"] = {
			"Me campou",
			"Campou meu alt",
			"Campou low levels",
			"Campou ficando invisivel",
			"Campou membros da guilda",
			"Campou NPCs/Objetivos",
			"Campou Cidade/Local",
		};
	},
	[4] = {
		["title"] = "Quests";
		["content"] = {
			"Me atacou enquanto eu fazia quests",
			"Me atacou depois que eu ajudei ele com uma quest",
			"Interferiu com os objetivos da quest",
			"Iniciou uma quest que eu queria fazer",
			"Matou NPCs da minha facção",
			"Matou um NPC de quest",
		};
	},
	[5] = {
		["title"] = "Ladrão de recursos";
		["content"] = {
			"Colheu erva que eu queria",
			"Minerou minério que eu queria",
			"Pegou recursos que eu queria",
			"Me matou e roubou meu alvo/raro NPC",
			"Esfolou mobs que eu matei",
			"Resgatou os mobs que eu matei",
			"Pescou na minha lagoa",
		};
	},
	[6] = {
		["title"] = "Outros";
		["content"] = {
			"Ta com o PVP ativado",
			"Me empurrou de um penhasco",
			"Usa truques de egenharia",
			"Sempre consegue escapar",
			"Usa itens e skills pra fugir",
 			"Burla as mecanicas do jogo",
			"Digite seu próprio motivo...",
		};
	},
}

StaticPopupDialogs["Spy_SetKOSReasonOther"] = {
	preferredIndex=STATICPOPUPS_NUMDIALOGS,  -- http://forums.wowace.com/showthread.php?p=320956
	text = "Motivos para colocar %s na Lista Negra:",
	button1 = "Pronto",
	button2 = "Cancelar",
	timeout = 20,
	hasEditBox = 1,
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("");
	end,
    	OnAccept = function(self)
		local reason = self.editBox:GetText()
		Spy:SetKOSReason(self.playerName, "Digite seu próprio motivo...", reason)
	end,
};

Spy_AbilityList = {

-----------------------------------------------------------
-- Allows an estimation of the race, class and level of a
-- player to be determined from what abilities are observed
-- in the combat log.
-----------------------------------------------------------

--++ Racials ++
	["Forma de Pedra"] = 		{ race = "Dwarf", level = 1, },
	["Artista da Fuga"] = 		{ race = "Gnome", level = 1, },
	["Cada Um por Si"] = 		{ race = "Human", level = 1, },
	["Fusão Sombria	"] = 		{ race = "Night Elf", level = 1, },
	["Dádiva dos Naarus"] = 	{ race = "Draenei", level = 1, },
	["Velonero"] = 				{ race = "Worgen", level = 1, },
	["Two Forms"] = 			{ race = "Worgen", level = 1, },
	["Correndo Livre"] = 		{ race = "Worgen", level = 1, },
	["Fúria Sangrenta"] = 		{ race = "Orc", level = 1, },
	["Pisada de Guerra"] = 		{ race = "Tauren", level = 1, },
	["Berserk"] = 				{ race = "Troll", level = 1, },
	["Determinação dos Renegados"] = { race = "Undead", level = 1, },
	["Canibalizar"] = 			{ race = "Undead", level = 1, },
	["Torrente Arcana"] = 		{ race = "Blood Elf", level = 1, },
	["Salto do Foguete"] = 		{ race = "Goblin", level = 1, },
	["Barragem de Foguetes"] = 	{ race = "Goblin", level = 1, },
	["Hobgoblin de Carga"] = 	{ race = "Goblin", level = 1, },
	["Palma Trêmula"] =			{ race = "Pandaren", level = 1, },

--++ Death Knight Abilities ++
	["Sopro Gélido"] = 			{ class = "DEATHKNIGHT", level = 1, },	--7
	["Explosão de Cadáver"] = 	{ class = "DEATHKNIGHT", level = 25, }, --7
	["Peste Sanguínea"] = 		{ class = "DEATHKNIGHT", level = 55, }, 
	["Portão da Morte"] = 		{ class = "DEATHKNIGHT", level = 55, },	
	["Garra da Morte"] = 		{ class = "DEATHKNIGHT", level = 55, },
	["Golpe da Morte"] = 		{ class = "DEATHKNIGHT", level = 56, }, --7m
	["Febre do Gelo"] = 		{ class = "DEATHKNIGHT", level = 55, },		
	["Runa da Gelâmina"] = 		{ class = "DEATHKNIGHT", level = 55, },
 	["Forjar Runas"] = 			{ class = "DEATHKNIGHT", level = 55, },  
 	["Carapaça Antimagia"] = 	{ class = "DEATHKNIGHT", level = 69, }, --7m
	["Comando Sombrio"]  = 		{ class = "DEATHKNIGHT", level = 58, },	--7m
	["Sobre um Cavalo Pálido"] = { class = "DEATHKNIGHT", level = 61, }, 
	["Congelar Mente"] = 		{ class = "DEATHKNIGHT", level = 62, },  
	["Caminho de Gelo"] = 		{ class = "DEATHKNIGHT", level = 66, },  
	["Controlar Morto-vivo"] = 	{ class = "DEATHKNIGHT", level = 69, },  
	["Runa do Cruzado Caído"] = { class = "DEATHKNIGHT", level = 70, },	
 	["Reviver Aliado"] = 		{ class = "DEATHKNIGHT", level = 72, },
	["Runa da Gárgula Litopele"] = { class = "DEATHKNIGHT", level = 72, },
--++ Death Knight Artifact Traits ++
	["Apocalipse"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n	
	["Consumição"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n	
	["Fúria de Sindragosa"] = 	{ class = "DEATHKNIGHT", level = 100, }, --7n
--++ Death Knight Specialization ++
	--++ Blood/Frost/Unholy ++
  	["Andar do Espectro"] = 	{ class = "DEATHKNIGHT", level = 60, }, --7n
	["Fortitude Congélida"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7.2.5m
	--++ Blood/Unholy ++
	["Morte e Decomposição"] = 	{ class = "DEATHKNIGHT", level = 56, }, --7m
	--++ Frost/Unholy ++
	["Socorro Negro"] = 			{ class = "DEATHKNIGHT", level = 58, },	--7n
	["Correntes de Gelo"] = 	{ class = "DEATHKNIGHT", level = 58, },  --7m	
	--++ Blood ++
--	["Asfixiar"] = 				{ class = "DEATHKNIGHT", level = 1, },	--??
	["Golpe no Coração"]  = 	{ class = "DEATHKNIGHT", level = 1, },	--7
	["Rasga-medula"]  = 		{ class = "DEATHKNIGHT", level = 55, }, --7n	
 	["Sangue Fervente"] = 		{ class = "DEATHKNIGHT", level = 56, }, --7m
	["Arma Rúnica Dançante"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7m
	["Afago da Morte"] = 		{ class = "DEATHKNIGHT", level = 58, },	--7n	
	["Sangue Vampírico"] = 		{ class = "DEATHKNIGHT", level = 60, }, --7.2.5m	
	["Veterano da Terceira Guerra"] = { class = "DEATHKNIGHT", level = 60, },	  
	["Flagelo Vermelho"] = 		{ class = "DEATHKNIGHT", level = 63, },	
	["Garra de Sanguinávido"] = { class = "DEATHKNIGHT", level = 64, },	--7m
--	["Ripostar"] = 				{ class = "DEATHKNIGHT", level = 76, }, --++ conflict		
	["Escudo de Sangue"] = 		{ class = "DEATHKNIGHT", level = 78, },
	--++ Frost ++ 
	["Potencialização Rúnica"] = { class = "DEATHKNIGHT", level = 1, }, --7m??
	["Febre do Gelo"] = 			{ class = "DEATHKNIGHT", level = 55, },	--7n	
	["Golpe Gélido"] = 			{ class = "DEATHKNIGHT", level = 55, },	  
	["Impacto Uivante"] = 		{ class = "DEATHKNIGHT", level = 55, },	  
 	["Obliterar"] = 			{ class = "DEATHKNIGHT", level = 55, },	  
	["Máquina Assassina"] = 	{ class = "DEATHKNIGHT", level = 56, },	  
 	["Energizar Arma Rúnica"] = { class = "DEATHKNIGHT", level = 57, },	--7n 
	["Pilar de Gelo"] = 		{ class = "DEATHKNIGHT", level = 57, },
	["Geada"] = 				{ class = "DEATHKNIGHT", level = 59, },	
	["Coração Congelado"] = 	{ class = "DEATHKNIGHT", level = 78, },	
	--++ Unholy ++  
	["Ferida Purulenta"] = 		{ class = "DEATHKNIGHT", level = 1, }, --7n
	["Corrupção Rúnica"] = 		{ class = "DEATHKNIGHT", level = 1, }, --7m??
	["Espiral da Morte"] = 		{ class = "DEATHKNIGHT", level = 55, }, --7m  
--	["Avanço da Morte"] = 		{ class = "DEATHKNIGHT", level = 55, }, --7m Hotfix removed
	["Ataque Supurante"] = 		{ class = "DEATHKNIGHT", level = 55, },		
	["Eclosão"] = 				{ class = "DEATHKNIGHT", level = 55, }, --7m 
	["Reviver Morto"] = 		{ class = "DEATHKNIGHT", level = 55, }, --7m
	["Golpe do Flagelo"] = 		{ class = "DEATHKNIGHT", level = 55, },
	["Ruína Súbita"] = 			{ class = "DEATHKNIGHT", level = 64, },
	["Transformação Negra"] = 	{ class = "DEATHKNIGHT", level = 74, },	  
	["Evocar Gárgula"] = 		{ class = "DEATHKNIGHT", level = 75, },	  
	["Terroraço"] = 			{ class = "DEATHKNIGHT", level = 78, },
	["Exército dos Mortos"] = 	{ class = "DEATHKNIGHT", level = 82, },	--7m	
--++ Death Knight Talents ++
	--++ Blood ++
	["Sorvessangue"] = 			{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Vermes de Sangue"] = 		{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Desilusão"] = 			{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Decomposição Rápida"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7n
--	["Engole-alma"] = 			{ class = "DEATHKNIGHT", level = 57, }, --7.2.5r
	["Coração de Gelo"] = 		{ class = "DEATHKNIGHT", level = 57, }, --7.2.5n
	["Deflexão Espectral"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7n
	["Barreira Antimagia"] = 	{ class = "DEATHKNIGHT", level = 58, }, --7n
	["Transfusão de Sangue"] = 	{ class = "DEATHKNIGHT", level = 58, }, --7m
	["Ossuário"] = 				{ class = "DEATHKNIGHT", level = 58, }, --7n
	["Marca de Sangue"] = 		{ class = "DEATHKNIGHT", level = 60, }, --7n	
	["Sede Rubra"] = 			{ class = "DEATHKNIGHT", level = 60, }, --7n	
	["Lápide"] = 				{ class = "DEATHKNIGHT", level = 60, }, --7n	
	["Marcha dos Malditos"] = 	{ class = "DEATHKNIGHT", level = 75, }, --7n	
	["Garra Sufocante"] = 		{ class = "DEATHKNIGHT", level = 75, }, --7n	
	["Trema Diante de Mim"] = 	{ class = "DEATHKNIGHT", level = 75, }, --7n	
	["Baluarte Repugnante"] = 	{ class = "DEATHKNIGHT", level = 90, }, --7n	
	["Transfusão Rúnica"] = 	{ class = "DEATHKNIGHT", level = 90, },	--7m
	["Vontade da Necrópole"] = 	{ class = "DEATHKNIGHT", level = 90, },	--7m
 	["Espelho de Sangue"] = 	{ class = "DEATHKNIGHT", level = 100, }, --7n
 	["Tempestade Óssea"] = 		{ class = "DEATHKNIGHT", level = 100, }, --7n
	["Purgatório"] = 			{ class = "DEATHKNIGHT", level = 57, },	--7m	
	--++ Frost ++ 
	["Garras Gélidas"] = 		{ class = "DEATHKNIGHT", level = 56, },	--7m 	
	["Atenuação Rúnica"] = 		{ class = "DEATHKNIGHT", level = 56, }, --7.3m	
	["Golpes Estilhaçantes"] = 	{ class = "DEATHKNIGHT", level = 56, }, --7n
	["Nevoeiro Congelante"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7n
	["Berrante do Inverno"] = 	{ class = "DEATHKNIGHT", level = 57, }, --7m
	["Eficiência Assassina"] = 	{ class = "DEATHKNIGHT", level = 56, }, --7.3m	
	["Avalanche"] = 			{ class = "DEATHKNIGHT", level = 58, }, --7n++
	["Avanço Glacial"] = 		{ class = "DEATHKNIGHT", level = 58, }, --7.3c		
	["Crosta de Gelo"] = 		{ class = "DEATHKNIGHT", level = 58, }, --7n
	["Poder da Abominação"] = 	{ class = "DEATHKNIGHT", level = 60, }, --7n
	["Saraivada Cegante"] = 	{ class = "DEATHKNIGHT", level = 60, }, --7n
	["O Inverno está Chegando"] = { class = "DEATHKNIGHT", level = 60, }, --7n
	["Ataque Inexorável"] =		{ class = "DEATHKNIGHT", level = 75, }, --7.3n		
	["Permafrio"] = 			{ class = "DEATHKNIGHT", level = 75, }, --7n
--	["Blindagem Volátil"] = 	{ class = "DEATHKNIGHT", level = 75, }, --7.3r
	["Andarilho Branco"] = 		{ class = "DEATHKNIGHT", level = 75, }, --7n
	["Foice Gélida"] = 			{ class = "DEATHKNIGHT", level = 90, }, --7n
	["Pulso Gélido"] = 			{ class = "DEATHKNIGHT", level = 90, }, --7.3c	
	["Tempestade Iminente"] = 	{ class = "DEATHKNIGHT", level = 90, }, --7n
	["Sopro de Sindragosa"]=	{ class = "DEATHKNIGHT", level = 100, },--7m
	["Arma Rúnica Faminta"] = 	{ class = "DEATHKNIGHT", level = 100, }, --7.3c	
	["Obliteração"] = 			{ class = "DEATHKNIGHT", level = 100, }, --7n
	--++ Unholy ++ 
	["Todos Serão Servos"] =	{ class = "DEATHKNIGHT", level = 56, },--7n
	["Feridas Estouradas"] =	{ class = "DEATHKNIGHT", level = 56, },--7n	
	["Febre do Ébano"] =		{ class = "DEATHKNIGHT", level = 56, },--7n	
	["Arma Rúnica Pestilenta"] = { class = "DEATHKNIGHT", level = 57, },--7n	
	["Epidemia"] =			 	{ class = "DEATHKNIGHT", level = 57, },--7n	
	["Pústulas Pestilentas"] =	{ class = "DEATHKNIGHT", level = 57, },--7n	
	["Castigador"] =			{ class = "DEATHKNIGHT", level = 58, },--7n	
	["Garras das Sombras"] =	{ class = "DEATHKNIGHT", level = 58, },--7n
	["Frenesi Profano"] = 		{ class = "DEATHKNIGHT", level = 58, },	--7m 
	["Asfixiar"] = 				{ class = "DEATHKNIGHT", level = 58, },	 
	["Infestação Debilitante"] = { class = "DEATHKNIGHT", level = 60, },--7n
	["Arroto Lodoso"] =			{ class = "DEATHKNIGHT", level = 60, },--7n
	["Escudo de Cadáveres"] =	{ class = "DEATHKNIGHT", level = 75, },--7n
	["Aparição Duradoura"] =	{ class = "DEATHKNIGHT", level = 75, },--7n
	["Comedor de Feitiços"] =	{ class = "DEATHKNIGHT", level = 75, },--7n
	["Garras Infectadas"] =		{ class = "DEATHKNIGHT", level = 90, },--7n	
	["Necrose"] = 				{ class = "DEATHKNIGHT", level = 90, },	--7m
	["Infusão Sombria"] =		{ class = "DEATHKNIGHT", level = 90, },--7n	
	["Árbitro Sombrio"] =		{ class = "DEATHKNIGHT", level = 100, },--7n
	["Profanar"] =			 	{ class = "DEATHKNIGHT", level = 100, },--7m
	["Ceifador de Almas"] = 	{ class = "DEATHKNIGHT", level = 100, }, --7m
--++ Death Knight PvP Talents
	["Estrangular"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Zona Antimagia"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Simulacro Negro"]=		{ class = "DEATHKNIGHT", level = 100, },--7n
	["Aura de Decomposição"]=	{ class = "DEATHKNIGHT", level = 100, },--7n
	["Peste Errante"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Corrente da Morte"]=		{ class = "DEATHKNIGHT", level = 100, },--7n
	["Máquina Assassina"]=		{ class = "DEATHKNIGHT", level = 100, },--7n
	["Assalto Gélido"]=			{ class = "DEATHKNIGHT", level = 100, },--7n
	["Reanimação"]=				{ class = "DEATHKNIGHT", level = 100, },--7n
	["Golpe Necrótico"]=		{ class = "DEATHKNIGHT", level = 100, },--7n

--++ Demon Hunter Abilities ++
--	["Acertos críticos"]=		{ class = "DEMONHUNTER", level = 98, }, --7n Conflict
--	["Aparo"]=					{ class = "DEMONHUNTER", level = 98, }, --7n Conflict
	["Golpe do Caos"]=			{ class = "DEMONHUNTER", level = 98, }, --7n
	["Consumir Magia"]=			{ class = "DEMONHUNTER", level = 98, }, --7n
	["Mordida do Demônio"]=		{ class = "DEMONHUNTER", level = 98, }, --7n
	["Salto Duplo"]=			{ class = "DEMONHUNTER", level = 98, }, --7n
--	["Regeneração de Energia"]=	{ class = "DEMONHUNTER", level = 98, }, --7n??
	["Raio Ocular"]=			{ class = "DEMONHUNTER", level = 98, }, --7n
	["Impulso Vil"]=			{ class = "DEMONHUNTER", level = 98, }, --7n
	["Planar"]=					{ class = "DEMONHUNTER", level = 98, }, --7n
	["Visão Espectral"]=		{ class = "DEMONHUNTER", level = 98, }, --7n
	["Arremessar Glaive"]=		{ class = "DEMONHUNTER", level = 98, }, --7n
	["Metamorfose"]=			{ class = "DEMONHUNTER", level = 99, }, --7n+	
	["Aniquilação"]=			{ class = "DEMONHUNTER", level = 99, }, --7n+
	["Dança de Lâminas"]=		{ class = "DEMONHUNTER", level = 100, }, --7n	
	["Borrão"]=					{ class = "DEMONHUNTER", level = 100, }, --7n
	["Nova do Caos"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Trevas"]=					{ class = "DEMONHUNTER", level = 100, },--7n
	["Varredura Mortal"]=		{ class = "DEMONHUNTER", level = 100, }, --7n+	
	["Aprisionar"]=				{ class = "DEMONHUNTER", level = 100, }, --7n+	
	["Retirada Vingativa"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
--++ Demon Hunter Artifact Traits ++
	["Fúria dos Illidari"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
	["Entalhador de Alma"]=		{ class = "DEMONHUNTER", level = 100, }, --7n	
--++ Demon Hunter Specialization ++
	--++ Havoc/Vengeance ++	
	["Almas Estilhaçadas"]=		{ class = "DEMONHUNTER", level = 98, },--7n
	--++ Havoc ++	
	["Presença Demoníaca"]= 	{ class = "DEMONHUNTER", level = 98, }, --7n
	--++ Vengeance ++	
	["Aura de Imolação"]=		{ class = "DEMONHUNTER", level = 100, },--7n
--	["Ameaça Aumentada"]=		{ class = "DEMONHUNTER", level = 98, }, --7n ??
	["Golpe Infernal"]=			{ class = "DEMONHUNTER", level = 100, },--7n
--	["Dor"]=					{ class = "DEMONHUNTER", level = 98, },--7n ??
	["Tormento"]=				{ class = "DEMONHUNTER", level = 100, },--7n
	["Espinhos Demoníacos"]=	{ class = "DEMONHUNTER", level = 100, }, --7n
	["Proteções Demoníacas"]=	{ class = "DEMONHUNTER", level = 100, }, --7n
	["Marca Ardente"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Sangue Vil"]=				{ class = "DEMONHUNTER", level = 100, }, --7n
	["Talhar"]=					{ class = "DEMONHUNTER", level = 100, }, --7n
	["Signo da Chama"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Cutilada da Alma"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
--	["Ripostar"]=				{ class = "DEMONHUNTER", level = 100, }, --7n Conflict
--	["Signo dos Grilhões"]=		{ class = "DEMONHUNTER", level = 100, }, --7n ??
	["Signo do Silêncio"]=		{ class = "DEMONHUNTER", level = 101, }, --7.1c 
	["Potencializar Proteções"]= { class = "DEMONHUNTER", level = 103, }, --7.1c 
	["Signo da Aflição"]=		{ class = "DEMONHUNTER", level = 105, }, --7.1c 	
--++ Demon Hunter Talents ++
	["Dilaceração da Alma"]=		{ class = "DEMONHUNTER", level = 104, }, --7n
	["Erupção Vil"]=			{ class = "DEMONHUNTER", level = 106, }, --7n
	--++ Havoc ++	
	["Fúria Cega"]=				{ class = "DEMONHUNTER", level = 99, }, --7n
	["Lâmina Vil"]=				{ class = "DEMONHUNTER", level = 99, }, --7.1.5m	
	["Cutilada do Caos"]=		{ class = "DEMONHUNTER", level = 102, }, --7n
	["Maestria Vil"]=			{ class = "DEMONHUNTER", level = 99, }, --7n
	["Lâminas do Demônio"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
	["Apetite Demoníaco"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
	["Preparado"]=				{ class = "DEMONHUNTER", level = 100, }, --7n
	["Sangria"]=				{ class = "DEMONHUNTER", level = 102, }, --7n
	["Primeira Gota"]=			{ class = "DEMONHUNTER", level = 102, }, --7n
	["Instintos Desesperados"]=	{ class = "DEMONHUNTER", level = 104, }, --7n
	["Andar no Éter"]=			{ class = "DEMONHUNTER", level = 104, }, --7n
	["Embalo"]=					{ class = "DEMONHUNTER", level = 106, }, --7n
	["Nêmesis"]=				{ class = "DEMONHUNTER", level = 106, }, --7n
	["Mestre da Glaive"]=		{ class = "DEMONHUNTER", level = 108, }, --7n
	["Demônio Renascido"]=		{ class = "DEMONHUNTER", level = 108, }, --7n
	["Poder Liberado"]=			{ class = "DEMONHUNTER", level = 108, }, --7n
	["Lâminas do Caos"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Demoníaco"]=				{ class = "DEMONHUNTER", level = 110, }, --7n
	["Salva Vil"]=				{ class = "DEMONHUNTER", level = 110, },--7n
	--++ Vengeance ++
	["Golpe Abissal"]=			{ class = "DEMONHUNTER", level = 99, }, --7n
	["Chamas Agonizantes"]=		{ class = "DEMONHUNTER", level = 99, }, --7n
	["Espinhos Afiados"]=		{ class = "DEMONHUNTER", level = 99, }, --7n
	["Queimando Vivo"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Precipitação"]=			{ class = "DEMONHUNTER", level = 100, }, --7n
	["Banquete de Almas"]=		{ class = "DEMONHUNTER", level = 100, }, --7n
	["Colisão Flamejante"]=		{ class = "DEMONHUNTER", level = 102, }, --7n
	["Glutonaria"]=				{ class = "DEMONHUNTER", level = 102, }, --7n
	["Alimento para o Demônio"]= { class = "DEMONHUNTER", level = 104, }, --7n
	["Fratura"]=				{ class = "DEMONHUNTER", level = 104, }, --7n
	["Signos Concentrados"]=	{ class = "DEMONHUNTER", level = 106, }, --7n
	["Signos Céleres"]=			{ class = "DEMONHUNTER", level = 106, }, --7n
	["Virada de Lâminas"]=		{ class = "DEMONHUNTER", level = 108, }, --7n
	["Devastação Vil"]=			{ class = "DEMONHUNTER", level = 108, }, --7n
	["Bomba Espiritual"]=		{ class = "DEMONHUNTER", level = 108, }, --7n
	["Infusão Demoníaca"]=		{ class = "DEMONHUNTER", level = 110, }, --7.1.5n
	["Último Recurso"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
--	["Vínculo Etéreo"]=			{ class = "DEMONHUNTER", level = 110, }, --7.1.5r
	["Barreira de Almas"]=		{ class = "DEMONHUNTER", level = 110, },--7n
--++ Demon Hunter PvP Talents ++
	["Quebra de Mana"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
	["Reverter Magia"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
	["Atropelo Demoníaco"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Agarrão de Illidan"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Olho de Leóteras"]=		{ class = "DEMONHUNTER", level = 110, }, --7n
	["Ataque Aéreo"]=			{ class = "DEMONHUNTER", level = 110, }, --7n
	["Fenda de Mana"]=			{ class = "DEMONHUNTER", level = 110, }, --7.1.5n
	
--++ Druid Abilities ++
	["Forma de Felino"] = 		{ class = "DRUID", level = 1, }, 
--	["Rastrear Humanoides"] = 	{ class = "DRUID", level = 1, }, 7 Conflict
	["Graça Felina"] = 			{ class = "DRUID", level = 6, },
	["Forma de Urso"] = 		{ class = "DRUID", level = 8, },
	["Abstração"] =	 			{ class = "DRUID", level = 10, },	
	["Fogo Lunar"] = 			{ class = "DRUID", level = 10, },	
	["Rosnar"] = 				{ class = "DRUID", level = 13, },
 	["Caminhar no Sonho"] = 	{ class = "DRUID", level = 14, }, --7n
 	["Reviver"] = 				{ class = "DRUID", level = 14, },
 	["Teleporte: Clareira da Lua"] = { class = "DRUID", level = 14, },
	["Forma de Viagem"] = 		{ class = "DRUID", level = 18, },
	["Fogo Solar"] = 			{ class = "DRUID", level = 18, }, --7m??
	["Surra"] = 		 		{ class = "DRUID", level = 18, }, --7m?
	["Raízes Enredantes"] = 	{ class = "DRUID", level = 10, }, 
--	["Arremetida"] = 			{ class = "DRUID", level = 24, }, 7 Conflict
	["Encantar Criatura da Floresta"] = { class = "DRUID", level = 40, }, --7m
	["Bater Asas"] = 			{ class = "DRUID", level = 40, }, --7n	
	["Forma de Cervo"] = 		{ class = "DRUID", level = 40, }, --7n	
--	["Track Beast"] = 			{ class = "DRUID", level = 40, }, --7 Conflict	
	["Renascimento"] = 			{ class = "DRUID", level = 56, }, 
	["Forma Voadora"] = 		{ class = "DRUID", level = 58, }, 
--++ Druid Artifact Traits ++
	["Frenesi de Ashamane"] = 	{ class = "DRUID", level = 100, }, --7n
	["Essência de G'Hanir"] = 	{ class = "DRUID", level = 100, }, --7n	
	["Lua Nova"] = 				{ class = "DRUID", level = 100, }, --7n		
	["Fúria do Adormecido"] = 	{ class = "DRUID", level = 100, }, --7n	
--++ Druid Specialization ++
	--++ Balance/Feral/Guardian/Restoration ++
	["Espreitar"] = 			{ class = "DRUID", level = 5, }, --7m
	--++ Balance/Restoration ++
	["Avivar"] = 				{ class = "DRUID", level = 54, }, --7m	
	--++ Balance/Feral/Guardian ++
	["Recrescimento"] = 		{ class = "DRUID", level = 10, }, --7.1n	
	["Remover Corrupção"] = 	{ class = "DRUID", level = 18, },
	--++ Balance/Guardian/Restoration ++
	["Pele de Árvore"] = 		{ class = "DRUID", level = 36, }, --x Moved
	--++ Feral/Guardian ++
--	["Acertos críticos"] = 		{ class = "DRUID", level = 1, }, --7m Conflict
	["Instinto Estimulante"] = 	{ class = "DRUID", level = 10, },
	["Patada"] = 				{ class = "DRUID", level = 32, }, --7m	
	["Instintos de Sobrevivência"] = { class = "DRUID", level = 40, },
	["Esmagar Crânio"] = 		{ class = "DRUID", level = 64, },
	["Estouro da Manada"] = 	{ class = "DRUID", level = 83, }, --7m	
	--++ Balance ++
	["Influência Astral"] = 	{ class = "DRUID", level = 10, }, --7n		
	["Ira Solar"] = 			{ class = "DRUID", level = 10, }, --7n	
	["Surto Estelar"] = 		{ class = "DRUID", level = 10, },
	["Golpe Lunar"] = 			{ class = "DRUID", level = 12, }, --7n	
	["Forma de Luniscante"] = 	{ class = "DRUID", level = 16, },
	["Raio Solar"] = 			{ class = "DRUID", level = 28, },
	["Chuva Estelar"] = 		{ class = "DRUID", level = 40, },
	["Alinhamento Celestial"] = { class = "DRUID", level = 64, }, 	
	["Luz Estelar"] = 			{ class = "DRUID", level = 78, }, --7n
	--++ Feral ++
	["Despedaçar"] = 			{ class = "DRUID", level = 1, },
	["Mordida Feroz"] = 		{ class = "DRUID", level = 6, }, --7m	
	["Estraçalhar"] = 			{ class = "DRUID", level = 6, }, 	
	["Rapidez Felina"] = 		{ class = "DRUID", level = 10, }, --7m
	["Fúria do Tigre"] = 		{ class = "DRUID", level = 12, },
	["Rasgar"] = 				{ class = "DRUID", level = 20, }, 
	["Velocidade Predatória"] = { class = "DRUID", level = 28, },
	["Presságio de Clareza"] = 	{ class = "DRUID", level = 38, }, --7m
	["Feridas Infectadas"] = 	{ class = "DRUID", level = 40, }, --7m	
	["Berserk"] = 				{ class = "DRUID", level = 48, }, --7m
	["Mutilar"] = 				{ class = "DRUID", level = 72, }, 
	["Garras de Navalha"] = 	{ class = "DRUID", level = 78, },
	--++ Guardian ++ 
	["Destroçar"] = 			{ class = "DRUID", level = 6, }, --7m
	["Malho"] = 				{ class = "DRUID", level = 10, }, --x Moved
	["Pelego Grosso"] = 		{ class = "DRUID", level = 14, }, 
	["Rugido Incapacitante"] = 	{ class = "DRUID", level = 28, }, --7n
	["Escornar"] = 				{ class = "DRUID", level = 34, }, --7n
	["Veloférreo"] = 			{ class = "DRUID", level = 44, }, --7n
	["Regeneração Frenética"] = { class = "DRUID", level = 50, }, --7m
	["Marca de Ursol"] = 		{ class = "DRUID", level = 72, }, --7n
	["Guardião da Natureza"] = 	{ class = "DRUID", level = 78, }, 
	--++ Restoration ++  
	["Rejuvenescer"] = 			{ class = "DRUID", level = 12, }, --7m	
	["Recomposição Rápida"] = 	{ class = "DRUID", level = 12, }, 
	["Cura da Natureza"] = 		{ class = "DRUID", level = 18, },
	["Toque de Cura"] = 		{ class = "DRUID", level = 26, }, --7.1m
	["Semente Viva"] = 			{ class = "DRUID", level = 28, },
	["Brotar da Vida"] = 		{ class = "DRUID", level = 32, },
	["Revitalizar"] = 			{ class = "DRUID", level = 44, }, --7n
	["Vórtice de Ursol"] = 		{ class = "DRUID", level = 48, }, --7m
	["Cascaferro"] = 			{ class = "DRUID", level = 52, },
	["Crescimento Silvestre"] = { class = "DRUID", level = 64, },	
	["Tranquilidade"] = 		{ class = "DRUID", level = 72, }, 
	["Harmonia"] = 				{ class = "DRUID", level = 78, },
	["Eflorescência"] = 		{ class = "DRUID", level = 82, }, --7n	
	--++ Druid Talents ++
	["Investida Selvagem"] = 	{ class = "DRUID", level = 30, }, 
	["Embaraço em Massa"] = 	{ class = "DRUID", level = 60, }, 
	["Trombada Poderosa"] = 	{ class = "DRUID", level = 60, }, 	
	["Tufão"] = 				{ class = "DRUID", level = 60, }, 	
	--++ Balance/Feral/Restoration ++
	["Afinidade com Guardião"] = { class = "DRUID", level = 45, }, --7n
	["Fera Deslocadora"] = 		{ class = "DRUID", level = 30, }, 	
	--++ Balance/Feral/Guardian ++
	["Renovação"] = 			{ class = "DRUID", level = 30, },
	["Afinidade com Restauração"] = { class = "DRUID", level = 45, }, --7n
	["Alma da Floresta"] = 		{ class = "DRUID", level = 75, },	--??
	--++ Feral/Guardian ++
	["Afinidade com Equilíbrio"] = { class = "DRUID", level = 45, }, --7n
	["Afinidade Feral"] = 		{ class = "DRUID", level = 45, }, --7n
	--++ Balance ++		
	["Força da Natureza"] = 	{ class = "DRUID", level = 15, },
	["Senhor das Estrelas"] = 	{ class = "DRUID", level = 15, }, --7n
	["Guerreiro de Eluna"] = 	{ class = "DRUID", level = 15, }, --7n
	["Encarnação: Escolhido de Eluna"] = { class = "DRUID", level = 75, }, --7n
	["Chama Estelar"] =		 	{ class = "DRUID", level = 75, }, 
	["Comunhão Astral"] = 		{ class = "DRUID", level = 90, }, --7m
	["Bênção dos Ancientes"] = 	{ class = "DRUID", level = 90, }, --7n
	["Estrelas Cadentes"] = 	{ class = "DRUID", level = 90, }, --7m
	["Fúria de Eluna"] = 		{ class = "DRUID", level = 100, }, --7n
	["Equilíbrio Natural"] = 	{ class = "DRUID", level = 100, }, --7n
	["Deriva Estelar"] = 		{ class = "DRUID", level = 100, }, --7n	
	--++ Feral ++
	["Cheiro de Sangue"] =		{ class = "DRUID", level = 15, }, --7n		
	["Inspiração Lunar"] =		{ class = "DRUID", level = 15, }, --x	
	["Predador"] =				{ class = "DRUID", level = 15, }, --7n
	["Encarnação: Rei da Selva"] = { class = "DRUID", level = 75, }, --7n
	["Feridas Feias"] = 		{ class = "DRUID", level = 75, }, --7.3m	
	["Talho Brutal"] = 			{ class = "DRUID", level = 90, }, --7.3m
	["Dente-de-sabre"] = 		{ class = "DRUID", level = 90, }, --7n
	["Rugido Selvagem"] = 		{ class = "DRUID", level = 90, }, --7.3m	
	["Garrasangre"] = 			{ class = "DRUID", level = 100, },
	["Guardião de Eluna"] = 	{ class = "DRUID", level = 100, }, --7.3m		
	--++ Guardian ++	
	["Frenesi de Sangue"] = 	{ class = "DRUID", level = 15, }, --7n	
	["Espinheiras"] = 			{ class = "DRUID", level = 15, }, --7n	
	["Pelo Eriçado"] = 			{ class = "DRUID", level = 15, }, 	
	["Rugidos Guturais"] = 		{ class = "DRUID", level = 30, }, --7n
	["Rugido Ameaçador"] = 		{ class = "DRUID", level = 30, }, --7.1.5n	
	["Guardião Galáctico"] = 	{ class = "DRUID", level = 75, }, --7n	
	["Encarnação: Guardião de Ursoc"] = { class = "DRUID", level = 75, }, --7n
	["Guarda da Terra"] = 		{ class = "DRUID", level = 90, }, --7n	
	["Guardião de Eluna"] =	 	{ class = "DRUID", level = 90, }, 	
	["A Lei da Selva"] = 		{ class = "DRUID", level = 90, }, --7m
	["Feixe Lunar"] = 			{ class = "DRUID", level = 100, }, --7n		
	["Pulverizar"] = 			{ class = "DRUID", level = 100, }, 	
	["Rasgar e Despedaçar"] = 	{ class = "DRUID", level = 100, }, --7n	
	--++ Restoration ++
	["Abundância"] = 			{ class = "DRUID", level = 15, }, --7n	
	["Proteção Cenariana"] = 	{ class = "DRUID", level = 15, }, 	
	["Prosperidade"] = 			{ class = "DRUID", level = 15, }, --7n
	["Cultivo"] = 				{ class = "DRUID", level = 75, }, --7n	
	["Encarnação: Árvore da Vida"] = { class = "DRUID", level = 75, }, --7n
	["Germinação"] = 			{ class = "DRUID", level = 90, }, 	
	["Paz Interior"] = 			{ class = "DRUID", level = 90, }, --7n
	["Flores Primaveris"] = 	{ class = "DRUID", level = 90, }, --7n
	["Florescer"] = 			{ class = "DRUID", level = 100, }, --7n
	["Litocasca"] = 			{ class = "DRUID", level = 100, }, --7n
	["Momento de Clareza"] =	{ class = "DRUID", level = 100, }, --7.1.5m	
--++ Druid PvP Talents ++
	["Ciclone"] =				{ class = "DRUID", level = 100, }, --7n
--	["Rugido Desmoralizante"] =	{ class = "DRUID", level = 100, }, --7n
--	["Mutilação Enfurecida"] =	{ class = "DRUID", level = 100, }, --7n
	["Sobrepujar"] =			{ class = "DRUID", level = 100, }, --7n
--	["Crescimento Concentrado"] = { class = "DRUID", level = 100, }, --7n
	["Exuberância"] =			{ class = "DRUID", level = 100, }, --7n
	["Espinhos"] =				{ class = "DRUID", level = 100, }, --7n
	["Enxame Feérico"] =		{ class = "DRUID", level = 100, }, --7n
	["Espinhos"] =				{ class = "DRUID", level = 100, }, --7.1.5n
	["Mutilar Enraivecido"] =		{ class = "DRUID", level = 100, }, --7.1.5n
	
--++ Hunter Abilities ++
	["Chamar Ajudante 1"] = 	{ class = "HUNTER", level = 1, },
	["Disparo Marcado"] = 		{ class = "HUNTER", level = 1, }, --7n	
	["Curar Ajudante"] = 		{ class = "HUNTER", level = 1, },	
	["Reviver Ajudante"] = 		{ class = "HUNTER", level = 1, },
	["Aspecto do Guepardo"] = 	{ class = "HUNTER", level = 5, },
	["Chamar Ajudante 2"] = 	{ class = "HUNTER", level = 10, },
	["Controlar Ajudante"] = 	{ class = "HUNTER", level = 10, },	
	["Dispensar Ajudante"] = 	{ class = "HUNTER", level = 10, },
	["Domar Fera"] = 			{ class = "HUNTER", level = 10, },
	["Alimentar Ajudante"] = 	{ class = "HUNTER", level = 11, },
	["Tradição das Feras"] = 	{ class = "HUNTER", level = 12, },	
	["Olho de Águia"] = 		{ class = "HUNTER", level = 16, },
	["Fingir de Morto"] = 		{ class = "HUNTER", level = 32, },
	["Despertar"] = 			{ class = "HUNTER", level = 32, }, --7n	
	["Chamar Ajudante 3"] = 	{ class = "HUNTER", level = 42, },	
	["Sinalizador"] = 			{ class = "HUNTER", level = 38, },
	["Aspecto do Camaleão"] = 	{ class = "HUNTER", level = 40, }, --7n
	["Pegar"] = 				{ class = "HUNTER", level = 40, }, 
	["Fogos de Artifício"] = 	{ class = "HUNTER", level = 40, }, 
	["Fazer-se de Morto"] = 	{ class = "HUNTER", level = 40, }, --7n		
	["Aspecto da Tartaruga"] = 	{ class = "HUNTER", level = 50, }, 	--7n	
	["Chamar Ajudante 4"] = 	{ class = "HUNTER", level = 62, },
	["Chamar Ajudante 5"] = 	{ class = "HUNTER", level = 82, },
--++ Hunter Artifact Traits ++
	["Fúria da Águia"] = 		{ class = "HUNTER", level = 100, }, --7n
	["Trovão do Titã"] = 		{ class = "HUNTER", level = 100, }, --7n
	["Sobrevento"] = 			{ class = "HUNTER", level = 100, }, --7n
--++ Hunter Specialization ++
	--++ Beast Mastery/Marksmanship ++
	["Tiro de Concussão"] = 	{ class = "HUNTER", level = 8, }, --7m
	["Desvencilhar"] = 			{ class = "HUNTER", level = 4514, }, --7.1.5c
	["Tiro Retaliatório"] = 	{ class = "HUNTER", level = 24, }, --7m
	["Tiro Múltiplo"] = 		{ class = "HUNTER", level = 28, }, --7m
	["Redirecionar"] = 			{ class = "HUNTER", level = 42, }, --7m
	--++ Beast Mastery/Marksmanship/Survival ++
	["Armadilha Congelante"] = 	{ class = "HUNTER", level = 16, }, --7.1.5m	
	["Exaltação"] = 			{ class = "HUNTER", level = 36, }, --7m ??
	["Armadilha de Piche"] = 	{ class = "HUNTER", level = 36, }, --7.1.5m
	--++ Beast Mastery ++
	["Disparo da Naja"] = 		{ class = "HUNTER", level = 1, },	
	["Comando para Matar"] = 	{ class = "HUNTER", level = 3, },
	["Fera Atroz"] = 			{ class = "HUNTER", level = 10, },	--7m
	["Feras Exóticas"] = 		{ class = "HUNTER", level = 10, },	
	["Aspecto do Indomado"] = 	{ class = "HUNTER", level = 18, }, --7n
	["Chamado da Selva"] = 		{ class = "HUNTER", level = 22, }, --7n
	["Cutilada da Fera"] = 		{ class = "HUNTER", level = 29, },
	["Ira Bestial"] = 			{ class = "HUNTER", level = 40, },
	["Espíritos Afins"] = 		{ class = "HUNTER", level = 44, },
	["Mestre das Feras"] = 		{ class = "HUNTER", level = 78, },
	--++ Marksmanship ++ 
	["Tiro Certo"] = 			{ class = "HUNTER", level = 10, },
	["Tiro Arcano"] = 			{ class = "HUNTER", level = 10 }, --7m
	["Marca do Caçador"] = 		{ class = "HUNTER", level = 18, }, --7m
	["Disparo Marcado"] = 		{ class = "HUNTER", level = 18, }, --7n	
	["Tiro Irruptivo"] = 		{ class = "HUNTER", level = 22, }, --7n		
	["Grupo de Caça"] = 		{ class = "HUNTER", level = 34, }, --7n
	["Tiro Certeiro"] = 		{ class = "HUNTER", level = 39, }, --7n
	["Concentração do Atirador Perito"] = { class = "HUNTER", level = 44, }, --7.1.5n	
	["Bombardeio"] = 			{ class = "HUNTER", level = 62, },
	["Treinamento de Francoatirador"] = { class = "HUNTER", level = 78, }, 
	--++ Survival ++  
	["Ataque Flanqueante"] = 	{ class = "HUNTER", level = 10, }, --7n
	["Golpe do Raptor"] = 		{ class = "HUNTER", level = 10, }, --7n	
	["Cortar Asas"] = 			{ class = "HUNTER", level = 10, }, --7n	
	["Sobrevivencialista"] = 	{ class = "HUNTER", level = 16, }, --7.1.5c	
	["Mordida de Mangusto"] = 	{ class = "HUNTER", level = 18, }, --7n	
	["Arremessar Machadinha"] = { class = "HUNTER", level = 19, }, --7n	
	["Arpão"] = 				{ class = "HUNTER", level = 22, }, --7n	
	["Focinho"] = 				{ class = "HUNTER", level = 24, }, --7n	
	["Lacerar"] = 				{ class = "HUNTER", level = 26, }, --7	
	["Aspecto da Águia"] = 		{ class = "HUNTER", level = 44, }, --7n		
	["Armadilha Explosiva"] = 	{ class = "HUNTER", level = 48, }, --7m	
	["Trinchar"] = 				{ class = "HUNTER", level = 54, }, --7n	
	["Companheiro de Caça"] = 	{ class = "HUNTER", level = 90, }, --7n	
--++ Hunter Talents ++
	["Abre-trilhas"] = 			{ class = "HUNTER", level = 45, }, --7.1n
	["O Quanto Antes"] = 		{ class = "HUNTER", level = 45, },
	--++ Beast Mastery/Marksmanship/Survival ++
	["Bando de Corvos"] = 		{ class = "HUNTER", level = 90, }, --??
	--++ Beast Mastery/Marksmanship ++
	["Andarilho"] = 			{ class = "HUNTER", level = 45, }, --7.1.5c 	
	["Disparo Aprisionador"] = 	{ class = "HUNTER", level = 75, }, 	
	["Picada de Mantícora"] = 	{ class = "HUNTER", level = 75, },	
	["Barragem"] = 				{ class = "HUNTER", level = 90, }, 
	["Salva"] = 				{ class = "HUNTER", level = 90, },	--7n
	--++ Beast Mastery/Survival ++
	["Aspecto da Fera"] = 		{ class = "HUNTER", level = 100, }, --7m
	--++ Marksmanship/Survival ++	
	["Camuflagem"] = 			{ class = "HUNTER", level = 75, }, --7m	
	--++ Beast Mastery ++	
	["A Grande Caçada"] = 		{ class = "HUNTER", level = 15, }, --7n		
	["Estábulo Atroz"] = 		{ class = "HUNTER", level = 15, }, --7n	
	["Caminho da Naja"] = 		{ class = "HUNTER", level = 15, }, --7n		
	["Tiro Quimérico"] = 		{ class = "HUNTER", level = 30, }, --7m	
	["Frenesi Atroz"] = 		{ class = "HUNTER", level = 30, }, --7n	
	["Pisada"] = 				{ class = "HUNTER", level = 30, }, --7n	
	["Fúria Bestial"] = 		{ class = "HUNTER", level = 60, }, --7n		
	["Ataques Lampejo"] = 		{ class = "HUNTER", level = 60, },	
	["Uno com a Matilha"] = 	{ class = "HUNTER", level = 60, }, --7n		
	["Intimidação"] = 			{ class = "HUNTER", level = 75, },
	["Naja Assassina"] = 		{ class = "HUNTER", level = 100, }, --7n		
	["Sanha"] = 				{ class = "HUNTER", level = 100, }, --7m
	--++ Marksmanship ++
	["Mira Cuidadosa"] = 		{ class = "HUNTER", level = 15, }, --7m
	["Lobo Solitário"] =		{ class = "HUNTER", level = 15, }, 
	["Concentração Firme"] = 	{ class = "HUNTER", level = 15, }, --7m
	["Flecha Negra"] = 			{ class = "HUNTER", level = 30, }, --7m	
	["Largar o Dedo"] = 		{ class = "HUNTER", level = 30, }, --7m	
	["Mira Certa"] = 			{ class = "HUNTER", level = 30, }, --7n	
	["Tiro Explosivo"] = 		{ class = "HUNTER", level = 60, }, --7m
	["Franco-atirador Paciente"] = { class = "HUNTER", level = 60, }, --7n
	["Sentinela"] = 			{ class = "HUNTER", level = 60, }, --7n		
	["Disparos Perfurantes"] = 	{ class = "HUNTER", level = 100, }, --7m??	
	["Cascavéis"] = 			{ class = "HUNTER", level = 100, }, --7n
	["Tiro de Mestre"] = 		{ class = "HUNTER", level = 100, }, --7n		
	--++ Survival ++	
	["Instintos Animais"] = 	{ class = "HUNTER", level = 15, }, --7n	
	["Machados de Arremesso"] = { class = "HUNTER", level = 15, }, --7n	
	["Caminho dos Mok'Nathal"] = { class = "HUNTER", level = 15, }, --7n	
	["Bando de Corvos"] = 		{ class = "HUNTER", level = 30, }, --7n
	["Ferimentos Mortais"] = 	{ class = "HUNTER", level = 30, }, --7n	
	["Caçador de Cobra"] = 		{ class = "HUNTER", level = 30, }, --7n	
	["Estrepes"] = 				{ class = "HUNTER", level = 60, }, --7n	
	["Armadilhas Aprimoradas"] = { class = "HUNTER", level = 60, }, --7n	
	["Armadilha de Aço"] = 		{ class = "HUNTER", level = 60, }, --7n	
	["Rede do Patrulheiro"] = 	{ class = "HUNTER", level = 75, }, --7n	
	["Bomba Grudenta"] = 		{ class = "HUNTER", level = 75, }, --7n	
	["Carnificina"] = 			{ class = "HUNTER", level = 90, }, --7n		
	["Granada de Fogo de Dragão"] = { class = "HUNTER", level = 90, }, --7n	
	["Picada de Serpente"] = 	{ class = "HUNTER", level = 90, }, --7m	
	["Coureador Perito"] = 		{ class = "HUNTER", level = 100, }, --7n		
	["Cobra Cuspideira"] = 		{ class = "HUNTER", level = 100, }, --7n
--++ Hunter PvP Talents ++
	["Chamado do Mestre"] = 	{ class = "HUNTER", level = 100, }, --7n
	["Mordida de Aranha"] = 	{ class = "HUNTER", level = 100, }, --7n
	["Tiro de Francoatirador"] = { class = "HUNTER", level = 100, }, --7n
	["Intrusão"] = 				{ class = "HUNTER", level = 100, }, --7.2.5n
	["Fera Atroz: Basilisco"] = { class = "HUNTER", level = 100, }, --7n
	["Fera Atroz: Falcão"] = 	{ class = "HUNTER", level = 100, }, --7n
--	["Flecha Congelante"] = 	{ class = "HUNTER", level = 100, }, --7.1.5r
	["Armadilha Altamente Explosiva"] = { class = "HUNTER", level = 100, }, --7.1.5n
	["Rede do Rastreador"] = 	{ class = "HUNTER", level = 100, }, --7n
	["Bandagem de Recomposição"] =  { class = "HUNTER", level = 100, }, --7n
	["Tiro de Dispersão"] = 	{ class = "HUNTER", level = 100, }, --7n

--++ Mage Abilities ++
	["Ilusão"] =   				{ class = "MAGE", level = 1, }, --7n??
	["Nova Congelante"] = 		{ class = "MAGE", level = 3, },
	["Lampejo"] = 				{ class = "MAGE", level = 7, },
	["Polimorfia"] = 			{ class = "MAGE", level = 18, },
	["Conjure Refreshment"] = 	{ class = "MAGE", level = 22, },
	["Queda Lenta"] = 			{ class = "MAGE", level = 32, },
	["Jato d'Água"] = 			{ class = "MAGE", level = 32, }, --7n	
	["Contrafeitiço"] = 		{ class = "MAGE", level = 34, },
	["Bloco de Gelo"] = 		{ class = "MAGE", level = 50, }, --7.1.5m	
	["Linguista Arcano"] = 		{ class = "MAGE", level = 58, }, --7n		
	["Distorção Temporal"] = 	{ class = "MAGE", level = 65, },
	["Roubar Feitiço"] = 		{ class = "MAGE", level = 64, }, 
	["Portal: Darnassus"] = 	{ class = "MAGE", level = 42, },
	["Portal: Exodar"] = 		{ class = "MAGE", level = 42, },
	["Portal: Altaforja"] = 	{ class = "MAGE", level = 42, },
	["Portal: Orgrimmar"] = 	{ class = "MAGE", level = 42, },
	["Portal: Luaprata"] = 		{ class = "MAGE", level = 42, },
	["Portal: Ventobravo"] = 	{ class = "MAGE", level = 42, },
	["Portal: Theramore"] = 	{ class = "MAGE", level = 42, },
	["Portal: Penhasco do Trovão"] = { class = "MAGE", level = 42, },
	["Portal: Cidade Baixa"] = 	{ class = "MAGE", level = 42, },
	["Portal: Pedregal"] = 		{ class = "MAGE", level = 52, },	
	["Portal: Shattrath"] = 	{ class = "MAGE", level = 66, },	
	["Portal Antigo: Dalaran"] = { class = "MAGE", level = 74, },	
	["Portal: Dalaran – Ilhas Partidas"] = { class = "MAGE", level = 74, }, --7n	
	["Portal: Dalaran - Nortúndria"] = { class = "MAGE", level = 74, }, --7n		
	["Portal: Tol Barad"] = 	{ class = "MAGE", level = 85, },
	["Portal: Vale das Flores Eternas"] = { class = "MAGE", level = 90, },
	["Portal: Escudo Tonante"] = { class = "MAGE", level = 92, }, --7n	
	["Teleporte: Lança de Guerra"] =  { class = "MAGE", level = 92, }, --7n	
	["Teleporte: Salão do Guardião"] = { class = "MAGE", level = 14, }, --7n
	["Teleport: Darnassus"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Exodar"] = 		{ class = "MAGE", level = 17, },
	["Teleport: Altaforja"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Orgrimmar"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Luaprata"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Ventobravo"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Theramore"] = 	{ class = "MAGE", level = 17, },
	["Teleport: Penhasco do Trovão"] = { class = "MAGE", level = 17, },
	["Teleport: Cidade Baixa"] = { class = "MAGE", level = 17, },	
	["Teleport: Pedregal"] = 	{ class = "MAGE", level = 52, },	
	["Teleport: Shattrath"] = 	{ class = "MAGE", level = 62, },	
	["Teleporte Antigo: Dalaran"] = { class = "MAGE", level = 71, },	
	["Portal: Dalaran – Ilhas Partidas"] = { class = "MAGE", level = 71, }, --7n
	["Teleporte: Dalaran — Nortúndria"] = { class = "MAGE", level = 71, }, --7n	
	["Teleport: Tol Barad"] = 	{ class = "MAGE", level = 85, },
	["Teleporte: Vale das Flores Eternas"] = { class = "MAGE", level = 90, },
	["Teleporte: Escudo Tonante"] = { class = "MAGE", level = 92, }, --7n	
	["Teleporte: Lança de Guerra"] = { class = "MAGE", level = 92, }, --7n		
--++ Mage Artifact Traits ++
	["Marca de Aluneth"] = 		{ class = "MAGE", level = 100, }, --7n
	["Chamas da Fênix"] = 		{ class = "MAGE", level = 100, }, --7n
	["Seta de Ébano"] = 		{ class = "MAGE", level = 100, }, --7n
--++ Mage Specialization ++
	--++ Fire/Frost ++ 
	["Invisibilidade"] = 		{ class = "MAGE", level = 50, }, --7m
	--++ Arcane ++
	["Impacto Arcano"] = 		{ class = "MAGE", level = 10, }, 
	["Barragem Arcana"] = 		{ class = "MAGE", level = 10, },
	["Carga Arcana"] = 			{ class = "MAGE", level = 10, }, --7??
	["Mísseis Arcanos"] = 		{ class = "MAGE", level = 14, },
	["Deslocamento"] = 			{ class = "MAGE", level = 24, }, --7n
	["Barreira Prismática"] = 	{ class = "MAGE", level = 26, }, --7.1.5n	
	["Explosão Arcana"] = 		{ class = "MAGE", level = 28, }, --x Moved
	["Retardar"] = 				{ class = "MAGE", level = 36, },
	["Evocação"] = 		 		{ class = "MAGE", level = 40, }, --x Moved
	["Poder Arcano"] = 			{ class = "MAGE", level = 44, },
	["Invisibilidade Maior"] = 	{ class = "MAGE", level = 60, }, --7m	
	["Presença de Espírito"] = 	{ class = "MAGE", level = 15, }, --7.1.5m	
--	["Armadura de Mago"] = 		{ class = "MAGE", level = 56, }, --7.1.5r
	["Sábio"] =				 	{ class = "MAGE", level = 78, }, --7n	
	--++ Fire ++ 
	["Massa Crítica"] = 		{ class = "MAGE", level = 56, }, --7.1.5m
	["Bola de Fogo"] = 			{ class = "MAGE", level = 10, },
	["Ignimpacto"] = 			{ class = "MAGE", level = 10, },
	["Impacto de Fogo"] = 		{ class = "MAGE", level = 11, }, --7m
	["Embalo de Fogo"] = 		{ class = "MAGE", level = 12, }, --7n
	["Pirotecnia Aprimorada"] = { class = "MAGE", level = 14, }, --7n	
	["Sopro do Dragão"] = 		{ class = "MAGE", level = 24, },
	["Blazing Barrier"] = 		{ class = "MAGE", level = 26, }, --7.1.5 	
	["Combustão"] = 			{ class = "MAGE", level = 28, }, 
	["Armadura Derretida"] = 	{ class = "MAGE", level = 36, }, 
	["Calcinar"] = 				{ class = "MAGE", level = 40, },	
	["Golpe Flamejante"] = 		{ class = "MAGE", level = 44, }, --x Moved
	["Cauterizar"] = 			{ class = "MAGE", level = 52, }, --7.1.5m	
	["Incendiar"] = 			{ class = "MAGE", level = 80, },
	--++ Frost ++ 
	["Seta de Gelo"] = 			{ class = "MAGE", level = 1, },
	["Lança de Gelo"] = 		{ class = "MAGE", level = 5, }, --x Moved
	["Evocar Elemental da Água"] = { class = "MAGE", level = 10, },
	["Estilhaçar"] = 			{ class = "MAGE", level = 12, }, --x Moved
--	["Ímpeto"] = 				{ class = "MAGE", level = 12, }, 7n Conflict
	["Dedos Glaciais"] = 		{ class = "MAGE", level = 24, },
	["Barreira de Gelo"] = 		{ class = "MAGE", level = 26, }, --7.1.5m	
	["Congelamento Cerebral"] = { class = "MAGE", level = 28, },	
	["Cone de Frio"] = 			{ class = "MAGE", level = 28, }, --7m
	["Veias Gélidas"] = 		{ class = "MAGE", level = 40, },
	["Nevasca"] = 				{ class = "MAGE", level = 44, }, --x Moved
	["Ruptura do Gelo"] = 		{ class = "MAGE", level = 52, }, --7.1.5m	
--	["Armadura Gélida"] = 		{ class = "MAGE", level = 56, }, --7.1.5r
	["Sincelo"] = 				{ class = "MAGE", level = 78, }, 	
	["Orbe Congelado"] = 		{ class = "MAGE", level = 83, },
--++ Mage Talents ++
	["Cintilação"] = 			{ class = "MAGE", level = 30, }, --7n
	["Fluxo do Sortílego"] = 	{ class = "MAGE", level = 45, }, --7n 
	["Imagem Espelhada"] = 		{ class = "MAGE", level = 45, }, 	
	["Runa de Poder"] = 		{ class = "MAGE", level = 45, }, 
 	["Proteção de Gelo"] = 		{ class = "MAGE", level = 75, }, 
	["Anel Gélido"] = 			{ class = "MAGE", level = 75, }, 
	["Magia Instável"] = 		{ class = "MAGE", level = 90, }, 	
	--++ Arcane ++	
	["Amplificação"] = 			{ class = "MAGE", level = 15, }, --7.1.5n
	["Familiar Arcano"] = 		{ class = "MAGE", level = 15, }, --7n
	["Palavras de Poder"] = 	{ class = "MAGE", level = 15, }, --7n
	["Escudo de Mana"] = 		{ class = "MAGE", level = 30, }, --7.1.5n
	["Turbilhão"] = 			{ class = "MAGE", level = 30, }, --7.1.5n	
	["Carregado"] = 			{ class = "MAGE", level = 60, }, --7n	
	["Ressonância"] = 			{ class = "MAGE", level = 60, }, --7n		
	["Supernova"] = 			{ class = "MAGE", level = 60, }, --x++
	["Deslocamento Cronológico"] = 	{ class = "MAGE", level = 75, }, --7.1.5n
	["Erosão"] = 				{ class = "MAGE", level = 90, }, --7n	
	["Tempestade de Éter"] = 	{ class = "MAGE", level = 90, }, --7n	
	["Orbe Arcano"] = 			{ class = "MAGE", level = 100, }, --x	
	["Subjugados"] = 			{ class = "MAGE", level = 100, }, --x
--	["Impaciente"] = 			{ class = "MAGE", level = 100, }, --7.1.5r	
	["Fluxo Temporal"] = 		{ class = "MAGE", level = 100, }, --7.1.5n		
	--++ Fire ++ 
	["Conflagração"] =			{ class = "MAGE", level = 15, }, --7n
	["Incendiário"] =			{ class = "MAGE", level = 15, }, --7n	
	["Piromaníaco"] = 			{ class = "MAGE", level = 15, }, --7m
	["Onda de Impacto"] = 		{ class = "MAGE", level = 30, }, --7.1.5m
	["Alma Fulgurante"] = 		{ class = "MAGE", level = 30, }, --7.1.5n	
	["Fúria de Alexstrasza"] = 	{ class = "MAGE", level = 60, }, --7.1.5n		
	["Queima Controlada"] =		{ class = "MAGE", level = 60, }, --7n
	["Queimando"] =				{ class = "MAGE", level = 60, }, --7n
	["Velocidade Frenética"] = 	{ class = "MAGE", level = 75, }, --7.1.5n	
	["Área em Chamas"] =		{ class = "MAGE", level = 90, }, --7n
	["Bomba Viva"] = 			{ class = "MAGE", level = 90, },
	["Tempestade de Cinzas"] =	{ class = "MAGE", level = 100, }, --7n	
	["Archote"] = 				{ class = "MAGE", level = 100, }, --x
	["Meteoro"] = 				{ class = "MAGE", level = 100, }, --x
	--++ Frost ++ 
	["Gelar Ossos"] =			{ class = "MAGE", level = 15, }, --7n
	["Inverno Solitário"] =		{ class = "MAGE", level = 15, }, --7n	
	["Raio de Gelo"] =			{ class = "MAGE", level = 15, }, --7n
	["Isolamento Glacial"] = 	{ class = "MAGE", level = 30, }, --7.1.5n
	["Banquisas"] = 			{ class = "MAGE", level = 30, }, --7.1.5m	
	["Toque Congelado"] =		{ class = "MAGE", level = 60, }, --7n
	["Nova de Gelo"] =	 		{ class = "MAGE", level = 60, }, --x
	["Ventos Frígidos"] = 		{ class = "MAGE", level = 75, }, --7.1.5n	
	["Ventania Ártica"] =		{ class = "MAGE", level = 90, }, --7n 
	["Bomba Gélida"] = 			{ class = "MAGE", level = 90, }, 
	["Chuva de Cometas"] = 		{ class = "MAGE", level = 100, }, --x
	["Punhal Glacial"] =		{ class = "MAGE", level = 100, }, --7n		
	["Caos Térmico"] = 			{ class = "MAGE", level = 100, }, --x	
--++ Mage PvP Talents ++
	["Escudo Temporal"] = 		{ class = "MAGE", level = 100, }, --7n
	["Forma de Gelo"] = 		{ class = "MAGE", level = 100, }, --7n
	["Invisibilidade em Massa"] = { class = "MAGE", level = 100, }, --7n
	["Ignimpacto Maior"] = 		{ class = "MAGE", level = 100, }, --7n
 
--++ Monk Abilities ++
--	["Aparar"]   = 				{ class = "MONK", level = 1, },	Conflict
	["Palma do Tigre"]   = 		{ class = "MONK", level = 1, },	
 	["Voo Zen"] =   			{ class = "MONK", level = 1, },
	["Chute Blecaute"]   = 		{ class = "MONK", level = 3, },   
	["Rolamento"]   = 			{ class = "MONK", level = 5, }, 
	["Provocar"]   = 			{ class = "MONK", level = 13, },
	["Ressuscitar"]   = 		{ class = "MONK", level = 14, },
	["Peregrinação Zen"]   = 	{ class = "MONK", level = 20, }, 
 	["Peregrinação Zen: Retornar"] = { class = "MONK", level = 30, },
 	["Raio Jade Crepitante"]  = { class = "MONK", level = 36, },  
	["Paralisia"]   = 			{ class = "MONK", level = 48, },  
	["Transcendência"]   = 		{ class = "MONK", level = 87, },  
	["Transcendência: Transferência"] = { class = "MONK", level = 87, },
--++ Monk Artifact Traits ++
	["Barril Explosivo"] = 		{ class = "MONK", level = 100, }, --7n
	["Dádiva de Sheilun"] = 	{ class = "MONK", level = 100, }, --7n
	["Golpe do Senhor dos Ventos"] = { class = "MONK", level = 100, }, --7n
--++ Monk Specialization ++
	--++ Brewmaster/Mistweaver/Windwalker ++
	["Efusão"]   = 				{ class = "MONK", level = 8, },	--7n
	["Desintoxicação"]   = 		{ class = "MONK", level = 22, }, --7m	
	--++ Brewmaster/Windwalker ++
--	["Critical Strikes"] =		{ class = "MONK", level = 1, }, --x Conflict
	["Golpe Mão de Lança"]   = 	{ class = "MONK", level = 32, }, --7m ??
	--++ Mistweaver/Windwalker ++	
	["Chute do Sol Nascente"] = { class = "MONK", level =  18, }, --7m
	["Chute Giratório da Garça"] = { class = "MONK", level = 40, }, --7m	
	--++ Brewmaster ++ 
	["Ataque Blecaute"]   = 	{ class = "MONK", level = 3, },	 --7n
	["Pancada de Barril"]   = 	{ class = "MONK", level = 10, },
	["Cambalear"]   = 			{ class = "MONK", level = 10, }, --7n	
	["Bafo de Onça"]   = 		{ class = "MONK", level = 18, }, 
 	["Expelir o Mal"]   = 		{ class = "MONK", level = 26, }, --7m 	
 	["Cerveja Pele de Ferro"] = { class = "MONK", level = 28, }, --7n
	["Glifo do Boi"]   = 		{ class = "MONK", level = 40, }, 
	["Sorte Celestial"]   = 	{ class = "MONK", level = 45, }, --7n		
	["Cerveja Purificante"] = 	{ class = "MONK", level = 54, },
 	["Meditação Zen"]   = 		{ class = "MONK", level = 65, }, --x Moved 
	["Lutador Evasivo"]   = 	{ class = "MONK", level = 78, },
	--++ Mistweaver ++ 
	["Bruma Envolvente"]   = 	{ class = "MONK", level = 10, }, 
	["Bruma Calmante"]   = 		{ class = "MONK", level = 10, }, 
	["Ensinamentos do Monastério"] = { class = "MONK", level = 10, },
 	["Névoa Renovadora"]   = 	{ class = "MONK", level = 24 }, 
	["Casulo de Vida"]   = 		{ class = "MONK", level = 28, },
	["Vivificar"]   = 			{ class = "MONK", level = 32, }, --7n 	
	["Novo Despertar"]   = 		{ class = "MONK", level = 44, }, --7n  
	["Chá do Foco do Trovão"] = { class = "MONK", level = 54, }, 
	["Cerveja Fortificante"] = 	{ class = "MONK", level = 55, }, --7.2m	
	["Fonte de Essência"]   = 	{ class = "MONK", level = 58, }, --7.2m	
 	["Reviver"]   = 			{ class = "MONK", level = 65, },
	["Rajada de Brumas"]   = 	{ class = "MONK", level = 78, }, --7n 	
	--++ Windwalker ++ 	
	["Postura do Tigre Agressivo"] = { class = "MONK", level = 1, }, --7n
	["Quebra-combo"] = 			{ class = "MONK", level =  10, }, 	
	["Chute Voador da Serpente"] = { class = "MONK", level =  10, }, 
	["Golpes Ciclônicos"] = 	{ class = "MONK", level =  12, }, --7n	
	["Andar sobre o Vento"] = 	{ class = "MONK", level =  12, }, --7n
	["Condicionamento de Combate"] = { class = "MONK", level =  20, }, 
	["Toque do Karma"] = 		{ class = "MONK", level =  24, }, 
	["Toque da Morte"]   = 		{ class = "MONK", level = 24, }, --7m 
	["Desativar"]   = 			{ class = "MONK", level = 25, }, --x Moved	
	["Além-vida"] = 			{ class = "MONK", level =  26, }, 
	["Punhos da Fúria"] = 		{ class = "MONK", level =  28, },
	["Tempestade, Terra e Fogo"] = { class = "MONK", level =  65, },
	["Sessão de Porrada"] = 	{ class = "MONK", level =  78, }, --7n	
--++ Monk Talents ++
	["Estouro de Chi"]  = 		{ class = "MONK", level = 15, }, 
	["Onda de Chi"]  = 			{ class = "MONK", level = 15, }, --7.2m	
	["Celeridade"]  = 			{ class = "MONK", level = 30, },
 	["Torpedo de Chi"] = 		{ class = "MONK", level = 30, }, 
	["Luxúria do Tigre"] =  	{ class = "MONK", level = 30, },
	["Rasteira"]  = 			{ class = "MONK", level = 60, }, 	
	["Anel da Paz"]  = 			{ class = "MONK", level = 60, },	
	["Atenuar Ferimento"]  = 	{ class = "MONK", level = 75, },  
	--++ Brewmaster/Windwalker ++
	["Olho do Tigre"]  = 		{ class = "MONK", level = 15, }, --7n
	["Evocar Estátua do Boi Negro"] = { class = "MONK", level = 60, }, --7.1.5m 	
	["Vento Impetuoso de Jade"] = { class = "MONK", level = 90, }, 	
	--++ Windwalker/Mistweaver ++ 
	["Magia Difusa"]  = 		{ class = "MONK", level = 75, },  --7.1.5m
	--++ Brewmaster ++
	["Cerveja do Boi Negro"]  = { class = "MONK", level = 45, }, --7n
	["Dádiva das Brumas"]  = 	{ class = "MONK", level = 45, }, --7n
	["Luz Cervejeira"]  = 		{ class = "MONK", level = 45, }, --7n	
	["Vitalidade Mística"]  = 	{ class = "MONK", level = 75, }, --7.1.5n	
	["Evocar Niuzao, o Boi Negro"] = { class = "MONK", level = 90, }, --7n
	["Entrega Especial"]  = 	{ class = "MONK", level = 90, }, --7n
	["Combo de Apagão"]  = 		{ class = "MONK", level = 100, }, --7n
	["Dança Elusiva"]  = 		{ class = "MONK", level = 100, }, --7n
	["Alta Tolerância"]  = 		{ class = "MONK", level = 100, }, --7n	
	--++ Mistweaver ++ 
-- 	["Caminhada nas Brumas"] =	{ class = "MONK", level = 15, }, --7.2r 
	["Pulso Zen"] = 			{ class = "MONK", level = 15, }, --7n
	["Ciclos de Vida"] = 		{ class = "MONK", level = 45, }, --7n
	["Véu de Névoa"] = 			{ class = "MONK", level = 45, }, --7n
	["Espírito da Garça"] = 	{ class = "MONK", level = 45, }, --7n	
	["Canção de Chi-Ji"] = 		{ class = "MONK", level = 60, }, --7n
	["Evocar Chi-Ji, a Garça Vermelha"] = { class = "MONK", level = 90, }, --7n
	["Vento Refrescante de Jade"] = { class = "MONK", level = 90, }, --7n
	["Evocar Estátua de Serpente de Jade"] = { class = "MONK", level = 90, }, --7m 
	["Trovão Concentrado"] = 	{ class = "MONK", level = 100, }, --7n
	["Chá de Mana"]   = 		{ class = "MONK", level = 100, }, --7m	
	["Trovão Nascente"] = 		{ class = "MONK", level = 100, }, --7n
	--++ Windwalker ++ 
	["Ascensão"]  = 			{ class = "MONK", level = 45, }, 
	["Elixir Energizante"] = 	{ class = "MONK", level =  45, }, --7n	
	["Golpes Poderosos"]  = 	{ class = "MONK", level = 45, },	
--	["Chutes Atordoantes"]  = 	{ class = "MONK", level = 60, }, --7.1.5r
	["Sessão de Golpes"]  =	 	{ class = "MONK", level = 90, }, --7n
	["Evocar Xuen, o Tigre Branco"] = { class = "MONK", level = 90, },
	["Órbita de Chi"]  = 		{ class = "MONK", level = 100, }, --7n	
	["Serenidade"] = 			{ class = "MONK", level = 100, }, --x
	["Soco Giratório do Dragão"] = { class = "MONK", level = 100, }, --7n	
--++ Monk PvP Talents ++
	["Cerveja Fortificante"] = 	{ class = "MONK", level = 100, }, --7.2m
--	["Flor de Fogo Giratória"] = { class = "MONK", level = 100, }, --7.2.5r
	["Cerveja Olho de Tigre"] = { class = "MONK", level = 100, }, --7.2.5n
	["Guarda"] = 	  			{ class = "MONK", level = 100, }, --7n
	["Barril Duplo"] = 			{ class = "MONK", level = 100, }, --7n
	["Coice Potente do Boi"] = 	{ class = "MONK", level = 100, }, --7n
	["Esfera Curativa"] = 		{ class = "MONK", level = 100, }, --7n
	["Criar: Cerveja Ligeira"] = { class = "MONK", level = 100, }, --7n
	["Caminho da Garça"] = 		{ class = "MONK", level = 100, }, --7n

--++ Paladin Abilities ++
--	["Bloqueio"] =			 	{ class = "PALADIN", level = 1, }, --7n Conflict
	["Convicção Irrestrita"] = 	{ class = "PALADIN", level = 1, },
	["Golpe do Cruzado"] = 		{ class = "PALADIN", level = 1, },
--	["Parry"]=					{ class = "PALADIN", level = 1, }, 7 Conflict		
	["Julgamento"] = 			{ class = "PALADIN", level = 3, },	
	["Ato de Bravura"] = 		{ class = "PALADIN", level = 13, }, --7n
	["Redenção"] = 				{ class = "PALADIN", level = 14, },
	["Escudo Divino"] = 		{ class = "PALADIN", level = 18, },
	["Evocar Elekk do Exarca"] = { class = "PALADIN", level = 20, },	--7n
	["Evocar Kodo Andarilho do Sol"] = { class = "PALADIN", level = 20, },	--7n
	["Evocar Cavalo de Guerra Thalassiano"] = { class = "PALADIN", level = 20, }, --7n
	["Evocar Cavalo de Guerra"] = { class = "PALADIN", level = 20, },	--7n
	["Impor as Mãos"] = 		{ class = "PALADIN", level = 22, },
	["Corcel Divino"] = 		{ class = "PALADIN", level = 28, }, --7n Hotfixh	
	["Contemplação"] = 			{ class = "PALADIN", level = 40, },	
	["Coração do Cruzado"] = 	{ class = "PALADIN", level = 40, },	
	["Evocar Corcel"] = 		{ class = "PALADIN", level = 40, },	--7n
	["Evocar Elekk do Grão-Exarca"] = { class = "PALADIN", level = 40, }, --7n
	["Evocar Nobre Kodo Andarilho do Sol"] = { class = "PALADIN", level = 40, }, --7n
	["Evocar Corcel Thalassiano"] = { class = "PALADIN", level = 40, }, --7n	
	["Bênção da Liberdade"] = 	{ class = "PALADIN", level = 52, },	--7n	
--++ Paladin Artifact Traits ++
	["Olho de Tyr"] = 			{ class = "PALADIN", level = 100, }, --7n
	["Libertação de Tyr"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Rastro de Cinzas"] = 		{ class = "PALADIN", level = 100, }, --7n
--++ Paladin Specialization ++
	--++ Holy/Protection/Retribution ++	
	["Selo da Retidão"] = 		{ class = "PALADIN", level = 5, }, --7m 
	["Clarão de Luz"] = 		{ class = "PALADIN", level = 8, }, --7m
	["Bênção de Proteção"] = 	{ class = "PALADIN", level = 48, }, --7n
	["Ira Vingativa"] = 		{ class = "PALADIN", level = 72, }, --7m
	--++ Holy/Retribution ++	
	["Proteção Divina"] = 		{ class = "PALADIN", level = 26, }, --7m
	["Consagração"] = 			{ class = "PALADIN", level = 34, }, --7m	
	["Bênção do Sacrifício"] = 	{ class = "PALADIN", level = 56, }, --7n
	--++ Protection/Retribution ++ 
	["Purificar Toxinas"] = 	{ class = "PALADIN", level = 21, }, --7n
	["Repreensão"] = 			{ class = "PALADIN", level = 36, }, --7m
	--++ Holy ++
	["Luz do Mártir"] =  		{ class = "PALADIN", level = 1, }, --7n??
	["Choque Sagrado"] = 		{ class = "PALADIN", level = 10, },
	["Purificação"] = 			{ class = "PALADIN", level = 21, }, --7m
	["Foco de Luz"] = 			{ class = "PALADIN", level = 36, }, 
--	["Absolvição"] = 			{ class = "PALADIN", level = 44, }, --7n Conflict
	["Infusão de Luz"] = 		{ class = "PALADIN", level = 50, },
	["Retidão"] = 				{ class = "PALADIN", level = 50, }, --7n	
	["Luz Sagrada"] = 			{ class = "PALADIN", level = 54, },
	["Luz da Aurora"] = 		{ class = "PALADIN", level = 58, },
	["Proficiência em Auras"] = { class = "PALADIN", level = 65, },	--7n	
	["Arauto da Luz"] = 		{ class = "PALADIN", level = 78, },	--7n	
	--++ Protection ++ 
	["Escudo do Vingador"] = 	{ class = "PALADIN", level = 10, },
	["Protegido pela Luz"] = 	{ class = "PALADIN", level = 10, },
	["Martelo do Íntegro"] = 	{ class = "PALADIN", level = 10, },	
	["Fúria Íntegra"] = 		{ class = "PALADIN", level = 10, }, --7m
	["Santuário"] = 			{ class = "PALADIN", level = 10, },	
	["Luz do Protetor"] = { class = "PALADIN", level = 12, }, --7n
	["Julgamentos do Sábio"] = 	{ class = "PALADIN", level = 28, },
	["Escudo do Íntegro"] = 	{ class = "PALADIN", level = 38, },
	["Grande Cruzado"] = 		{ class = "PALADIN", level = 50, },
	["Defensor Ardente"] = 		{ class = "PALADIN", level = 65, },	
--	["Ripostar"] =		 		{ class = "PALADIN", level = 76, }, --7 Conflict
	["Baluarte Divino"] = 		{ class = "PALADIN", level = 78, },
	["Guardião dos Reis Antigos"] = { class = "PALADIN", level = 83, },	
	--++ Retribution ++  
	["Veredito do Templário"] = { class = "PALADIN", level = 10, },
--	["Espada de Luz"] = 		{ class = "PALADIN", level = 12, },
	["Lâmina da Justiça"] = 	{ class = "PALADIN", level = 16, }, --7n
	["Escudo de Vingança"] = 	{ class = "PALADIN", level = 24, }, --7n
	["Mão Incapacitadora"] = 	{ class = "PALADIN", level = 26, }, --7n	
	["Tempestade Divina"] = 	{ class = "PALADIN", level = 32, },
--	["Bênção Maior de Poder"] = { class = "PALADIN", level = 42, }, --7.1.5r
	["Bênção Maior dos Reis"] = { class = "PALADIN", level = 44, }, --7n
	["Bênção Maior de Sabedoria"] = { class = "PALADIN", level = 46, }, --7n
	["Retribuição"] =			{ class = "PALADIN", level = 56, }, --7n	
	["Julgamento Divino"] =		{ class = "PALADIN", level = 78, }, --7n
--++ Paladin Talents ++
--	["Fidalgo"] = 				{ class = "PALADIN", level = 30, }, --7n hotfix 60 Prot, 90 Ret
	["Luz Ofuscante"] = 		{ class = "PALADIN", level = 45, }, 
 	["Contrição"] = 			{ class = "PALADIN", level = 45, },
	["Julgamento da Luz"] = 	{ class = "PALADIN", level = 90, }, --7.1.5m	
	--++ Holy/Protection ++ 
	["Punho da Justiça"] = 		{ class = "PALADIN", level = 45, }, --7.1.5m
	--++ Holy ++
	["Conceder Fé"] = 			{ class = "PALADIN", level = 15, },	--7n
	["Poder do Cruzado"] = 		{ class = "PALADIN", level = 15, },	--7n
	["Martelo da Luz"] = 		{ class = "PALADIN", level = 15, },
	["Peso da Lei"] =			{ class = "PALADIN", level = 30, },	--7n	
	["Espírito Indestrutível"] = { class = "PALADIN", level = 30, },
	["Aura da Misericórdia"] = 	{ class = "PALADIN", level = 60, }, --7n	
	["Aura do Sacrifício"] = 	{ class = "PALADIN", level = 60, }, --7n
	["Aura de Devoção"] = 		{ class = "PALADIN", level = 60, },--7m
	["Desígnio Divino"] = 		{ class = "PALADIN", level = 75, }, --7??
	["Vingador Sagrado"] = 		{ class = "PALADIN", level = 75, },
	["Prisma Sagrado"] = 		{ class = "PALADIN", level = 90, },
	["Mártir Fervoroso"] = 		{ class = "PALADIN", level = 90, }, --7n
	["Ira Santificada"] = 		{ class = "PALADIN", level = 90, },
	["Foco de Fé"] =			{ class = "PALADIN", level = 100, }, --x
	["Sinalizador do Arauto da Lu"] = { class = "PALADIN", level = 100, }, --7n
	["Foco de Virtude"] =		{ class = "PALADIN", level = 100, }, --7n
	--++ Protection ++ 	
	["Bastião da Luz"] = 		{ class = "PALADIN", level = 15, },	--7n
	["Julgamento do Cruzado"] = { class = "PALADIN", level = 15, },	--7n
	["Primeiro Vingador"] = 	{ class = "PALADIN", level = 15, },	--7n
	["Martelo Abençoado"] = 	{ class = "PALADIN", level = 30, },	--7n
	["Martelo Consagrado"] = 	{ class = "PALADIN", level = 30, },	--7n
	["Escudo Sagrado"] = 		{ class = "PALADIN", level = 100, }, --x
	["Bênção da Salvação"] = 	{ class = "PALADIN", level = 60, },	--7n
	["Bênção de Proteção Mágica"] =  { class = "PALADIN", level = 60, },	--7n
	["Aura da Retribuição"] = 	{ class = "PALADIN", level = 60, },	--7n
	["Resistência Final"] = 	{ class = "PALADIN", level = 75, },	--7n
	["Mão do Protetor"] = 		{ class = "PALADIN", level = 75, },	--7n	
	["Cavaleiro Templário"] = 	{ class = "PALADIN", level = 75, },	--7n
	["Égide de Luz"] = 			{ class = "PALADIN", level = 90, },	--7n
	["Solo Consagrado"] = 		{ class = "PALADIN", level = 90, },	--7n
	["Último Defensor"] = 		{ class = "PALADIN", level = 100, }, --7n
	["Protetor Íntegro"] = 		{ class = "PALADIN", level = 100, }, --7n 	
	["Serafim"] = 				{ class = "PALADIN", level = 100, }, --x
	--++ Retribution ++ 
	["Consagração"] = 			{ class = "PALADIN", level = 15, }, --7n	
	["Pena de Morte"] = 		{ class = "PALADIN", level = 15, },
	["Veredito Final"] = 		{ class = "PALADIN", level = 15, }, --7n
	["Julgamento Maior"] = 		{ class = "PALADIN", level = 30, }, --7n
	["Chamas da Justiça"] = 	{ class = "PALADIN", level = 30, }, --7n
	["Zelo"] = 					{ class = "PALADIN", level = 30, }, --7n
	["Punho da Justiça"] = 		{ class = "PALADIN", level = 45, }, --7.1.5n		
	["Lâmina da Ira"] = 		{ class = "PALADIN", level = 60, }, --7n
	["Martelo Divino"] = 		{ class = "PALADIN", level = 60, }, --7n
	["Lâmina da Virtude"] = 	{ class = "PALADIN", level = 60, }, --7n
	["Olho por Olho"] = 		{ class = "PALADIN", level = 75, }, --7n
	["Vingança do Justicar"] = 	{ class = "PALADIN", level = 75, }, --7n
	["Palavra de Glória"] = 	{ class = "PALADIN", level = 75, }, --7n
	["Intervenção Divina"] = 	{ class = "PALADIN", level = 90, }, --7n
	["Julgamento da Luz"] = 	{ class = "PALADIN", level = 90, }, --7.1.5n
--	["Selo da Luz"] = 			{ class = "PALADIN", level = 90, }, --7.1.5r
	["Cruzada"] = 				{ class = "PALADIN", level = 100, }, --7n	
	["Desígnio Divino"] = 	 	{ class = "PALADIN", level = 100, }, --7n
	["Ira Sagrada"] = 			{ class = "PALADIN", level = 100, }, --7m
--++ Paladin PvP Talents ++
	["Martelo da Desforra"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Bênção do Santuário"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Favorecimento Divino"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Escudo de Virtude"] = 	{ class = "PALADIN", level = 100, }, --7n
	["Cruzado Vingador"] = 		{ class = "PALADIN", level = 100, }, --7n
	["Guardião da Rainha dos Esquecidos"] = { class = "PALADIN", level = 100, }, --7n

--++ Priest Abilities ++
	["O Penitente"] = 			{ class = "PRIEST", level = 1, }, --7.2.5m
	["Punição"] = 				{ class = "PRIEST", level = 1, },
	["Palavra de Poder: Barreira"] = { class = "PRIEST", level = 5, }, --7m??
	["Ressurreição"] = 			{ class = "PRIEST", level = 18, },
	["Dissipar Magia"] = 		{ class = "PRIEST", level = 26, },
	["Agrilhoar Morto-vivo"] = 	{ class = "PRIEST", level = 32, },
	["Controle Mental"] = 		{ class = "PRIEST", level = 36, }, --7n
	["Desvanecer"] = 			{ class = "PRIEST", level = 38, },	
	["Dissipação em Massa"] = 	{ class = "PRIEST", level = 72, },
--++ Priest Artifact Traits ++
	["Clarão de T'uure"] = 		{ class = "PRIEST", level = 100, }, --7n
	["Ira da Luz"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Torrente do Caos"] = 		{ class = "PRIEST", level = 100, }, --7n
--++ Priest Specialization ++
	--++ Discipline/Holy/Shadow ++
	["Levitar"] = 				{ class = "PRIEST", level = 34, }, --7m	 
	--++ Discipline/Holy ++
	["Purificar"] = 			{ class = "PRIEST", level = 22, },
	["Vontade Férrea"] = 		{ class = "PRIEST", level = 34, },
	["Ressurreição em Massa"] =	{ class = "PRIEST", level = 44, }, --7n
	["Salto da Fé"] = 			{ class = "PRIEST", level = 83, }, --7m	
	--++ Discipline/Shadow ++
	["Recomposição Sombria"] = 	{ class = "PRIEST", level = 1, }, --7n	
	["Palavra Sombria: Dor"] = 	{ class = "PRIEST", level = 3, }, --7m
	["Palavra de Poder: Escudo"] = { class = "PRIEST", level = 5, }, --7m
	["Grito Psíquico"] = 		{ class = "PRIEST", level = 12, }, --7m	
	["Demônio das Sombras"] = 	{ class = "PRIEST", level = 40, }, --7m	
	["Visão da Mente"] = 		{ class = "PRIEST", level = 42, }, --7m
	--++ Discipline ++
	["Súplica"] = 				{ class = "PRIEST", level = 7, }, --7n	
	["Penitência"] = 			{ class = "PRIEST", level = 10, },
	["Reconciliação"] = 		{ class = "PRIEST", level = 24, },
	["Palavra de Poder: Resplendor"] = 	{ class = "PRIEST", level = 46, }, --7n			
	["Enlevo"] = 				{ class = "PRIEST", level = 50, },
	["Supressão de Dor"] = 		{ class = "PRIEST", level = 56, },
	--++ Holy ++
	["Cura Célere"] = 			{ class = "PRIEST", level = 10, }, --7m	
	["Renovar"] = 				{ class = "PRIEST", level = 10, }, 
	["Fogo Sagrado"] = 			{ class = "PRIEST", level = 12, }, --7m	
	["Palavra Sagrada: Serenidade"] = 	{ class = "PRIEST", level = 18, }, --7n		
	["Palavra Sagrada: Castigar"] = { class = "PRIEST", level = 24, },
	["Espírito da Redenção"] = 	{ class = "PRIEST", level = 29, },
	["Cura"] = 					{ class = "PRIEST", level = 34, },
	["Prece de Cura"] = 		{ class = "PRIEST", level = 40, },
	["Serendipidade"] = 		{ class = "PRIEST", level = 42, },	
	["Palavra Sagrada: Santificar"] = 	{ class = "PRIEST", level = 50, }, --7n
	["Prece Desesperada"] = 	{ class = "PRIEST", level = 30, }, --7.1.5m
	["Espírito Guardião"] = 	{ class = "PRIEST", level = 54, },	
	["Prece da Recomposição"] = { class = "PRIEST", level = 68, }, --7m	
	["Nova Sagrada"] = 			{ class = "PRIEST", level = 65, },
	["Hino Divino"] = 			{ class = "PRIEST", level = 76, },
	["Eco de Luz"] = 			{ class = "PRIEST", level = 78, },
	--++ Shadow ++
	["Açoite Mental"] = 		{ class = "PRIEST", level = 10, },
	["Seta Caótica"] = 			{ class = "PRIEST", level = 10, }, --7n
	["Erupção do Caos"] = 		{ class = "PRIEST", level = 10, }, --7n
	["Forma do Caos"] = 		{ class = "PRIEST", level = 10, }, --7n	
	["Forma de Sombra"] = 		{ class = "PRIEST", level = 12, }, --7.1n
	["Impacto Mental"] = 		{ class = "PRIEST", level = 16, }, 
	["Purificar Doença"] = 		{ class = "PRIEST", level = 22, }, --7n
	["Toque Vampírico"] = 		{ class = "PRIEST", level = 24, },
	["Calcinação Mental"] = 	{ class = "PRIEST", level = 28, }, --7m	
	["Palavra Sombria: Morte"] = { class = "PRIEST", level = 28, }, --7??	
	["Aparições Sombrias"] = 	{ class = "PRIEST", level = 34, },
	["Silêncio"] = 				{ class = "PRIEST", level = 50, },
	["Dispersão"] = 			{ class = "PRIEST", level = 58, },
	["Abraço Vampírico"] = 		{ class = "PRIEST", level = 65, },
	["Loucura"] = 				{ class = "PRIEST", level = 78, }, --7n		
--++ Priest Talents ++
	--++ Discipline/Holy ++	
	["Pena Angelical"] = 		{ class = "PRIEST", level = 30, },
	["Força Rutilante"] = 		{ class = "PRIEST", level = 45, }, --7n
	["Estrela Divina"] = 		{ class = "PRIEST", level = 90, },
	["Halo"] = 					{ class = "PRIEST", level = 90, },	
	--++ Discipline/Shadow ++		
	["Corpo e Alma"] = 			{ class = "PRIEST", level = 30, },
	["Masoquismo"] = 			{ class = "PRIEST", level = 30, }, --7n	
	["Dominar Mente"] = 		{ class = "PRIEST", level = 45, }, 
	["Voz Psíquica"] = 			{ class = "PRIEST", level = 45, }, --7n
	["Dobramentes"] = 			{ class = "PRIEST", level = 45, },	
	["Infusão de Poder"] = 		{ class = "PRIEST", level = 75, },
	--++ Discipline ++	
	["Castigo"] = 				{ class = "PRIEST", level = 15, }, --7n
	["Cisma"] = 				{ class = "PRIEST", level = 15, }, --7n
	["Palavra de Poder: Consolo"] = { class = "PRIEST", level = 60, }, --7n
	["Disciplina do Escudo"] = 	{ class = "PRIEST", level = 60, }, --7n
--	["Contrição"] = 			{ class = "PRIEST", level = 75, }, --7.2.5r
	["Clareza de Vontade"] = 	{ class = "PRIEST", level = 75, }, --7.2.5m
	["Santuário"] = 			{ class = "PRIEST", level = 75, }, --7.2.5n		
	["Sabá das Sombras"] = 		{ class = "PRIEST", level = 75, }, --7.2.5m	
	["Expurgar o Mal"] = 		{ class = "PRIEST", level = 90, }, --7.2.5m	
	["Graça"] = 				{ class = "PRIEST", level = 100, }, --7
	["Evangelismo"] = 			{ class = "PRIEST", level = 100, }, --7.2.5n	
	--++ Shadow ++	
	["Virada do Destino"] = 	{ class = "PRIEST", level = 75, },
	--++ Holy ++	
	["Renovação Perpétua"] = 	{ class = "PRIEST", level = 15, }, --7n
	["Esclarecimento"] = 		{ class = "PRIEST", level = 15, }, --7m
	["Trilha de Luz"] = 		{ class = "PRIEST", level = 15, }, --7n
	["Corpo e Mente"] = 		{ class = "PRIEST", level = 30, }, --7n
	["Perseverança"] = 			{ class = "PRIEST", level = 30, }, --7.1.5n
	["Além-vida"] = 			{ class = "PRIEST", level = 45, }, --7n
	["Censura"] = 				{ class = "PRIEST", level = 45, }, --7n
	["Anjo da Guarda"] = 		{ class = "PRIEST", level = 60, }, --7n	
	["Luz dos Naarus"] =		{ class = "PRIEST", level = 60, }, --7n	
	["Símbolo de Esperança"] = 	{ class = "PRIEST", level = 60, }, --7n		
	["Cura Vinculada"] = 		{ class = "PRIEST", level = 48, },--x Moved	
	["Devoção"] = 				{ class = "PRIEST", level = 75, }, --7n	
	["Torrente de Luz"] = 		{ class = "PRIEST", level = 75, }, --7n
	["Divindade"] = 			{ class = "PRIEST", level = 90, }, --7n
	["Apoteose"] = 				{ class = "PRIEST", level = 100, }, --7n
	["Bênção"] = 				{ class = "PRIEST", level = 100, }, --7n
	["Círculo de Cura"] = 		{ class = "PRIEST", level = 100, }, --7m	
	--++ Shadow ++
	["Fortaleza da Mente"] = 	{ class = "PRIEST", level = 15, }, --7n
	["Palavra Sombria: Caos"] = { class = "PRIEST", level = 15, }, --7n
	["Mania"] = 				{ class = "PRIEST", level = 30, }, --7n++
--	["Bomba Psíquica"] = 		{ class = "PRIEST", level = 45, }, --7.1.5r
	["Insanidade Persistente"] = { class = "PRIEST", level = 60, }, --7.1.5n	
	["Ceifador de Almas"] = 	{ class = "PRIEST", level = 60, }, --7n
--	["Senhor do Caos"] = 		{ class = "PRIEST", level = 60, }, --7.1.5r
	["Raio do Caos"] = 			{ class = "PRIEST", level = 60, }, --7n
	["Espíritos Auspiciosos"] = { class = "PRIEST", level = 75, }, 	
	["San'layn"] = 				{ class = "PRIEST", level = 75, }, --7n++
	["Percepção Sombria"] = 	{ class = "PRIEST", level = 75, }, --7n
	["Padecimento"] = 			{ class = "PRIEST", level = 90, }, --7.1.5n		
	["Colisão de Sombras"] = 	{ class = "PRIEST", level = 100, }, --71.5m
	["Legado do Caos"] = 		{ class = "PRIEST", level = 100, }, --7n
--	["Aguilhão Mental"] = 		{ class = "PRIEST", level = 100, }, --7.1.5r
	["Submissão à Loucura"] = 	{ class = "PRIEST", level = 100, }, --7n
--++ Priest PvP Talents ++
	["Deslocamento Caótico"] = 	{ class = "PRIEST", level = 100, }, --7n
	["Concentração Interior"] = { class = "PRIEST", level = 100, }, --7n
	["Clarão de Esperança"] = 	{ class = "PRIEST", level = 100, }, --7n
	["Arcanjo"] = 				{ class = "PRIEST", level = 100, }, --7n
	["Premonição"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Psicodemônio"] = 			{ class = "PRIEST", level = 100, }, --7n
	["Palavra de Poder: Fortitude"] = { class = "PRIEST", level = 100, }, --7n
	["Desvanecer Maior"] = 		{ class = "PRIEST", level = 100, }, --7n
	["Defesa Sagrada"] = 		{ class = "PRIEST", level = 100, }, --7n
	["Espírito do Redentor"] = 	{ class = "PRIEST", level = 100, }, --7n

--++ Ladino Abilities ++
--	["Acertos críticos"] = 		{ class = "DRUID", level = 1, }, --++ Conflict
	["Detecção"] = 				{ class = "ROGUE", level = 1, }, --7m
--	["Aparar"]=					{ class = "ROGUE", level = 1, }, 7 Conflict		
	["Frasco Rubro"] = 			{ class = "ROGUE", level = 14, }, --7n		
	["Chute"] = 				{ class = "ROGUE", level = 18, },
	["Abrir Fechadura"] = 		{ class = "ROGUE", level = 24, },
	["Disparada"] = 			{ class = "ROGUE", level = 26, },
	["Detectar Armadilhas"] = 	{ class = "ROGUE", level = 42, },
	["Manto das Sombras"] = 	{ class = "ROGUE", level = 58, },
	["Pé de Vento"] = 			{ class = "ROGUE", level = 62, },
	["Queda Segura"] = 			{ class = "ROGUE", level = 62, }, 	
	["Leque de Facas"] = 		{ class = "ROGUE", level = 66, }, --7??
	["Truques do Ofício"] = 	{ class = "ROGUE", level = 78, },
--++ Rogue Artifact Traits ++
	["Maldição dos Alfanjes do Terror"] = { class = "ROGUE", level = 100, }, --7n
	["Mordida do Gorjavil"] =	{ class = "ROGUE", level = 100, }, --7n
	["Ruína dos Reis"] = 		{ class = "ROGUE", level = 100, }, --7n
--++ Rogue Specialization ++
	--++ Assassination/Outlaw/Subtlety ++ 
	["Furtividade"] = 			{ class = "ROGUE", level = 5, }, --7m
	["Aturdir"] = 				{ class = "ROGUE", level = 12, }, --7m	
	["Bater Carteira"] = 		{ class = "ROGUE", level = 16, }, --7m
	["Cegar"] = 				{ class = "ROGUE", level = 24, }, --7.1.5m	
	["Distração"] = 			{ class = "ROGUE", level = 28, }, --7m
	["Golpe Baixo"] = 			{ class = "ROGUE", level = 29, }, --7m
	["Sumir"] = 				{ class = "ROGUE", level = 32, }, --7m	 
	--++ Assassination/Subtlety ++  
	["Evasão"] = 				{ class = "ROGUE", level = 8, }, --7m		
	["Passo Furtivo"] = 		{ class = "ROGUE", level = 13, }, --7m
	["Golpe no Rim"] = 			{ class = "ROGUE", level = 40, }, --7m	
	--++ Assassination ++  
	["Mutilar"] = 				{ class = "ROGUE", level = 1, },
	["Veneno Mortal"] = 		{ class = "ROGUE", level = 2, }, --7m	
	["Envenenar"] = 			{ class = "ROGUE", level = 3, },
	["Determinação do Assassino"] = { class = "ROGUE", level = 10, },
	["Venenos Aprimorados"] = 	{ class = "ROGUE", level = 10, },
	["Faca Envenenada"] = 		{ class = "ROGUE", level = 10, }, --7n
	["Ir ao Ponto"] = 			{ class = "ROGUE", level = 20, }, 
	["Ruptura"] = 				{ class = "ROGUE", level = 22, }, --7m
	["Feridas Envenenadas"] = 	{ class = "ROGUE", level = 22, },
	["Veneno Ferino"] = 		{ class = "ROGUE", level = 25, }, --7m	
	["Selar o Destino"] = 		{ class = "ROGUE", level = 27, },
	["Veneno Debilitante"] = 	{ class = "ROGUE", level = 38, }, --7.1.5m
	["Garrote"] = 				{ class = "ROGUE", level = 48, }, --7m
	["Vendeta"] = 				{ class = "ROGUE", level = 72, },
	["Venenos Potentes"] = 		{ class = "ROGUE", level = 78, },
	--++ Outlaw ++  
--	["Ripostar"] = 				{ class = "ROGUE", level = 10, }, -- Conflict	
	["Transpassar"] = 			{ class = "ROGUE", level = 10, }, --7n
	["Talho de Sabre"] = 		{ class = "ROGUE", level = 10, }, --7n
	["Vitalidade"] = 			{ class = "ROGUE", level = 10, },
	["Tiro de Pistola"] = 		{ class = "ROGUE", level = 12, }, --7n
	["Emboscar"] = 				{ class = "ROGUE", level = 14 }, --7m
	["Esfaquear"] = 			{ class = "ROGUE", level = 22, }, --7m
	["No Meio da Testa"] = 		{ class = "ROGUE", level = 25, }, --7n	
	["Malevolência"] = 			{ class = "ROGUE", level = 27, }, 
	["Vigor em Combate"] = 		{ class = "ROGUE", level = 34, },
	["Golpe de Sorte"] = 		{ class = "ROGUE", level = 36, }, --7n
	["Rajada de Lâminas"] = 	{ class = "ROGUE", level = 48, }, 	
	["Lâminas Inquietas"] = 	{ class = "ROGUE", level = 50, },
	["Suborno"] = 				{ class = "ROGUE", level = 54, }, --7n
	["Adrenalina"] = 			{ class = "ROGUE", level = 72, },
	["Adaga de Bloqueio"] = 	{ class = "ROGUE", level = 78, },
	--++ Subtlety ++
	["Punhalada pelas Costas"] = { class = "ROGUE", level = 10, },	
	["Recuperação Energética"] = { class = "ROGUE", level = 10, },
	["Eviscerar"] = 			{ class = "ROGUE", level = 10, }, --7m
	["Lançar Shuriken"] = 		{ class = "ROGUE", level = 11, }, --7m
	["Golpe Sombrio"] = 		{ class = "ROGUE", level = 22, }, --7n
	["Técnicas Sombrias"] = 	{ class = "ROGUE", level = 27, }, --7n
	["Símbolos da Morte"] = 	{ class = "ROGUE", level = 34, }, --7n
	["Dança das Sombras"] = 	{ class = "ROGUE", level = 36, },
	["Sombras Copiosas"] = 		{ class = "ROGUE", level = 42, }, --7n
	["Lâmina Soturna"] = 		{ class = "ROGUE", level = 46, }, --7n	
	["Golpes Implacáveis"] = 	{ class = "ROGUE", level = 50, }, 
	["Tempestade de Shurikens"] = { class = "ROGUE", level = 66, }, --7n
	["Sequência de Shurikens"] = { class = "ROGUE", level = 70, }, --7.2.5n	
	["Lâminas Sombrias"] = 		{ class = "ROGUE", level = 72, }, --7m	
	["Carrasco"] = 				{ class = "ROGUE", level = 78, }, 
--++ Rogue Talents ++
	["Antecipação"] = 			{ class = "ROGUE", level = 45, }, 
	["Estratagema Profundo"] = 	{ class = "ROGUE", level = 45 }, --7n	
	["Vigor"] = 				{ class = "ROGUE", level = 45 }, --7n++
	["Escapar da Morte"] = 		{ class = "ROGUE", level = 60, }, 
	["Escorregadio"] = 			{ class = "ROGUE", level = 60, },  
	["Oprimir os Fracos"] = 	{ class = "ROGUE", level = 75, }, 
	["Diligência"] = 			{ class = "ROGUE", level = 90, }, --7n
	["A Morte Vem de Cima"] = 	{ class = "ROGUE", level = 100, }, 
	["Marcado para Morrer"] =	{ class = "ROGUE", level = 90, }, 
	--++ Assassination/Subtlety ++  
	["Espreitanoite"] = 		{ class = "ROGUE", level = 30, },
	["Concentração Sombria"] = 	{ class = "ROGUE", level = 30, },	
	["Subterfúgio"] = 			{ class = "ROGUE", level = 30, },	
	--++ Assassination ++ 
	["Planejamento Elaborado"] = { class = "ROGUE", level = 15, }, --7n
	["Hemorragia"] = 			{ class = "ROGUE", level = 15, }, --7m
	["Mestre Envenenador"] = 	{ class = "ROGUE", level = 90, },  --7m
	["Veneno Sorvedouro"] = 	{ class = "ROGUE", level = 60, },
	["Hemorragia Interna"] = 	{ class = "ROGUE", level = 75, }, --x
	["Bandidagem"] = 			{ class = "ROGUE", level = 75, }, --7n	
--	["Veneno Agonizante"] = 	{ class = "ROGUE", level = 90, }, --7.2.5r	
	["Exsanguinate"] = 			{ class = "ROGUE", level = 90, }, --7n
	["Lâmina Tóxica"] = 		{ class = "ROGUE", level = 90, }, --7.2.5n		
	["Descarga Venenosa"] = 	{ class = "ROGUE", level = 100, }, --x
	--++ Outlaw ++ 
	["Golpe Fantasmagórico"] = 	{ class = "ROGUE", level = 15, }, --7n
	["Saque Rápido"] = 			{ class = "ROGUE", level = 15, }, --7n
	["Mestre Espadachim"] = 	{ class = "ROGUE", level = 15, }, --7n
	["Golpes Acrobáticos"] = 	{ class = "ROGUE", level = 30, }, --7n
	["Gancho de Escalada"] = 	{ class = "ROGUE", level = 30, }, --7n
	["Bater e Correr"] = 		{ class = "ROGUE", level = 30, }, --7n
	["Estômago de Ferro"] = 	{ class = "ROGUE", level = 60, }, --7n
	["Truques Sujos"] = 		{ class = "ROGUE", level = 75, },
	["Lábia"] = 				{ class = "ROGUE", level = 75, }, --7n
	["Barragem de Canhão"] = 	{ class = "ROGUE", level = 90, }, --7n
	["Matança"] = 				{ class = "ROGUE", level = 90, }, --7m
	["Retalhar"] = 				{ class = "ROGUE", level = 100, }, --7m	
	--++ Subtlety ++  
	["Lâmina Lúgubre"] = 		{ class = "ROGUE", level = 15, }, --7n
	["Mestre do Subterfúgio"] = { class = "ROGUE", level = 15, }, --7m
	["Mestre de Armas"] = 		{ class = "ROGUE", level = 15, }, --7n
	["Trevas Reconfortantes"] = { class = "ROGUE", level = 60, }, --7n
	["Ataque das Sombras"] = 	{ class = "ROGUE", level = 75, }, --7n
	["Emaranhado de Sombras"] = { class = "ROGUE", level = 75 }, --7n
	["Sombra Escura"] = 		{ class = "ROGUE", level = 90 }, --7.2.5n	
	["Invólucro de Sombras"] = 	{ class = "ROGUE", level = 100, }, --7n
--	["Premeditação"] = 			{ class = "ROGUE", level = 90, }, --7.2.5r
	["Mestre das Sombras"] = 	{ class = "ROGUE", level = 100, }, --7n	
--++ Rogue PvP Talents ++
--	["Ir ao Ponto"] = 			{ class = "ROGUE", level = 100, }, --7.2.5r
	["Pilhar Armadura"] = 		{ class = "ROGUE", level = 100, }, --7n
	["Neurotoxina"] = 			{ class = "ROGUE", level = 100, }, --7.2.5m
	["Duelo Sombrio"] = 		{ class = "ROGUE", level = 100, }, --7n
	["Desmantelar"] = 			{ class = "ROGUE", level = 100, }, --7n
	["Bomba de Fumaça"] = 		{ class = "ROGUE", level = 100, }, --7n
	["Sangue Frio"] = 			{ class = "ROGUE", level = 100, }, --7n
	["Estocada"] = 				{ class = "ROGUE", level = 100, }, --7.2.5m	
	
--++ Shaman Abilities ++
	["Totem Incapacitante"] = 	{ class = "SHAMAN", level = 1, }, --7n??
	["Espírito Ancestral"] = 	{ class = "SHAMAN", level = 14, },
	["Lobo Fantasma"] = 		{ class = "SHAMAN", level = 16, },
	["Andar sobre a Água"] = 	{ class = "SHAMAN", level = 24, },
	["Visão Distante"] = 		{ class = "SHAMAN", level = 36, },
	["Bagata"] = 				{ class = "SHAMAN", level = 42, },
	["Revocação Astral"] = 		{ class = "SHAMAN", level = 44, }, 
	["Transição Astral"] = 		{ class = "SHAMAN", level = 52, }, 	
	["Expurgar"] = 				{ class = "SHAMAN", level = 58, },	
	["Sede de Sangue"] = 		{ class = "SHAMAN", level = 65, },
	["Heroísmo"] = 				{ class = "SHAMAN", level = 65, },
--++ Shaman Artifact Traits ++
	["Ventos da Perdição"] = 	{ class = "SHAMAN", level = 100, }, --7n
	["Dádiva da Rainha"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Guardião da Tempestade"] = { class = "SHAMAN", level = 100, }, --7n
--++ Shaman Specialization ++
	--++ Elemental/Enhancement/Restoration ++ 
	["Raio"] = 					{ class = "SHAMAN", level = 1, }, --7m		
	["Maré Curativa"] = 		{ class = "SHAMAN", level = 7, }, --7m	
	["Rajada de Vento"] = 		{ class = "SHAMAN", level = 22, }, --7m
	--++ Elemental/Enhancement ++
	["Controlador da Voragem"] = { class = "SHAMAN", level = 3, }, --7n??	
	["Purificar Espírito"] = 	{ class = "SHAMAN", level = 18, }, --7m
	--++ Elemental/Restoration ++ 
	["Choque Flamejante"] = 	{ class = "SHAMAN", level = 3, }, --7m		
	["Estouro de Lava"] = 		{ class = "SHAMAN", level = 12, },
	["Cadeia de Raios"] = 		{ class = "SHAMAN", level = 28, }, --7m
	["Torrente de Lava"] = 		{ class = "SHAMAN", level = 38, },	
	--++ Elemental ++ 
	["Fulminação"] = 			{ class = "SHAMAN", level = 1, },	
	["Choque Terreno"] = 		{ class = "SHAMAN", level = 3, }, --x
	["Fúria Elemental"] = 		{ class = "SHAMAN", level = 10, }, 
	["Iluminação Espiritual"] = { class = "SHAMAN", level = 10, },
	["Tempestade Relampejante"] = { class = "SHAMAN", level = 16, },
	["Choque Gélido"] = 		{ class = "SHAMAN", level = 22, }, --7m
	["Concentração Elemental"] = { class = "SHAMAN", level = 40, },
	["Elemental do Fogo"] = 	{ class = "SHAMAN", level = 48, }, --7n	
	["Totem do Terremoto"] = 	{ class = "SHAMAN", level = 52, }, --7n	
	["Elemental da Terra"] = 	{ class = "SHAMAN", level = 72, }, --7n	
	["Sobrecarga Elemental"] = 	{ class = "SHAMAN", level = 78, }, --x	
	--++ Enhancement ++
--	["Acertos críticos"] = 		{ class = "DRUID", level = 1, }, --x Conflict
	["Açoite de Lava"] = 		{ class = "SHAMAN", level = 10, },
	["Trinca-pedra"] = 			{ class = "SHAMAN", level = 10, }, --7n	
	["Labareda"] = 				{ class = "SHAMAN", level = 12, }, --7n
	["Marca Gélida"] = 			{ class = "SHAMAN", level = 19, }, --7n		
	["Ataque da Tempestade"] = 	{ class = "SHAMAN", level = 26, },
	["Raio Poderoso"] = 		{ class = "SHAMAN", level = 28, }, --7n
	["Fúria dos Ventos"] = 		{ class = "SHAMAN", level = 30, }, --7n	
	["Açoite Trovejante"] = 	{ class = "SHAMAN", level = 38, }, --7n
	["Traztormenta"] = 			{ class = "SHAMAN", level = 40, }, --7n
	["Espírito Feral"] = 		{ class = "SHAMAN", level = 48, }, --7n
	["Arma da Voragem"] = 		{ class = "SHAMAN", level = 52, },
	["Andar Espiritual"] = 		{ class = "SHAMAN", level = 72, },
	["Elementos Melhorados"] = 	{ class = "SHAMAN", level = 78, },
	--++ Restoration ++
	["Contracorrente"] = 		{ class = "SHAMAN", level = 10, },
	["Totem de Torrente Curativa"] = { class = "SHAMAN", level = 13, },
	["Purificar o Espírito"] = 	{ class = "SHAMAN", level = 18, },	
	["Cura Encadeada"] = 		{ class = "SHAMAN", level = 26, }, --x Moved	
	["Ressurgência"] = 			{ class = "SHAMAN", level = 40, },
	["Visão Ancestral"] = 		{ class = "SHAMAN", level = 44, }, --7n
	["Chuva Curativa"] = 		{ class = "SHAMAN", level = 48, },
	["Mar Revolto"] = 			{ class = "SHAMAN", level = 50, },
	["Totem de Maré Curativa"] = { class = "SHAMAN", level = 54, }, 
	["Onda Curativa"] = 		{ class = "SHAMAN", level = 56, },	
	["Totem do Vínculo do Espírito"] = { class = "SHAMAN", level = 62, },
	["Graça do Andarilho Espiritual"] = { class = "SHAMAN", level = 72, }, 	
	["Cura Profunda"] = 		{ class = "SHAMAN", level = 78, }, 
--++ Shaman Talents ++
	["Totem de Rajada de Vento"] =  { class = "SHAMAN", level = 30, }, --7n
	["Totem Agarraterra"] = 	{ class = "SHAMAN", level = 30, },
	["Totem de Surto Elétrico"] = { class = "SHAMAN", level = 45, }, --7n
	["Totem Vodu"] = 			{ class = "SHAMAN", level = 45, }, --7n
	["Ascendência"] = 			{ class = "SHAMAN", level = 100, }, --7n		
	--++ Elemental/Enhancement ++
	["Rapidez Ancestral"] = 	{ class = "SHAMAN", level = 60, },	
	--++ Elemental/Restoration ++
	["Conselho dos Ancestrais"] = { class = "SHAMAN", level = 30, },
	["Rajada de Vento"] = 		{ class = "SHAMAN", level = 30, }, --7n	
	["Eco dos Elementos"] = 	{ class = "SHAMAN", level = 60, }, 	
	--++ Elemental ++	
	["Fúria Telúrica"] = 		{ class = "SHAMAN", level = 15, }, --7n
	["Caminho de Chamas"] = 	{ class = "SHAMAN", level = 15, }, --7n
	["Maestria Totêmica"] = 	{ class = "SHAMAN", level = 15, }, --7n	
	["Tremor Secundário"] = 	{ class = "SHAMAN", level = 60, }, --7.1.5m	
	["Mestre dos Elementos"] = 	{ class = "SHAMAN", level = 60, }, --7.1.5m	
	["Impacto Elemental"] = 	{ class = "SHAMAN", level = 75, }, --7.1.5m
	["Fusão Elemental"] = 		{ class = "SHAMAN", level = 75, }, --x	
	["Elementalista Primevo"] = { class = "SHAMAN", level = 75, },
	["Totem de Magma Líquido"] = { class = "SHAMAN", level = 90, }, --7.1.5m	
	["Elemental da Tempestade"] = { class = "SHAMAN", level = 90, }, --7n
	["Algifúria"] = 			{ class = "SHAMAN", level = 100, }, --7.1.5m	
	["Para-raios"] = 		{ class = "SHAMAN", level = 100, }, --7n	
	--++ Enhancement ++	
	["Mão Quente"] = 			{ class = "SHAMAN", level = 15, }, --7n
	["Soterrador"] = 			{ class = "SHAMAN", level = 15, }, --7.2.5m	
	["Canção do Vento"] = 		{ class = "SHAMAN", level = 15, }, --7n
	["Estocada Feral"] = 		{ class = "SHAMAN", level = 30, }, --7n
	["Precipitação"] = 			{ class = "SHAMAN", level = 30, }, --7n
	["Chuva de Granizo"] = 		{ class = "SHAMAN", level = 60, }, --7n		
	["Escudo de Raios"] = 		{ class = "SHAMAN", level = 60, }, --7m	
	["Açoite Trovejante Potencializado"] = 	{ class = "SHAMAN", level = 75, }, --7n
	["Sobrecarga"] = 			{ class = "SHAMAN", level = 75, }, --7n
	["Tormenta"] = 				{ class = "SHAMAN", level = 75, }, --7n
	["Tempestade Poderosa"] = 	{ class = "SHAMAN", level = 90, }, --7n
	["Fúria do Ar"] = 			{ class = "SHAMAN", level = 90, }, --7n
	["Cisão"] = 				{ class = "SHAMAN", level = 90, }, --7n
	["Punho de Pedra"] = 		{ class = "SHAMAN", level = 100, }, --7.2.5m	
	["Aguilhão Terrano"] = 		{ class = "SHAMAN", level = 100, }, --7n
	--++ Restoration ++
	["Torrente"] = 				{ class = "SHAMAN", level = 15, }, --7n
	["Ondulação"] = 			{ class = "SHAMAN", level = 15, }, --7n
	["Espírito Gracioso"] = 	{ class = "SHAMAN", level = 30, }, --7n
	["Ondas Fortes"] = 			{ class = "SHAMAN", level = 60, }, --7n
	["Dilúvio"] = 				{ class = "SHAMAN", level = 60, }, --7n
	["Totem de Proteção Ancestral"] = { class = "SHAMAN", level = 75, }, --7n
	["Fortitude Ancestral"] = 	{ class = "SHAMAN", level = 75, }, --7n++
	["Totem do Escudo Terreno"] = { class = "SHAMAN", level = 75, }, --7n
	["Profundezas Sem Fundo"] = { class = "SHAMAN", level = 90, }, --7n
	["Totem da Explosão Nebulosa"] = { class = "SHAMAN", level = 90, }, --x
	["Maré Alta"] = 			{ class = "SHAMAN", level = 100, }, --x
	["Nascente"] = 				{ class = "SHAMAN", level = 100, }, --7n	
--++ Shaman PvP Talents ++
	["Escudo da Terra"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Vínculo do Espírito"] = 	{ class = "SHAMAN", level = 100, }, --7n
	["Totem da Fúria Celeste"] = { class = "SHAMAN", level = 100, }, --7n
	["Totem de Contragolpe"] = 	{ class = "SHAMAN", level = 100, }, --7n
	["Totem de Fúria dos Ventos"] = { class = "SHAMAN", level = 100, }, --7n
	["Totem de Aterramento"] = 	{ class = "SHAMAN", level = 100, }, --7n
	["Carga Trovejante"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Controlar Lava"] = 		{ class = "SHAMAN", level = 100, }, --7n
	["Laço de Raio"] = 			{ class = "SHAMAN", level = 100, }, --7n
	["Forma Etérea"] = 			{ class = "SHAMAN", level = 100, }, --7n

--++ Warlock Abilities ++
	["Barragem de Caos"] = 		{ class = "WARLOCK", level = 1, }, --7n??
	["Sorvo de Alma"] = 		{ class = "WARLOCK", level = 1, },  --7m??
	["Seta do Caos"] = 			{ class = "WARLOCK", level = 1, }, --7m ??
	["Seta Sombria"] = 			{ class = "WARLOCK", level = 1, }, --7??
	["Estilhaços de Alma"] = 	{ class = "WARLOCK", level = 1, }, --7.2.5n	
	["Evocar Diabrete"] = 		{ class = "WARLOCK", level = 1, },
	["Criar Pedra de Vida"] = 	{ class = "WARLOCK", level = 5, },
	["Evocar Emissário do Caos"] = { class = "WARLOCK", level = 8, },
	["Controlar Demônio"] = 	{ class = "WARLOCK", level = 10, },
	["Medo"] = 					{ class = "WARLOCK", level = 16, },
	["Pedra da Alma"] = 		{ class = "WARLOCK", level = 18, },
	["Funil de Vida"] = 		{ class = "WARLOCK", level = 19, },	
	["Corcel Vil"] = 			{ class = "WARLOCK", level = 20, },	--7n 
	["Olho de Kilrogg"] = 		{ class = "WARLOCK", level = 22, },
	["Fôlego Interminável"] = 	{ class = "WARLOCK", level = 24, },
	["Evocar Súcubo"] = 		{ class = "WARLOCK", level = 28, },	
	["Comandar Demônio"] = 		{ class = "WARLOCK", level = 31, },	
	["Banir"] = 				{ class = "WARLOCK", level = 32, },
	["Evocar Caçador Vil"] = 	{ class = "WARLOCK", level = 35, },
	["Corcel Medonho"] = 		{ class = "WARLOCK", level = 40, },	--7n
	["Evocar Infernal"] = 		{ class = "WARLOCK", level = 50, },
	["Escravizar Demônio"] = 	{ class = "WARLOCK", level = 54, },
	["Evocar Demonarca"] = 		{ class = "WARLOCK", level = 58, },
	["Determinação Interminável"] = { class = "WARLOCK", level = 62, },
	["Criar Poço das Almas"] = 	{ class = "WARLOCK", level = 65, },
	["Ritual de Evocação"] = 	{ class = "WARLOCK", level = 72, },	
	["Portal Demoníaco"] = 		{ class = "WARLOCK", level = 87, },
--++ Warlock Artifact Traits ++
	["Fissura Dimensional"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Ceifar Almas"] = 			{ class = "WARLOCK", level = 100, }, --7n
	["Consumição de Thal'kiel"] = { class = "WARLOCK", level = 100, }, --7n
--++ Warlock Specialization ++
	--++ Affliction/Demonology/Destruction ++
	["Conversão de Vida"] = 	{ class = "WARLOCK", level = 16, }, --x
	--++ Affliction ++
	["Corrupção"] = 			{ class = "WARLOCK", level = 3, }, --7m
	["Agonia"] = 				{ class = "WARLOCK", level = 10, },
	["Agonia Instável"] = 		{ class = "WARLOCK", level = 10, },
--	["Segredos dos Necrólitos"] = { class = "WARLOCK", level = 10, }, --7.1.5r	
	["Drenar Vida"] = 			{ class = "WARLOCK", level = 13, }, --7.1.5m
	["Drenar Alma"] = 			{ class = "WARLOCK", level = 13, }, --7.1.5m	
	["Semente da Corrupção"] = 	{ class = "WARLOCK", level = 38, },
	["Suplícios Potentes"] = 	{ class = "WARLOCK", level = 78, },
	--++ Demonology ++
	["Mão de Gul'dan"] = 		{ class = "WARLOCK", level = 10, },	
	["Potencialização Demoníaca"] = { class = "WARLOCK", level = 12, },	--7n
	["Evocar Espreitadores do Medo"] = 	{ class = "WARLOCK", level = 14, }, --7n
	["Ruína"] = 				{ class = "WARLOCK", level = 26, }, --x	
	["Ira Demoníaca"] = 		{ class = "WARLOCK", level = 36, }, --7n	
	["Evocar Guarda Vil"] = 	{ class = "WARLOCK", level = 40, },
	["Vínculo Anímico"] = 		{ class = "WARLOCK", level = 42, },	
	["Mestre Demonologista"] = 	{ class = "WARLOCK", level = 78, },
	--++ Destruction ++
	["Imolação"] = 				{ class = "WARLOCK", level = 10, },
	["Incinerar"] = 			{ class = "WARLOCK", level = 10, },
	["Conflagrar"] = 			{ class = "WARLOCK", level = 14, },
	["Chuva de Fogo"] = 		{ class = "WARLOCK", level = 38, }, 
	["Devastação"] = 			{ class = "WARLOCK", level = 40, },
	["Energias Caóticas"] = 	{ class = "WARLOCK", level = 78, }, --7n
--++ Warlock Talents ++
	["Círculo Demoníaco: Evocação"] = { class = "WARLOCK", level = 45, }, --7m
	["Espiral da Morte"] = 		{ class = "WARLOCK", level = 45, },
	["Colheita de Almas"] = 	{ class = "WARLOCK", level = 60, }, --7m
	["Impulso Ardente"] = 		{ class = "WARLOCK", level = 75, },
	["Pacto Sombrio"] = 		{ class = "WARLOCK", level = 75, }, --7n
	["Pele de Demônio"] = 		{ class = "WARLOCK", level = 75, }, --7n
	["Grimório de Supremacia"] = { class = "WARLOCK", level = 90, },
	["Grimório do Serviço"] = 	{ class = "WARLOCK", level = 90, },
	["Conduíte da Alma"] = 		{ class = "WARLOCK", level = 100, }, --7n
	--++ Affliction/Destruction ++	
--	["Transfusão de Mana"] = 	{ class = "WARLOCK", level = 30, }, --7.1.5r
	["Conversão de Vida Potencializada"] = 	{ class = "WARLOCK", level = 30, }, --7.1.5n	
	["Grimório de Sacrificar"] = { class = "WARLOCK", level = 90, }, 
	--++ Demonology/Destruction ++
	["Fúria Sombria"] = 		{ class = "WARLOCK", level = 45, }, 
	--++ Affliction ++
	["Possessão"] = 			{ class = "WARLOCK", level = 15, },	--7m
	["Garra Maléfica"] = 		{ class = "WARLOCK", level = 15, },	--7.1.5n		
	["Contorça-se em Agonia"] = { class = "WARLOCK", level = 15, }, --7n
	["Corrupção Absoluta"] = 	{ class = "WARLOCK", level = 30, }, --7n 
	["Contágio"] = 				{ class = "WARLOCK", level = 30, }, --7n
	["Uivo do Terror"] = 		{ class = "WARLOCK", level = 45, }, --x 
	["Plantar as Sementes"] = 	{ class = "WARLOCK", level = 60, }, --7n 
	["Singularidade Fantasmática"] = { class = "WARLOCK", level = 60, }, --7.2.5m
	["Abraço da Morte"] = 		{ class = "WARLOCK", level = 100, }, --7.2.5n 
	["Sifão de Vida"] = 		{ class = "WARLOCK", level = 100, }, --7.2.5m	
--	["Efígie Anímica"] = 		{ class = "WARLOCK", level = 100, }, --7.2.5r
	--++ Demonology ++
	["Chamado Demoníaco"] = 	{ class = "WARLOCK", level = 15, }, --7n 
	["Chama Sombria"] = 		{ class = "WARLOCK", level = 15, }, --7n
	["Inspiração Sombria"] = 	{ class = "WARLOCK", level = 15, }, --7n 
	["Ruína Iminente"] = 		{ class = "WARLOCK", level = 30, }, --7n 
	["Implosão"] = 				{ class = "WARLOCK", level = 30, }, --7n 
	["Espreitadores do Medo Aprimorados"] = { class = "WARLOCK", level = 30, }, --7n 
	["Mão da Ruína"] = 			{ class = "WARLOCK", level = 60, }, --7n 
	["Delírio de Poder"] = 		{ class = "WARLOCK", level = 60, }, --7n
	["Grimório da Sinergia"] = 	{ class = "WARLOCK", level = 90, }, --x
	["Seta Demoníaca"] = 		{ class = "WARLOCK", level = 100, }, --x
	["Summon Darkglare"] = 		{ class = "WARLOCK", level = 100, }, --7n 
	--++ Destruction ++
	["Ignição Explosiva"] = 	{ class = "WARLOCK", level = 15, }, --7m
	["Labareda Crepitante"] = 	{ class = "WARLOCK", level = 15, }, --7n
	["Sombra Ardente"] = 		{ class = "WARLOCK", level = 15, },
	["Erradicação"] = 			{ class = "WARLOCK", level = 30, }, --7.1.5m
	["Entropia Reversa"] = 		{ class = "WARLOCK", level = 30, }, --7n
	["Cataclismo"] = 			{ class = "WARLOCK", level = 60, }, --7.1.5m	
	["Fogo e Enxofre"] = 		{ class = "WARLOCK", level = 60, }, --7m	
	["Canalizar Fogo Demoníaco"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Semear a Devastação"] = 	{ class = "WARLOCK", level = 100, }, --7n	
--++ Warlock PvP Talents ++
--	["Trocar Almas"] = 			{ class = "WARLOCK", level = 100, }, --7.1.5r
	["Maldição das Sombras"] = 		{ class = "WARLOCK", level = 100, }, --7.1.5n
	["Maldição de Línguas"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Maldição da Fraqueza"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Maldição da Fragilidade"] = { class = "WARLOCK", level = 100, }, --7n
	["Ruína Devastadora"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Chamar Observador"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Pedra de Fogo"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Proteção Etérea"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Chamar Lorde Vil"] = 		{ class = "WARLOCK", level = 100, }, --7n
	["Chamar Caçador Vil"] = 	{ class = "WARLOCK", level = 100, }, --7n
	["Chamusco Mágico"] = 		{ class = "WARLOCK", level = 100, }, --7n
--	["Queimadura Anímica"] = 	{ class = "WARLOCK", level = 100, }, --7.1.5r
	["Abalo Anímico"] = 		{ class = "WARLOCK", level = 100, }, --7.1.5n
	["Círculo de Conjuração"] = { class = "WARLOCK", level = 100, }, --7n

--++ Warrior Abilities ++
	["Atacar"] = 				{ class = "WARRIOR", level = 1, }, --7m
--	["Bloqueio"] = 				{ class = "WARRIOR", level = 1, }, --7 Conflict
--	["Aparar"] = 				{ class = "WARRIOR", level = 1, }, --7 Conflict
	["Investida"] = 			{ class = "WARRIOR", level = 3, },
	["Provocar"] = 				{ class = "WARRIOR", level = 14, },
	["Arremesso Heroico"] = 	{ class = "WARRIOR", level = 22, },
	["Murro"] = 				{ class = "WARRIOR", level = 24, },
	["Salto Heroico"] = 		{ class = "WARRIOR", level = 26, },	
	["Feridas Profundas"] = 	{ class = "WARRIOR", level = 32, }, --x Moved
--++ Warrior Artifact Traits ++
	["Fúria de Neltharion"] = 	{ class = "WARRIOR", level = 100, }, --7n
	["Fúria de Odyn"] = 		{ class = "WARRIOR", level = 100, }, --7n
	["Senhora da Guerra"] = 	{ class = "WARRIOR", level = 100, }, --7n
--++ Warrior Specialization ++
	--++ Arms/Fury/Protection ++
	["Raiva Concentrada"] = 	{ class = "WARRIOR", level = 12, }, --7.1.5m
	["Raiva Incontrolada"] = 	{ class = "WARRIOR", level = 40, }, --7m
	["Grito de Batalha"] = 		{ class = "WARRIOR", level = 60, },	--7n	
	--++ Arms/Fury ++
	["Executar"] = 				{ class = "WARRIOR", level = 8, }, --7m
	["Redemoinho"] = 			{ class = "WARRIOR", level = 28, },		
	["Brado Intimidador"] = 	{ class = "WARRIOR", level = 70, }, --7m
	["Brado de Comando"] = 		{ class = "WARRIOR", level = 83, }, --7m	
	--++ Arms/Protection ++	
	["Ímpeto da Vitória"] = 	{ class = "WARRIOR", level = 10, }, --7m
	--++ Arms ++	
	["Batida"] = 				{ class = "WARRIOR", level = 1, },
	["Golpe Mortal"] = 			{ class = "WARRIOR", level = 5, },	
--	["Veterano de Guerra"] = 	{ class = "WARRIOR", level = 10, }, --removed
	["Golpe Colossal"] = 		{ class = "WARRIOR", level = 18, }, --x Moved
	["Estrategista"] = 			{ class = "WARRIOR", level = 18, }, --7n
	["Cutilada"] = 				{ class = "WARRIOR", level = 32, }, --7m	
	["Cortar Tendão"] = 		{ class = "WARRIOR", level = 35, }, --7m
	["Morte pela Espada"] = 	{ class = "WARRIOR", level = 50, },
	["Tornado de Aço"] = 		{ class = "WARRIOR", level = 75, },	--7m ??
	["Poder Colossal"] = 		{ class = "WARRIOR", level = 78, },	--7n	
	--++ Fury ++
	["Sede de Sangue"] = 		{ class = "WARRIOR", level = 10, },
	["Enfurecer"] = 			{ class = "WARRIOR", level = 10, }, --x Moved
	["Corte Furioso"] = 		{ class = "WARRIOR", level = 10, }, --7n		
	["Punhos de Titã"] = 		{ class = "WARRIOR", level = 10, }, 	
	["Regeneração Enfurecida"] = { class = "WARRIOR", level = 12, }, --7m
	["Golpe Furioso"] = 		{ class = "WARRIOR", level = 13, },
	["Alvoroço"] = 				{ class = "WARRIOR", level = 18, },	 --7n	
	["Uivo Perfurante"] = 		{ class = "WARRIOR", level = 26, }, --7m
	["Fúria Obcecada"] = 		{ class = "WARRIOR", level = 38, }, 
	["Cutelo de Carne"] = 		{ class = "WARRIOR", level = 58, }, 
	["Fúria Desagrilhoada"] = 	{ class = "WARRIOR", level = 78, },
	--++ Protection ++  
	["Postura de Defesa"] = 	{ class = "WARRIOR", level = 9, }, --7m	
--	["Determinação"] = 			{ class = "WARRIOR", level = 10, }, --x Conflict with Druid/Monk
	["Escudada"] = 				{ class = "WARRIOR", level = 10, },
	["Sentinela Resoluta"] = 	{ class = "WARRIOR", level = 10, },
	["Devastar"] = 				{ class = "WARRIOR", level = 12, },
	["Trovoada"] = 				{ class = "WARRIOR", level = 16, }, --x Moved	
	["Levantar Escudo"] = 		{ class = "WARRIOR", level = 18, },
	["Revanche"] = 				{ class = "WARRIOR", level = 28, },
	["Ignorar Dor"] = 			{ class = "WARRIOR", level = 34, }, --7n
	["Último Recurso"] = 		{ class = "WARRIOR", level = 36, },
	["Muralha de Escudos"] = 	{ class = "WARRIOR", level = 48, }, --x Moved
	["Brado Desmoralizador"] = 	{ class = "WARRIOR", level = 50, },
	["Bastião da Defesa"] = 	{ class = "WARRIOR", level = 60, },
	["Reflexão de Feitiço"] = 	{ class = "WARRIOR", level = 65, }, --7m
	["Interceptar"] = 			{ class = "WARRIOR", level = 72, }, --7n	
--	["Ripostar"] = 				{ class = "WARRIOR", level = 76, }, --7 Conflict	
	["Bloqueio Crítico"] = 		{ class = "WARRIOR", level = 78, },
--++ Warrior Talents ++
	--++ Arms/Fury/Protection ++	
	["Onda de Choque"] = 		{ class = "WARRIOR", level = 15, }, --7m??	
	["Seta Tempestuosa"] = 		{ class = "WARRIOR", level = 15, }, --7??
	["Passos Amplos"] = 		{ class = "WARRIOR", level = 60, }, --7n
	--++ Arms/Fury ++	
	["Dose Dupla"] = 			{ class = "WARRIOR", level = 15, },
	--++ Arms/Protection ++	
	["Controle de Raiva"] = 	{ class = "WARRIOR", level = 100, }, --x
	["Assolador"] = 			{ class = "WARRIOR", level = 100, }, --x
	--++ Arms ++	
	["Inabalável"] = 			{ class = "WARRIOR", level = 15, }, --7n
	["Subjugar"] = 				{ class = "WARRIOR", level = 15, }, --7m
	["Golpes a Esmo"] = 		{ class = "WARRIOR", level = 60, },	--7m
	["Dilacerar"] =				{ class = "WARRIOR", level = 45, }, --7m
	["Avatar"] = 				{ class = "WARRIOR", level = 45, },
	["Trauma"] = 				{ class = "WARRIOR", level = 45, }, --7.2.5m
	["Fôlego Renovado"] = 		{ class = "WARRIOR", level = 60, },
	["Fervor da Batalha"] = 	{ class = "WARRIOR", level = 75, }, --7.2.5m	
	["Combo Mortal"] = 			{ class = "WARRIOR", level = 75, }, --7n
	["Poder Titânico"] = 		{ class = "WARRIOR", level = 75, }, --7.2.5m
	["Fleuma Letal"] = 			{ class = "WARRIOR", level = 90, }, --7n ??
	["Fleuma Letal"] = 			{ class = "WARRIOR", level = 90, }, --7.2.5m ??
	["Entrar Para Matar"] = 	{ class = "WARRIOR", level = 90, }, --7.2.5m	
	["Golpes de Oportunidade"] = { class = "WARRIOR", level = 100, }, --7n??
	--++ Fury ++
	["Máquina de Guerra"] = 	{ class = "WARRIOR", level = 15, }, --7n	
	["Raiva Infinita"] = 		{ class = "WARRIOR", level = 15, }, --7n	
	["Carne Fresca"] = 			{ class = "WARRIOR", level = 15, }, --7n
	["Bola de Demolição"] = 	{ class = "WARRIOR", level = 45, }, --7n
	["Estouro"] = 				{ class = "WARRIOR", level = 45, }, --7n
	["Carga Furiosa"] = 		{ class = "WARRIOR", level = 60, }, --7n
	["Pintura de Guerra"] = 	{ class = "WARRIOR", level = 60, }, --7n
	["Massacre"] = 				{ class = "WARRIOR", level = 75, }, --7n++
	["Berserker Espumante"] =	{ class = "WARRIOR", level = 75, }, --7n
	["Chacina"] = 				{ class = "WARRIOR", level = 75, }, --7n
	["Banho de Sangue"] = 		{ class = "WARRIOR", level = 90, },
	["Frenesi"] = 				{ class = "WARRIOR", level = 90, }, --7n
	["Raiva Interior"] = 		{ class = "WARRIOR", level = 90, }, --7n
	["Desenvoltura Arrojada"] = { class = "WARRIOR", level = 100, }, --7n
	["Rugido do Dragão"] = 		{ class = "WARRIOR", level = 100, }, 
	--++ Protection ++
	["Armipotente"] = 			{ class = "WARRIOR", level = 15, }, 	
	["Vitória Iminente"] = 		{ class = "WARRIOR", level = 30, },	
	["Presença Inspiradora"] = 	{ class = "WARRIOR", level = 30, }, --x
	["Salvaguarda"] = 			{ class = "WARRIOR", level = 30, },
	["Um Prato que se Come Frio"] = { class = "WARRIOR", level = 45, }, --7.1.5m	
	["Fúria Renovada"] = 		{ class = "WARRIOR", level = 45, }, --7n	
--	["Ultimato"] = 				{ class = "WARRIOR", level = 45, }, --7.1.5r	
	["Desafio do Senhor da Guerra"] = 	{ class = "WARRIOR", level = 60, }, --7n
	["Trovão Crepitante"] = 	{ class = "WARRIOR", level = 60, }, --7n
	["Devastador"] = 			{ class = "WARRIOR", level = 75, }, --7.1.5n
	["Indomável"] = 			{ class = "WARRIOR", level = 75, }, --7n
	["Vingança"] = 				{ class = "WARRIOR", level = 10, }, --7m
	["Ao Combate"] = 			{ class = "WARRIOR", level = 90, }, --7n
	["Voz Estrondosa"] = 		{ class = "WARRIOR", level = 90, }, --7n
	["Repercussões Violentas"] = { class = "WARRIOR", level = 100, }, --x
--++ Warrior PvP Talents ++
	["Desarmar"] = 				{ class = "WARRIOR", level = 100, }, --7.1.5n
	["Duelo"] = 				{ class = "WARRIOR", level = 100, }, --7.1.5n
	["Interceptar"] = 			{ class = "WARRIOR", level = 100, }, --7n
	["Afiar Lâmina"] = 			{ class = "WARRIOR", level = 100, }, --7n
	["Trombada com Escudo"] = 	{ class = "WARRIOR", level = 100, }, --7n
	["Desejo de Matar"] = 		{ class = "WARRIOR", level = 100, }, --7n
	["Investida do Dragão"] = 	{ class = "WARRIOR", level = 100, }, --7n
	["Guarda-costas"] = 		{ class = "WARRIOR", level = 100, }, --7n
	["Reflexão de Feitiço em Massa"] = { class = "WARRIOR", level = 100, }, --7n
	["Reflexão de Feitiço"] = 	{ class = "WARRIOR", level = 100, }, --7n
	["Estandarte de Guerra"] = 	{ class = "WARRIOR", level = 100, }, --7.1.5n	
};
