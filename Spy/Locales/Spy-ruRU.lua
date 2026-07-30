local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "ptRU")
if not L then return end


--Информация аддон
L ["Spy"] = "Spy"
L ["Version"] = "Версия"
L ["LoadDescription"] = "аддон |cff9933ffSpy загрузки. Тип |cffffffff/spy|cff9933ff для вариантов".
L ["SpyEnabled"] = "|cff9933ffSpy аддон включен."
L ["SpyDisabled"] = "аддон |cff9933ffSpy отключен. Типа |cffffffff/Spy show|cff9933ff для включения".
L ["UpgradeAvailable"] = "доступна новая версия |cff9933ffA от Spy. Он может быть загружен с: \n| cffffffffhttps://mods.curse.com/addons/wow/spy"
 
--Строки конфигурации
L ["Profiles"] = "Профили"
 
L ["GeneralSettings"] = "Общие настройки"
L ["SpyDescription1"] = [[
Spy-это аддон, который предупредит вас о наличии поблизости вражеских игроков.
]]
L ["SpyDescription2"] = [[
 
|cffffd000Nearby list|cffffffff
Список отображает любые вражеских игроков, которые были обнаружены поблизости. При щелчке списка позволяет вам целевой игрок, однако это работает только вне боя. Игроки удаляются из списка, если они не были обнаружены после определенного периода времени.
 
Кнопку Очистить в строке заголовка может использоваться для очистки списка, и удерживая Очистка списка управления позволит вам быстро включить/выключить Spy.
 
|cffffd000Last стойка list|cffffffff
В последний час списке отображаются все враги, которые были обнаружены в последний час.
 
|cffffd000Ignore list|cffffffff
Игроки, которые добавляются в черный список не будет сообщаться Spy. Можно добавлять и удалять игроков из этого списка с помощью кнопки выпадающего меню или, удерживая клавишу Control при нажатии на кнопку.
 
|cffffd000Kill взгляд на list|cffffffff
Игроки на вашем списке убить на прицел вызывают тревогу звук при обнаружении. Можно добавлять и удалять игроков из этого списка с помощью кнопки выпадающего меню или удерживая нажатой клавишу Shift во время нажатия на кнопку.
 
Выпадающего меню может также использоваться для установки причины, почему вы добавили кого-то к списку убить на прицел. Если вы хотите ввести конкретной причины, которая не находится в списке, используйте "Введите ваш собственный разум..." в другом списке.


|cffffd000Автор: http://www.curse.com/users/slipjack |cffffffff
 
]]
L ["EnableSpy"] = "Включить Spy"
L ["EnableSpyDescription"] = "включает или отключает Spy, как сейчас, так и на вход".
L ["EnabledInBattlegrounds"] = "Включить Spy на поле боя"
L ["EnabledInBattlegroundsDescription"] = "Включает или отключает Spy, когда вы находитесь на поле боя".
L ["EnabledInArenas"] = "Включить Spy на аренах"
L ["EnabledInArenasDescription"] = "Включает или отключает Spy когда ты на арене."
L ["EnabledInWintergrasp"] = "Включить Spy в мире зонах боевых действий"
L ["EnabledInWintergraspDescription"] = "Включает или отключает Spy, когда вы находитесь в мире боевых зон, например озеро Ледяных оков в Нордсколе."
L ["DisableWhenPVPUnflagged"] = "Отключить Spy, когда не помечаются для PVP"
L ["DisableWhenPVPUnflaggedDescription"] = "Включает или отключает Spy в зависимости от вашего статуса PVP."
 
L ["DisplayOptions"] = "Display"
L ["DisplayOptionsDescription"] = [[
Spy может быть показан или скрыт автоматически.
]]
L ["ShowOnDetection"] = "Посмотреть Spy при обнаружении противника игроков"
L ["ShowOnDetectionDescription"] = "Установить для отображения окна Spy и список если Spy скрыт при обнаружении противника игроков."
L ["HideSpy"] = "Скрыть Spy при обнаружении противника игроков не"
L ["HideSpyDescription"] = "установить это скрыть Spy, когда отображается список, и она становится пустой. Spy не будут скрыты, если вы вручную очистить список."
L ["LockSpy"] = "Блокировать окна Spy"
L ["LockSpyDescription"] = "Блокирует Spy окно в место так, что он не двигается".
L ["InvertSpy"] = "Инвертировать окна Spy"
L ["InvertSpyDescription"] = "Отражение окна Spy вверх ногами."
L ["ResizeSpy"] = "Автоматически изменить размер окна Spy"
L ["ResizeSpyDescription"] = "Установить это, чтобы автоматически изменить размер окна Spy, как добавляются и удаляются вражеских игроков."
L ["TooltipDisplayWinLoss"] = "Отображать Статистика побед/поражений в подсказке"
L ["TooltipDisplayWinLossDescription"] = "Установить это для отображения статистики выигрыш/проигрыш игрока, в игрока в подсказке".
L ["TooltipDisplayKOSReason"] = "Убить дисплей на прицел причинам в подсказке"
L ["TooltipDisplayKOSReasonDescription"] = "Установить для отображения убить на взгляд причин игрока в подсказке игрока."
L ["TooltipDisplayLastSeen"] = "Дисплей в последний раз видели детали в подсказке"
L ["TooltipDisplayLastSeenDescription"] = "Установить для отображения последнего известно время и место игрока в подсказке игрока."
 
L ["AlertOptions"] = "Сигналы"
L ["AlertOptionsDescription"] = [[
Вы можете объявить подробности о встрече в чат канала и контролировать, как Spy предупреждает вас, когда обнаружения вражеских игроков.
]]
L ["Announce"] = "объявить:"
L ["None"] = "None"
L ["NoneDescription"] = "Не объявить при обнаружении противника игроков."
L ["Self"] = "Я"
L ["SelfDescription"] = "Объявить себя при обнаружении противника игроков."
L ["Party"] = "Партии"
L ["PartyDescription"] = "Анонс к вашей партии, при обнаружении противника игроков."
L ["Guild"] = "Гильдия"
L ["GuildDescription"] = "Объявить для вашей гильдии при обнаружении противника игроков."
L ["Raid"] = "Raid"
L ["RaidDescription"] = "Объявить raid при обнаружении противника игроков."
L ["LocalDefense"] = "Местной обороны"
L ["LocalDefenseDescription"] = "Объявление в местной обороны канал при обнаружении противника игроков."
L ["OnlyAnnounceKoS"] = "Только объявить вражеских игроков, которые убивают на прицел"
L ["OnlyAnnounceKoSDescription"] = "Установить это только объявить о вражеских игроков, которые находятся на ваших убить на взгляд списка."
L ["WarnOnStealth"] = "Предупреждать при обнаружении стелс"
L ["WarnOnStealthDescription"] = "Установить это для отображения предупреждения и звук оповещение, когда противника игрок получает стелс".
L ["WarnOnKOS"] = "Предупреждать при Kill на прицел обнаружения"
L ["WarnOnKOSDescription"] = "Установить это отображать предупреждение и звуковые оповещения при обнаружении противником на вашем убить на взгляд списка."
L ["WarnOnKOSGuild"] = "Предупреждать при Kill на прицел гильдии обнаружения"
L ["WarnOnKOSGuildDescription"] = "Установить это отображать предупреждение и звуковые оповещения при обнаружении противником в той же гильдии, как кто-то на ваших убить на взгляд списка."
L ["DisplayWarningsInErrorsFrame"] = "Предупреждения отображаются в окне ошибки"
L ["DisplayWarningsInErrorsFrameDescription"] = "Установить это чтобы использовать ошибки фрейм для отображения предупреждений вместо использования графического всплывающего кадров."
L ["EnableSound"] = "Включить аудио оповещения"
L ["EnableSoundDescription"] = "установить это для включения аудио-оповещения при обнаружении вражеских игроков. Звук оповещения если противника игрок получает стелс или если враг игрока находится на вашем списке убить на прицел."
 
L ["ListOptions"] = "Поблизости список"
L ["ListOptionsDescription"] = [[
Можно настроить как Spy добавляет и удаляет вражеских игроков в и из списка поблизости.
]]
L ["RemoveUndetected"] = "удалить вражеских игроков из списка поблизости после:"
L ["1Min"] = "1 минута"
L ["1MinDescription"] = "Убрать противником, который был более чем на 1 минуту."
L ["2Min"] = "2 минуты"
L ["2MinDescription"] = "Удалить противника игрок, который был более 2 минут".
L ["5Min"] = "5 минут"
L ["5MinDescription"] = "Убрать противником, который был более 5 минут."
L ["10Min"] = "10 минут"
L ["10MinDescription"] = "Убрать противником, который был более 10 минут."
L ["15Min"] = "15 минут"
L ["15MinDescription"] = "Убрать противником, который был более 15 минут."
L ["никогда"] = "Никогда не убрать"
L ["NeverDescription"] = "никогда не удалить вражеских игроков. Список может все еще быть очищен вручную."
L ["ShowNearbyList"] = "Перейти на список при обнаружении противника игрок"
L ["ShowNearbyListDescription"] = "Установить это, чтобы отобразить список, если она не видна уже при обнаружении противника игроков."
L ["PrioritiseKoS"] = "Убить Prioritise на противника прицел игроков в список"
L ["PrioritiseKoSDescription"] = "Установить это всегда показывать убить на прицел вражеские игроки первой в списке поблизости."
 
L ["MinimapOptions"] = "Карта"
L ["MinimapOptionsDescription"] = [[
Для игроков, которые могут отслеживать гуманоиды миникарте могут быть использованы для предоставления дополнительных функций.
 
Игроки, которые могут отслеживать гуманоиды включают охотников, друидов и те, кто получил способность через другие средства, например едят стейк почерневшие ворг клана.
]]
L ["MinimapTracking"] = "Включить отслеживание миникарты"
L ["MinimapTrackingDescription"] = "установить это для включения обнаружения и отслеживания миникарте. Известные вражеских игроков, обнаруженных на миникарте будет добавлен в список."
L ["MinimapDetails"] = "Дисплей класс уровня детали в подсказках"
L ["MinimapDetailsDescription"] = "Установить это обновление карты подсказок, чтобы класс уровня подробности отображаются рядом с названиями противника."
L ["DisplayOnMap"] = "Отображать расположение противника на карте"
L ["DisplayOnMapDescription"] = "Установить для отображения на карте и миникарте местоположение врагов, обнаруженные другими пользователями Spy в вашей партии, raid и гильдии".
L["SwitchToZone"] = "Switch to current zone map on enemy detection"
L["SwitchToZoneDescription"] = "If the World Map is open this will change the map to the players current zone map when enemies are detected."
L ["MapDisplayLimit"] = "Предел отображаемых значков карты для:"
L ["LimitNone"] = "Везде"
L ["LimitNoneDescription"] = "Выводит все обнаруженные врагов на карте независимо от вашего текущего местоположения".
L ["LimitSameZone"] = "Же зона"
L ["LimitSameZoneDescription"] = "только отображает обнаружено врагов на карте, если вы находитесь в той же зоне."
L ["LimitSameContinent"] = "Же континент"
L ["LimitSameContinentDescription"] = "только отображает обнаружено врагов на карте, если вы находитесь на том же континенте."
 
L ["DataOptions"] = "Управление данными"
L ["DataOptionsDescription"] = [[
Можно настроить как Spy поддерживает и собирает свои данные.
]]
L ["PurgeData"] = "очистить незамеченными враг игрока данных после:"
L ["OneDay"] = "1 день"
L ["OneDayDescription"] = "Очистить данные для вражеских игроков, которые были незамеченными за 1 день".
L ["FiveDays"] = "5 дней"
L ["FiveDaysDescription"] = "Очистить данные для вражеских игроков, которые были незамеченными в течение 5 дней."
L ["десятьдней"] = "10 дней"
L ["TenDaysDescription"] = "Очистить данные для вражеских игроков, которые были незамеченными в течение 10 дней".
L ["ThirtyDays"] = "30 дней"
L ["ThirtyDaysDescription"] = "Очистить данные для вражеских игроков, которые были незамеченными в течение 30 дней".
L ["SixtyDays"] = "60 дней"
L ["SixtyDaysDescription"] = "Очистить данные для вражеских игроков, которые были незамеченными в течение 60 дней."
L ["NinetyDays"] = "90 дней"
L ["NinetyDaysDescription"] = "Очистить данные для вражеских игроков, которые были незамеченными в течение 90 дней."
L ["ShareData"] = "Обмениваться данными с другими пользователями аддон Spy"
L ["ShareDataDescription"] = "Установить это поделиться детали вашего противника игрок встречи с другими пользователями Spy в вашей партии, raid и гильдии".
L ["UseData"] = "Использовать данные от других пользователей аддон Spy"
L ["UseDataDescription"] = [[установить это использовать данные, собранные другими пользователями Spy в вашей партии, raid и гильдии.
 
Если другой Spy пользователь обнаруживает противника игрок то что враг игрока будут добавляться в список близлежащих если есть номер.
]]
L ["ShareKOSBetweenCharacters"] = "Доля убивать на прицел игроков между ваших персонажей"
L ["ShareKOSBetweenCharactersDescription"] = "Установить это поделиться игроками, пометить как убить на зрение между другие символы, которые вы играете на одном сервере и фракции."
 
L ["SlashCommand"] = "Слэш команды"
L ["SpySlashDescription"] = "эти кнопки выполняют те же функции, как те в /spy команда слэш"
L ["Enable"] = "Enable"
L ["EnableDescription"] = "Позволяет Spy и показывает главное окно."
L ["Reset"] = "Reset"
L ["ResetDescription"] = "Сбрасывает позицию и внешний вид главного окна."
L ["Config"] = "Config"
L ["ConfigDescription"] = "Открыть окно настройки интерфейса аддоны для Spyа."
L ["КОS"] = "КОS"
L ["KOSDescription"] = "Добавить/удалить игрока из убить на взгляд списка."
L ["Ignore"] = "Ignore"
L ["IgnoreDescription"] = "Добавить/удалить игрока в/из; списка игнорирования."
 
--Списки
L ["Nearby"] = "Поблизости"
L ["LastHour"] = "Последний час"
L ["Ignore"] = "Игнорировать"
L ["KillOnSight"] = "Убить на прицел"

--Stats
--L["Last"] = "Last"
L["Time"] = "Time"	
L["List"] = "List"	
L["Show Only"] = "Show Only"
L["Won/Lost"] = "Won/Lost"
L["Reason"] = "Reason"	 
L["HonorKills"] = "Honor Kills"
L["PvPDeatchs"] = "PvP Deaths"
 
--++ Класс описания
L ["DEATHKNIGHT"] = "рыцарь смерти"
L ["DRUID"] = "Друид"
L ["HUNTER"] = "Охотник"
L ["MAGE"] = "Маг"
L ["MONK"] = "Монах"
L ["PALADIN"] = "Паладин"
L ["PRIEST"] = "Священник"
L ["ROGUE"] = "Изгоев"
L ["SHAMAN"] = "Шаман"
L ["WARLOCK"] = "Чернокнижник"
L ["WARRIOR"] = "Воин"
L ["UNKNOWN"] = "Неизвестный"
 
--Стелс способности
L ["Stealth"] = "Стелс"
L ["Prowl"] = "Рыскать"
 
--Имена каналов
L ["LocalDefenseChannelName"] = "LocalDefense"
 
--++ Minimap цветовые коды
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
 
--Выходные сообщения
L ["AlertStealthTitle"] = "Обнаружено незаметности игрок!"
L ["AlertKOSTitle"] = "Убить на прицел игрока обнаружен!"
L ["AlertKOSGuildTitle"] = "Убить на прицел игрок гильдии обнаружено!"
L ["AlertTitle_kosaway"] = "игрока убить на прицел расположен на"
L ["AlertTitle_kosguildaway"] = "гильдии игрок убить на прицел расположен на"
L ["StealthWarning"] = "|cff9933ffStealthed игрок обнаружено: |cffffffff"
L ["KOSWarning"] = "|cffff0000Kill на взгляд игрока обнаружено: |cffffffff"
L ["KOSGuildWarning"] = "|cffff0000Kill на взгляд игрок гильдии обнаружено: |cffffffff"
L ["SpySignatureColored"] = "|cff9933ff [Spy]"
L ["PlayerDetectedColored"] = "обнаружено игрок: |cffffffff"
L ["PlayersDetectedColored"] = "обнаружено Игроки: |cffffffff"
L ["KillOnSightDetectedColored"] = "убить на прицел игрока обнаружено: |cffffffff"
L ["PlayerAddedToIgnoreColored"] = "Добавлено игрока в черный список: |cffffffff"
L ["PlayerRemovedFromIgnoreColored"] = "удалено игрок из черного списка: |cffffffff"
L ["PlayerAddedToKOSColored"] = "Добавлено игрока убить на взгляд списка: |cffffffff"
L ["PlayerRemovedFromKOSColored"] = "удален игрок из убить на взгляд списка: |cffffffff"
L ["PlayerDetected"] = "[Spy] игрок обнаружено:"
L ["KillOnSightDetected"] = "[Spy] убить на прицел игрок обнаружено:"
L ["Level"] = "Уровень"
L ["LastSeen"] = "Последний раз видели"
L ["LessThanOneMinuteAgo"] = "менее чем за минуту назад"
L ["MinutesAgo"] = "минут назад"
L ["HoursAgo"] = "Сентябрь"
L ["DaysAgo"] = "дней назад"
L ["Закрыть"] = "Закрыть"
L ["CloseDescription"] = "|cffffffffHides окна Spy. По умолчанию будет показывать при обнаружении следующий игрок противника."
L ["Left/Right"] = "Влево/вправо"
L ["Left/RightDescription"] = "|cffffffffNavigates между поблизости, последний час, игнорировать и убить на прицел списки."
L ["Clear"] = "Очистить"
L ["ClearDescription"] = "|cffffffffClears список игроков, которые были обнаружены. Нажмите CTRL будет включить или отключить Spy во время отображения".
L ["NearbyCount"] = "Поблизости граф"
L ["NearbyCountDescription"] = "|cffffffffSends количество близлежащих игроков общаться."
L ["AddToIgnoreList"] = "Добавить в черный список"
L ["AddToKOSList"] = "Добавить в убить взгляд списка"
L ["RemoveFromIgnoreList"] = "Удалить из черного списка"
L ["RemoveFromKOSList"] = "Убрать из убить взгляд списка"
L ["AnnounceDropDownMenu"] = "Анонс"
L ["KOSReasonDropDownMenu"] = "Установить убивать по причине зрение"
L ["PartyDropDownMenu"] = "Партии"
L ["RaidDropDownMenu"] = "Raid"
L ["GuildDropDownMenu"] = "Гильдия"
L ["LocalDefenseDropDownMenu"] = "Местной обороны"
L ["Player"] = "(игрок)"
L ["KOSReason"] = "Убить на прицел"
L ["KOSReasonIndent"] = ""
L ["KOSReasonOther"] = "Введите ваш собственный разум..."
L ["KOSReasonClear"] = "Очистить"
L ["StatsWins"] = "|cff40ff00Wins:"
L ["StatsSeparator"] = ""
L ["StatsLoses"] = "|cff0070ddLoses:"
L ["Located"] = "расположены:"
L ["Yards"] = "дворы"
 
--Spy_KOSReasonListLength = 13
Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
	[1] = {
		["title"] = "Started бой";
		["content"] = {
--			"Засаду меня",
--			"Всегда атакует меня на зрение",
			"Напал на меня без причины",
			"На меня накинулись на дающего квест",--++
			"Напал на меня в то время как я была борьба НПС",
			"Напал на меня в то время как я въезд/выезд экземпляр",
			"На меня, пока я был АФК",
--			"Напал на меня пока я был в битве домашних животных",--++
			"Напал на меня в то время как я был смонтирован/летать",
			"Напал на меня в то время как у меня было низкое здоровье/мана",
--			"Steamrolled меня с группой врагов",
--			"Не атаковать без резервного копирования",
--			"Осмелился бросить мне вызов",
		};
	},
	[2] = {
		["title"] = "Стиль боя";
		["content"] = {
			"Засаду меня",
			"Всегда атакует меня на зрение",
			"Убил меня мне с символом высшего уровня",--++
			"Steamrolled меня с группой врагов",
			"Не атаковать без резервного копирования"
			"Всегда зовет на помощь",
--			"Толкнул меня с обрыва",
--			"Инженерные приемы использует",
			"Использует слишком много толпы управления",
--			"Спам одну способность все время",
--			"Заставило меня принять долговечность ущерб",
--			"Убил меня и от моих друзей",
--			"Побежал прочь затем засаду меня",
--			"Всегда удается сбежать",
--			"Пузырь горнов бежать",
--			"Удается остаться в бою",
--			"Управляет остановиться в кайтинг диапазон",
--			"Поглощает слишком много ущерба",
--			"Исцеляет слишком много",
--			"DPS в слишком много",
		};
	},
-- [3] = {
--		["title"] = "Общее поведение";
--		["content"] = {
--			"Раздражает",
--			"Грубость",
--			"Трусость",
--			"Высокомерие",
--			"Самоуверенность",
--			"Ненадежный",
--			"Эмоции слишком много",
--			"Преследовал меня / друзей",
--			"Претендует быть хорошим",
--			"Эмоции "не будет происходить"",
--			"Волны до свидания при низком уровне здоровья",
--			"Пытался успокоить меня с волной",
--			"Фол акты выполненных на мой труп",
--			"Смеялись на меня",
--			"Плюнул на меня",
--  	};
-- 	},
	[3] = {
		["title"] = "Кемпинг";
		["content"] = {
			"Лагерь меня",
			"Лагерь alt",
			"Лагерь lowbies",
			"Лагерь от стелс",
			"Лагерь гильдии члены",
			"Лагерь Игры NPC/цели",
			"Лагерь сайт города",
--			"Называется в помощь в лагерь меня",
--			"Сделал выравнивания кошмар",
--			"Заставили меня выйти",
--			"Не бороться мой главный",
		};
	},
	[4] = {
		["title"] = "Questing";
		["content"] = {
			"Напал на меня в то время как я ищущий",
			"Напал на меня после того, как я помог с поиском",
			"Вмешивалось в поисках цели",
			"Начал квест, что я хотел сделать"
			"Убил мой фракция НПС",
			"Убили квест NPC"
		};
    },
	[5] = {
		["title"] = "Украл ресурсов";
		["content"] = {
			"Собранные травы я хотел",
			"Собрались минералов я хотел",
			"Собранные ресурсы я хотел",
--			"Добываемого газа от облака я хотел",
			"Убил меня и украл мой целевой/редкие NPC"
			"Кожей моей убивает",
			"Спасти мою голову",
			"Ловили в моем бассейне",
		};
	},
--[[ [7] = {
["title"] = "Поля боя";
["content"] = {
"Всегда грабит трупов",
"Очень хороший флаг бегун",
"Backcaps флаги или баз",
"Stealth шапки флаги или баз",
"Убил меня и взял флаг",
"Мешает с целями на поле боя",
"Взял power-up, что я хотел"
"Принудительное танк потерять Агро",
"Причиной wipe",
"Разрушает осадных машин",
"Капли бомб",
"Разоружает бомбы",
"Страх бомбардировщик",
                                };
                },
[8] = {
["title"] = "Реальной жизни";
["content"] = {
"Друг в реальной жизни",
"Враг в реальной жизни",
"Распространяет слухи обо мне",
"Жалуется на форумах",
"Spy другой фракции",
"Предатель моей фракции",
"Отказался от сделки",
"Претенциозным nub",
"Другой ноу-это все",
"Другой Johnny-come-lately",
"Крест фракции мусора Говорун",
                                };
                },
[9] = {
["title"] = "Трудность";
["content"] = {
"Невозможно убить",
"Выигрывает большую часть времени"
"Кажется справедливой матч",
"Теряет большую часть времени"
"Весело убить",
"Легко чести",
                                };
                },
[10] = {
["title"] = "Раса";
["content"] = {
"Ненавижу игрока гонки",
"Эльфы крови, самовлюбленный"
"Дренеи являются слизистые пространства кальмары"
"Гномы являются короткие волосатые стоперы",
"Гоблинов будет продавать свои собственные матери для получения прибыли",
"Гномы принадлежат в саду",
"Люди, праведный суетятся"
"Ночные эльфы обнять слишком много деревьев",
"Орки являются милитаристской варваров",
"Pandarens говорю мне замедлить",--++
"Таурен должен быть на моем burger",
"Троллей должно остаться на веб-форумах"
"Нежить неестественно зверей",
"Воргены имеют слишком много блох"
                                };
                },
[11] = {
["title"] = "Класс";
["content"] = {
"Ненавижу игрока класса",
"Рыцари смерти одолели",
"Друиды являются грязными животными"
"Охотники являются простой режим",
"Маги являются заблуждение умы",
"Монахи Чи слаба",--++
"Паладины являются ханжески дураков",
"Священники являются благочестивых проповедников"
"Жулики у ни чести",
"Шаманы поговорить с мнимой животных",
"Чернокнижники являются некромантии садисты",
"Воины у гневом вопросы",
                                };
                },
[12] = {
["title"] = "Имя";
["content"] = {
"Есть смешное имя",
"Претенциозное имя",
"Вариант Леголас",
"Имя имеет странные символы"
"Название гильдии является смешным",
"Название гильдии использует только заглавные буквы"
"Название гильдии используются заглавные буквы и пробелы"
"Название гильдии утверждает, что они ненавидят моя фракция",
                                };
                },]]--
-- [13] = {
	[6] = {
		["title"] = "Другие";
		["content"] = {
--			"Карма",
--			"Red dead",
--			"Просто так",
--			"Сбой в PvP",
			"Помеченные для PvP",
--			"Не хотим PvP",
--			"Отходы и наше время",
--			"Этот игрок является noob",
--			"Я действительно ненавижу этот игрок",
--			"Не уровень достаточно быстро",
			"Толкнул меня с обрыва",
			"Использует инженерные приемы",
			"Всегда удается сбежать",
			"Использует предметы и навыки к бегству",
			"Подвиги игровой механики",
--			"Подозреваемых хакер",
--			"Фермер",
--			"Другой...",
			"Введите ваш собственный разум...",
		};
	},
}
 
StaticPopupDialogs ["Spy_SetKOSReasonOther"] = {
	preferredIndex = STATICPOPUPS_NUMDIALOGS,--http://forums.wowace.com/showthread.php?p=320956
	text = "Введите Kill на взгляд причина для % s:",
	button1 = "Установить",
	button2 = "Отменить",
	timeout = 20,
	hasEditBox = 1,
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("");
	end,
		OnAccept = function(self)
		local reason = self.editBox:GetText()
--		Spy:SetKOSReason(self.playerName, "Other...", reason)
		Spy:SetKOSReason(self.playerName, "Введите ваш собственный разум...", reason)
	end,
};
 
Spy_AbilityList = {
 
-----------------------------------------------------------
--Позволяет оценку раса, класс и уровень
--игрок быть определено, какие способности наблюдаются
--в журнале боя.
-----------------------------------------------------------
 
--++ Расовых ++
["Снимает"] = {race = "Dwarf", level = 1},
["Мастер побега"] = {race = "Gnome", level = 1},
["Каждый сам за себя "] = {race = "Human", level = 1},
["Shadowmeld"] = {race = "Night Elf", level = 1},
["Дар наару"] = {race = "Draenei", level = 1},
["Воргенов"] = {race = "Worgen", level = 1},
["Две формы"] = {race = "Worgen", level = 1},
["Работает дикий"] = {race = "Worgen", level = 1,},
["Кровавое неистовство"] = {race = "Orc", level = 1},
["War Stomp"] = {race = "Tauren", level = 1},
["Берсерк"] = {race = "Тroll", level = 1},
["Воля Отрекшихся"] = {race = "Undead", level = 1},
["Разделать"] = {race = "Undead", level = 1},
["Загадочные торрент"] = {race = "Blood Elf", level = 1},
["Ракетный прыжок"] = {race = "Goblin", level = 1},
["Ракетный шквал"] = {race = "Goblin", level = 1},
["Пакета домовой"] = {race = "Goblin", level = 1},
["Дрожащие ладони"] = {race = "Pandaren", level = 1},
 
--++ Способности рыцарь смерти ++
["Кровавая чума"] = {class = "DEATHKNIGHT", level = 55,},
["Кровавый удар"] = {class = "DEATHKNIGHT", level = 55,},
["Лик смерти"] = {class = "DEATHKNIGHT", level = 55,}, 
["Врата смерти"] = {class = "DEATHKNIGHT", level = 55,}, 
["Хватка смерти"] = {class = "DEATHKNIGHT", level = 55,},
["Озноб"] = {class = "DEATHKNIGHT", level = 55,},
["Власть льда"] = {class = "DEATHKNIGHT", level = 55,}, 
["Icy Touch"] = {class = "DEATHKNIGHT", level = 55,}, 
["Удара чумы"] = {class = "DEATHKNIGHT", level = 55,}, 
["Ковка рун"] = {class = "DEATHKNIGHT", level = 55,}, 
["Вскипание крови"] = {class = "DEATHKNIGHT", level = 56,},
["Удар смерти"] = {class = "DEATHKNIGHT", level = 56,}, 
["Моровой язвы"] = {class = "DEATHKNIGHT", level = 56,}, 
["Воскрешение мертвых"] = {class = "DEATHKNIGHT", level = 56,}, 
["Присутствие крови"] = {class = "DEATHKNIGHT", level = 57,}, 
["Разума замораживания"] = {class = "DEATHKNIGHT", level = 57,}, 
["Ледяные оковы"] = {class = "DEATHKNIGHT", level = 58,}, 
["Задушить"] = {class = "DEATHKNIGHT", level = 58,}, 
["Смерть и разложение"] = {class = "DEATHKNIGHT", level = 60,}, 
["Конь бледный"] = {class = "DEATHKNIGHT", level = 61,}, 
["Незыблемости"] = {class = "DEATHKNIGHT", level = 62,},
["Нечестивый присутствие"] = {class = "DEATHKNIGHT", level = 64,},
["Зимний горн"] = {class = "DEATHKNIGHT", level = 65,}, 
["Путь Фрост"] = {class = "DEATHKNIGHT", level = 66,}, 
["Антимагический панцирь"] = {class = "DEATHKNIGHT", level = 69,},
["Контроль нежити"] = {class = "DEATHKNIGHT", level = 69,}, 
["Поднять союзником"] = {class = "DEATHKNIGHT", level = 72,}, 
["Уполномочивают руническое оружие"] = {class = "DEATHKNIGHT", level = 76,}, 
["Войско мертвых"] = {class = "DEATHKNIGHT", level = 80,}, 
["Вспышки"] = {class = "DEATHKNIGHT", level = 81,}, 
["Некротический удар"] = {class = "DEATHKNIGHT", level = 83,}, 
["Темный симулякр"] = {class = "DEATHKNIGHT", level = 85,}, 
["Душа Reaper"] = {class = "DEATHKNIGHT", level = 87,}, 
["Руна оплавленного"] = {class = "DEATHKNIGHT", level = 55,},
["Руне упал крестоносец"] = {class = "DEATHKNIGHT", level = 70,}, 
["Руне Lichbane"] = {class = "DEATHKNIGHT", level = 60,},
["Руна ледяного"] = {class = "DEATHKNIGHT", level = 55,},
["Руне чар"] = {class = "DEATHKNIGHT", level = 57,},
["Руна сокрушения"] = {class = "DEATHKNIGHT", level = 57,},
["Руне Swordbreaking"] = {class = "DEATHKNIGHT", level = 63,},
["Руне Swordshattering"] = {class = "DEATHKNIGHT", level = 63,},
["Руне нерубский панцирь"] = {class = "DEATHKNIGHT", level = 72,},
["Руна каменной горгульи"] = {class = "DEATHKNIGHT", level = 72,},
--++ Символ способности ++
["Взрыв трупа"] = {class = "DEATHKNIGHT", level = 25,}, 
--++ Рыцарь смерти специализации ++
--++ Фрост/Unholy ++
["Unholy Aura"] = {class = "DEATHKNIGHT", level = 60,},
--++ Крови ++
["Кровь обрядов"] = {class = "DEATHKNIGHT", level = 55,}, 
["Месть"] = {class = "DEATHKNIGHT", level = 55,}, 
["Ветеран третьей войны"] = {class = "DEATHKNIGHT", level = 55,}, 
["Темная власть"] = {class = "DEATHKNIGHT", level = 58,}, 
["Сердце забастовку"] = {class = "DEATHKNIGHT", level = 60,}, 
["Запах крови"] = {class = "DEATHKNIGHT", level = 62,}, 
["Улучшено присутствие крови"] = {class = "DEATHKNIGHT", level = 64,}, 
["Руне Коснитесь"] = {class = "DEATHKNIGHT", level = 64,}, 
["Рунический удар"] = {class = "DEATHKNIGHT", level = 65,}, 
["Паразит крови"] = {class = "DEATHKNIGHT", level = 66,}, 
["Скарлатина"] = {class = "DEATHKNIGHT", level = 68,}, 
["Воля некрополя"] = {class = "DEATHKNIGHT", level = 70,}, 
["Сангвиник стойкость"] = {class = "DEATHKNIGHT", level = 72,}, 
["Танцы руническое оружие"] = {class = "DEATHKNIGHT", level = 74,}, 
--["Ripsote"] = {class = "DEATHKNIGHT", level = 76,},--добавил в патч 5.4, но не активирована, так как воины также имеют эту способность 
["Кровь вампира"] = {class = "DEATHKNIGHT", level = 76,}, 
["Костяной щит"] = {class = "DEATHKNIGHT", level = 78,},
["Щит крови"] = {class = "DEATHKNIGHT", level = 80,},
["Малиновый бедствия"] = {class = "DEATHKNIGHT", level = 84,},
--++ Фрост ++ 
["Кровь Севера"] = {class = "DEATHKNIGHT", level = 55,}, 
["Ледяной удар"] = {class = "DEATHKNIGHT", level = 55,}, 
["Howling Blast"] = {class = "DEATHKNIGHT", level = 55,}, 
["Ледяные когти"] = {class = "DEATHKNIGHT", level = 55,}, 
["Уничтожить"] = {class = "DEATHKNIGHT", level = 58,}, 
["Машина для убийств"] = {class = "DEATHKNIGHT", level = 63,}, 
["Улучшение льда"] = {class = "DEATHKNIGHT", level = 65,}, 
["Хрупкость костей"] = {class = "DEATHKNIGHT", level = 66,}, 
["Столб Мороз"] = {class = "DEATHKNIGHT", level = 68,}, 
["Изморозь"] = {class = "DEATHKNIGHT", level = 70,}, 
["Может из замороженных отходов"] = {class = "DEATHKNIGHT", level = 74,}, 
["Угроза Тассариана"] = {class = "DEATHKNIGHT", level = 74,}, 
["Замороженное сердце"] = {class = "DEATHKNIGHT", level = 80,}, 
--++ Unholy ++ 
["Мастер Ghouls"] = {class = "DEATHKNIGHT", level = 55,}, 
["Жатва"] = {class = "DEATHKNIGHT", level = 55,}, 
["Нечестивое могущество"] = {class = "DEATHKNIGHT", level = 55,}, 
["Удар Плети"] = {class = "DEATHKNIGHT", level = 58,}, 
["Теневые вливания"] = {class = "DEATHKNIGHT", level = 60,}, 
["Гнойные удар"] = {class = "DEATHKNIGHT", level = 62,}, 
["Внезапно Doom"] = {class = "DEATHKNIGHT", level = 64,}, 
["Нечестивое бешенство"] = {class = "DEATHKNIGHT", level = 66,}, 
["Эбон разносчик"] = {class = "DEATHKNIGHT", level = 68,}, 
["Темно Преображение"] = {class = "DEATHKNIGHT", level = 70,}, 
["Призыв горгульи"] = {class = "DEATHKNIGHT", level = 74,}, 
["Улучшено жуткий присутствие"] = {class = "DEATHKNIGHT", level = 75,}, 
["Dreadblade"] = {class = "DEATHKNIGHT", level = 80,}, 
--++ Рыцарь смерти таланты ++
["Охватили крови"] = {class = "DEATHKNIGHT", level = 56,}, 
["Чумы пиявки"] = {class = "DEATHKNIGHT", level = 56,}, 
["Нечестивой порчи"] = {class = "DEATHKNIGHT", level = 56,}, 
["Перерождение"] = {class = "DEATHKNIGHT", level = 57,}, 
["Зона антимагии"] = {class = "DEATHKNIGHT", level = 57,}, 
["Чистилище"] = {class = "DEATHKNIGHT", level = 57,}, 
["Заранее смерти"] = {class = "DEATHKNIGHT", level = 58,}, 
["Вечная мерзлота"] = {class = "DEATHKNIGHT", level = 58,}, 
["Душить"] = {class = "DEATHKNIGHT", level = 58,}, 
["Смертельный союз"] = {class = "DEATHKNIGHT", level = 60,}, 
["Смерть сифон"] = {class = "DEATHKNIGHT", level = 60,}, 
["Конверсия"] = {class = "DEATHKNIGHT", level = 60,}, 
["Кровь Tap"] = {class = "DEATHKNIGHT", level = 75,}, 
["Руническая возможностей"] = {class = "DEATHKNIGHT", level = 75,}, 
["Руническая коррупции"] = {class = "DEATHKNIGHT", level = 75,}, 
["Кровожад 's ГРАСП"] = {class = "DEATHKNIGHT", level = 90,}, 
["Безжалостный зима"] = {class = "DEATHKNIGHT", level = 90,}, 
["Осквернили землю"] = {class = "DEATHKNIGHT", level = 90,}, 
 
--++ Способности Друид ++
["Гнева"] = {class = "DRUID", level = 1}, 
["Лунного огня"] = {class = "DRUID", level 3,},
["Омоложения"] = {class = "DRUID", level = 4,},
["Кошка формы"] = {class = "DRUID", level = 6},
["Feline Grace"] = {class = "DRUID", level = 6},
["Калечить"] = {class = "DRUID", level = 6},
["Рыскать"] = {class = "DRUID", level = 6},
["Грабли"] = {class = "DRUID", level = 6},
["Свирепый укус"] = {class = "DRUID", level = 6},
["Медведь формы"] = {class = "DRUID", level = 8,},
["Рык"] = {class = "DRUID", level = 8,},
["Maul"] = {class = "DRUID", level = 8,},
["Таланта"] = {class = "DRUID", level = 10,},
["Гнев деревьев"] = {class = "DRUID", level = 10,},
["Оживить"] = {class = "DRUID", level = 12,},
["Телепорт: Лунная поляна"] = {class = "DRUID", level = 14,},
["Путешествия формы"] = {class = "DRUID", level = 16,},
["Водной формы"] = {class = "DRUID", level = 18,},
["Разорить!"] = {class = "DRUID", level = 22,},
["Смахните"] = {class = "DRUID", level = 22,}, 
["Dash"] = {class = "DRUID", level = 24,},
["Исцеление Touch"] = {class = "DRUID", level = 26,},
["Волшебный огонь"] = {class = "DRUID", level = 28,},
["Трэш"] = {class = "DRUID", level = 28,},
["Изначального неистовства"] = {class = "DRUID", level = 30,},
["Pounce"] = {class = "DRUID", level = 32,},
["Трек гуманоиды"] = {class = "DRUID", level = 36,},
["Разрывают"] = {class = "DRUID", level = 38,},
["Астральный шторм"] = {class = "DRUID", level = 42,},
["Ураган"] = {class = "DRUID", level = 42,},
["Дубовая кожа"] = {class = "DRUID", level = 44,},
["Хватка природы"] = {class = "DRUID", level = 52,},
["Озарение"] = {class = "DRUID", level = 54,},
["Возрождение"] = {class = "DRUID", level = 56,},
["Полет формы"] = {class = "DRUID", level = 58,},
["Успокоить"] = {class = "DRUID", level = 60,},
["Знак дикой природы"] = {class = "DRUID", level = 62,},
["Спящий"] = {class = "DRUID", level = 66,},
["Бешеной регенерации"] = {class = "DRUID", level = 68,},
["Форма рейса Swift"] = {class = "DRUID", level = 70,},
["Мощь Урсока"] = {class = "DRUID", level = 72,},
["Спокойствия"] = {class = "DRUID", level = 74,},
["Циклон"] = {class = "DRUID", level = 78,},
["Калечить"] = {class = "DRUID", level = 82,},
["Тревожный рев"] = {class = "DRUID", level = 84,},
["Симбиоз"] = {class = "DRUID", level = 87,}, 
--++ Символ способности ++
["Woodland существо-Шарм"] = {class = "DRUID", level = 25,},
["Древень форма"] = {class = "DRUID", level = 25,}, 
--++ DRUIDов специализации ++
--++ Баланс/восстановление ++
["Естественный Insight"] = {class = "DRUID", level = 10,},
["Стремительность природы"] = {class = "DRUID", level = 30,},
["Инстинкт убийцы"] = {class = "DRUID", level = 34,},
["Дикий гриб"] = {class = "DRUID", level = 84,},
--++ Баланс/дикие/опекуном ++
["Удалить коррупции"] = {class = "DRUID", level = 22,},
--++ Ферал/опекуном ++
["Рип"] = {class = "DRUID", level = 20,},
["Воспитания инстинкт"] = {class = "DRUID", level = 34,},
["Зараженные раны"] = {class = "DRUID", level = 40,},
["Вожак стаи"] = {class = "DRUID", level = 46,},
["Berserk"] = {class = "DRUID", level = 48,},
["Разорить"] = {class = "DRUID", level = 54,},
["Инстинкты выживания"] = {class = "DRUID", level = 56,},
["Череп Bash"] = {class = "DRUID", level = 64,},
--++ Ферал/реставрация мототехники ++
["Знамение ясности"] = {class = "DRUID", level = 38,},
--++ Равновесие ++
["Баланса сил"] = {class = "DRUID", level = 10,},
["Звездный"] = {class = "DRUID", level = 10,},
["Уперлись"] = {class = "DRUID", level = 12,},
["Облик лунного совуха"] = {class = "DRUID", level = 16,},
["Sunfire"] = {class = "DRUID", level = 18,},
["Астральное общение"] = {class = "DRUID", level = 20,},
["Звездопад"] = {class = "DRUID", level = 26,},
["Солнечный луч"] = {class = "DRUID", level = 28,},
["Эйфория"] = {class = "DRUID", level = 38,},
["Бешенство совуха"] = {class = "DRUID", level = 48,},
["Небесных выравнивание"] = {class = "DRUID", level = 68,},
["Звездопад"] = {class = "DRUID", level = 76,},
["Полное затмение"] = {class = "DRUID", level = 80,},
["Лунный"] = {class = "DRUID", level = 82,},
["Дикий гриб: взорвать "] = {class = "DRUID", level = 84,},
--++ Ферал ++
["Ярость тигра"] = {class = "DRUID", level = 10,},
["Лоскуток"] = {class = "DRUID", level = 16,},
["Дикий рев"] = {class = "DRUID", level = 18,},
["Хищных стремительность"] = {class = "DRUID", level = 26,},
["Бритва когти"] = {class = "DRUID", level = 80,},
--++ Guardian ++ 
["Дикая защита"] = {class = "DRUID", level = 10,},
["Месть"] = {class = "DRUID", level = 10,},
["Толстые скрыть"] = {class = "DRUID", level = 14,},
["Медвежьи объятия"] = {class = "DRUID", level = 18,},
["Клык и коготь"] = {class = "DRUID", level = 32,},
["Исступления"] = {class = "DRUID", level = 76,},
["Хранитель природы"] = {class = "DRUID", level = 80,},
--++ Реставрации ++ 
["Натуралист"] = {class = "DRUID", level = 10,},
["Swiftmend"] = {class = "DRUID", level = 10,},
["Питают"] = {class = "DRUID", level = 12,},
["Медитация"] = {class = "DRUID", level = 14,},
["Nature's фокус"] = {class = "DRUID", level = 16,},
["Волоски"] = {class = "DRUID", level = 18,},
["Природы Cure"] = {class = "DRUID", level = 22,},
["Семя жизни"] = {class = "DRUID", level = 28,},
["Жизнецвет"] = {class = "DRUID", level = 36,},
["Swift омоложения"] = {class = "DRUID", level = 46,},
["Айронбарк"] = {class = "DRUID", level = 64,},
["Буйный рост"] = {class = "DRUID", level = 76,},
["Гармония"] = {class = "DRUID", level = 80,},
["Дар Малфуриона"] = {class = "DRUID", level = 82,},
["Дикий гриб"] = {class = "DRUID", level = 84,},
["Дикий гриб: Блум "] = {class = "DRUID", level = 84,},
["Genesis"] = {class = "DRUID", level = 88,},
--++ Друид таланты ++
["Кошачьих стремительность"] = {class = "DRUID", level = 15,},
["Буйка зверь"] = {class = "DRUID", level = 15,},
["Дикие обвинения"] = {class = "DRUID", level = 15,}, 
["Изеры дар"] = {class = "DRUID", level = 30,},
["Оживление"] = {class = "DRUID", level = 30,},
["Уорд Кенария"] = {class = "DRUID", level = 30,}, 
["Рой Фей"] = {class = "DRUID", level = 45,},
["Масса запутанности"] = {class = "DRUID", level = 45,},
["Тайфун"] = {class = "DRUID", level = 45,}, 
["Душа леса"] = {class = "DRUID", level = 60,},
["Воплощение"] = {class = "DRUID", level = 60,},
["Сила природы"] = {class = "DRUID", level = 60,},
["Дезориентирующий рык"] = {class = "DRUID", level = 75,},
["Урсоловая Vortex"] = {class = "DRUID", level = 75,},
["Могучий Bash"] = {class = "DRUID", level = 75,}, 
["Сердце дикой природы"] = {class = "DRUID", level = 90,},
["Сон Кенария"] = {class = "DRUID", level = 90,},
["Бдение природы"] = {class = "DRUID", level = 90,}, 
 
--++ Хантер способности ++
["Чародейский выстрел"] = {class = "HUNTER", level = 1},
["Auto Shot"] = {class = "HUNTER", level = 1},
["Call ПЭТ 1"] = {class = "HUNTER", level = 1},
["Воскрешения питомца"] = {class = "HUNTER", level = 1},
["Устойчивый выстрел"] = {class = "HUNTER", level 3,},
["Отслеживание"] = {class = "HUNTER", level = 4,},
["Concussive Shot"] = {class = "HUNTER", level = 8,},
["Зверь Lore"] = {class = "HUNTER", level = 10,},
["Увольнять Pet"] = {class = "HUNTER", level = 10,},
["Укус змеи"] = {class = "HUNTER", level = 10,},
["Приручить зверя"] = {class = "HUNTER", level = 10,},
["Контроль Pet"] = {class = "HUNTER", level = 10,},
["Кормить питомца"] = {class = "HUNTER", level = 11,},
["Аспект Hawk"] = {class = "HUNTER", level = 12,},
["Развести"] = {class = "HUNTER", level = 14,},
["Hunter's Mark"] = {class = "HUNTER", level = 14,},
["Scatter Shot"] = {class = "HUNTER", level = 15,},
["Eagle Eye"] = {class = "HUNTER", level = 16,},
["Починить Pet"] = {class = "HUNTER", level = 16,},
["Вызов питомца 2"] = {class = "HUNTER", level = 18,},
["Противостоять выстрел"] = {class = "HUNTER", level = 22,},
["Аспект гепарда"] = {class = "HUNTER", level = 24,},
["Залп"] = {class = "HUNTER", level = 24,},
["Замораживающая ловушка"] = {class = "HUNTER", level = 28,},
["Симулировать смерть"] = {class = "HUNTER", level = 32,},
["Убийственный выстрел"] = {class = "HUNTER", level = 35,},
["Транквилизирующим выстрел"] = {class = "HUNTER", level = 35,},
["Напугать зверя"] = {class = "HUNTER", level = 36,},
["Взрывная ловушка"] = {class = "HUNTER", level = 38,},
["Отблеск"] = {class = "HUNTER", level = 38,},
["Аура меткого"] = {class = "HUNTER", level = 39,},
["Вдова яд"] = {class = "HUNTER", level = 40,},
["Вызов питомца 3"] = {class = "HUNTER", level = 42,},
["Ледяной ловушки"] = {class = "HUNTER", level = 46,},
["Ловушку Launcher"] = {class = "HUNTER", level = 48,},
["Отвлекающий выстрел"] = {class = "HUNTER", level = 52,},
["Быстрый огонь"] = {class = "HUNTER", level = 54,},
["Аспект пакета"] = {class = "HUNTER", level = 56,},
["Вызов питомца 4"] = {class = "HUNTER", level = 62,},
["Змеиной ловушки"] = {class = "HUNTER", level = 66,},
["Приказ хозяина"] = {class = "HUNTER", level = 74,},
["Неправильного"] = {class = "HUNTER", level = 76,},
["Сдерживания"] = {class = "HUNTER", level = 78,},
["Вызов питомца 5"] = {class = "HUNTER", level = 82,},
["Камуфляж"] = {class = "HUNTER", level = 85,},
["Толкучка"] = {class = "HUNTER", level = 87,}, 
--++ Символ способности ++
["Дух зверя"] = {class = "HUNTER", level = 25,}, 
["Fetch"] = {class = "HUNTER", level = 25,}, 
["Фейерверки"] = {class = "HUNTER", level = 25,}, 
--++ Хантер специализация ++
--++ Зверь мастерства/выживание ++
["Выстрел кобры"] = {class = "HUNTER", level = 81,},
--++ Зверя ++
["Убить команду"] = {class = "HUNTER", level = 10,},
["Go для горла"] = {class = "HUNTER", level = 20,},
["Рассекающий зверь"] = {class = "HUNTER", level = 24,},
["Веселая"] = {class = "HUNTER", level = 30,},
["Сосредоточить огонь"] = {class = "HUNTER", level = 32,},
["Звериный гнев"] = {class = "HUNTER", level = 40,},
["Cobra забастовки"] = {class = "HUNTER", level = 43,},
["Зверь внутри"] = {class = "HUNTER", level = 50},
["Родственные духов"] = {class = "HUNTER", level = 58,},
["Оздоровления"] = {class = "HUNTER", level = 63,},
["Экзотические звери"] = {class = "HUNTER", level = 69,},
["Мастер Звери"] = {class = "HUNTER", level = 80,},
--++ Marksmanship ++ 
["Направленные выстрел"] = {class = "HUNTER", level = 10,},
["Тщательного Цель"] = {class = "HUNTER", level = 20,},
["Глушащий выстрел"] = {class = "HUNTER", level = 30,},
["Шокирующий шквал"] = {class = "HUNTER", level = 30,},
["Бомбардировка"] = {class = "HUNTER", level = 45,},
["Быстрое оздоровление"] = {class = "HUNTER", level = 54,},
["Master Marksman"] = {class = "HUNTER", level = 58,},
["Выстрел химеры"] = {class = "HUNTER", level = 60,},
["Устойчивый фокус"] = {class = "HUNTER", level = 63,},
["Пирсинг выстрелы"] = {class = "HUNTER", level = 72,},
["Диких колчан"] = {class = "HUNTER", level = 80,},
--++ Выживание ++ 
["Разрывной выстрел"] = {class = "HUNTER", level = 10,},
["Замок и нагрузка"] = {class = "HUNTER", level = 43,},
["Черная стрела"] = {class = "HUNTER", level = 50},
["Захвата"] = {class = "HUNTER", level = 55,},
["Viper Venom"] = {class = "HUNTER", level = 63,},
["Ловушку мастерства"] = {class = "HUNTER", level = 64,},
["Змей спред"] = {class = "HUNTER", level = 68,},
["Улучшение укус змеи"] = {class = "HUNTER", level = 70,},
["Сущность Viper"] = {class = "HUNTER", level = 80,},
--++ Таланты охотника ++
["Задачах"] = {class = "HUNTER", level = 15,},
["Узкий Escape"] = {class = "HUNTER", level = 15,},
["Крадущийся тигр, скрытый Химера"] = {class = "HUNTER", level = 15,}, 
["Обязательный выстрел"] = {class = "HUNTER", level = 30,},
["Wyvern Стинг"] = {class = "HUNTER", level = 30,},
["Запугивание"] = {class = "HUNTER", level = 30,},
["Возбуждение"] = {class = "HUNTER", level = 45,},
["Аспект Hawk железа"] = {class = "HUNTER", level = 45,},
["Узы духа"] = {class = "HUNTER", level = 45,}, 
["Пыл"] = {class = "HUNTER", level = 60,},
["Остро зверь"] = {class = "HUNTER", level = 60,},
["Волнение от охоты"] = {class = "HUNTER", level = 60,}, 
["Убийство из вороны"] = {class = "HUNTER", level = 75,},
["Blink забастовки"] = {class = "HUNTER", level = 75,},
["Рыси"] = {class = "HUNTER", level = 75,}, 
["Бросок глеф"] = {class = "HUNTER", level = 90,},
["Powershot"] = {class = "HUNTER", level = 90,},
["Шквал"] = {class = "HUNTER", level = 90,}, 
 
--++ Маг способности ++
["Ледяного"] = {class = "MAGE", level = 1},
["Фрост Нова"] = {class = "MAGE", level 3,},
["Fire Blast"] = {class = "MAGE", level = 5,},
["Blink"] = {class = "MAGE", level = 7,},
["АнтиMAGEия"] = {class = "MAGE", level = 8,},
["Полиморф"] = {class = "MAGE", level = 14,},
["Разбиться"] = {class = "MAGE", level = 16,},
["Чародейский взрыв"] = {class = "MAGE", level = 18,},
["Льда Лэнс"] = {class = "MAGE", level = 22,},
["Айс блок"] = {class = "MAGE", level = 26,},
["Конус холода"] = {class = "MAGE", level = 28,},
["Снять проклятие"] = {class = "MAGE", level = 29,},
["Медленно падения"] = {class = "MAGE", level = 32,},
["Раскаленный доспех"] = {class = "MAGE", level = 34,},
["Колдовать освежения"] = {class = "MAGE", level = 38,},
["Вызывания"] = {class = "MAGE", level = 40,},
["Заклинанием"] = {class = "MAGE", level = 44,},
["Колдовать Мана Gem"] = {class = "MAGE", level = 47,},
["Зеркальное изображение"] = {class = "MAGE", level = 49,},
["Колдовство"] = {class = "MAGE", level = 50},
["Blizzard"] = {class = "MAGE", level = 52,},
["Морозного доспеха"] = {class = "MAGE", level = 54,},
["Фрост болт"] = {class = "MAGE", level = 54,},
["Невидимости"] = {class = "MAGE", level = 56,},
["Загадочные яркость"] = {class = "MAGE", level = 58,},
["Чарокрад"] = {class = "MAGE", level = 64,},
["Глубокая заморозка"] = {class = "MAGE", level = 66,},
["Улучшенная АнтиMAGEия"] = {class = "MAGE", level = 70,},
["Колдовать освежения таблицы"] = {class = "MAGE", level = 72,}, 
["Пустоты созвучие"] = {class = "MAGE", level = 74,},
["Маг бомба"] = {class = "MAGE", level = 75,},
["Блеск Даларан"] = {class = "MAGE", level = 80,}, 
["Магический доспех"] = {class = "MAGE", level = 80,},
["Горение души"] = {class = "MAGE", level = 82,},
["Искривление времени"] = {class = "MAGE", level = 84,},
["Изменить время"] = {class = "MAGE", level = 87,}, 
["Превращение: свинья "] = {class = "MAGE", level = 60,},
["Превращения: кролик "] = {class = "MAGE", level = 60,},
["Превращение: черепаха "] = {class = "MAGE", level = 60,},
["Превращение: черный кот "] = {class = "MAGE", level = 60,}, 
["Превращение: Турция "] = {class = "MAGE", level = 60,}, 
["Древний портал: Даларан "] = {class = "MAGE", level = 74,},
["Портал: Даларан "] = {class = "MAGE", level = 74,},
["Портал: Дарнас "] = {class = "MAGE", level = 42,},
["Портал: Экзодар "] = {class = "MAGE", level = 42,},
["Портал: Стальгорн "] = {class = "MAGE", level = 42,},
["Портал: Оргриммар "] = {class = "MAGE", level = 42,},
["Портал: Шаттрат "] = {class = "MAGE", level = 66,},
["Портал: Луносвет "] = {class = "MAGE", level = 42,},
["Портал: Каменоре "] = {class = "MAGE", level = 52,},
["Портал: Штормград "] = {class = "MAGE", level = 42,},
["Портал: Терамора"] = {class = "MAGE", level = 42,},
["Портал: Громовой Утес "] = {class = "MAGE", level = 42,},
["Портал: Тол Барада"] = {class = "MAGE", level = 85,},
["Портал: Подгород"] = {class = "MAGE", level = 42,},
["Портал: Вечноцветущий дол "] = {class = "MAGE", level = 90,},
["Древний телепорт: Даларан "] = {class = "MAGE", level = 71,},
["Телепорт: Даларан "] = {class = "MAGE", level = 71,},
["Телепорт: Дарнас "] = {class = "MAGE", level = 17,},
["Телепорт: Экзодар "] = {class = "MAGE", level = 17,},
["Телепорт: Стальгорн "] = {class = "MAGE", level = 17,},
["Телепорт: Оргриммар "] = {class = "MAGE", level = 17,},
["Телепорт: Шаттрат "] = {class = "MAGE", level = 62,},
["Телепорт: Луносвет "] = {class = "MAGE", level = 17,},
["Телепорт: Каменоре "] = {class = "MAGE", level = 52,},
["Телепорт: Штормград "] = {class = "MAGE", level = 17,},
["Телепорт: Терамора"] = {class = "MAGE", level = 17,},
["Телепорт: Громовой Утес "] = {class = "MAGE", level = 17,},
["Телепорт: Тол Барада"] = {class = "MAGE", level = 85,},
["Телепорт: Подгород"] = {class = "MAGE", level = 17,},
["Телепорт: Вечноцветущий дол "] = {class = "MAGE", level = 90,},
--++ Символ способности ++
["Колдовать знакомые"] = {class = "MAGE", level = 25,},
["Иллюзия"] = {class = "MAGE", level = 25,},
--++ Специализации маг ++
--++ Arcane ++
["Чародейская вспышка"] = {class = "MAGE", level = 10,},
["Arcane заряд"] = {class = "MAGE", level = 10,},
["Arcane Barrage"] = {class = "MAGE", level = 12,},
["Чародейские"] = {class = "MAGE", level = 24,},
["Медленно"] = {class = "MAGE", level = 36,},
["Arcane Power"] = {class = "MAGE", level = 62,},
["Adept Мана"] = {class = "MAGE", level = 80,}, 
--++ Пожар ++ 
["Огненная глыба"] = {class = "MAGE", level = 10,},
["Fireball"] = {class = "MAGE", level = 12,},
["Взрыв"] = {class = "MAGE", level = 24,},
["Критической массы"] = {class = "MAGE", level = 36,},
["Палить"] = {class = "MAGE", level = 48,},
["Дыхание дракона"] = {class = "MAGE", level = 62,},
["Сгорания"] = {class = "MAGE", level = 77,},
["Воспламенение"] = {class = "MAGE", level = 80,},
["Пироман"] = {class = "MAGE", level = 85,},
--++ Фрост ++ 
["Призыв элементаля воды"] = {class = "MAGE", level = 10,},
["Ледяная"] = {class = "MAGE", level = 12,},
["Ледяные пальцы"] = {class = "MAGE", level = 24,},
["Стылая кровь"] = {class = "MAGE", level = 36,},
["Frozen Orb"] = {class = "MAGE", level = 62,},
["Мозг заморозить"] = {class = "MAGE", level = 77,},
["Сосульки"] = {class = "MAGE", level = 80,},
--++ Талантов Маг ++
["Величие разума"] = {class = "MAGE", level = 15,},
["Высокая скорость"] = {class = "MAGE", level = 15,},
["Льдин"] = {class = "MAGE", level = 15,}, 
["Flameglow"] = {class = "MAGE", level = 30,},
["Временной щит"] = {class = "MAGE", level = 30,},
["Ледяная преграда"] = {class = "MAGE", level = 30,}, 
["Кольцо Мороза"] = {class = "MAGE", level = 45,},
["Айс Уорд"] = {class = "MAGE", level = 45,},
["Frostjaw"] = {class = "MAGE", level = 45,}, 
["Больше невидимости"] = {class = "MAGE", level = 60,},
["Прижечь"] = {class = "MAGE", level = 60,},
["Похолодание"] = {class = "MAGE", level = 60,}, 
["Буря пустоты"] = {class = "MAGE", level = 75,},
["Живая бомба"] = {class = "MAGE", level = 75,},
["Ледяная бомба"] = {class = "MAGE", level = 75,}, 
["Вызовом"] = {class = "MAGE", level = 90,},
["Руне власти"] = {class = "MAGE", level = 90,},
["Колдовское Уорд"] = {class = "MAGE", level = 90,}, 
 
--++ Монах способности ++
["ОАК"] = {class = "MONK", level = 1},
["Позицию разъяренного тигра"] = {class = "MONK", level = 1}, 
["Путь MONKа"] = {class = "MONK", level = 1}, 
["Тигр Palm"] = {class = "MONK", level 3,}, 
["Roll"] = {class = "MONK", level = 5,}, 
["Blackout удар"] = {class = "MONK", level = 7,}, 
["Провоцировать"] = {class = "MONK", level = 14,}, 
["Реанимировать"] = {class = "MONK", level = 18,}, 
["Детокс"] = {class = "MONK", level = 20,}, 
["Дзэн паломничество"] = {class = "MONK", level = 20,}, 
["Наследие императора"] = {class = "MONK", level = 22,}, 
["Прикосновение смерти"] = {class = "MONK", level = 22,}, 
["Swift рефлексы"] = {class = "MONK", level = 23,}, 
["Укрепление Brew"] = {class = "MONK", level = 24,}, 
["Изгнать вреда"] = {class = "MONK", level = 26,}, 
["Отключить"] = {class = "MONK", level = 28,},
["Проворные Brew"] = {class = "MONK", level = 30,},
["Дзэн паломничества: возвращение "] = {class = "MONK", level = 30,},
["Копье рука ударить"] = {class = "MONK", level = 32,}, 
["Паралич"] = {class = "MONK", level = 44,}, 
["Спиннинг журавль"] = {class = "MONK", level = 46,},
["Хрустящее Нефритовая молния"] = {class = "MONK", level = 54,}, 
["Исцеление сфере"] = {class = "MONK", level = 64,}, 
["Грейфер оружие"] = {class = "MONK", level = 68,}, 
["Дзен медитации"] = {class = "MONK", level = 82,}, 
["Трансцендентность"] = {class = "MONK", level = 87,}, 
["Трансцендентности: передача "] = {class = "MONK", level = 87,},
--++ Символ способности ++
["Leer быка"] = {class = "MONK", level = 25,},
["Полет дзен"] = {class = "MONK", level = 25,}, 
--++ Монах специализация ++
--++ Бессчетных/хмелевары ++ 
["Тигр поражает"] = {class = "MONK", level = 10,}, 
--++ Хмелевар ++ 
["Позицию прочная быка"] = {class = "MONK", level = 10,}, 
["Головокружительные Haze"] = {class = "MONK", level = 10,}, 
["Месть"] = {class = "MONK", level = 10,}, 
["Бочонок Smash"] = {class = "MONK", level = 11,}, 
["Столкновение"] = {class = "MONK", level = 18,}, 
["Дыхание огня"] = {class = "MONK", level = 18,}, 
["Гвардия"] = {class = "MONK", level = 26,}, 
["Хмелевар обучение"] = {class = "MONK", level = 34,}, 
["Неуловимый Brew"] = {class = "MONK", level = 36,}, 
["Пивоварения: неуловимый Brew "] = {class = "MONK", level = 36,}, 
["Отчаянные меры"] = {class = "MONK", level = 45,}, 
["Предотвратить вред"] = {class = "MONK", level = 48,}, 
["Подарок быка"] = {class = "MONK", level = 56,}, 
["Вызвать черный статуя быка"] = {class = "MONK", level = 70,}, 
["Очищающая Brew"] = {class = "MONK", level = 75,}, 
["Неуловимый скандалист"] = {class = "MONK", level = 80,},
--++ Бессчетных ++ 
["Позиция мудрый змей"] = {class = "MONK", level = 10,}, 
["Успокаивающий туман"] = {class = "MONK", level = 10,}, 
["Раздумья маны"] = {class = "MONK", level = 10,},
["Окутывающий туман"] = {class = "MONK", level = 16,}, 
["Внутренняя медицина"] = {class = "MONK", level = 20,}, 
["Мышечной памяти"] = {class = "MONK", level = 20,},
["Вздымаясь туман"] = {class = "MONK", level = 32,}, 
["Учения монастыря"] = {class = "MONK", level = 34,}, 
["Возобновление туман"] = {class = "MONK", level = 42,}, 
["Demateralize"] = {class = "MONK", level = 45,}, 
["Жизнь кокон"] = {class = "MONK", level = 50}, 
["Мана чай"] = {class = "MONK", level = 56,}, 
["Пивоварения: Мана чай "] = {class = "MONK", level = 56,}, 
["Поднятия"] = {class = "MONK", level = 62,}, 
["Гром фокус чай"] = {class = "MONK", level = 66,}, 
["Вызвать Статуя нефритового змея"] = {class = "MONK", level = 70,}, 
["Возрождение"] = {class = "MONK", level = 78,}, 
["Дар змеи"] = {class = "MONK", level = 80,}, 
--++ Хмелевары ++ 
["Кулаки ярости"] = {class = "MONK", level = 10,}, 
["Combo Breaker"] = {class = "MONK", level = 15,}, 
["Летающий змей удар"] = {class = "MONK", level = 18,}, 
["Боевые принадлежности"] = {class = "MONK", level = 20,}, 
["Touch Karma"] = {class = "MONK", level = 22,}, 
["Загробной"] = {class = "MONK", level = 26,}, 
["Энергетический Brew"] = {class = "MONK", level = 36,}, 
["Спарринг"] = {class = "MONK", level = 42,}, 
["Адаптация"] = {class = "MONK", level = 45,}, 
["Спиннинг огонь Blossom"] = {class = "MONK", level = 48,}, 
["Восходящего солнца удар"] = {class = "MONK", level = 56,}, 
["Тайгерай Brew"] = {class = "MONK", level = 56,}, 
["Пивоварения: Тайгерай Brew "] = {class = "MONK", level = 56,}, 
["Буря, земля и огонь"] = {class = "MONK", level = 75,}, 
["Ярость в бутылках"] = {class = "MONK", level = 80,}, 
["Наследие белого тигра"] = {class = "MONK", level = 81,}, 
--++ Монах таланты ++
["Быстрота"] = {class = "MONK", level = 15,}, 
["Тигровый похоть"] = {class = "MONK", level = 15,}, 
["Импульс"] = {class = "MONK", level = 15,}, 
["Волна Ци"] = {class = "MONK", level = 30,}, 
["Дзэн сфера"] = {class = "MONK", level = 30,}, 
["Чи взрыв"] = {class = "MONK", level = 30,}, 
["Сила ударов"] = {class = "MONK", level = 45,}, 
["Вознесения"] = {class = "MONK", level = 45,}, 
["Чи Brew"] = {class = "MONK", level = 45,}, 
["Кольцо мира"] = {class = "MONK", level = 60,},
["Зарядка Ox волна"] = {class = "MONK", level = 60,}, 
["Ноги развертки"] = {class = "MONK", level = 60,}, 
["Исцеление эликсиры"] = {class = "MONK", level = 75,}, 
["Снижению вреда"] = {class = "MONK", level = 75,}, 
["Диффузные магии"] = {class = "MONK", level = 75,}, 
["Нефритовый Ветер торопится"] = {class = "MONK", level = 90,}, 
["Ссылаться на Xuen, белый тигр"] = {class = "MONK", level = 90,}, 
["Чи Торпедо"] = {class = "MONK", level = 90,}, 
 
--++ Способности паладина ++
["Удар воина света"] = {class = "PALADIN", level = 1},
["Печать повиновения"] = {class = "PALADIN", level 3,},
["Суд"] = {class = "PALADIN", level = 5,},
["Молот правосудия"] = {class = "PALADIN", level = 7,},
["Суровые слова"] = {class = "PALADIN", level = 9,},
["Торжество"] = {class = "PALADIN", level = 9,},
["Праведное неистовство"] = {class = "PALADIN", level = 12,},
["Выкупления"] = {class = "PALADIN", level = 13,},
["Вспышка света"] = {class = "PALADIN", level = 14,},
["Расплаты"] = {class = "PALADIN", level = 15,},
["Возложение рук"] = {class = "PALADIN", level = 16,},
["Божественный щит"] = {class = "PALADIN", level = 18,},
["Очистить"] = {class = "PALADIN", level = 20,},
["Печати правды"] = {class = "PALADIN", level = 24,},
["Божественная защита"] = {class = "PALADIN", level = 26,},
["Благословение королей"] = {class = "PALADIN", level = 30,},
["Печать прозрения"] = {class = "PALADIN", level = 32,},
["Молении"] = {class = "PALADIN", level = 34,},
["Обличения"] = {class = "PALADIN", level = 36,},
["Молот гнева"] = {class = "PALADIN", level = 38,},
["Печать праведности"] = {class = "PALADIN", level = 42,},
["Сердце рыцаря"] = {class = "PALADIN", level = 44,},
["Повернуть зло"] = {class = "PALADIN", level = 46,},
["Рука защиты"] = {class = "PALADIN", level = 48,},
["Длань свободы"] = {class = "PALADIN", level = 52,},
["Святость битвы"] = {class = "PALADIN", level = 58,},
["Аура благочестия"] = {class = "PALADIN", level = 60,},
["Рука спасения"] = {class = "PALADIN", level = 66,},
["Гнев карателя"] = {class = "PALADIN", level = 72,},
["Длань жертвенности"] = {class = "PALADIN", level = 80,},
["Благословение могущества"] = {class = "PALADIN", level = 81,},
["Бескрайние осуждение"] = {class = "PALADIN", level = 85,},
["Слепящий свет"] = {class = "PALADIN", level = 87,},
--++ Символ способности ++
["Созерцание"] = {class = "PALADIN", level = 25,},
--++ Паладин специализации ++
--++ Защиты/возмездие ++ 
["Молот праведника"] = {class = "PALADIN", level = 20,},
--++ Святым/защита/возмездие ++ 
["Хранитель древних королей"] = {class = "PALADIN", level = 75,},
--++ Святым ++
["Шок небес"] = {class = "PALADIN", level = 10,},
["Святой Insight"] = {class = "PALADIN", level = 10,},
["Осудить"] = {class = "PALADIN", level = 20,},
["Священное очищение"] = {class = "PALADIN", level = 20,},
["Святое сияние"] = {class = "PALADIN", level = 28,},
["Святой свет"] = {class = "PALADIN", level = 34,},
["Частица света"] = {class = "PALADIN", level = 39,},
["Божественный призыв"] = {class = "PALADIN", level = 46,},
["Прилив света"] = {class = "PALADIN", level = 50},
["Божественный свет"] = {class = "PALADIN", level = 54,},
["Рассвет"] = {class = "PALADIN", level = 56,},
["Божественная пользу"] = {class = "PALADIN", level = 62,},
["Башня сияние"] = {class = "PALADIN", level = 64,},
["Свет зари"] = {class = "PALADIN", level = 70,},
["Освещенная исцеление"] = {class = "PALADIN", level = 80,}, 
--++ Защита ++ 
["Щит мстителя"] = {class = "PALADIN", level = 10,},
["Под охраной света"] = {class = "PALADIN", level = 10,},
["Месть"] = {class = "PALADIN", level = 10,},
["Священный гнев"] = {class = "PALADIN", level = 20,},
["Суждений мудрецов"] = {class = "PALADIN", level = 28,},
["Освящение"] = {class = "PALADIN", level = 34,},
["Щит праведника"] = {class = "PALADIN", level = 40,},
["Великого Крестоносца"] = {class = "PALADIN", level = 50},
["Святилище"] = {class = "PALADIN", level = 64,},
["Ревностный защитник"] = {class = "PALADIN", level = 70,},
["Божественный Оплот"] = {class = "PALADIN", level = 80,},
--++ Возмездие ++ 
["Вердикт храмовника"] = {class = "PALADIN", level = 10,},
["Меч света"] = {class = "PALADIN", level = 10,},
["Суждения Bold"] = {class = "PALADIN", level = 28,},
["Божественная буря"] = {class = "PALADIN", level = 34,},
["Экзорцизм"] = {class = "PALADIN", level = 46,},
["Искусство войны"] = {class = "PALADIN", level = 50},
["Эмансипировать"] = {class = "PALADIN", level = 54,},
["Печать справедливости"] = {class = "PALADIN", level = 70,},
["Освобождают"] = {class = "PALADIN", level = 80,},
["Стороны света"] = {class = "PALADIN", level = 80,},
["Инквизиция"] = {class = "PALADIN", level = 81,}, 
--++ Таланты паладина ++
["Скорость света"] = {class = "PALADIN", level = 15,},
["Длинные руки закона"] = {class = "PALADIN", level = 15,},
["Погоня за справедливостью"] = {class = "PALADIN", level = 15,}, 
["Кулак правосудия"] = {class = "PALADIN", level = 30,},
["Покаяние"] = {class = "PALADIN", level = 30,},
["Зло это с точки зрения"] = {class = "PALADIN", level = 30,},
["Самоотверженный целитель"] = {class = "PALADIN", level = 45,},
["Вечный огонь"] = {class = "PALADIN", level = 45,},
["Священный щит"] = {class = "PALADIN", level = 45,}, 
["Рука чистоты"] = {class = "PALADIN", level = 60,},
["Нерушимая дух"] = {class = "PALADIN", level = 60,},
["Помилования"] = {class = "PALADIN", level = 60,}, 
["Святой мститель"] = {class = "PALADIN", level = 75,},
["Освящены гнева"] = {class = "PALADIN", level = 75,},
["Божественная цель"] = {class = "PALADIN", level = 75,}, 
["Божественная призма"] = {class = "PALADIN", level = 90,},
["Молот света"] = {class = "PALADIN", level = 90,},
["Смертный приговор"] = {class = "PALADIN", level = 90,},
 
--++ Священник способности ++
["Сразить"] = {class = "PRIEST", level = 1},
["Тень слово: боль "] = {class = "PRIEST", level 3,},
["Власть слова: щит "] = {class = "PRIEST", level = 5,},
["Flash Heal"] = {class = "PRIEST", level = 7,},
["Внутренний огонь"] = {class = "PRIEST", level = 9,},
["Божественная фокус"] = {class = "PRIEST", level = 10,},
["Ментальный крик"] = {class = "PRIEST", level = 12,},
["Воскресение"] = {class = "PRIEST", level = 18,},
["Власть слова: стойкость "] = {class = "PRIEST", level = 22,},
["Fade"] = {class = "PRIEST", level = 24,},
["Рассеивание заклинаний"] = {class = "PRIEST", level = 26,},
["Возобновить"] = {class = "PRIEST", level = 26,},
["Сковывают нежить"] = {class = "PRIEST", level = 32,},
["Левитация"] = {class = "PRIEST", level = 34,},
["Разума видение"] = {class = "PRIEST", level = 42,},
["Исчадие"] = {class = "PRIEST", level = 42,},
["Тень слова: смерть "] = {class = "PRIEST", level = 46,},
["Привязка Heal"] = {class = "PRIEST", level = 48,},
["Мистицизм"] = {class = "PRIEST", level = 50},
["Страх Уорд"] = {class = "PRIEST", level = 54,},
["Гимн надежды"] = {class = "PRIEST", level = 66,},
["Молитва восстановления"] = {class = "PRIEST", level = 68,},
["Развеять массу"] = {class = "PRIEST", level = 72,},
["Иссушение разума"] = {class = "PRIEST", level = 76,},
["Внутренняя воля"] = {class = "PRIEST", level = 80,},
["Скачок веры"] = {class = "PRIEST", level = 84,},
["Void Shift"] = {class = "PRIEST", level = 87,},
--++ Символ способности ++
["Святой Нова"] = {class = "PRIEST", level = 25,},
["Исповедь"] = {class = "PRIEST", level = 25,},
--++ Священник специализации ++
--++ Дисциплины/Святой ++
["Медитация"] = {class = "PRIEST", level = 10,},
["Духовное исцеление"] = {class = "PRIEST", level = 10,},
["Святой огонь"] = {class = "PRIEST", level = 18,},
["Очищают"] = {class = "PRIEST", level = 22,},
["Залечить"] = {class = "PRIEST", level = 28,},
["Сосредоточены воли"] = {class = "PRIEST", level = 28,},
["Больше Heal"] = {class = "PRIEST", level = 34,},
["Евангелизации"] = {class = "PRIEST", level = 44,},
["Молитва исцеления"] = {class = "PRIEST", level = 46,},
--++ Дисциплины ++
["Rapture"] = {class = "PRIEST", level = 10,},
["Покаяние"] = {class = "PRIEST", level = 10,},
["Божественный эгидой"] = {class = "PRIEST", level = 24,},
["Дух Shell"] = {class = "PRIEST", level = 28,},
["Внутреннее Сосредоточение"] = {class = "PRIEST", level = 36,},
["Искупление"] = {class = "PRIEST", level = 38,},
["Grace"] = {class = "PRIEST", level = 45,},
["Архангел"] = {class = "PRIEST", level = 50},
["Сила души"] = {class = "PRIEST", level = 52,},
["Подавление боли"] = {class = "PRIEST", level = 58,},
["Лишнее время"] = {class = "PRIEST", level = 62,},
["Власть слова: барьер "] = {class = "PRIEST", level = 70,},
["Поезд мысли"] = {class = "PRIEST", level = 78,},
["Щит дисциплины"] = {class = "PRIEST", level = 80,},
--++ Святым ++
["Святое слово: наказывать "] = {class = "PRIEST", level = 10,},
["Дух воздаяния"] = {class = "PRIEST", level = 30,},
["Serendipity"] = {class = "PRIEST", level = 34,},
["Колодца"] = {class = "PRIEST", level = 36,},
["Круг исцеления"] = {class = "PRIEST", level = 50},
["Чакра: наказывать "] = {class = "PRIEST", level = 56,},
["Чакра: Святилище"] = {class = "PRIEST", level = 56,},
["Чакра: безмятежность"] = {class = "PRIEST", level = 56,},
["Быстрое оживление"] = {class = "PRIEST", level = 64,},
["Оберегающий дух"] = {class = "PRIEST", level = 70,},
["Божественный гимн"] = {class = "PRIEST", level = 78,},
["Эхо света"] = {class = "PRIEST", level = 80,},
--++ Тень ++
["Пытка разума"] = {class = "PRIEST", level = 10,},
["Духовные точность"] = {class = "PRIEST", level = 10,},
["Всепожирающая чума"] = {class = "PRIEST", level = 21,},
["Взрыв разума"] = {class = "PRIEST", level = 21,},
["Тень Orbs"] = {class = "PRIEST", level = 21,},
["Тьмы"] = {class = "PRIEST", level = 24,},
["Прикосновение вампира"] = {class = "PRIEST", level = 28,},
["Теневые явления"] = {class = "PRIEST", level = 42,},
["Разум Спайк"] = {class = "PRIEST", level = 44,},
["Молчания"] = {class = "PRIEST", level = 52,},
["Дисперсия"] = {class = "PRIEST", level = 60,},
["Глубинный ужас"] = {class = "PRIEST", level = 74,},
["Объятия вампира"] = {class = "PRIEST", level = 78,},
["Теневые вспомнить"] = {class = "PRIEST", level = 80,},
--++ Священник таланты ++
["Void усики"] = {class = "PRIEST", level = 15,},
["Ментального"] = {class = "PRIEST", level = 15,},
["Доминировать ум"] = {class = "PRIEST", level = 15,}, 
["Тело и душа"] = {class = "PRIEST", level = 30,},
["Ангельские перья"] = {class = "PRIEST", level = 30,},
["Фантазм"] = {class = "PRIEST", level = 30,}, 
["От тьмы, приходит света"] = {class = "PRIEST", level = 45,},
["Подчиняющий"] = {class = "PRIEST", level = 45,},
["Утешение и безумия"] = {class = "PRIEST", level = 45,},
["Молитва отчаяния"] = {class = "PRIEST", level = 60,},
["Спектральный прикрытием"] = {class = "PRIEST", level = 60,},
["Ангельской Оплот"] = {class = "PRIEST", level = 60,}, 
["Иронии судьбы"] = {class = "PRIEST", level = 75,},
["Власть вливания"] = {class = "PRIEST", level = 75,},
["Божественная проницательность"] = {class = "PRIEST", level = 75,}, 
["Каскад"] = {class = "PRIEST", level = 90,},
["Божественная звезда"] = {class = "PRIEST", level = 90,},
["Halo"] = {class = "PRIEST", level = 90,},
 
--++ Изгоев способности ++
["Коварного удара"] = {class = "ROGUE", level = 1},
["Потрошение"] = {class = "ROGUE", level 3,},
["Стелс"] = {class = "ROGUE", level = 5,},
["Засада"] = {class = "ROGUE", level = 6},
["Уклонение"] = {class = "ROGUE", level = 8,},
["Смертельный яд"] = {class = "ROGUE", level = 10,},
["Sap"] = {class = "ROGUE", level = 12,},
["Slice и кости"] = {class = "ROGUE", level = 14,},
["Pick Pocket"] = {class = "ROGUE", level = 15,},
["Выздороветь"] = {class = "ROGUE", level = 16,},
["Kick"] = {class = "ROGUE", level = 18,},
["Калечащий яд"] = {class = "ROGUE", level = 20,},
["Парализующий удар"] = {class = "ROGUE", level = 22,},
["Pick Lock"] = {class = "ROGUE", level = 24,},
["Спринт"] = {class = "ROGUE", level = 26,},
["Отвлечь"] = {class = "ROGUE", level = 28,},
["Дурманящий яд"] = {class = "ROGUE", level = 28,},
["Cheap Shot"] = {class = "ROGUE", level = 30,},
["Раны яд"] = {class = "ROGUE", level = 30,},
["Клинок в хитрости"] = {class = "ROGUE", level = 30,},
["Исчезнуть"] = {class = "ROGUE", level = 34,},
["Подвергать броня"] = {class = "ROGUE", level = 36,},
["Слепой"] = {class = "ROGUE", level = 38,},
["Почек выстрел"] = {class = "ROGUE", level = 40,},
["Обнаружить ловушки"] = {class = "ROGUE", level = 42,},
["Финт"] = {class = "ROGUE", level = 44,},
["Разрыв"] = {class = "ROGUE", level = 46,},
["Гаррота"] = {class = "ROGUE", level = 48,},
["Безопасного падения"] = {class = "ROGUE", level = 48,},
["Демонтировать"] = {class = "ROGUE", level = 52,},
["Неустанное забастовки"] = {class = "ROGUE", level = 54,},
["Разоружить ловушку"] = {class = "ROGUE", level = 56,},
["Плащ теней"] = {class = "ROGUE", level = 58,},
["Флота Черноногий"] = {class = "ROGUE", level = 62,},
["Мастер ядоварения"] = {class = "ROGUE", level = 64,},
["Веер клинков"] = {class = "ROGUE", level = 66,},
["Подготовка"] = {class = "ROGUE", level = 68,},
["Теневой ходьбы"] = {class = "ROGUE", level = 72,},
["Заточка"] = {class = "ROGUE", level = 74,},
--["Саван сокрытия"] = {class = "ROGUE", level = 76,}, not activated
["Приемы торговли"] = {class = "ROGUE", level = 78,},
["Redirect"] = {class = "ROGUE", level = 81,},
["Малиновый Tempest"] = {class = "ROGUE", level = 83,},
["Дымовая шашка"] = {class = "ROGUE", level = 85,},
["Тень лезвия"] = {class = "ROGUE", level = 87,},
--++ Символ способности ++
["Обнаружения"] = {class = "ROGUE", level = 25,}, 
--++ Бродяга специализации ++
--++ Убийство ++ 
["Assassin's решимость"] = {class = "ROGUE", level = 10,},
["Улучшено ядов"] = {class = "ROGUE", level = 10,},
["Портить"] = {class = "ROGUE", level = 10,},
["Отравлять"] = {class = "ROGUE", level = 20,},
["Печать судьба"] = {class = "ROGUE", level = 30,},
["Отправление"] = {class = "ROGUE", level = 40,},
["Ядовитая раны"] = {class = "ROGUE", level = 50},
["Вырезать, чтобы погоня"] = {class = "ROGUE", level = 60,},
["Blindside"] = {class = "ROGUE", level = 70,},
["Вендетта"] = {class = "ROGUE", level = 80,},
["Сильнодействующих ядов"] = {class = "ROGUE", level = 80,},
--++ Борьбы с ++ 
["Амбидекстрия"] = {class = "ROGUE", level = 10,},
["Жизнеспособность"] = {class = "ROGUE", level = 10,},
["Лезвие шквал"] = {class = "ROGUE", level = 10,},
["Выявление забастовка"] = {class = "ROGUE", level = 20,},
["Борьбы с потенции"] = {class = "ROGUE", level = 30,},
["Жестокость"] = {class = "ROGUE", level = 32,},
["Адреналин Раш"] = {class = "ROGUE", level = 40,},
["Беспокойный лезвия"] = {class = "ROGUE", level = 50},
["Коварство бандита"] = {class = "ROGUE", level = 60,},
["Череда убийств"] = {class = "ROGUE", level = 80,},
["Main Gauche"] = {class = "ROGUE", level = 80,},
--++ Тонкости ++
["Кровоизлияние"] = {class = "ROGUE", level = 10,},
["Мастер тонкости"] = {class = "ROGUE", level = 10,},
["Sinister Calling"] = {class = "ROGUE", level = 10,},
["Найти слабость"] = {class = "ROGUE", level = 20,},
["Преднамеренность"] = {class = "ROGUE", level = 30,},
["Жало"] = {class = "ROGUE", level = 40,},
["Чести среди воров"] = {class = "ROGUE", level = 50},
["Вспарывание вен"] = {class = "ROGUE", level = 60,},
["Рекуперация энергии"] = {class = "ROGUE", level = 70,},
["Танец теней"] = {class = "ROGUE", level = 80,},
["Палач"] = {class = "ROGUE", level = 80,}, 
--++ Бродяга таланты ++
["Nightstalker"] = {class = "ROGUE", level = 15,},
["Уловки"] = {class = "ROGUE", level = 15,},
["Теневой фокус"] = {class = "ROGUE", level = 15,},
["Смертельные бросать"] = {class = "ROGUE", level = 30,},
["Нерв забастовка"] = {class = "ROGUE", level = 30,},
["Боевой готовности"] = {class = "ROGUE", level = 30,}, 
["Обмануть смерть"] = {class = "ROGUE", level = 45,},
["Качал яд"] = {class = "ROGUE", level = 45,},
["Неуловимость"] = {class = "ROGUE", level = 45,}, 
["Оплетенным"] = {class = "ROGUE", level = 60,},
["Всплеск скорости"] = {class = "ROGUE", level = 60,}, 
["Плащ и кинжал"] = {class = "ROGUE", level = 60,}, 
["Охотиться на слабых"] = {class = "ROGUE", level = 75,},
["Паралитический яд"] = {class = "ROGUE", level = 75,},
["Грязных трюков"] = {class = "ROGUE", level = 75,}, 
["Бросить сюрикен"] = {class = "ROGUE", level = 90,},
["Метка смерти"] = {class = "ROGUE", level = 90,},
["Предстояние"] = {class = "ROGUE", level = 90,},
 
--++ Способностей шамана ++
["Молнии"] = {class = "SHAMAN", level = 1},
["Прямой удар"] = {class = "SHAMAN", level 3,},
["Земной шок"] = {class = "SHAMAN", level = 6},
["Исцеление от перенапряжения"] = {class = "SHAMAN", level = 7,},
["Щит молний"] = {class = "SHAMAN", level = 8,},
["Оружие языка пламени"] = {class = "SHAMAN", level = 10,},
["Пламя шок"] = {class = "SHAMAN", level = 12,},
["Очистить"] = {class = "SHAMAN", level = 12,},
["Дух предков"] = {class = "SHAMAN", level = 14,},
["Призрачный волк"] = {class = "SHAMAN", level = 15,},
["Жгучая Тотем"] = {class = "SHAMAN", level = 16,},
["Пронизывающий ветер"] = {class = "SHAMAN", level = 16,},
["Очистить дух"] = {class = "SHAMAN", level = 18,},
["Водного щита"] = {class = "SHAMAN", level = 20,},
["Ледяной шок"] = {class = "SHAMAN", level = 22,},
["Водные прогулки"] = {class = "SHAMAN", level = 24,},
["Earthbind Totem"] = {class = "SHAMAN", level = 26,},
["Цепная молния"] = {class = "SHAMAN", level = 28,},
["Исцеление поток Тотем"] = {class = "SHAMAN", level = 30,},
["Тотемные вспомнить"] = {class = "SHAMAN", level = 30,},
["Реинкарнация"] = {class = "SHAMAN", level = 32,},
["Астрал вспомнить"] = {class = "SHAMAN", level = 34,},
["Далеко взгляд"] = {class = "SHAMAN", level = 36,},
["Тотем магмы"] = {class = "SHAMAN", level = 36,},
["Тотем заземления"] = {class = "SHAMAN", level = 38,},
["Горящий гнев"] = {class = "SHAMAN", level = 40,},
["Цепное исцеление"] = {class = "SHAMAN", level = 44,},
["Ледяного оружие"] = {class = "SHAMAN", level = 46,},
["Тотем трепета"] = {class = "SHAMAN", level = 54,},
["Земля элементарного тотем"] = {class = "SHAMAN", level = 58,},
["Целительный ливень"] = {class = "SHAMAN", level = 60,},
["Конденсатор Тотем"] = {class = "SHAMAN", level = 63,},
["Исцеление Тотем прилива"] = {class = "SHAMAN", level = 65,},
["Тотем элементаля огня"] = {class = "SHAMAN", level = 66,},
["Героизм"] = {class = "SHAMAN", level = 70,},
["Кровожадность"] = {class = "SHAMAN", level = 70,},
["Привязка Элементаль"] = {class = "SHAMAN", level = 72,},
["Hex"] = {class = "SHAMAN", level = 75,},
["Rockbiter оружие"] = {class = "SHAMAN", level = 75,},
["Stormlash Тотем"] = {class = "SHAMAN", level = 78,},
["Грейс Air"] = {class = "SHAMAN", level = 80,},
["Раскрыть элементы"] = {class = "SHAMAN", level = 81,},
["В благосклонность"] = {class = "SHAMAN", level = 85,},
["Доминирующую"] = {class = "SHAMAN", level = 87,},
--++ Шаман специализация ++
--++ Стихии/восстановление ++ 
["Духовное понимание"] = {class = "SHAMAN", level = 10,},
["Выброс лавы"] = {class = "SHAMAN", level = 34,},
--++ Стихии/повышение ++
["Ярость шамана"] = {class = "SHAMAN", level = 65,}, 
--++ Элементарного ++ 
["Elemental Fury"] = {class = "SHAMAN", level = 10,},
["Точность стихии"] = {class = "SHAMAN", level = 10,},
["Elemental Reach"] = {class = "SHAMAN", level = 10,},
["Шаманизм"] = {class = "SHAMAN", level = 10,},
["Гроза"] = {class = "SHAMAN", level = 10,},
["Rolling Thunder"] = {class = "SHAMAN", level = 20,},
["Fulmination"] = {class = "SHAMAN", level = 20,},
["Элементарный фокус"] = {class = "SHAMAN", level = 40,},
["Лава всплеск"] = {class = "SHAMAN", level = 50},
["Клятва стихий"] = {class = "SHAMAN", level = 55,},
["Землетрясение"] = {class = "SHAMAN", level = 60,},
["Элементаль перегрузки"] = {class = "SHAMAN", level = 80,},
--++ Повышение ++
["Лава ресниц"] = {class = "SHAMAN", level = 10,},
["Острота"] = {class = "SHAMAN", level = 10,},
["Изначальная мудрость"] = {class = "SHAMAN", level = 10,},
["Шквал"] = {class = "SHAMAN", level = 20,},
["Бури"] = {class = "SHAMAN", level = 26,},
["Оружие неистовства"] = {class = "SHAMAN", level = 30,},
["Тлеющее пламя"] = {class = "SHAMAN", level = 34,},
["Статический шок"] = {class = "SHAMAN", level = 40,},
["Огонь Нова"] = {class = "SHAMAN", level = 44,},
["Оружие Водоворота"] = {class = "SHAMAN", level = 50},
["Развязали Rage"] = {class = "SHAMAN", level = 55,},
["Дух зверя"] = {class = "SHAMAN", level = 60,},
["Поступь духа"] = {class = "SHAMAN", level = 60,},
["Расширение элементов"] = {class = "SHAMAN", level = 80,},
--++ Реставрации ++
["Медитация"] = {class = "SHAMAN", level = 10,},
["Очищение"] = {class = "SHAMAN", level = 10,},
["Риптайд"] = {class = "SHAMAN", level = 10,},
["Очищение духа"] = {class = "SHAMAN", level = 18,},
["Волна исцеления"] = {class = "SHAMAN", level = 20,},
["Щит земли"] = {class = "SHAMAN", level = 26,},
["Исцеляющее оружие"] = {class = "SHAMAN", level = 30,},
["Пробуждение предков"] = {class = "SHAMAN", level = 34,},
["Возрождение"] = {class = "SHAMAN", level = 40,},
["Приливной волны"] = {class = "SHAMAN", level = 50},
["Тотем прилива маны"] = {class = "SHAMAN", level = 56,},
["Больше волна исцеления"] = {class = "SHAMAN", level = 60,},
["Дух ссылка Тотем"] = {class = "SHAMAN", level = 70,},
["Глубокое исцеление"] = {class = "SHAMAN", level = 80,}, 
--++ Шаман таланты ++
["Хранитель природы"] = {class = "SHAMAN", level = 15,},
["Каменный оплот Тотем"] = {class = "SHAMAN", level = 15,},
["Астральный сдвиг"] = {class = "SHAMAN", level = 15,}, 
["Замороженные мощности"] = {class = "SHAMAN", level = 30,},
["Хватка Тотем"] = {class = "SHAMAN", level = 30,},
["Windwalk Тотем"] = {class = "SHAMAN", level = 30,}, 
["Вызов элементов"] = {class = "SHAMAN", level = 45,},
["Тотемные сохраняемости"] = {class = "SHAMAN", level = 45,},
["Тотемический проекция"] = {class = "SHAMAN", level = 45,}, 
["Стихий"] = {class = "SHAMAN", level = 60,},
["Предков быстротой"] = {class = "SHAMAN", level = 60,},
["Эхо элементов"] = {class = "SHAMAN", level = 60,}, 
["Бросаясь потоки"] = {class = "SHAMAN", level = 75,},
["Предков руководство"] = {class = "SHAMAN", level = 75,},
["Проводимость"] = {class = "SHAMAN", level = 75,}, 
["Развязали ярость"] = {class = "SHAMAN", level = 90,},
["Primal стихий"] = {class = "SHAMAN", level = 90,},
["Элементаль взрыва"] = {class = "SHAMAN", level = 90,},
 
--++ Чернокнижника способности ++
["Теневой болт"] = {class = "WARLOCK", level = 1},
["Демонические черты"] = {class = "WARLOCK", level = 1,},
["Сифон жизни"] = {class = "WARLOCK", level = 1},
["Вызвать ИМП"] = {class = "WARLOCK", level = 1},
["Коррупция"] = {class = "WARLOCK", level 3,},
["Похищение жизни"] = {class = "WARLOCK", level = 7,},
["Призыв Бездны"] = {class = "WARLOCK", level = 8,},
["Создать инвентаре"] = {class = "WARLOCK", level = 9,},
["Контролировать демона"] = {class = "WARLOCK", level = 10,},
["Здоровье воронка"] = {class = "WARLOCK", level = 11,},
["Страх"] = {class = "WARLOCK", level = 14,},
["Сна"] = {class = "WARLOCK", level = 14,},
["Жизнеотвод"] = {class = "WARLOCK", level = 16,},
["Проклятие Enfeeblement"] = {class = "WARLOCK", level = 17,},
["Камень"] = {class = "WARLOCK", level = 18,},
["Призыв суккуба"] = {class = "WARLOCK", level = 20,},
["Око Килрогга"] = {class = "WARLOCK", level = 22,},
["Бесконечное дыхание"] = {class = "WARLOCK", level = 24,},
["Душа урожай"] = {class = "WARLOCK", level = 27,},
["Вызывать Скверны"] = {class = "WARLOCK", level = 29,},
["Вой террора"] = {class = "WARLOCK", level = 30,},
["Порабощение демона"] = {class = "WARLOCK", level = 31,},
["Изгнать"] = {class = "WARLOCK", level = 32,},
["Сумерки Уорд"] = {class = "WARLOCK", level = 34,},
["Ярость Уорд"] = {class = "WARLOCK", level = 34,},
[" "Доспех Скверны""] = {class = "WARLOCK", level = 38,},
["Ритуал призыва"] = {class = "WARLOCK", level = 42,},
["Вызвать Адская"] = {class = "WARLOCK", level = 49,},
["Nethermancy"] = {class = "WARLOCK", level = 50},
["Проклятие стихий"] = {class = "WARLOCK", level = 51,},
["Команда демона"] = {class = "WARLOCK", level = 56,},
["Вызывать Стражник ужаса"] = {class = "WARLOCK", level = 58,},
["Бесконечной решимость"] = {class = "WARLOCK", level = 64,},
["Раскола"] = {class = "WARLOCK", level = 66,},
["Провокацией"] = {class = "WARLOCK", level = 66,},
["Создать Soulwell"] = {class = "WARLOCK", level = 68,},
["Демонический круг: вызывать "] = {class = "WARLOCK", level = 76,},
["Демонический круг: Телепорт "] = {class = "WARLOCK", level = 76,},
["Пламя Скверны"] = {class = "WARLOCK", level = 77,},
["Темные намерения"] = {class = "WARLOCK", level = 82,},
["Демонический портал"] = {class = "WARLOCK", level = 87,},
["Пандемия"] = {class = "WARLOCK", level = 90,}, 
--++ Символ способности ++
["Темные апофеоз"] = {class = "WARLOCK", level = 25,},
["Imp Рой"] = {class = "WARLOCK", level = 25,},
--++ Специализации чернокнижника ++
--++ Колдовство/уничтожение ++
["Огненный дождь"] = {class = "WARLOCK", level = 21,},
--++ Скорби ++
["Нестабильное колдовство"] = {class = "WARLOCK", level = 10,},
["Drain душа"] = {class = "WARLOCK", level = 19,},
["Горящая"] = {class = "WARLOCK", level = 19,},
["Горящая: здоровье воронка "] = {class = "WARLOCK", level = 27,},
["Проклятие усталости"] = {class = "WARLOCK", level = 32,},
["Агония"] = {class = "WARLOCK", level = 36,},
["Вредный хватка"] = {class = "WARLOCK", level = 42,},
["Темноты"] = {class = "WARLOCK", level = 54,},
["Семя коррупции"] = {class = "WARLOCK", level = 60,},
["Преследовать"] = {class = "WARLOCK", level = 62,},
["Горящая: семя коррупции"] = {class = "WARLOCK", level = 62,},
["Повышение страха"] = {class = "WARLOCK", level = 69,},
["Горящая: проклятие "] = {class = "WARLOCK", level = 73,},
["Душа Swap"] = {class = "WARLOCK", level = 79,},
["Горящая: душа Swap "] = {class = "WARLOCK", level = 79,},
["Мощным скорбей"] = {class = "WARLOCK", level = 80,},
["Dark Soul: Misery "] = {class = "WARLOCK", level = 84,},
["Горящая: Демонический круг: Телепорт "] = {class = "WARLOCK", level = 86,},
--++ Демонологии ++
["Демоническая ярость"] = {class = "WARLOCK", level = 10,},
["Метаморфозы"] = {class = "WARLOCK", level = 10,},
["Демонический прыжок"] = {class = "WARLOCK", level = 12,},
["Душа огня"] = {class = "WARLOCK", level = 13,},
["Рука гул"] = {class = "WARLOCK", level = 19,},
["Hellfire"] = {class = "WARLOCK", level = 22,},
["Метаморфоза: касание хаоса "] = {class = "WARLOCK", level = 25,},
["Пустоты покрытие"] = {class = "WARLOCK", level = 27,},
["Дикие бесы"] = {class = "WARLOCK", level = 32,},
["Метаморфоза: Doom "] = {class = "WARLOCK", level = 36,},
["Вызывать Скверны"] = {class = "WARLOCK", level = 42,},
["Падаль Рой"] = {class = "WARLOCK", level = 47,},
["Демонический возрождение"] = {class = "WARLOCK", level = 54,},
["Метаморфоза: Обжигающий Аура "] = {class = "WARLOCK", level = 62,},
["Метаморфоза: проклят ауры "] = {class = "WARLOCK", level = 67,},
["Огненные недра"] = {class = "WARLOCK", level = 69,},
["Прореживание"] = {class = "WARLOCK", level = 73,},
["Метаморфоза: Волна хаоса"] = {class = "WARLOCK", level = 79,},
["Мастер-демонолог"] = {class = "WARLOCK", level = 80,},
["Dark Soul: знание "] = {class = "WARLOCK", level = 84,},
["Метаморфоза: пустоты "] = {class = "WARLOCK", level = 85,},
--++ Уничтожения ++
["Хаотической энергии"] = {class = "WARLOCK", level = 10,},
["Поджигание"] = {class = "WARLOCK", level = 10,},
["Сжигать"] = {class = "WARLOCK", level = 10,},
["Жертву"] = {class = "WARLOCK", level = 12,},
["Зазор"] = {class = "WARLOCK", level = 32,},
["Хаос"] = {class = "WARLOCK", level = 36,},
["Стрела Хаоса"] = {class = "WARLOCK", level = 42,},
["Уголек Tap"] = {class = "WARLOCK", level = 42,},
["Раскаленные угли"] = {class = "WARLOCK", level = 42,},
["Ожог"] = {class = "WARLOCK", level = 47,},
["Огонь и сера"] = {class = "WARLOCK", level = 54,},
["Последствия"] = {class = "WARLOCK", level = 54,},
["Обратная тяга"] = {class = "WARLOCK", level = 69,},
["Пламя Xoroth"] = {class = "WARLOCK", level = 79,},
["Бушующее"] = {class = "WARLOCK", level = 80,},
["Dark Soul: нестабильность "] = {class = "WARLOCK", level = 84,},
["Пироклазм"] = {class = "WARLOCK", level = 86,},
--++ Таланты чернокнижника ++
["Темные регенерация"] = {class = "WARLOCK", level = 15,},
["Душа пиявки"] = {class = "WARLOCK", level = 15,},
["Урожай жизни"] = {class = "WARLOCK", level = 15,}, 
["Демонический дыхание"] = {class = "WARLOCK", level = 30,},
["Mortal Coil"] = {class = "WARLOCK", level = 30,},
["Shadowfury"] = {class = "WARLOCK", level = 30,}, 
["Связка души"] = {class = "WARLOCK", level = 45,},
["Жертвенных Пакт"] = {class = "WARLOCK", level = 45,},
["Темные сделки"] = {class = "WARLOCK", level = 45,}, 
["Кровь ужас"] = {class = "WARLOCK", level = 60,},
["Горящий Rush"] = {class = "WARLOCK", level = 60,},
["Несвязанные воли"] = {class = "WARLOCK", level = 60,}, 
["Гримуар превосходство"] = {class = "WARLOCK", level = 75,},
["Гримуар сервис"] = {class = "WARLOCK", level = 75,},
["Гримуар жертвоприношения"] = {class = "WARLOCK", level = 75,}, 
["Архимонда тьмы"] = {class = "WARLOCK", level = 90,},
["Джедена хитростью"] = {class = "WARLOCK", level = 90,},
["Ярость Маннорота"] = {class = "WARLOCK", level = 90,}, 
 
--++ Воина способности ++
["Битва позицию"] = {class = "WARRIOR", level = 1},
["Героический удар"] = {class = "WARRIOR", level = 1},
["Заряд"] = {class = "WARRIOR", level 3,},
["Победный раж"] = {class = "WARRIOR", level = 5,},
["Выполнение"] = {class = "WARRIOR", level = 7,},
["Оборонительная стойка"] = {class = "WARRIOR", level = 9,},
["Дразнить"] = {class = "WARRIOR", level = 12,},
["Исступления"] = {class = "WARRIOR", level = 14,},
["Раскол брони"] = {class = "WARRIOR", level = 16,},
["Тандер Клап"] = {class = "WARRIOR", level = 20,},
["Героический бросок"] = {class = "WARRIOR", level = 22,},
["Бить"] = {class = "WARRIOR", level = 24,},
["Разоружить"] = {class = "WARRIOR", level = 28,},
["Глубокие раны"] = {class = "WARRIOR", level = 32,},
["Берсерка"] = {class = "WARRIOR", level = 34,},
["Подрезать сухожилия"] = {class = "WARRIOR", level = 36,},
["Боевой крик"] = {class = "WARRIOR", level = 42,},
["Прилепится"] = {class = "WARRIOR", level = 44,},
["Щит стены"] = {class = "WARRIOR", level = 48,},
["Запугать кричать"] = {class = "WARRIOR", level = 52,},
["Ярость берсерка"] = {class = "WARRIOR", level = 54,},
["Безрассудство"] = {class = "WARRIOR", level = 62,},
["Назови отражение"] = {class = "WARRIOR", level = 66,},
["Командир кричать"] = {class = "WARRIOR", level = 68,},
["Вмешиваться"] = {class = "WARRIOR", level = 72,},
["Сокрушительный бросок"] = {class = "WARRIOR", level = 74,},
--["Ripsote"] = {class = "WARRIOR", level = 76,},--добавил в 5.4 патч, но не активируется так как рыцари смерти также имеют эту способность
["Ралли Крик"] = {class = "WARRIOR", level = 83,},
["Героический прыжок"] = {class = "WARRIOR", level = 85,},
["Деморализующий баннер"] = {class = "WARRIOR", level = 87,},
["Насмешливый баннер"] = {class = "WARRIOR", level = 87,},
["Череп знамя"] = {class = "WARRIOR", level = 87,},
--++ WARRIOR специализация ++
--++ Оружия/ярость ++
["Вихрь"] = {class = "WARRIOR", level = 26,},
["Умереть от меча"] = {class = "WARRIOR", level = 56,},
["Безудержная ярость"] = {class = "WARRIOR", level = 56,},
["Колосс Smash"] = {class = "WARRIOR", level = 81,},
--++ Оружия/защита ++ 
["Кровь и гром"] = {class = "WARRIOR", level = 46,},
--++ Оружия ++
["Смертельный удар"] = {class = "WARRIOR", level = 10,},
["Опытный солдат"] = {class = "WARRIOR", level = 10,},
["Slam"] = {class = "WARRIOR", level = 18,},
["Подавлять"] = {class = "WARRIOR", level = 30,},
["Вкус крови"] = {class = "WARRIOR", level = 30,},
["Потрясающим забастовки"] = {class = "WARRIOR", level = 60,},
["Удары возможности"] = {class = "WARRIOR", level = 80,},
["Внезапная смерть"] = {class = "WARRIOR", level = 81,},
--++ Ярость ++
["Кровожадность"] = {class = "WARRIOR", level = 10,},
["Сумасшедших Берсерк"] = {class = "WARRIOR", level = 10,},
["Дикий удар"] = {class = "WARRIOR", level = 18,},
["Яростный выпад"] = {class = "WARRIOR", level = 30,},
["Титан Grip"] = {class = "WARRIOR", level = 38,},
["Одержимых ярость"] = {class = "WARRIOR", level = 38,},
["Прилив"] = {class = "WARRIOR", level = 50},
["Кливер мяса"] = {class = "WARRIOR", level = 58,},
["Шквал"] = {class = "WARRIOR", level = 60,},
["Эко­ ярость"] = {class = "WARRIOR", level = 80,},
--++ Защита ++ 
["Щит шлема"] = {class = "WARRIOR", level = 10,},
["Непоколебимой Sentinel"] = {class = "WARRIOR", level = 10,},
["Месть"] = {class = "WARRIOR", level = 10,},
["Щит блока"] = {class = "WARRIOR", level = 18,},
["Сокрушение"] = {class = "WARRIOR", level = 26,},
["Месть"] = {class = "WARRIOR", level = 30,},
["Последний стенд"] = {class = "WARRIOR", level = 38,},
["Щит и меч"] = {class = "WARRIOR", level = 50},
["Деморализующий крик"] = {class = "WARRIOR", level = 56,},
["Ультиматум"] = {class = "WARRIOR", level = 58,},
["Бастион обороны"] = {class = "WARRIOR", level = 60,},
["Критический блок"] = {class = "WARRIOR", level = 80,},
["Щит барьер"] = {class = "WARRIOR", level = 81,},
--++ Воин таланты ++
["Джаггернаут"] = {class = "WARRIOR", level = 15,},
["Двойной время"] = {class = "WARRIOR", level = 15,},
["Завоеватель"] = {class = "WARRIOR", level = 15,}, 
["Разъярённый регенерации"] = {class = "WARRIOR", level = 30,},
["Второе дыхание"] = {class = "WARRIOR", level = 30,},
["Надвигающейся победе"] = {class = "WARRIOR", level = 30,}, 
["Ошеломляющие кричать"] = {class = "WARRIOR", level = 45,},
["Пронзительный вой"] = {class = "WARRIOR", level = 45,},
["Нарушая кричать"] = {class = "WARRIOR", level = 45,},
["Клинков"] = {class = "WARRIOR", level = 60,},
["Shockwave"] = {class = "WARRIOR", level = 60,},
["Рев дракона"] = {class = "WARRIOR", level = 60,}, 
["Отражение заклинания массового"] = {class = "WARRIOR", level = 75,},
["Защитных"] = {class = "WARRIOR", level = 75,},
["Бдительность"] = {class = "WARRIOR", level = 75,}, 
["Аватар"] = {class = "WARRIOR", level = 90,},
["Кровавую баню"] = {class = "WARRIOR", level = 90,},
["Шторм болт"] = {class = "WARRIOR", level = 90,}, 
};
