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
       tpz.items.ANELACE,
       tpz.items.DRAGON_MITTENS,
       tpz.items.ERRANT_PIGACHES
    }
    tpz.annm.OpenChest(player, npc, possibleItems[math.random(#possibleItems)])
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end