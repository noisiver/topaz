-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Strange Apparatus
-- !pos 104 0 -179 195
-----------------------------------
--require("scripts/globals/strangeapparatus")
-----------------------------------

--function onTrade(player, npc, trade)
  --  tpz.strangeApparatus.onTrade(player, trade, 3)
--end

--function onTrigger(player, npc)
  --  tpz.strangeApparatus.onTrigger(player, 1)
--end

--function onEventUpdate(player, csid, option)
    --if csid == 1 then
    --    tpz.strangeApparatus.onEventUpdate(player, option)
  --  end
--end

--function onEventFinish(player, csid, option)
    --if csid == 3 then
    --    tpz.strangeApparatus.onEventFinish(player)
  --  end
--end

-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Strange Apparatus
-- !pos 104 0 -179 195
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 478) then -- Clear Chip
        if npcUtil.popFromQM(player, npc, ID.mob.MURGLEIS) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("Why has a mere mortal awakened me from my slumber?",0,"Murgleis")
            player:confirmTrade()
        end
    elseif npcUtil.tradeHasExactly(trade, 480) then -- White Chip
        if npcUtil.popFromQM(player, npc, ID.mob.BURTGANG) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("You will not defile this holy place!",0,"Burtgang")
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.DEVICE_NOT_WORKING) -- put special message when clicking ??? here from IDs.lua of the zone
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
