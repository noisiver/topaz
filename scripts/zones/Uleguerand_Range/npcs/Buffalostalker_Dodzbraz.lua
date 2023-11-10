-----------------------------------
-- Area: Uleguerand Range
--   NPC: Buffalostalker Dodzbraz
-- Type: Quest NPC
-- !pos -380.171 -24.89 -180.797 5
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHasExactly(trade, { {tpz.items.CLUSTER_CORE, 2} }) then
        player:startEvent(8)
    else
        player:startEvent(7)
    end
end

function onTrigger(player,npc)
    player:startEvent(6);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if csid == 8 and npcUtil.giveItem(player, tpz.items.CHUNK_OF_SHUMEYO_SALT) then
        player:tradeComplete()
    end
end
