-----------------------------------
-- Area: Windurst Waters
--  NPC: Taza
-- Moogle Coins Moogle
-- !pos
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
require("scripts/globals/augments")
-----------------------------------
local itemList =
{
    { item = tpz.items.FANCY_TOP, coins = 50, egg = tpz.items.F_EGG },
    { item = tpz.items.FANCY_SHORTS, coins = 40 egg = tpz.items. F_EGG },
    { item = tpz.items.COSSIE_TOP, coins = 50, egg = tpz.items.C_EGG },
    { item = tpz.items.COSSIE_BOTTOM, coins = 40, egg = tpz.items.C_EGG },
    { item = tpz.items.STARLET_FLOWER, coins = 25, egg = tpz.items.S_EGG },
    { item = tpz.items.STARLET_JABOT, coins = 50, egg = tpz.items.S_EGG },
    { item = tpz.items.STARLET_GLOVES, coins = 15, egg = tpz.items.S_EGG },
    { item = tpz.items.STARLET_SKIRT, coins = 40, egg = tpz.items.S_EGG },
    { item = tpz.items.STARLET_BOOTS, coins = 20, egg = tpz.items.S_EGG },
    { item = tpz.items.MITHRA_TOP, coins = 35, egg = tpz.items.M_EGG },
    { item = tpz.items.MITHRA_SHORTS, coins = 25, egg = tpz.items.M_EGG },
    { item = tpz.items.SAVAGE_TOP, coins = 35, egg = tpz.items.S_EGG },
    { item = tpz.items.SAVAGE_SHORTS, coins = 25, egg = tpz.items.S_EGG },
    { item = tpz.items.LADYS_YUKATA, coins = 25, egg = tpz.items.L_EGG },
    { item = tpz.items.OMINA_YUKATA, coins = 25, egg = tpz.items.O_EGG },
    { item = tpz.items.ONNAGUSA_YUKATA, coins = 35, egg = tpz.items.O_EGG },
    { item = tpz.items.HIMEGAMI_YUKATA, coins = 35, egg = tpz.items.H_EGG },
    { item = tpz.items.DREAM_HAT, coins = 25, egg = tpz.items.D_EGG },
    { item = tpz.items.DREAM_ROBE, coins = 35, egg = tpz.items.D_EGG },
    { item = tpz.items.DREAM_MITTENS, coins = 15, egg = tpz.items.D_EGG },
    { item = tpz.items.DREAM_PANTS, coins = 35, egg = tpz.items.D_EGG },
    { item = tpz.items.DREAM_BOOTS, coins = 20, egg = tpz.items.D_EGG },
    { item = tpz.items.PIEUJE_UNITY_SHIRT, coins = 40, egg = tpz.items.P_EGG },
    { item = tpz.items.AYAME_UNITY_SHIRT, coins = 40, egg = tpz.items.A_EGG },
    { item = tpz.items.INVINCIBLE_SHIELD_UNITY_SHIRT, coins = 40, egg = tpz.items.I_EGG },
    { item = tpz.items.APURURU_UNITY_SHIRT, coins = 35, egg = tpz.items.A_EGG },
    { item = tpz.items.MAAT_UNITY_SHIRT, coins = 40, egg = tpz.items.M_EGG },
    { item = tpz.items.ALDO_UNITY_SHIRT, coins = 30, egg = tpz.items.A_EGG },
    { item = tpz.items.JAKOH_WAHCONDALO_UNITY_SHIRT, coins = 40, egg = tpz.items.J_EGG },
    { item = tpz.items.NAJA_SALAHEEM_UNITY_SHIRT, coins = 40, egg = tpz.items.N_EGG },
    { item = tpz.items.FLAVIRIA_UNITY_SHIRT, coins = 40, egg = tpz.items.F_EGG },
    { item = tpz.items.YORAN_ORAN_UNITY_SHIRT, coins = 40, egg = tpz.items.Y_EGG },
    { item = tpz.items.SYLVIE_UNITY_SHIRT, coins = 40, egg = tpz.items.S_EGG },
    { item = tpz.items.CHOCOBO_SHIRT, coins = 40, egg = tpz.items.C_EGG },
    { item = tpz.items.ALLIANCE_SHIRT, coins = 50, egg = tpz.items.A_EGG },
    { item = tpz.items.AKITU_SHIRT, coins = 45, egg = tpz.items.A_EGG },
    { item = tpz.items.GIL_NABBER_SHIRT, coins = 45, egg = tpz.items.G_EGG },
    { item = tpz.items.AGENT_COAT, coins = 40, egg = tpz.items.A_EGG },
    { item = tpz.items.DECENNIAL_DRESS, coins = 50, egg = tpz.items.D_EGG },
    { item = tpz.items.DECENNIAL_HOSE, coins = 40, egg = tpz.items.D_EGG },
    { item = tpz.items.DINNER_JACKET, coins = 30, egg = tpz.items.D_EGG },
    { item = tpz.items.HEART_APRON, coins = 60, egg = tpz.items.H_EGG },
    { item = tpz.items.NOVENNIAL_DRESS, coins = 60, egg = tpz.items.N_EGG },
    { item = tpz.items.NOVENNIAL_THIGH_BOOTS, coins = 50, egg = tpz.items.N_EGG },
    { item = tpz.items.PRETTY_PINK_SUBLIGAR, coins = 60, egg = tpz.items.P_EGG },
    { item = tpz.items.SHOAL_MAILLOT, coins = 55, egg = tpz.items.S_EGG },
    { item = tpz.items.SHOAL_TRUNKS, coins = 45, egg = tpz.items.S_EGG },
    { item = tpz.items.SHOKUJO_HANMOMOHIKI, coins = 55, egg = tpz.items.S_EGG },
}

local function DistributeItem(player, item)
    player:tradeComplete()
    player:addItem(item)
    local ID = zones[player:getZoneID()]
    player:PrintToPlayer("A wonderful choice, kupo!",0,"Moogle")
    player:messageSpecial(ID.text.ITEM_OBTAINED, item)
end

function onTrade(player, npc, trade)    
    for _, items inpairs(itemList) do
        if (type(itemList) == 'table') and npcUtil.tradeHasExactly(trade, { tpz.items.MOOGLE_COIN, items[2], items[3]  }) then
            DistributeItem(player, items[1])
        else
            player:PrintToPlayer("I can't do anything with those items, kupo!",0,"Moogle");
        end
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer("Kupo! Give me Moogle Coins and the correct egg for fantastic prizes!",0,"Moogle")
    for i = tpz.items.A_EGG, tpz.items.Z_EGG, 1 do
        player:addItem(i)
    end
    player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.A_EGG)
end