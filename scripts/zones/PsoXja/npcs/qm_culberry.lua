-----------------------------------
-- Area: Pso'xja
--  NPC: ???
-- Notes: Used to spawn Golden-Tongued Culberry
-- !pos -270.063 31.395 256.812 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    local pendantChance = 0
    if nnpcUtil.tradeHasExactly(trade, { tpz.items.CHUNK_OF_WHITE_STEEL, tpz.items.PIECE_OF_MAGNOLIA_LUMBER } ) then
        pendantChance = 1000
     elseif nnpcUtil.tradeHasExactly(trade, tpz.items.ODOROUS_KNIFE) then
        pendantChance = 1000
     elseif nnpcUtil.tradeHasExactly(trade, tpz.items.ODOROUS_KNIFE_HQ) then
        pendantChance = 1000
    end

    if pendantChance > 0 and npcUtil.popFromQM(player, npc, ID.mob.GOLDEN_TONGUED_CULBERRY) then
        player:confirmTrade()
        SetDropRate(1512, tpz.items.UGGALEPIH_PENDANT, pendantChance)
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.BROKEN_KNIFE)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
