-----------------------------------
-- Area: Caedarva Mire
-- NPC:  qm8
-- Gives Lamian Fang Key
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    npcUtil.giveItem(player, 2219)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
