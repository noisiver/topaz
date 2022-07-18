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
    if (npc:getID() == 17138420) then
        tpz.moblinmazemongers.OpenChest(player, npc)
    elseif (npc:getID() == 17138421) then
        local possibleItems = {
           tpz.items.EBONY_WAND,
           tpz.items.SILK_CLOAK,
           tpz.items.CORAL_HAIRPIN
        }
        tpz.annm.OpenChest(player, npc, possibleItems[math.random(#possibleItems)])
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end