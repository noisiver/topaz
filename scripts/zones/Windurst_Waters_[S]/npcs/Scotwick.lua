-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Scotwick
-- Type: Allied Notes Notorious Monsters
-- !pos 153.785 -3.134 9.895 94
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/annm")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    tpz.annm.GiveKI(player, npc, trade)
end

function onTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
