-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Masis
-- Standard Info NPC
-- Accepts items for Holy / Divine Shield
-----------------------------------------
require("scripts/globals/npc_util")
-----------------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, { tpz.items.MANA_BARREL, tpz.items.HARD_SHIELD } ) then
        -- 10% chance at Divine Shield(HQ), 90% at Holy
        if (math.random(100) <= 10) then
            npcUtil.giveItem(player, tpz.items.DIVINE_SHIELD)
        else
            npcUtil.giveItem(player, tpz.items.HOLY_SHIELD)
        end
    end
end

function onTrigger(player, npc)
    player:startEvent(337)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
