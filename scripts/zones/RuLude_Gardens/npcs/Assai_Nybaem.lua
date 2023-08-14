-----------------------------------
-- Area: Ru'Lude Gardens
--   NPC: Assai Nybaem
-- Type: NPC Voidwalker 
-- !pos -32 0 -76 243
-----------------------------------
require("scripts/globals/voidwalker")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    tpz.voidwalker.npcOnTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
    tpz.voidwalker.npcOnEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    tpz.voidwalker.npcOnEventFinish(player, csid, option)
end