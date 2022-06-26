-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------

local trades =
{
    {
        items = {
            { tpz.items.TITANS_CUDGEL, 1 },
            { tpz.items.TITATEAR, 1 },
            { 'gil', 250000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.TITANS_CUDGEL, 1, 45, 14);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.TITANS_CUDGEL);
        end
    },
    {
        items = {
            { tpz.items.TITANS_CUDGEL, 1 },
            { tpz.items.SOIL_GEODE, 1 },
            { 'gil', 200000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.TITANS_CUDGEL, 1, 45, 14, 46, 12);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.TITANS_CUDGEL)
        end
    }
}




function onTrade(player, npc, trade)
    for _,option in pairs(trades) do
        if npcUtil.tradeHas(trade, option.items) then
            player:confirmTrade()
            option.GiveAugment(player);
            player:PrintToPlayer("I have successfully augmented your item and the the magical properties have been revealed!",0,"Taza")
            return
        end
    end
    player:PrintToPlayer("I can't do anything with those items",0,"Taza")
end


function onTrigger(player, npc)
	player:PrintToPlayer("Do you have magical items you would like to augment? I can help!",0,"Taza")
end