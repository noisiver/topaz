-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- Standard Merchant NPC
-- !pos 70 0 61 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        16455,  4309, 3,    -- Baselard
        16532, 16934, 3,    -- Gladius
        16545, 21067, 3,    -- Broadsword
        16576, 35769, 3,    -- Hunting Sword
        16524, 13406, 3,    -- Fleuret
        16450,  1827, 3,    -- Dagger
        16536,  7128, 3,    -- Iron Sword
        16566,  8294, 3,    -- Longsword
        16448,   140, 3,    -- Bronze Dagger
        16449,   837, 3,    -- Brass Dagger
        16531,  3523, 3,    -- Brass Xiphos
        16535,   241, 3,    -- Bronze Sword
        16565,  1674, 3,    -- Spatha
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
