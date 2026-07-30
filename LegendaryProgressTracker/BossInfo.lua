
function LPT:initializeBoss()	
	bosses = {}
	
	--LFR
	bosses[17] = {
		--Antorus
		[2063] = true, --Aggramar
		[2070] = true, --Antorus War Council
		[2092] = true, --Argus the Unmaker
		[2075] = true, --Eonar
		[2076] = true, --Garothi
		[2064] = true, --Hasabel
		[2074] = true, --Hounds
		[2082] = true, --Imonar
		[2088] = true, --Kin'garoth
		[2073] = true, --Shivarra Coven
		[2069] = true, --Varimathras
		
		--TOS
		[2032] = true, --Goroth
		[2048] = true, --Inq
		[2036] = true, --Harj
		[2037] = true, --Mistress
		[2050] = true, --Sisters
		[2054] = true, --Host
		[2052] = true, --Maiden
		[2038] = true, --Avatar
		[2051] = true, --KJ
		
		--NH
		[1849] = true, --Skorpyron
		[1865] = true, --Chrono
		[1867] = true, --Trilliax
		[1871] = true, --Spellblade
		[1842] = true, --Krosus
		[1862] = true, --Tich
		[1863] = true, --Star Augur
		[1886] = true, --Botanist
		[1872] = true, --Elisande
		[1866] = true, --Guldan
		
		--ToV
		[1958] = true, --Odyn
		[1962] = true, --Guarm
		[2008] = true, --Helya
		
		--EN
		[1853] = true, --Nythendra
		[1873] = true, --Ilgynoth
		[1841] = true, --Ursoc
		[1876] = true, --Spider
		[1854] = true, --Double dragons
		[1877] = true, --Cenarius
		[1864] = true --Xavius
		}
	--Normal
	bosses[14] = {
		--Antorus
		[2063] = true, --Aggramar
		[2070] = true, --Antorus War Council
		[2092] = true, --Argus the Unmaker
		[2075] = true, --Eonar
		[2076] = true, --Garothi
		[2064] = true, --Hasabel
		[2074] = true, --Hounds
		[2082] = true, --Imonar
		[2088] = true, --Kin'garoth
		[2073] = true, --Shivarra Coven
		[2069] = true, --Varimathras
		--TOS
		[2032] = true, --Goroth
		[2048] = true, --Inq
		[2036] = true, --Harj
		[2037] = true, --Mistress
		[2050] = true, --Sisters
		[2054] = true, --Host
		[2052] = true, --Maiden
		[2038] = true, --Avatar
		[2051] = true, --KJ
		
		--NH
		[1849] = true, --Skorpyron
		[1865] = true, --Chrono
		[1867] = true, --Trilliax
		[1871] = true, --Spellblade
		[1842] = true, --Krosus
		[1862] = true, --Tich
		[1863] = true, --Star Augur
		[1886] = true, --Botanist
		[1872] = true, --Elisande
		[1866] = true, --Guldan
		
		--ToV
		[1958] = true, --Odyn
		[1962] = true, --Guarm
		[2008] = true, --Helya
		
		--EN
		[1853] = true, --Nythendra
		[1873] = true, --Ilgynoth
		[1841] = true, --Ursoc
		[1876] = true, --Spider
		[1854] = true, --Double dragons
		[1877] = true, --Cenarius
		[1864] = true --Xavius
		}
	--Heroic
	bosses[15] = {
		--Antorus
		[2063] = true, --Aggramar
		[2070] = true, --Antorus War Council
		[2092] = true, --Argus the Unmaker
		[2075] = true, --Eonar
		[2076] = true, --Garothi
		[2064] = true, --Hasabel
		[2074] = true, --Hounds
		[2082] = true, --Imonar
		[2088] = true, --Kin'garoth
		[2073] = true, --Shivarra Coven
		[2069] = true, --Varimathras
		--TOS
		[2032] = true, --Goroth
		[2048] = true, --Inq
		[2036] = true, --Harj
		[2037] = true, --Mistress
		[2050] = true, --Sisters
		[2054] = true, --Host
		[2052] = true, --Maiden
		[2038] = true, --Avatar
		[2051] = true, --KJ
		
		--NH
		[1849] = true, --Skorpyron
		[1865] = true, --Chrono
		[1867] = true, --Trilliax
		[1871] = true, --Spellblade
		[1842] = true, --Krosus
		[1862] = true, --Tich
		[1863] = true, --Star Augur
		[1886] = true, --Botanist
		[1872] = true, --Elisande
		[1866] = true, --Guldan
		
		--ToV
		[1958] = true, --Odyn
		[1962] = true, --Guarm
		[2008] = true, --Helya
		
		--EN
		[1853] = true, --Nythendra
		[1873] = true, --Ilgynoth
		[1841] = true, --Ursoc
		[1876] = true, --Spider
		[1854] = true, --Double dragons
		[1877] = true, --Cenarius
		[1864] = true --Xavius
		}
	--Mythic
	bosses[16] = {
		--Antorus
		[2063] = true, --Aggramar
		[2070] = true, --Antorus War Council
		[2092] = true, --Argus the Unmaker
		[2075] = true, --Eonar
		[2076] = true, --Garothi
		[2064] = true, --Hasabel
		[2074] = true, --Hounds
		[2082] = true, --Imonar
		[2088] = true, --Kin'garoth
		[2073] = true, --Shivarra Coven
		[2069] = true, --Varimathras
		--TOS
		[2032] = true, --Goroth
		[2048] = true, --Inq
		[2036] = true, --Harj
		[2037] = true, --Mistress
		[2050] = true, --Sisters
		[2054] = true, --Host
		[2052] = true, --Maiden
		[2038] = true, --Avatar
		[2051] = true, --KJ
		
		--NH
		[1849] = true, --Skorpyron
		[1865] = true, --Chrono
		[1867] = true, --Trilliax
		[1871] = true, --Spellblade
		[1842] = true, --Krosus
		[1862] = true, --Tich
		[1863] = true, --Star Augur
		[1886] = true, --Botanist
		[1872] = true, --Elisande
		[1866] = true, --Guldan
		
		--ToV
		[1958] = true, --Odyn
		[1962] = true, --Guarm
		[2008] = true, --Helya
		
		--EN
		[1853] = true, --Nythendra
		[1873] = true, --Ilgynoth
		[1841] = true, --Ursoc
		[1876] = true, --Spider
		[1854] = true, --Double dragons
		[1877] = true, --Cenarius
		[1864] = true --Xavius
		}
		--Mythic 0
		bosses[23] = {
		--BRH
		[1832] = true, --Amalgam
		[1833] = true, --Illysanna
		[1835] = true, --Kurtalos
		[1834] = true, --Smashspite
		
		--CoEN
		[2055] = true, --Agronox
		[2053] = true, --Domatrax
		[2039] = true, --Mephistroph
		[2057] = true, --Trashbite
		
		--CoS
		[1868] = true, --Gerdo
		[1870] = true, --Melandrus
		[1869] = true, --Talixae
		
		--DHT
		[1838] = true, --Dresaron
		[1836] = true, --Glaidalis
		[1837] = true, --Oakheart
		[1839] = true, --Shade of Xavius
		
		--EoA
		[1811] = true, --Hatecoil
		[1812] = true, --Deepbeard
		[1810] = true, --Parjesh
		[1813] = true, --Serpendrix
		[1814] = true, --Wrath
		
		--HoV
		[1807] = true, --Fenryr
		[1805] = true, --Hymdall
		[1806] = true, --Hyrja
		[1808] = true, --Skovald
		[1809] = true, --Odyn
		
		--MoS
		[1823] = true, --Hebaron
		[1824] = true, --Helya
		[1822] = true, --Ymiron
		
		--Nelths
		[1793] = true, --Dargul
		[1792] = true, --Naraxus
		[1790] = true, --Rokmora
		[1791] = true, --Ularogg
		
		--Upper Kara
		[1964] = true, --Curator
		[1965] = true, --Medivh
		[1959] = true, --Mana Devourer
		[2017] = true, --Vizaduum
		
		--Lower Kara
		[1960] = true, --Attumen
		[1954] = true, --Maiden
		[1961] = true, --Moroes
		[2031] = true, --Nightbane
		[1957] = true, --Opera Beast
		[1957] = true, --Opera Westfall
		[1957] = true, --Opera Wickett
		
		--Seat
		[2068] = true, --Lura
		[2066] = true, --Saprish
		[2067] = true, --Viceroy
		[2065] = true, --Zuraal
		
		--Arcway
		[1825] = true, --Corstilax
		[1828] = true, --General
		[1827] = true, --Ivanyr
		[1826] = true, --Naltira
		[1829] = true, --Vandros
		
		--VoTW
		[1816] = true, --Ash Golem
		[1818] = true, --Cordana
		[1817] = true, --Glazer
		[1815] = true, --Tirathon
		[1850] = true, --Tormentorum
		
		--VH
		[1852] = true, --Anubesset
		[1856] = true, --Fel Lord
		[1848] = true, --Festerface
		[1847] = true, --Manastorm
		[1846] = true, --Mindflayer
		[1855] = true, --Princess Thalena
		[1851] = true, --Saelorn
		[1845] = true --Shivermaw
		
		}
		
		bosses["lastGreaterInvasion"] = 0
end

LPTisleRares = {
	[117096] = { --Potionmaster Gloop
		["questId"] = 46094
	},
	[119718] = { --Imp Mother Bruva
		["questId"] = 46313
	},
	[121134] = { --Duke Sithizi
		["questId"] = 47036
	},
	[121046] = { --Brother Badatin
		["questId"] = 47001
	},
	[120998] = { --Flllurlokkr
		["questId"] = 46951
	},
	[121112] = { --Somber Dawn
		["questId"] = 47028
	},
	[121029] = { --Brood Mother Nix
		["questId"] = 46965
	},
	[121107] = { --Lady Eldrathe
		["questId"] = 47026
	},
	[117136] = { --Doombringer Zar'thoz
		["questId"] = 46097
	},
	[117103] = { --Felcaller Zelthae
		["questId"] = 46102
	},
	[117086] = { --Emberfire
		["questId"] = 46093
	},
	[117091] = { --Felmaw Emberfiend
		["questId"] = 46095
	},
	[119629] = { --Lord Hel'Nurath
		["questId"] = 46304
	},
	[117093] = { --Felbringer Xar'thok
		["questId"] = 46099
	},
	[121037] = { --Grossir
		["questId"] = 46995
	},
	[117089] = { --Inquisitor Chillbane
		["questId"] = 46096
	},
	[117095] = { --Dreadblade Annihilator
		["questId"] = 46098
	},
	[117141] = { --Malgrazoth
		["questId"] = 46090
	},
	[121016] = { --Aqueux
		["questId"] = 46953
	},
	[117140] = { --Salethan the Broodwalker
		["questId"] = 46091
	},
	[118993] = { --Dreadeye
		["questId"] = 46202
	},
	[117090] = { --Xorogun the Flamecarver
		["questId"] = 46100
	},
	[117094] = { --Malorus the Soulkeeper
		["questId"] = 46092
	},
	[116166] =  { --Eye of Gurgh
		["questId"] = 47068
	},
	[116953] = { --Corrupted Bonebreaker
		["questId"] = 46101
	}
}

LPTargusRares = {
	[123689] = { --Talestra the Vile
		["questId"] = 48628
	},
	[125820] = { --Imp Mother Laglath
		["questId"] = 48666
	},
	[122912] = { --Commander Sathrenael
		["questId"] = 48562
	},
	[124775] = { --Commander Endaxis
		["questId"] = 48564
	},
	[124804] = { --Tereck the Selector
		["questId"] = 48664
	},
	[125479] = { --Tar Spitter
		["questId"] = 48665
	},
	[120393] = { --Siegemaster Voraan
		["questId"] = 48627
	},
	[125388] = { --Vagath the Betrayed
		["questId"] = 48629
	},
	[123464] = { --Sister Subversia
		["questId"] = 48565
	},
	[126419] = { --Naroua
		["questId"] = 48667
	},
	[125824] = { --Khazaduum
		["questId"] = 48561
	},
	[127288] = { --Houndmaster Kerrax
		["questId"] = 48821
	},
	[126040] = { --Puscilla
		["questId"] = 48809
	},
	[127705] = { --Mother Rosula
		["questId"] = 48970
	},
	[127376] = { --Chief Alchemist Munculus
		["questId"] = 48865
	},
	[122999] = { --Gar'zoth
		["questId"] = 49241
	},
	[127090] = { --Admiral Rel'var
		["questId"] = 48817
	},
	[127096] = { --All-Seer Xanarian
		["questId"] = 48818
	},
	[122958] = { --Blistermaw
		["questId"] = 49183
	},
	[126199] = { --Vrax'thul
		["questId"] = 48810
	},
	[126115] = { --Ven'orn
		["questId"] = 48811
	},
	[126208] = { --Varga
		["questId"] = 48812
	},
	[126338] = { --Wrath-Lord Yarez
		["questId"] = 48814
	},
	[127118] = { --WorldSplitter Skuul
		["questId"] = 48820
	},
	[126254] = { --Lieutenant Xakaar
		["questId"] = 48813
	},
	[127581] = { --The Many-Faced Devourer
		["questId"] = 48966
	},
	[122947] = { --Mistress Il'thendra
		["questId"] = 49240
	},
	[127703] = { --Doomcaster Suprax
		["questId"] = 48968
	},
	[127700] = { --Squadron Commander Vishax
		["questId"] = 48967
	},
	[127300] = { --Void Warden Valsuran
		["questId"] = 48824
	},
	[127084] = { --Commander Texlaz
		["questId"] = 48816
	},
	[127706] = { --Rezira the Seer
		["questId"] = 48971
	},
	[126867] = { --Venomtail Skyfin
		["questId"] = 48705
	},
	[126860] = { --Kaara The Pale
		["questId"] = 48697
	},
	[126869] = { --Captain Faruq
		["questId"] = 48707
	},
	[126912] = { --Skreeg the devourer
		["questId"] = 48721
	},
	[124440] = { --Overseer Y'Beda
		["questId"] = 48714
	},
	[126913] = { --Slithon the last
		["questId"] = 48935
	},
	[126899] = { --Jed'hin Champion Vorusk
		["questId"] = 48713
	},
	[127291] = { --Watcher Aival
		["questId"] = 48822
	},
	[122911] = { --Commander Vecaya
		["questId"] = 48563
	},
	[126946] = { --Inquisitor Vethroz
		["questId"] = 48815
	},
	[126866] = { --Vigilant Kuro
		["questId"] = 48704
	},
	[126908] = { --Zul'tan the Numerous
		["questId"] = 48719
	},
	[126862] = { --Baruut the Bloodthirsty
		["questId"] = 48700
	},
	[126896] = { --Herald of Chaos
		["questId"] = 48711
	},
	[126865] = { --Vigilant Thanos
		["questId"] = 48703
	},
	[126900] = { --Instructor Tarahna
		["questId"] = 48718
	},
	[126852] = { --Wrangler Kravos
		["questId"] = 48695
	},
	[126887] = { --Ataxon
		["questId"] = 48709
	},
	[126868] = { --Turek the Lucid
		["questId"] = 48706
	},
	[125498] = { --Overseer Y'Morna
		["questId"] = 48717
	},
	[126864] = { --Feasel the Muffin Thief
		["questId"] = 48702
	},
	[126815] = { --Soultwisted Monstrosity
		["questId"] = 48693
	},
	[125497] = { --Overseer Y'Sorna
		["questId"] = 48716
	},
	[126898] = { --Sabuul
		["questId"] = 48712
	},
	[126910] = { --Commander Xethgar
		["questId"] = 48720
	},
	[122838] = { --Shadowcaster Voruun
		["questId"] = 48692
	},
	[126885] = { --Umbraliss
		["questId"] = 48708
	},
	[126889] = { --Sorolis the Ill-Fated
		["questId"] = 48710
	}
}

function LPT:setArgusRares()
	for i,id in pairs(LPTargusRares) do
		LPTargusRares[i]["killed"] = IsQuestFlaggedCompleted(id["questId"])
	end
end

function LPT:setIslandRares()
	for i,id in pairs(LPTisleRares) do
		LPTisleRares[i]["killed"] = IsQuestFlaggedCompleted(id["questId"])
	end
end
--[[
function LPT:setArgusRares()
	local count = 0
	
	if argusRares == nil then
		argusRares = {}
	end
	
	if IsQuestFlaggedCompleted(48628) then --Talestra the Vile
		argusRares[123689] = false
		count = count + 1
	else
		argusRares[123689] = true
	end
	
	if IsQuestFlaggedCompleted(48666) then --Imp Mother Laglath
		argusRares[125820] = false
		count = count + 1
	else
		argusRares[125820] = true
	end
	
	if IsQuestFlaggedCompleted(48562) then --Commander Sathrenael
		argusRares[122912] = false
		count = count + 1
	else
		argusRares[122912] = true
	end
	
	if IsQuestFlaggedCompleted(48564) then --Commander Endaxis
		argusRares[124775] = false
		count = count + 1
	else
		argusRares[124775] = true
	end
	
	if IsQuestFlaggedCompleted(48664) then --Tereck the Selector
		argusRares[124804] = false
		count = count + 1
	else
		argusRares[124804] = true
	end
	
	if IsQuestFlaggedCompleted(48665) then --Tar Spitter
		argusRares[125479] = false
		count = count + 1
	else
		argusRares[125479] = true
	end
	
	if IsQuestFlaggedCompleted(48627) then --Siegemaster Voraan
		argusRares[120393] = false
		count = count + 1
	else
		argusRares[120393] = true
	end
	
	if IsQuestFlaggedCompleted(48629) then --Vagath the Betrayed
		argusRares[125388] = false
		count = count + 1
	else
		argusRares[125388] = true
	end
	
	if IsQuestFlaggedCompleted(48565) then --Sister Subversia
		argusRares[123464] = false
	else
		argusRares[123464] = true
		count = count + 1
	end
	
	if IsQuestFlaggedCompleted(48667) then --Naroua
		argusRares[126419] = false
		count = count + 1
	else
		argusRares[126419] = true
	end
	
	if IsQuestFlaggedCompleted(48561) then --Khazaduum
		argusRares[125824] = false
		count = count + 1
	else
		argusRares[125824] = true
	end
	
	if IsQuestFlaggedCompleted(48821) then --Houndmaster Kerrax
		argusRares[127288] = false
		count = count + 1
	else
		argusRares[127288] = true
	end
	
	if IsQuestFlaggedCompleted(48809) then --Puscilla
		argusRares[126040] = false
		count = count + 1
	else
		argusRares[126040] = true
	end
	
	if IsQuestFlaggedCompleted(48970) then --Mother Rosula
		argusRares[127705] = false
		count = count + 1
	else
		argusRares[127705] = true
	end
	
	if IsQuestFlaggedCompleted(48865) then --Chief Alchemist Munculus"
		argusRares[127376] = false
		count = count + 1
	else
		argusRares[127376] = true
	end
	
	if IsQuestFlaggedCompleted(48815) then --Inquisitor Vethroz
		argusRares[126946] = false
		count = count + 1
	else
		argusRares[126946] = true
	end
	
	if IsQuestFlaggedCompleted(49241) then --Gar'zoth
		argusRares[122999] = false
		count = count + 1
	else
		argusRares[122999] = true
	end
	
	if IsQuestFlaggedCompleted(48817) then --Admiral Rel'var
		argusRares[127090] = false
		count = count + 1
	else
		argusRares[127090] = true
	end
	
	if IsQuestFlaggedCompleted(48818) then --All-Seer Xanarian
		argusRares[127096] = false
		count = count + 1
	else
		argusRares[127096] = true
	end
	
	if IsQuestFlaggedCompleted(49183) then --Blistermaw
		argusRares[122958] = false
		count = count + 1
	else
		argusRares[122958] = true
	end
	
	if IsQuestFlaggedCompleted(48810) then --Vrax'thul
		argusRares[126199] = false
		count = count + 1
	else
		argusRares[126199] = true
	end
	
	if IsQuestFlaggedCompleted(48811) then --Ven'orn
		argusRares[126115] = false
		count = count + 1
	else
		argusRares[126115] = true
	end
	
	if IsQuestFlaggedCompleted(48812) then --Varga
		argusRares[126208] = false
		count = count + 1
	else
		argusRares[126208] = true
	end
	
	if IsQuestFlaggedCompleted(48814) then --Wrath-Lord Yarez
		argusRares[126338] = false
		count = count + 1
	else
		argusRares[126338] = true
	end
	
	if IsQuestFlaggedCompleted(48820) then --WorldSplitter Skuul
		argusRares[127118] = false
		count = count + 1
	else
		argusRares[127118] = true
	end
	
	if IsQuestFlaggedCompleted(48813) then --Lieutenant Xakaar
		argusRares[126254] = false
		count = count + 1
	else
		argusRares[126254] = true
	end
	
	if IsQuestFlaggedCompleted(48966) then --The Many-Faced Devourer
		argusRares[127581] = false
		count = count + 1
	else
		argusRares[127581] = true
	end
	
	if IsQuestFlaggedCompleted(49240) then --Mistress Il'thendra"
		argusRares[122947] = false
		count = count + 1
	else
		argusRares[122947] = true
	end
	
	if IsQuestFlaggedCompleted(48968) then --Doomcaster Suprax
		argusRares[127703] = false
		count = count + 1
	else
		argusRares[127703] = true
	end
	
	if IsQuestFlaggedCompleted(48967) then --Squadron Commander Vishax
		argusRares[127700] = false
		count = count + 1
	else
		argusRares[127700] = true
	end
	
	if IsQuestFlaggedCompleted(48824) then --Void Warden Valsuran
		argusRares[127300] = false
		count = count + 1
	else
		argusRares[127300] = true
	end
	
	if IsQuestFlaggedCompleted(48816) then --Commander Texlaz
		argusRares[127084] = false
		count = count + 1
	else
		argusRares[127084] = true
	end
	
	if IsQuestFlaggedCompleted(48971) then --Rezira the Seer
		argusRares[127706] = false
		count = count + 1
	else
		argusRares[127706] = true
	end
	
	if IsQuestFlaggedCompleted(48705) then --Venomtail Skyfin
		argusRares[126867] = false
		count = count + 1
	else
		argusRares[126867] = true
	end
	
	if IsQuestFlaggedCompleted(48697) then --Kaara The Pale
		argusRares[126860] = false
		count = count + 1
	else
		argusRares[126860] = true
	end
	
	if IsQuestFlaggedCompleted(48707) then --Captain Faruq
		argusRares[126869] = false
		count = count + 1
	else
		argusRares[126869] = true
	end
	
	if IsQuestFlaggedCompleted(48721) then --Skreeg the devourer
		argusRares[126912] = false
		count = count + 1
	else
		argusRares[126912] = true
	end
	
	if IsQuestFlaggedCompleted(48714) then --Overseer Y'Beda
		argusRares[124440] = false
		count = count + 1
	else
		argusRares[124440] = true
	end
	
	if IsQuestFlaggedCompleted(48935) then --Slithon the last
		argusRares[126913] = false
		count = count + 1
	else
		argusRares[126913] = true
	end
	
	if IsQuestFlaggedCompleted(48713) then --Jed'hin Champion Vorusk
		argusRares[126899] = false
		count = count + 1
	else
		argusRares[126899] = true
	end
	
	return count
end]]--

