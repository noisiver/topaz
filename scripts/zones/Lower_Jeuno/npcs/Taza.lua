-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
--require("scripts/globals/augments")
-----------------------------------

-----------------------------------
-- Forgotten items
local forgotten =
{
head = tpz.items.FORGOTTEN_THOUGHT, body = tpz.items.FORGOTTEN_HOPE,  hands = tpz.items.FORGOTTEN_TOUCH,
legs = tpz.items.FORGOTTEN_JOURNEY, feet = tpz.items.FORGOTTEN_STEP
}
-----------------------------------

local trades =
{
    {
        items = {
            { tpz.items.IFRITS_BLADE, 1 },
            { tpz.items.IFRITEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.IFRITS_BLADE, 1, 45, 4);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.IFRITS_BLADE)
        end
    },
        {
        items = {
            { tpz.items.FIRE_RING, 1 },
            { tpz.items.IFRITEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.FIRE_RING, 1, 143, 1);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.FIRE_RING)
        end
    },
    {
        items = {
            { tpz.items.SHIVAS_CLAWS, 1 },
            { tpz.items.SHIVATEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.SHIVAS_CLAWS, 1, 45, 9);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.SHIVAS_CLAWS)
        end
    },
    {
        items = {
            { tpz.items.ICE_RING, 1 },
            { tpz.items.SHIVATEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.ICE_RING, 1, 334, 1);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.ICE_RING)
        end
    },
    {
        items = {
            { tpz.items.LEVIATHANS_ROD, 1 },
            { tpz.items.LEVIATEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.LEVIATHANS_ROD, 1, 55, 2);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.LEVIATHANS_ROD)
        end
    },
    {
        items = {
            { tpz.items.WATER_RING, 1 },
            { tpz.items.LEVIATEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WATER_RING, 1, 323, 1);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WATER_RING)
        end
    },
    {
        items = {
            { tpz.items.GARUDAS_DAGGER, 1 },
            { tpz.items.GARUTEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.GARUDAS_DAGGER, 1, 45, 9);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.GARUDAS_DAGGER)
        end
    },
    {
        items = {
            { tpz.items.WIND_RING, 1 },
            { tpz.items.GARUTEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WIND_RING, 1, 31, 4);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WIND_RING)
        end
    },
    {
        items = {
            { tpz.items.RAMUHS_STAFF, 1 },
            { tpz.items.RAMUTEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.RAMUHS_STAFF, 1, 45, 29);  
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.RAMUHS_STAFF)
        end
    },
    {
        items = {
            { tpz.items.LIGHTING_RING, 1 },
            { tpz.items.RAMUTEAR, 1 },
            { 'gil', 250000 }, 
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.LIGHTING_RING, 1, 55, 2);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.LIGHTING_RING)
        end
    },
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
            { tpz.items.EARTH_RING, 1 },
            { tpz.items.TITATEAR, 1 },
            { 'gil', 250000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.EARTH_RING, 1, 54, 1);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.EARTH_RING);
        end
    },
    {
        items = {
            { tpz.items.WARLOCKS_CHAPEAU, 1 },
            { forgotten.head, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WARLOCKS_CHAPEAU, 1, 45, 14);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WARLOCKS_CHAPEAU);
        end
    },
    {
        items = {
            { tpz.items.WARLOCKS_TABARD, 1 },
            { forgotten.body, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WARLOCKS_TABARD, 1, 45, 14);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WARLOCKS_TABARD);
        end
    },
    {
        items = {
            { tpz.items.WARLOCKS_GLOVES, 1 },
            { forgotten.hands, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WARLOCKS_GLOVES, 1, 138, 0);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WARLOCKS_GLOVES);
        end
    },
    {
        items = {
            { tpz.items.WARLOCKS_TIGHTS, 1 },
            { forgotten.legs, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WARLOCKS_TIGHTS, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WARLOCKS_TIGHTS);
        end
    },
    {
        items = {
            { tpz.items.WARLOCKS_BOOTS, 1 },
            { forgotten.feet, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WARLOCKS_BOOTS, 1, 368, 1);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WARLOCKS_BOOTS);
        end
    },
    {
        items = {
            { tpz.items.WISE_CAP, 1 },
            { forgotten.head, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WISE_CAP, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WISE_CAP);
        end
    },
    {
        items = {
            { tpz.items.CHASUBLE, 1 },
            { forgotten.body, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.CHASUBLE, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.CHASUBLE);
        end
    },
    {
        items = {
            { tpz.items.WISE_GLOVES, 1 },
            { forgotten.hands, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WISE_GLOVES, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WISE_GLOVES);
        end
    },
    {
        items = {
            { tpz.items.WISE_PIGACHES, 1 },
            { forgotten.feet, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.WISE_PIGACHES, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.WISE_PIGACHES);
        end
    },
    {
        items = {
            { tpz.items.NOBLES_CROWN, 1 },
            { forgotten.head, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.NOBLES_CROWN, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.NOBLES_CROWN);
        end
    },
    {
        items = {
            { tpz.items.NOBLES_MITTS, 1 },
            { forgotten.hands, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.NOBLES_MITTS, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.NOBLES_MITTS);
        end
    },
    {
        items = {
            { tpz.items.NOBLES_SLACKS, 1 },
            { forgotten.legs, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.NOBLES_SLACKS, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.NOBLES_SLACKS);
        end
    },
    {
        items = {
            { tpz.items.NOBLES_PUMPS, 1 },
            { forgotten.feet, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.NOBLES_PUMPS, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.NOBLES_PUMPS);
        end
    },
    {
        items = {
            { tpz.items.BLESSED_BRIAULT, 1 },
            { forgotten.body, 100 },
            { 'gil', 1000000 },
        },
        GiveAugment = function(player)
            player:addItem(tpz.items.BLESSED_BRIAULT, 1, 1248, 24);
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.BLESSED_BRIAULT);
        end
    },
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