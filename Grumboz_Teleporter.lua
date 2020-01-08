-- Creator Info :
-- by slp13at420
-- Designed For Mangos Eluna
-- Start Date : 01/01/2020
-- Finish Date : 01/04/2020
-- Dev point : Scripting Complete
-- Release Stage : open Beta testing - READY
-- Version : V 2.0
--
-- look out Mangos .., Grumbo'z Coming ! RUN !!!
--
-- Emulator Support Info :
-- EMU : Mangos
-- Type : Eluna script
-- Build : auto-adaptive <= 15595 (5875, 8606, 12340, 15595) will auto adapt to future builds.
-- included Map/GPS expansion Support : <= 4.3.4 {DoW, TBC, WotLK, Cata}
--
-- Credits :
-- ALL tele points are from Rochet2's sql teleporter.

print();
print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
print("+                           +");

local expansion = (GetCoreName()..GetCoreExpansion());

-- Table BluePrint --
--
-- 	Menu :	{menu_id, "Menu Title", menu_icon, menu_team, expansion_low, expansion_high, realmid_low, realmid_high}
--
--	Entry :	[menu_id]{"location title", loc_icon, loc_team, loc_minimum_level, map, x, y, z, o, expansion_low, expansion_high}
--
--
-- icon : 0=bubble::1=bag::2=flight::3=book::4=wheel::5=wheel::6=bag dot::7=bubble dots::8=tabard::9=2swords::10=dot
-- team : team requierd to see entry // 0 = ally , 1 = horde , 2 = both , 3 = gm
-- 		2 team menu/location checks for a reason
-- 		1 menu team check so you can make faction only menus // 1 location team check so
-- 		yea ofc so you can have faction specific tele points.
--
-- minimum level : minimum level to see entry.
-- expansion low : lowest build entry will support.
-- expansion high : highest build that supports entry.
-- 		2 expansion low checks Menu/location so this script can work seamlesly on any Mangos build
-- 		without any editing. it just adapts ...
-- 		2 expansion high checks Menu/location so this script can work seamlesly on any Mangos build
-- 		supporting any changes of gps between expansions.(mainly for custom odd locations that may 
--		no longer exist in higher builds).


--[[
ATTN:
	DO NOT edit/modify anything below this point
	UNLESS you KNOW what your DOING or or you may 
	CRASH the script !!!
]]--


-- Define global variables local to the script --
local npcid = 170000
local itemid = 40582
local intoffset = 10000;
local Allowed_Entries = 12;
local CORE_EXPANSION = GetCoreExpansion();
local REALM_ID = GetRealmID();
local DATABASE = "grumboz_quantum_teleporter";
local ENTRY_KEY = 7;

-- Define Menu Entry Colors --
local FRIENDLY = "|cff004D0D";
local HOSTILE = "|cffAF002A";
local NEUTRAL = "|cff004D0D";
local GAMEMASTER = "|cff404040";
local COLOR_END = "|r";


-- Define the Tables --
local function newAutotable(dim)
    local MT = {};
    for i=1, dim do
        MT[i] = {__index = function(t, k)
            if i < dim then
                t[k] = setmetatable({}, MT[i+1])
                return t[k];
            end
        end}
    end

    return setmetatable({}, MT[1]);
end

local TeleportEntry = newAutotable(3);
local TeleportMenu = {};

local function LoadEntries(menu_id)

local entry = WorldDBQuery("SELECT * FROM "..DATABASE..".entries WHERE `menu_id` = '"..menu_id.."';");

local a = 0;

	if(entry)then
		
		repeat
			
			a=a+1;
			
			local entry_menu_id = entry:GetUInt8(0);
			
				TeleportEntry[menu_id][a] = { entry:GetString(1),entry:GetUInt8(2),entry:GetUInt8(3),entry:GetUInt32(4),entry:GetUInt32(5),entry:GetFloat(6),entry:GetFloat(7),entry:GetFloat(8),entry:GetFloat(9),entry:GetUInt8(10),entry:GetUInt8(11) };

		until not entry:NextRow();
	end -- if entry loop
return true;
end

local function BuildTable()

local menu = WorldDBQuery("SELECT * FROM "..DATABASE..".menus;");

	if(menu)then
		
		repeat
		
			local entry = 0;
			
			local menu_id = menu:GetUInt8(0);

			TeleportMenu[menu_id] = { menu:GetString(1), menu:GetUInt8(2), menu:GetUInt8(3), menu:GetUInt8(4), menu:GetUInt8(5), menu:GetUInt8(6), menu:GetUInt8(7), menu:GetUInt8(8) };
			
			LoadEntries(menu_id);
			
		until not menu:NextRow();
	end -- menu loop
end

BuildTable();


local function TeleportStoneOnHello(event, player, unit, sender, intid, code)

--______________________--
-----G-------------s------
-- Teleporter Main Menu --
--                      --
-- Menu Table BluePrint : TeleportMenu[Menu_Id]{"Menu Title", icon, team, level, expansion_low, expansion_high, realmid_low, realmid_high}
--l------------------R----

	if (player:IsInCombat()~=true)then	-- Show main menu

	    local i = 0;
	    local entry = 0;
	    local sSize = #TeleportMenu;
	    local pTeam = player:GetTeam();
	    local pLevel = player:GetLevel();

			for i = i+1, sSize do
				
				local name, icon, team, level, expansion_low, expansion_high, realm_low, realm_high = table.unpack(TeleportMenu[i]);

					if((CORE_EXPANSION >= expansion_low) and (CORE_EXPANSION <= expansion_high))then
					
						if((REALM_ID >= realm_low) and (REALM_ID <= realm_high))then
						
						if(team == 2)or(team == pTeam)or(player:IsGM() == true)then
						
							if(pLevel >= level)then
							
								local color;
		
									if((team == 2) or (team ~= pTeam))then color = HOSTILE;end
									if(team == pTeam)then color = FRIENDLY;end
									if(team == 3)then color = NEUTRAL;end
									if(team == 4)then color = GAMEMASTER;end
		
								player:GossipMenuAddItem(icon, color..name..COLOR_END, i, 1);
				    			
				    			entry = entry+1;
				    		
				    		end -- Level Check
						end -- team check
			
				   		if(entry == Allowed_Entries)then
			
							player:GossipMenuAddItem(7, "|cff00308Fnext..|r", 0, i+1)
			
							break;
				   		end
				   	end -- Realm Check
		   		end -- Expansion check
			end -- if/do loop
		
	    player:GossipSendMenu(1, unit)

	else
		player:SendNotification("You are in combat.")
	end
end

local function TeleporterOnGossipSelect(event, player, unit, sender, intid, code)

--_______________________________--
-----p-----U-----------------1-----
-- Teleporter Main Menu extended --
--                               --
-- Menu Table BluePrint : TeleportEntry[Menu_id]{"Menu Title", icon, team, expansion low, expansion high, realmid_low, realmid_high}
------3---------------M------------

	if (sender == 0) then -- Continue Menu

	    
	    local i = 0;
	    local entry = 0;
	    local sSize = #TeleportMenu;
	    local pTeam = player:GetTeam();
		local pLevel = player:GetLevel();
		
		    if(intid == 0)then
		    	intid = 1;
		    end
	    
			for i = intid, sSize do
			
				local name, icon, team, level, expansion_low, expansion_high, _ = table.unpack(TeleportMenu[i]);

					if((CORE_EXPANSION >= expansion_low) and (CORE_EXPANSION <= expansion_high))then
		
						if((team == 2) or (team == pTeam) or player:IsGM())then

							if(pLevel >= level)then
							
								local color;
		
									if((team == 2) or (team ~= pTeam))then color = HOSTILE;end
									if(team == pTeam)then color = FRIENDLY;end
									if(team == 3)then color = NEUTRAL;end
									if(team == 4)then color = GAMEMASTER;end
		
									player:GossipMenuAddItem(icon, color..name..COLOR_END, i, 1);
						    			
					    			entry = entry+1;
					    			
					    	end -- level check
						end -- Team check
				
				   		if(entry == Allowed_Entries)then
			
							player:GossipMenuAddItem(3, "|cff00308Fnext..|r", 0, i+1)
			
							break;
				   		end -- Entry Limit check
				   	end -- Expansion check	   		
			end -- for/do loop

			if(intid >= Allowed_Entries) then 
				player:GossipMenuAddItem(3, "|cff00308FBack..|r", 0, 1)
			end

		player:GossipSendMenu(1, unit);
		return;
	end


--B-------a----------
-- Teleport Player --
---t----------4------

	if (intid > (intoffset))then

		player:GossipComplete();

		local int = intid-intoffset;
		
		local _, _, _, _, map, x, y, z, o, _ = table.unpack(TeleportEntry[sender][int]);
		
		player:RemoveAura(7265);
		
		player:Teleport(map, x, y, z, o);
		
		player:CastSpell(player, 7265, false);
	
		return;
	end

--____________________________--
---------------------------2----
-- teleport location sub menu --

--  Location Table blueprint = [menu_id]{"location name", icon, team, minimum level, map, x, y, z, o, expansion minimum},}
-------0----------------O-------


	if (sender >= 1)then-- Show teleport sub-menu
	
			if(intid == 0)then 
				intid = 1;
			end
			
		local a = 0;
		local entry = 0;
		local tSize = #TeleportEntry[sender];
		local pTeam = player:GetTeam();
		local pLevel = player:GetLevel();

			for a = a+intid, tSize do
			
				local name, icon, team, level, map, x, y, z, o, expansion_low, expansion_high = table.unpack(TeleportEntry[sender][a]);

				if((CORE_EXPANSION >= expansion_low) and (CORE_EXPANSION <= expansion_high))then
		
						if((team == 2) or (team == pTeam) or player:IsGM())then

							if(pLevel >= level)then
							
								local color;
								
									if((team == 2) or (team ~= pTeam))then color = HOSTILE;end
									if(team == pTeam)then color = FRIENDLY;end
									if(team == 3)then color = NEUTRAL;end
									if(team == 4)then color = GAMEMASTER;end
									
								player:GossipMenuAddItem(icon, color..name..COLOR_END, sender, (a+intoffset))
									
								entry = entry+1;
							end -- level Check
						end -- entry team check
				end -- expansion check
	
				if((entry == Allowed_Entries) or (a == tSize))then
				
						if(a < tSize)then
							player:GossipMenuAddItem(3, "|cff00308FNext|r", sender, (a+1))
						end
					
						if(intid > Allowed_Entries)then
	
							player:GossipMenuAddItem(3, "|cff00308FBack|r", sender, 1)
							
						end
	
					player:GossipMenuAddItem(3, "|cff00308FMain Menu|r", 0, 0)
					
					break;
				end	-- max entry check triggered
			end -- for/do loop
		
		player:GossipSendMenu(1, unit)
		
	end
end

RegisterItemGossipEvent(itemid, 1, TeleportStoneOnHello)
RegisterItemGossipEvent(itemid, 2, TeleporterOnGossipSelect)

print("+          Grumboz          +");
print("+       Hyper-Dynamic       +");
print("+      Pan-Dimensional      +");
print("+          Quantum          +");
print("+        Teleporter         +");
print("+          online           +");
print("+                           +");
print("+          "..expansion.."          +");
print("+                           +");
print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
