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
        21444,  200,    -- Livid Broth
        21445,  344,    -- Lyrical Broth
        21446,  519,    -- Airy Broth
        21447, 1016,    -- Crumbly Soil
        17922, 1484,    -- Blackwater Broth
        21448, 1747,    -- Pale Sap
        21498, 1747,    -- Crackling Broth
        17920, 2195,    -- Meaty Broth
        21497, 2371,    -- Rapid Broth
        21499, 2425,    -- Creepy Broth
        17921, 2853,    -- Muddy Broth
        21449, 3004,    -- Dire Broth
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
    tpz.shop.general(player, stock, JEUNO)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
