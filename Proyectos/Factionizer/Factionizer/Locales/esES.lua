-- Español (Spanish & Latin American esMX)	
----------------------------------------------------
if (GetLocale() == "esES" or GetLocale() == "esMX") then	
	
-- Binding names	
BINDING_HEADER_FACTIONIZER	= "Factionizer"
BINDING_NAME_SHOWCONFIG	= "Mostrar ventana de opciones"
BINDING_NAME_SHOWDETAILS	= "Mostrar ventana de detalles de reputación"
	
FIZ_TXT	= {}
FIZ_TXT.Mob = {}
-- help	
FIZ_TXT.help	= "Una herramienta para gestionar tu reputación"
FIZ_TXT.command	= "Comando no reconocido"
FIZ_TXT.usage	= "Uso"
FIZ_TXT.helphelp	= "Mostrar este texto de ayuda"
FIZ_TXT.helpabout	= "Mostrar información sobre el autor"
FIZ_TXT.helpstatus	= "Mostrar estado de la configuración"
-- about	
FIZ_TXT.by	= "por"
FIZ_TXT.version	= "Versión"
FIZ_TXT.date	= "Fecha"
FIZ_TXT.web	= "Sitio web"
FIZ_TXT.slash	= "Comando de barra"
FIZ_TXT_STAND_LV	= {}
FIZ_TXT_STAND_LV[0]	= "Desconocido"
FIZ_TXT_STAND_LV[1]	= "Odiado"
FIZ_TXT_STAND_LV[2]	= "Hostil"
FIZ_TXT_STAND_LV[3]	= "Adverso"
FIZ_TXT_STAND_LV[4]	= "Neutral"
FIZ_TXT_STAND_LV[5]	= "Amistoso"
FIZ_TXT_STAND_LV[6]	= "Honrado"
FIZ_TXT_STAND_LV[7]	= "Venerado"
FIZ_TXT_STAND_LV[8]	= "Exaltado"
-- status	
FIZ_TXT.status	= "Estado"
FIZ_TXT.disabled	= "desactivado"
FIZ_TXT.enabled	= "activado"
FIZ_TXT.statMobs	= "Mostrar Monstruos [M]"
FIZ_TXT.statQuests	= "Mostrar Misiones [Q]"
FIZ_TXT.statInstances	= "Mostrar Mazmorras [D]"
FIZ_TXT.statItems	= "Mostrar Objetos [I]"
FIZ_TXT.statGeneral	= "Mostrar General [G]"
FIZ_TXT.statMissing	= "Mostrar reputación faltante"
FIZ_TXT.statDetails	= "Mostrar ventana de detalles extendida"
FIZ_TXT.statChat	= "Mensaje de chat detallado"
FIZ_TXT.statNoGuildChat	= "Sin chat para reputación de hermandad"
FIZ_TXT.statSuppress	= "Ocultar mensaje de chat original"
FIZ_TXT.statPreview	= "Mostrar barra previa en ventana de reputación"
FIZ_TXT.statSwitch	= "Cambiar automáticamente a la última reputación ganada"
FIZ_TXT.statNoGuildSwitch	= "Sin cambio automático para hermandad"
FIZ_TXT.statSilentSwitch	= "Cambiar barra silenciosamente (sin chat)"
FIZ_TXT.statGuildCap	= "Mostrar límite de reputación de hermandad en el chat"
-- XML UI elements	
FIZ_TXT.showQuests	= "Misiones"
FIZ_TXT.showInstances	= "Mazmorras"
FIZ_TXT.showMobs	= "Monstruos"
FIZ_TXT.showItems	= "Objetos"
FIZ_TXT.showGeneral	= "Información general"
FIZ_TXT.showAll	= "Mostrar todo"
FIZ_TXT.showNone	= "Ninguno"
FIZ_TXT.expand	= "Expandir"
FIZ_TXT.collapse	= "Contraer"
FIZ_TXT.supressNoneFaction	= "Restaurar ocultos (facción)"
FIZ_TXT.supressNoneGlobal	= "Restaurar ocultos (todas)"
FIZ_TXT.suppressHint	= "Clic derecho en una misión para ocultarla del resumen"
FIZ_TXT.clearSessionGain	= "Reiniciar contador de sesión"
-- options dialog	
FIZ_TXT.showMissing	= "Mostrar reputación faltante en la lista principal"
FIZ_TXT.extendDetails	= "Mostrar ventana de detalles extendida"
FIZ_TXT.gainToChat	= "Mostrar mensajes detallados de ganancia en el chat"
FIZ_TXT.noGuildGain	= "Ocultar mensajes de reputación de hermandad"
FIZ_TXT.suppressOriginalGain	= "Ocultar mensajes originales del juego al ganar reputación"
FIZ_TXT.showPreviewRep	= "Mostrar reputación entregable como barra previa"
FIZ_TXT.switchFactionBar	= "Cambiar barra de reputación a la última ganada"
FIZ_TXT.noGuildSwitch	= "No cambiar barra de reputación por ganancias de hermandad"
FIZ_TXT.silentSwitch	= "Sin mensaje en chat al cambiar barra"
FIZ_TXT.guildCap	= "Mostrar límite de reputación de hermandad en el chat"
FIZ_TXT.defaultChatFrame	= "Usando ventana de chat por defecto"
FIZ_TXT.chatFrame	= "Usando ventana de chat %d (%s)"
FIZ_TXT.usingDefaultChatFrame	= "Ahora usando ventana de chat por defecto"
FIZ_TXT.usingChatFrame	= "Ahora usando ventana de chat"
-- various LUA	
FIZ_TXT.options	= "Opciones"
FIZ_TXT.orderByStanding	= "Ordenar por rango"
FIZ_TXT.lookup	= "Buscando facción "
FIZ_TXT.allFactions	= "Listando todas las facciones"
FIZ_TXT.missing	= "(para subir)"
FIZ_TXT.missing2	= "Faltante"
FIZ_TXT.heroic	= "Heroico"
FIZ_TXT.normal	= "Normal"
FIZ_TXT.switchBar	= "Cambiando barra de reputación a"
-- FIZ_ShowFactions	
FIZ_TXT.faction	= "Facción"
FIZ_TXT.is	= "es"
FIZ_TXT.withStanding	= "con rango"
FIZ_TXT.needed	= "necesarios"
FIZ_TXT.mob	= "[Monstruo]"
FIZ_TXT.limited	= "está limitado a"
FIZ_TXT.limitedPl	= "están limitados a"
FIZ_TXT.quest	= "[Misión]"
FIZ_TXT.instance	= "[Mazmorra]"
FIZ_TXT.items	= "[Objetos]"
FIZ_TXT.unknown	= "es desconocida para el jugador"
-- mob Details	
FIZ_TXT.tmob	= "Monstruos comunes (Basura)"
FIZ_TXT.oboss	= "Otros jefes"
FIZ_TXT.aboss	= "Todos los jefes"
FIZ_TXT.pboss	= "Por jefe"
FIZ_TXT.fclear	= "Limpieza completa"
FIZ_TXT.AU	= "Monstruos sin nombre"
FIZ_TXT.AN	= "Monstruos con nombre"
FIZ_TXT.BB	= "Bucanero Vela Sangrienta"
FIZ_TXT.SSP	= "Pirata de los Mares del Sur"
FIZ_TXT.Wa	= "Verópolis"
FIZ_TXT.VCm	= "Cualquier miembro de Ventura & Cía."
FIZ_TXT.Mob.MoshOgg_Spellcrafter = "Creaconjuros Mosh'Ogg"
FIZ_TXT.Mob.BoulderfistOgre = "Ogro Puño de Roca"
-- Quest Details	
FIZ_TXT.cdq	= "Misiones diarias de cocina de capitales"
FIZ_TXT.coq	= "Otras misiones diarias de cocina"
FIZ_TXT.fdq	= "Misiones diarias de pesca de capitales"
FIZ_TXT.foq	= "Otras misiones diarias de pesca"
FIZ_TXT.ndq	= "sin misiones diarias"
FIZ_TXT.deleted	= "Obsoleto"
FIZ_TXT.Championing	= "Defendiendo (Tabardo)"
FIZ_TXT.bpqfg	= "Por porcentaje de ganancia de la misión"
	
-- items Details	
FIZ_TXT.cbadge	= "Distintivo de mención de otras ciudades"
-- instance Details	
FIZ_TXT.srfd	= "Ganancia secundaria por mazmorras"
FIZ_TXT.tbd	= "Pendiente"
FIZ_TXT.nci	= "Mazmorras de Cataclysm (Normal)"
FIZ_TXT.hci	= "Mazmorras de Cataclysm (Heroico)"
-- ToBeDone general	
FIZ_TXT.tfr	= "Reputación de huerto (Los Labradores)"
FIZ_TXT.nswts	= "Fecha de inicio indeterminada"
FIZ_TXT.mnd	= "Número máximo de misiones diarias"
FIZ_TXT.mnds	= "El número máximo de diarias es"
	
-- ReputationDetails	
FIZ_TXT.currentRep	= "Reputación actual"
FIZ_TXT.neededRep	= "Reputación necesaria"
FIZ_TXT.missingRep	= "Reputación faltante"
FIZ_TXT.repInBag	= "Reputación en bolsas"
FIZ_TXT.repInBagBank	= "En bolsas y banco"
FIZ_TXT.repInQuest	= "En misiones activas"
FIZ_TXT.factionGained	= "Ganada esta sesión"
FIZ_TXT.noInfo	= "No hay información disponible para esta facción o reputación."
FIZ_TXT.toExalted	= "Para llegar a Exaltado"
-- to chat	
FIZ_TXT.stats	= " (Total: %s%d, Faltan: %d)"
-- config changed	
FIZ_TXT.configQuestion	= "Se han modificado ajustes de Factionizer. ¿Deseas revisar las opciones ahora?"
FIZ_TXT.showConfig	= "Ver opciones"
FIZ_TXT.later	= "Más tarde"
-- UpdateList	
FIZ_TXT.mobShort	= "[M]"
FIZ_TXT.questShort	= "[Q]"
FIZ_TXT.instanceShort	= "[D]"
FIZ_TXT.itemsShort	= "[I]"
FIZ_TXT.generalShort	= "[G]"
FIZ_TXT.mobHead	= "Ganar reputación eliminando a este enemigo"
FIZ_TXT.questHead	= "Ganar reputación completando esta misión"
FIZ_TXT.instanceHead	= "Ganar reputación completando esta mazmorra"
FIZ_TXT.itemsHead	= "Ganar reputación entregando objetos"
FIZ_TXT.generalHead	= "Información general sobre cómo ganar reputación"
FIZ_TXT.mobTip	= "Cada vez que eliminas a este enemigo ganas reputación hasta el límite indicado."
FIZ_TXT.questTip	= "Cada vez que completas esta misión diaria o repetible ganas la reputación indicada."
FIZ_TXT.instanceTip	= "Cada vez que completas esta mazmorra o banda ganas la reputación indicada."
FIZ_TXT.itemsName	= "Entrega de objetos"
FIZ_TXT.itemsTip	= "Cada vez que entregas los objetos requeridos ganas reputación."
FIZ_TXT.generalTip	= "Información adicional de progreso o métodos alternativos para esta facción."
FIZ_TXT.allOfTheAbove	= "Resumen de las %d misiones listadas"
FIZ_TXT.questSummaryHead	= FIZ_TXT.allOfTheAbove
FIZ_TXT.questSummaryTip	= "Muestra el resumen de todas las misiones listadas arriba.\r\nSi son misiones diarias, esto te muestra cuántos días exactos tardarás en subir de rango completándolas todas cada día."
FIZ_TXT.complete	= "completa"
FIZ_TXT.active	= "activa"
FIZ_TXT.inBag	= "En bolsas"
FIZ_TXT.turnIns	= "Entregas:"
FIZ_TXT.reputation	= "Reputación:"
FIZ_TXT.reputationCap	= "Límite de reputación:"
FIZ_TXT.reputationCapCurrent	= "Reputación actual:"
FIZ_TXT.inBagBank	= "En bolsas y banco"
FIZ_TXT.questCompleted	= "Misión completada"
FIZ_TXT.timesToDo	= "Veces a realizar:"
FIZ_TXT.instance2	= "Mazmorra:"
FIZ_TXT.mode	= "Dificultad:"
FIZ_TXT.timesToRun	= "Veces a completar:"
FIZ_TXT.mob2	= "Enemigo:"
FIZ_TXT.location	= "Ubicación:"
FIZ_TXT.toDo	= "A realizar:"
FIZ_TXT.quest2	= "Misión:"
FIZ_TXT.itemsRequired	= "Objetos requeridos"
FIZ_TXT.general2	= "General:"
FIZ_TXT.maxStanding	= "Otorga reputación hasta"
-- skills	
FIZ_TXT.skillHerb	= "Herboristería"
FIZ_TXT.skillMine	= "Minería"
FIZ_TXT.skillSkin	= "Desuello"
FIZ_TXT.skillAlch	= "Alquimia"
FIZ_TXT.skillBlack	= "Herrería"
FIZ_TXT.skillEnch	= "Encantamiento"
FIZ_TXT.skillEngi	= "Ingeniería"
FIZ_TXT.skillIncrip	= "Inscripción"
FIZ_TXT.skillJewel	= "Joyería"
FIZ_TXT.skillLeath	= "Peletería"
FIZ_TXT.skillTail	= "Sastrería"
FIZ_TXT.skillAid	= "Primeros auxilios"
FIZ_TXT.skillArch	= "Arqueología"
FIZ_TXT.skillCook	= "Cocina"
FIZ_TXT.skillFish	= "Pesca"
-- Tooltip	
FIZ_TXT.elements	= {}
FIZ_TXT.elements.name	= {}
FIZ_TXT.elements.tip	= {}
	
FIZ_TXT.elements.name.FIZ_OptionsButton	= FIZ_TXT.options
FIZ_TXT.elements.tip.FIZ_OptionsButton	= "Abra una ventana para configurar Factionizer."
FIZ_TXT.elements.name.FIZ_OrderByStandingCheckBox	= FIZ_TXT.orderByStanding
FIZ_TXT.elements.tip.FIZ_OrderByStandingCheckBox	= "Si esta casilla no está marcada, la lista facción se muestra mediante una clasificación por defecto (ventisca), agrupados por orden lógico y alfabético. \r\n\r\n Si se marca esta casilla, la lista se ordena por la facción de pie. \r\n\r\n Para ver los | cFFFAA0A0inactive |r facciones , desactive esta casilla y vaya a la parte inferior de la lista."
	
FIZ_TXT.elements.name.FIZ_ShowMobsButton	= FIZ_TXT.showMobs
FIZ_TXT.elements.tip.FIZ_ShowMobsButton	= "Marque este botón para ver las turbas se puede matar a mejorar su reputación."
FIZ_TXT.elements.name.FIZ_ShowQuestButton	= FIZ_TXT.showQuests
FIZ_TXT.elements.tip.FIZ_ShowQuestButton	= "Marque este botón para ver las misiones que puede hacer para mejorar su reputación."
FIZ_TXT.elements.name.FIZ_ShowItemsButton	= FIZ_TXT.showItems
FIZ_TXT.elements.tip.FIZ_ShowItemsButton	= "Marque este botón para ver los elementos que puede entregar a mejorar su reputación."
FIZ_TXT.elements.name.FIZ_ShowInstancesButton	= FIZ_TXT.showInstances
FIZ_TXT.elements.tip.FIZ_ShowInstancesButton	= "Marque este botón para ver las instancias que puede ejecutar para mejorar su reputación."
FIZ_TXT.elements.name.FIZ_ShowGeneralButton	= FIZ_TXT.showGeneral
FIZ_TXT.elements.tip.FIZ_ShowGeneralButton	= "Marque este botón para ver la información general sobre la mejora de su reputación."
	
FIZ_TXT.elements.name.FIZ_ShowAllButton	= FIZ_TXT.showAll
FIZ_TXT.elements.tip.FIZ_ShowAllButton	= "Pulse este botón para comprobar las cuatro casillas de la izquierda. \r\nEsto mostrará mobs, misiones, objetos e instancias que le dan fama de la facción seleccionada."
FIZ_TXT.elements.name.FIZ_ShowNoneButton	= FIZ_TXT.showNone
FIZ_TXT.elements.tip.FIZ_ShowNoneButton	= "Pulse este botón para anular la selección de las cuatro casillas de la izquierda. \r\nDesde aquí puedes ver ninguna de las maneras de ganar reputación de la facción seleccionada."
	
FIZ_TXT.elements.name.FIZ_ExpandButton	= FIZ_TXT.expand
FIZ_TXT.elements.tip.FIZ_ExpandButton	= "Pulse este botón para expandir todas las entradas de la lista. Esto le mostrará los materiales necesarios para la mano en los quests recolección de elementos."
FIZ_TXT.elements.name.FIZ_CollapseButton	= FIZ_TXT.collapse
FIZ_TXT.elements.tip.FIZ_CollapseButton	= "Pulse este botón para cerrar todas las entradas de la lista. Esto ocultará los materiales necesarios a la mano en la recolección de búsquedas."
FIZ_TXT.elements.name.FIZ_SupressNoneFactionButton	= FIZ_TXT.supressNoneFaction
FIZ_TXT.elements.tip.FIZ_SupressNoneFactionButton	= "Pulse este botón para volver a activar todas las misiones de esta facción que ha excluido por righ-clic sobre él."
FIZ_TXT.elements.name.FIZ_SupressNoneGlobalButton	= FIZ_TXT.supressNoneGlobal
FIZ_TXT.elements.tip.FIZ_SupressNoneGlobalButton	= "Pulse este botón para volver a activar todas las misiones de todas las facciones que se han excluido, haga clic en él."
FIZ_TXT.elements.name.FIZ_ClearSessionGainButton	= FIZ_TXT.clearSessionGain
FIZ_TXT.elements.tip.FIZ_ClearSessionGainButton	= "Pulse este botón para borrar a cero el contador de la reputación adquirida en esta sesión."
	
FIZ_TXT.elements.name.FIZ_EnableMissingBox	= FIZ_TXT.showMissing
FIZ_TXT.elements.tip.FIZ_EnableMissingBox	= "Active esta opción para agregar los puntos de reputación faltantes necesarias para el próximo nivel de reputación detrás de la posición actual de cada facción en el marco de reputación."
FIZ_TXT.elements.name.FIZ_ExtendDetailsBox	= FIZ_TXT.extendDetails
FIZ_TXT.elements.tip.FIZ_ExtendDetailsBox	= "Active esta opción para mostrar un cuadro detalle reputación extendida. \r\nEn Además, la información que se muestra en el cuadro detalle original, esto mostrará la reputación faltante necesaria para alcanzar el siguiente nivel de reputación y una lista de maneras de ganar esta reputación mediante anuncio quests , las multitudes, los elementos e instancias que producen reputación de la facción elegida."
FIZ_TXT.elements.name.FIZ_GainToChatBox	= FIZ_TXT.gainToChat
FIZ_TXT.elements.tip.FIZ_GainToChatBox	= "Activez ce paramètre pour afficher réputation acquise pour toutes les factions chaque fois que vous gagnez réputation. \r\nCela diffère de la manière standard de reporting gain de réputation, car normalement, seul le gain avec la faction principale est répertorié."
FIZ_TXT.elements.name.FIZ_NoGuildGainBox	= FIZ_TXT.noGuildGain
FIZ_TXT.elements.tip.FIZ_NoGuildGainBox	= "Active este ajuste si no desea imprimir mensajes de chat reputación gremio."
FIZ_TXT.elements.name.FIZ_SupressOriginalGainBox	= FIZ_TXT.suppressOriginalGain
FIZ_TXT.elements.tip.FIZ_SupressOriginalGainBox	= "Active esta opción para suprimir los mensajes de ganar reputación estándar. \r\nEsto tiene sentido si se ha habilitado los mensajes ganancia facción detallados, por lo que no consigue listados idénticos a las versiones estándar y extendida."
FIZ_TXT.elements.name.FIZ_ShowPreviewRepBox	= FIZ_TXT.showPreviewRep
FIZ_TXT.elements.tip.FIZ_ShowPreviewRepBox	= "Active esta opción para mostrar la reputación se puede obtener mediante la presentación de artículos y Misiones como una barra gris superpuesto sobre la barra normal de reputación en el marco de reputación."
FIZ_TXT.elements.name.FIZ_SwitchFactionBarBox	= FIZ_TXT.switchFactionBar
FIZ_TXT.elements.tip.FIZ_SwitchFactionBarBox	= "Active esta opción para cambiar automáticamente la facción que se observaba a la facción último a quien le han ganado la reputación de."
FIZ_TXT.elements.name.FIZ_NoGuildSwitchBox	= FIZ_TXT.noGuildSwitch
FIZ_TXT.elements.tip.FIZ_NoGuildSwitchBox	= "Active esta opción para no cambiar la facción observó por ganancias de reputación del clan."
FIZ_TXT.elements.name.FIZ_SilentSwitchBox	= FIZ_TXT.silentSwitch
FIZ_TXT.elements.tip.FIZ_SilentSwitchBox	= "Active esta opción para cambiar la barra de reputación silenciosamente (sin mensaje de chat)."
FIZ_TXT.elements.name.FIZ_GuildCapBox	= FIZ_TXT.guildCap
FIZ_TXT.elements.name.FIZ_ChatFrameSlider	= "chatear marco"
FIZ_TXT.elements.tip.FIZ_ChatFrameSlider	= "Seleccione la charla marco Factionizer imprime sus mensajes"
	
FIZ_TXT.elements.name.FIZ_OptionEnableMissing	= FIZ_TXT.elements.name.FIZ_EnableMissingBox
FIZ_TXT.elements.tip.FIZ_OptionEnableMissing	= FIZ_TXT.elements.tip.FIZ_EnableMissingBox
FIZ_TXT.elements.name.FIZ_OptionEnableMissingCB	= FIZ_TXT.elements.name.FIZ_EnableMissingBox
FIZ_TXT.elements.tip.FIZ_OptionEnableMissingCB	= FIZ_TXT.elements.tip.FIZ_EnableMissingBox
FIZ_TXT.elements.name.FIZ_OptionExtendDetails	= FIZ_TXT.elements.name.FIZ_ExtendDetailsBox
FIZ_TXT.elements.tip.FIZ_OptionExtendDetails	= FIZ_TXT.elements.tip.FIZ_ExtendDetailsBox
FIZ_TXT.elements.name.FIZ_OptionExtendDetailsCB	= FIZ_TXT.elements.name.FIZ_ExtendDetailsBox
FIZ_TXT.elements.tip.FIZ_OptionExtendDetailsCB	= FIZ_TXT.elements.tip.FIZ_ExtendDetailsBox
FIZ_TXT.elements.name.FIZ_OptionGainToChat	= FIZ_TXT.elements.name.FIZ_GainToChatBox
FIZ_TXT.elements.tip.FIZ_OptionGainToChat	= FIZ_TXT.elements.tip.FIZ_GainToChatBox
FIZ_TXT.elements.name.FIZ_OptionGainToChatCB	= FIZ_TXT.elements.name.FIZ_GainToChatBox
FIZ_TXT.elements.tip.FIZ_OptionGainToChatCB	= FIZ_TXT.elements.tip.FIZ_GainToChatBox
FIZ_TXT.elements.name.FIZ_OptionNoGuildGain	= FIZ_TXT.elements.name.FIZ_NoGuildGainBox
FIZ_TXT.elements.tip.FIZ_OptionNoGuildGain	= FIZ_TXT.elements.tip.FIZ_NoGuildGainBox
FIZ_TXT.elements.name.FIZ_OptionNoGuildGainCB	= FIZ_TXT.elements.name.FIZ_NoGuildGainBox
FIZ_TXT.elements.tip.FIZ_OptionNoGuildGainCB	= FIZ_TXT.elements.tip.FIZ_NoGuildGainBox
FIZ_TXT.elements.name.FIZ_OptionSupressOriginalGain	= FIZ_TXT.elements.name.FIZ_SupressOriginalGainBox
FIZ_TXT.elements.tip.FIZ_OptionSupressOriginalGain	= FIZ_TXT.elements.tip.FIZ_SupressOriginalGainBox
FIZ_TXT.elements.name.FIZ_OptionSupressOriginalGainCB	= FIZ_TXT.elements.name.FIZ_SupressOriginalGainBox
FIZ_TXT.elements.tip.FIZ_OptionSupressOriginalGainCB	= FIZ_TXT.elements.tip.FIZ_SupressOriginalGainBox
FIZ_TXT.elements.name.FIZ_OptionShowPreviewRep	= FIZ_TXT.elements.name.FIZ_ShowPreviewRepBox
FIZ_TXT.elements.tip.FIZ_OptionShowPreviewRep	= FIZ_TXT.elements.tip.FIZ_ShowPreviewRepBox
FIZ_TXT.elements.name.FIZ_OptionShowPreviewRepCB	= FIZ_TXT.elements.name.FIZ_ShowPreviewRepBox
FIZ_TXT.elements.tip.FIZ_OptionShowPreviewRepCB	= FIZ_TXT.elements.tip.FIZ_ShowPreviewRepBox
FIZ_TXT.elements.name.FIZ_OptionSwitchFactionBar	= FIZ_TXT.elements.name.FIZ_SwitchFactionBarBox
FIZ_TXT.elements.tip.FIZ_OptionSwitchFactionBar	= FIZ_TXT.elements.tip.FIZ_SwitchFactionBarBox
FIZ_TXT.elements.name.FIZ_OptionSwitchFactionBarCB	= FIZ_TXT.elements.name.FIZ_SwitchFactionBarBox
FIZ_TXT.elements.tip.FIZ_OptionSwitchFactionBarCB	= FIZ_TXT.elements.tip.FIZ_SwitchFactionBarBox
FIZ_TXT.elements.name.FIZ_OptionNoGuildSwitch	= FIZ_TXT.elements.name.FIZ_NoGuildSwitchBox
FIZ_TXT.elements.tip.FIZ_OptionNoGuildSwitch	= FIZ_TXT.elements.tip.FIZ_NoGuildSwitchBox
FIZ_TXT.elements.name.FIZ_OptionNoGuildSwitchCB	= FIZ_TXT.elements.name.FIZ_NoGuildSwitchBox
FIZ_TXT.elements.tip.FIZ_OptionNoGuildSwitchCB	= FIZ_TXT.elements.tip.FIZ_NoGuildSwitchBox
FIZ_TXT.elements.name.FIZ_OptionSilentSwitch	= FIZ_TXT.elements.name.FIZ_SilentSwitchBox
FIZ_TXT.elements.tip.FIZ_OptionSilentSwitch	= FIZ_TXT.elements.tip.FIZ_SilentSwitchBox
FIZ_TXT.elements.name.FIZ_OptionSilentSwitchCB	= FIZ_TXT.elements.name.FIZ_SilentSwitchBox
FIZ_TXT.elements.tip.FIZ_OptionSilentSwitchCB	= FIZ_TXT.elements.tip.FIZ_SilentSwitchBox
FIZ_TXT.elements.name.FIZ_OptionGuildCap	= FIZ_TXT.elements.name.FIZ_GuildCapBox
FIZ_TXT.elements.tip.FIZ_OptionGuildCap	= FIZ_TXT.elements.tip.FIZ_GuildCapBox
FIZ_TXT.elements.name.FIZ_OptionGuildCapCB	= FIZ_TXT.elements.name.FIZ_GuildCapBox
FIZ_TXT.elements.tip.FIZ_OptionGuildCapCB	= FIZ_TXT.elements.tip.FIZ_GuildCapBox
FIZ_TXT.elements.name.FIZ_OptionChatFrameSlider	= FIZ_TXT.elements.name.FIZ_ChatFrameSlider
FIZ_TXT.elements.tip.FIZ_OptionChatFrameSlider	= FIZ_TXT.elements.tip.FIZ_ChatFrameSlider
end	
	
	
