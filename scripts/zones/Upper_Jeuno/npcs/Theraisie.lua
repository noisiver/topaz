-----------------------------------
-- Area: Upper Jeuno
-- NPC: Theraisie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        21444, 4000,    -- Livid Broth
        21445, 4000,    -- Lyrical Broth
        21446, 4000,    -- Airy Broth
        21447, 4000,    -- Crumbly Soil
        17922, 4000,    -- Blackwater Broth
        21448, 4000,    -- Pale Sap
        21498, 4000,    -- Crackling Broth
        17920, 4000,    -- Meaty Broth
        21497, 4000,    -- Rapid Broth
        21499, 4000,    -- Creepy Broth
        17921, 4000,    -- Muddy Broth
        21449, 4000,    -- Dire Broth
        17016,  11,    -- Pet Food Alpha
        17017,  82,    -- Pet Food Beta
       -- 17018,  350,    -- Pet Food Gamma
       -- 17019,  500,    -- Pet Food Delta
       -- 17020,  750,    -- Pet Food Epsilon
       -- 17021, 1000,    -- Pet Food Zeta
       -- 17022, 1500,    -- Pet Food Eta
       -- 17023, 2000,    -- Pet Food Theta
        9251,  300,    -- Pet Roborant
        19252,  250,    -- Pet Poultice
    }

    player:showText(npc, ID.text.MP_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
