-----------------------------------
-- NPC:  Treasure Coffer
-- Reward chest after killing a MMM or ANNM
require("scripts/globals/annm")
require("scripts/globals/items")
-----------------------------------
function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
    local possibleItems = {
       tpz.items.HEAVY_CROSSBOW,
       tpz.items.DARKSTEEL_MUFFLERS,
       tpz.items.SCORPION_SUBLIGAR
    }
    tpz.annm.OpenChest(player, npc, possibleItems[math.random(#possibleItems)])
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end