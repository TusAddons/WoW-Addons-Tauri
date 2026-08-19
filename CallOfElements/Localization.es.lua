
--[[ ----------------------------------------------------------------

			E S P A \195\177 O L  by Kaie from Estirpe de la Sombra in Minahonda

-------------------------------------------------------------------]]
if( GetLocale() == "esES" ) then
-- Errors
-- -------
COESTR_NOTASHAMAN = "T\195\154 no eres un cham\195\165n. Descargando Llamada de elementos";
COESTR_NOTOTEM = "Ning\195\154n t\195\179tem disponible a\195\154n";
COESTR_UI_NOTASSIGNED = "<Sin texto asignado>";
COESTR_INVALIDELEMENT = "Elemento no v\195\165lido en t\195\179tem: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s acaba en %d segundos";
COESTR_TOTEMEXPIRED = "%s ha expirado";
COESTR_TOTEMDESTROYED = "%s ha sido DESTRUIDO";
COESTR_SWITCHTOSET = "%s t\195\179tem set activado";
COESTR_FIXEDSETS = "Fija el orden de lanzamiento de tus totem sets.";
COESTR_UDATEDSAVED = "Variables Grabadas han sido actualizadas de versi\195\179n ";
COESTR_FIXEDDISPLAY = "Errores en las Variables Grabadas han sido corregidas.";
COESTR_TOTEMSRELOADED = "T\195\179tems recargados";
COESTR_RESTARTINGSET = "Grupo reiniciado";
COESTR_RESET = "Tiempos a 0";
COESTR_HEALCOOLDOWN = " no est\195\165 preparado a\195\154n!";
COESTR_NOHEALING = "No necesita cura";
COESTR_HEALING = "Sanando a %s con %s (Rango %d)";
COESTR_HEALLOWERRANK = "Sin man\195\165 suficiente. Usando rango %d ";
COESTR_HEALOOM = "SIN MAN\195\165!";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "T\195\179tem";
COESTR_TOTEMTOOLS = "Herramientas: T\195\179tem (.*)";
COESTR_TOTEMMANA = "(%d*) p. de man\195\165";
COESTR_TOTEMRANK = "Rango (%d+)";
COESTR_MINUTEDURATION = "(%d%.%d%d) min";
COESTR_MINUTEDURATION_INT = "(%d) min";
COESTR_SECDURATION = "(%d%d?) s.";
COESTR_CASTBYNAME = "%(Rango (%d)%)";
COESTR_TOTEMDAMAGE = { ".+ [crh]+its (.+ T\195\179tem) ?%u* para (%d+).*" };
COESTR_TOTEMHEALTH = { "(%d*) salud" };
COESTR_SHOCKSPELL = "(Choque de %a*)";
COESTR_HEALINGWAVE = "Ola de sanaci\195\179n";
COESTR_LESSERWAVE = "Ola de sanaci\195\179n inferior";
COESTR_MINAMOUNT = "(%d*) a";
COESTR_MAXAMOUNT = "a (%d*)";
COESTR_TRINKET = "^.*%[Esp\195\173ritu de agua enamorado%].*$"; 
COESTR_TOTEMICCALL = "Llamada tot\195\169mica";
COESTR_RANKGSUB = "( [IVX]+)$";

-- Totem Advisor
-- --------------
COESTR_POISON = "Veneno";
COESTR_DISEASE = "Enfermedad";
COESTR_TOTEMPOISON = "T\195\179tem contraveneno";
COESTR_TOTEMDISEASE = "T\195\179tem de limpieza de enfermedades";
COESTR_TOTEMTREMOR = "T\195\179tem de tremor";
COESTR_CLEANSINGTOTEM = "Lanza %s ahora!";

COESTR_TREMOR = {
	"Dormir", "Terror", "Grito Ps\195\173quico", "Control mental", "Bellowing Roar", "Miedo",
	"Grito de intimidaci\195\179n", "Pánico", "Chillido terror\195\173fico", "Seducci\195\179n",
	"Aullido de Terror", "Gru\195\177ido de intimidaci\195\179", "Sue\195\177o Cristalino", "Sue\195\177o de Druida"
}


-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "de tierra";
COESTR_TOTEMTOOLS_FIRE = "de fuego";
COESTR_TOTEMTOOLS_WATER = "de agua";
COESTR_TOTEMTOOLS_AIR = "de aire";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "Tierra";
COESTR_ELEMENT_FIRE = "Fuego";
COESTR_ELEMENT_WATER = "Agua";
COESTR_ELEMENT_AIR = "Aire";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "Cierra";
COE_ConfigTotemTabPanel = "Opciones T\195\179tem";
COE_ConfigHealingTabPanel = "Opciones Curaci\195\179n";
COE_ConfigDebuffTabPanel = "Opciones Debuff";
COE_ConfigTotemTotemBar = "Barras T\195\179tem";
COE_ConfigTotemTotemOptions = "Opciones";
COE_ConfigTotemTotemSets = "Totem Grupos";
COE_OptionEnableTotemBar = "Activa Barra T\195\179tem";
COE_OptionHideBackdrop = "Ocultar en inactivo";
COE_OptionEnableTimers = "Activa cronos";
COE_OptionEnableTimerNotifications = "Activa notificaciones";
COE_OptionTTAlignment = "Globos de ayuda";
COE_OptionDisplayMode = "Bot\195\179n Anclado";
COE_OptionDisplayAlignment = "Bot\195\179n alineaci\195\179n";
COE_OptionAdvisor = "Activa avisador t\195\179tems";
COE_OptionEnableSets = "Activa t\195\179tem Grupos";
COE_OptionEnableAutoSwitch = "Autocambia Grupos en JCJ";
COE_OptionActiveSet = "Activa t\195\179tem Grupo";
COE_OptionNewSet = "Nuevo Grupo";
COE_OptionDeleteSet = "Borra Grupo";
COE_OptionConfigureSet = "Configura Grupo";
COE_OptionStopConfigureSet = "OK";
COE_OptionCastOrderString = "Orden de \nlanzamiento";
COE_OptionConfigureBar = "Configura T\195\179tems";
COE_OptionFixBar = "Fija posici\195\179n barra t\195\179tem";
COE_OptionConfigureOrder = "Configura Orden";
COE_OptionScanTotems = "Recarga T\195\179tems";
COE_OptionCurrentFrame = "Configura Barra";
COE_OptionDirection = "Direcci\195\179n";
COE_OptionFrameMode = "Modo Barra";
COE_OptionFlexCount = "Botones est\195\165ticos";
COE_OptionScaling = "Escala";
COE_OptionEnableTimerFrame = "Muestra crono separado";
COE_OptionGroupBars = "Mover barras en conjunto";
COE_OptionOverrideRank = "Modificador Rango 1";
COE_OptionFrameTimersOnly = "Muestra crono SOLO en iconos";
COE_OptionScalingTimers = "Escala Cronos";
COE_OptionDisableTTCombat = "Disable tooltips in combat";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "Muestra las opciones de t\195\179tem";
COE_ConfigHealingTab = "Muestra las opcones de curaci\195\179n";
COE_ConfigDebuffTab = "Muestra las opciones de debuff";
COE_OptionEnableTotemBar = "Activa y muestra la barra t\195\179tem\nque mantiene todos los t\195\179tems\ndisponibles para uso rapido";
COE_OptionHideBackdrop = "Oculta icono cuando el rat\195\179n\nno está sobre la barra";
COE_OptionEnableTimers = "Muestra el icono del\ntiempo que queda dentro del bot\195\179n";
COE_OptionEnableTimerNotifications = "Muestra avisos cuando un t\195\179tem\nexpira o es destruido";
COE_OptionAdvisor = "Muestra notificaciones cuando t\195\154 o \nun miembro de tu grupo/raid\ntiene un efecto que puede ser curado\npor uno de tus t\195\179tems";
COE_OptionEnableAutoSwitch = "Autom\195\161ticamente cambia al\nt\195\179tem Grupo de clase cuando\nseleccionas un enemigo";
COE_OptionFixBar = "Fija la posici\195\179n de la barra de t\195\179tems\npara prevenir desplazamientos accidentales";
COE_OptionGroupBars = "Cuando desplazas una barra,\nlas otras le siguen";
COE_OptionDisableTTCombat = "Disable tooltips in combat";
}

COESTR_TRINKET_TOOLTIP = "Esp\195\173ritu de agua enamorado"; 
COESTR_TRINKET_TOTEM = "T\195\179tem Marea de man\195\161";

-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "Arriba Izquierda" };
{ "ANCHOR_LEFT"; "Izquierda" };
{ "ANCHOR_BOTTOMLEFT"; "Abajo Izquierda" }; 
{ "ANCHOR_TOPRIGHT"; "Arriba Derecha" };
{ "ANCHOR_RIGHT"; "Derecha" };
{ "ANCHOR_BOTTOMRIGHT"; "Abajo Derecha" };
{ "DISABLED"; "Deshabilita" };
}

COEUI_DISPLAYMODE = { "Seleccionado", "S\195\179lo Contadores", "Activar Grupo" }
 
COEUI_DISPLAYALIGN = { "Cuadro", "Vertical", "Horizontal" }

COEUI_PVPSETS = { "[PVP] Druida", "[PVP] Cazador", "[PVP] Mago", "[PVP] Palad\195\173n", "[PVP] Sacerdote", 
	"[PVP] P\195\173caro", "[PVP] Cham\195\165n", "[PVP] Brujo", "[PVP] Guerrero" }
COEUI_DEFAULTSET = "Por Defecto";

COEUI_OVERRIDERANK = { "Sin Tecla", "Usar SHIFT", "Usar ALT", "Usar CTRL" };

COEUI_CURRENTFRAME = { "Tierra", "Fuego", "Agua", "Aire" };

COEUI_DIRECTION = { "Arriba", "Abajo", "Izquierda", "Derecha" };

COEUI_FRAMEMODE = { "Cerrado", "Abierto", "Flexible", "Oculto" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "Muestra el cuadro de configuraci\195\179n";
BINDING_NAME_COEBESTHEAL = "Mejor Cura";
BINDING_NAME_COEBATTLEHEAL = "Cura de Batalla";
BINDING_NAME_COETHROWADVISED = "Lanza el t\195\179tem avisado";
BINDING_NAME_COENEXTSET = "Activa el siguiente totem Grupo";
BINDING_NAME_COEDROPSET = "Abre sub-menu para el Grupo activo";
BINDING_NAME_COEDROPSET2 = "Open sub-menu for the blizzard frame totem sets";
BINDING_NAME_COETHROWSET = "Lanza el totem Grupo activo";
BINDING_NAME_COERESTARTSET = "Reinicia el Grupo activo";
BINDING_NAME_TOTEMEARTH1 = "T\195\179tem de Tierra #1";
BINDING_NAME_TOTEMEARTH2 = "T\195\179tem de Tierra #2";
BINDING_NAME_TOTEMEARTH3 = "T\195\179tem de Tierra #3";
BINDING_NAME_TOTEMEARTH4 = "T\195\179tem de Tierra #4";
BINDING_NAME_TOTEMEARTH5 = "T\195\179tem de Tierra #5";
BINDING_NAME_TOTEMEARTH6 = "T\195\179tem de Tierra #6";
BINDING_NAME_TOTEMEARTH7 = "T\195\179tem de Tierra #7";
BINDING_NAME_TOTEMEARTH8 = "T\195\179tem de Tierra #8";
BINDING_NAME_TOTEMEARTH9 = "T\195\179tem de Tierra #9";
BINDING_NAME_TOTEMFIRE1 = "T\195\179tem de Fuego #1";
BINDING_NAME_TOTEMFIRE2 = "T\195\179tem de Fuego #2";
BINDING_NAME_TOTEMFIRE3 = "T\195\179tem de Fuego #3";
BINDING_NAME_TOTEMFIRE4 = "T\195\179tem de Fuego #4";
BINDING_NAME_TOTEMFIRE5 = "T\195\179tem de Fuego #5";
BINDING_NAME_TOTEMFIRE6 = "T\195\179tem de Fuego #6";
BINDING_NAME_TOTEMFIRE7 = "T\195\179tem de Fuego #7";
BINDING_NAME_TOTEMFIRE8 = "T\195\179tem de Fuego #8";
BINDING_NAME_TOTEMFIRE9 = "T\195\179tem de Fuego #9";
BINDING_NAME_TOTEMWATER1 = "T\195\179tem de Agua #1";
BINDING_NAME_TOTEMWATER2 = "T\195\179tem de Agua #2";
BINDING_NAME_TOTEMWATER3 = "T\195\179tem de Agua #3";
BINDING_NAME_TOTEMWATER4 = "T\195\179tem de Agua #4";
BINDING_NAME_TOTEMWATER5 = "T\195\179tem de Agua #5";
BINDING_NAME_TOTEMWATER6 = "T\195\179tem de Agua #6";
BINDING_NAME_TOTEMWATER7 = "T\195\179tem de Agua #7";
BINDING_NAME_TOTEMWATER8 = "T\195\179tem de Agua #8";
BINDING_NAME_TOTEMWATER9 = "T\195\179tem de Agua #9";
BINDING_NAME_TOTEMAIR1 = "T\195\179tem de Aire #1";
BINDING_NAME_TOTEMAIR2 = "T\195\179tem de Aire #2";
BINDING_NAME_TOTEMAIR3 = "T\195\179tem de Aire #3";
BINDING_NAME_TOTEMAIR4 = "T\195\179tem de Aire #4";
BINDING_NAME_TOTEMAIR5 = "T\195\179tem de Aire #5";
BINDING_NAME_TOTEMAIR6 = "T\195\179tem de Aire #6";
BINDING_NAME_TOTEMAIR7 = "T\195\179tem de Aire #7";
BINDING_NAME_TOTEMAIR8 = "T\195\179tem de Aire #8";
BINDING_NAME_TOTEMAIR9 = "T\195\179tem de Aire #9";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "CTRL";
COEMODIFIER_CTRL_SHORT = "C";
COEMODIFIER_SHIFT = "MAY\195\154S";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Comandos disponibles para Call Of Elements:";
COESHELL_CONFIG = "'/coe' or '/coe config' - Muestra la configuraci\195\179n";
COESHELL_LIST = "'/coe list' - Muestra esta lista";
COESHELL_NEXTSET = "'/coe nexset' - Cambia al siguiente t\195\179tem Grupo o al normal";
COESHELL_PRIORSET = "'/coe priorset' - Cambia al anterior totem Grupo o al normal";
COESHELL_SET = "'/coe set <name>' - Cambia al t\195\179tem Grupo con el nombre espec\195\173fico. <name> respeta may\195\154sculas";
COESHELL_RESTARTSET = "'/coe restartset' - Siguente vez lanzas el Grupo activo, relanza todos los t\195\179tems";
COESHELL_RESET = "'/coe reset' - Reinicia todos los contadores y Grupos activos";
COESHELL_RESETFRAMES = "'/coe resetframes' - Retorna todos las barras al centro de la pantalla";
COESHELL_RESETORDERING = "'/coe resetordering' - Restaura el orden de las barras de t\195\179tem";
COESHELL_RELOAD = "'/coe reload' - Recarga todos los t\195\179tems y Grupos";
COESHELL_MACRONOTE = "El siguiente comando s\195\179lo funciona cuando es arrastrado a tus barras de acci\195\179n:";
COESHELL_THROWSET = "'/coe throwset' - Lanza el totem Grupo activo ++obsoleto++";
COESHELL_ADVISED = "'/coe advised' - Lanza el siguiente t\195\179tem avisado";

end

-- á \195\161 
-- é \195\169
-- í \195\173
-- ó \195\179
-- ú \195\154
-- ñ \195\177