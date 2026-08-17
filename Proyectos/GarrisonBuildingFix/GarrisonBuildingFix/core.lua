-- GarrisonBuildingFix
-- Blizzard_GarrisonBuildingUI.lua:1153 (GarrisonBuildingList_SelectBuilding) puede lanzar
-- "attempt to index field 'info' (a nil value)" si se selecciona un edificio en el instante
-- en que la lista de botones todavia no ha terminado de poblarse con los datos de la guarnicion
-- (carrera de timing, mas frecuente en este servidor que en retail). Esto no lo provoca ningun
-- addon nuestro: GarrisonBuildingList_SelectBuilding es 100% codigo de Blizzard sin hooks encima.
--
-- GarrisonBuildingList_SelectBuilding es una funcion Lua definida dentro del addon
-- LoadOnDemand Blizzard_GarrisonUI, asi que no existe como global hasta que ese addon carga
-- (al abrir la Mesa de Mando). Por eso hay que envolverla tras el evento ADDON_LOADED en vez
-- de al cargar este addon, como hace TauriTrainerFix con la API de entrenadores.

local function WrapSelectBuilding()
	if GarrisonBuildingFix_Wrapped then
		return
	end
	local orig_GarrisonBuildingList_SelectBuilding = GarrisonBuildingList_SelectBuilding
	if not orig_GarrisonBuildingList_SelectBuilding then
		return
	end

	GarrisonBuildingList_SelectBuilding = function(...)
		local ok, err = pcall(orig_GarrisonBuildingList_SelectBuilding, ...)
		if not ok then
			-- Absorbe el error de carrera sin romper la interfaz ni llenar BugSack.
			-- Reintenta en el siguiente frame: para entonces la lista ya deberia
			-- estar poblada y la seleccion se completa con normalidad.
			local args = { ... }
			C_Timer.After(0, function()
				pcall(orig_GarrisonBuildingList_SelectBuilding, unpack(args))
			end)
		end
	end

	GarrisonBuildingFix_Wrapped = true
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
	if addonName == "Blizzard_GarrisonUI" then
		WrapSelectBuilding()
	end
end)

-- Por si Blizzard_GarrisonUI ya estaba cargado antes que nosotros (poco probable
-- al ser LoadOnDemand, pero es gratis comprobarlo).
if GarrisonBuildingList_SelectBuilding then
	WrapSelectBuilding()
end
