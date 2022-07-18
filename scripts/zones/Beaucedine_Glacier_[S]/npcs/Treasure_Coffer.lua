-----------------------------------
-- NPC:  Treasure Coffer
-- Reward chest after killing a MMM NM
require("scripts/globals/moblinmazemongers")
-----------------------------------
function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
    tpz.moblinmazemongers.OpenChest(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end