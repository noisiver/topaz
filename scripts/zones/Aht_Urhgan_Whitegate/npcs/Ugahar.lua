-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ugahar
-- Standard Info NPC
-- ToAU Augmenting NPC
-- !pos 79 -0 54 50
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:addStatusEffect(tpz.effect.STUN, 1, 0, 300)
    player:PrintToPlayer("Let's see here, the weapons that can be imbued are...",0,"Ugahar")
    player:timer(3000, function(player)
        player:PrintToPlayer("Weapons - Coming Soon",0xF,"Ugahar")
    end)
    player:timer(6000, function(player)
        player:PrintToPlayer("Let's see here, the armor that can be imbued are...",0,"Ugahar")
    end)
    player:timer(9000, function(player)
        player:PrintToPlayer("Jaridah Peti Set, Siphahi Jawshan Set, Tabin Set, Marid Mittens, Marid Leggings, Marid Belt.",0xF,"Ugahar")
    end)
    player:timer(12000, function(player)
        player:PrintToPlayer("Lastly, the pet items that can be imbued are...",0,"Ugahar")
    end)
    player:timer(15000, function(player)
        player:delStatusEffectSilent(tpz.effect.STUN)
        player:PrintToPlayer("Moonwatch Wand, Spellcaster's Ecu, Mantra Coin, Silken Coat Set, Star Pendant, Moon Earring, Demon's Ring, Brocade Obi, Green Cape.",0xF,"Ugahar")
    end)
    --player:startEvent(253)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
