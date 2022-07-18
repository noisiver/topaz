-----------------------------------
-- NPC:  Treasure Coffer
-- Reward chest after killing a MMM or ANNM
require("scripts/globals/moblinmazemongers")
require("scripts/globals/annm")
require("scripts/globals/items")
-----------------------------------
function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
    if (npc:getID() == 17175261) then
        tpz.moblinmazemongers.OpenChest(player, npc)
    elseif (npc:getID() == 17175262) then
        local possibleItems = {
           tpz.items.MYTHIC_POLE,
           tpz.items.ELITE_BERET,
           tpz.items.ERRANT_HOUPPELANDE
        }
        tpz.annm.OpenChest(player, npc, possibleItems[math.random(#possibleItems)])
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end