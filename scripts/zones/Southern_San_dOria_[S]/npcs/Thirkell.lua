-----------------------------------
-- Area: Southern Sandoria [S]
--  NPC: Thirkell
-- Type: Allied Notes Notorious Monsters
-- !pos 101.257 1.000 111.204 80
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
