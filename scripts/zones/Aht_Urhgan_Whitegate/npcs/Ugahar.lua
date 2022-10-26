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
    player:PrintToPlayer("Let's see here, the weapons that can be imbued is...",0,"Ugahar")
    player:PrintToPlayer("ZNM weapons.",0xF,"Ugahar")
    player:PrintToPlayer("Let's see here, the armor that can be imbued is...",0,"Ugahar")
    player:PrintToPlayer("Jaridah Peti Set, Siphahi Turban Set, Tabin Set, Marid Mittens, Marid Leggings, Marid Belt.",0xF,"Ugahar")
    player:PrintToPlayer("Let's see here, the pet items that can be imbued is...",0,"Ugahar")
    player:PrintToPlayer("Moonwatch Wand, Spellcaster's Ecu, Mantra Coin, Silken Coat Set, Star Pendant, Moon Earring, Demon's Ring, Brocade Obi, Green Cape.",0xF,"Ugahar")
    --player:startEvent(253)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
