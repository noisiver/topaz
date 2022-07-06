-----------------------------------
-- Area: Bastok Market [S]
--  NPC: Keenan
-- Type: Allied Notes Notorious Monsters
-- !pos -241.183 -12.095 -44.166 87
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
