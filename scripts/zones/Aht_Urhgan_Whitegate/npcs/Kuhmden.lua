-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Kuhmden
-- Standard Info NPC
-- ToAU Augmenting NPC
-- !pos 79 -0 54 50
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    --player:startEvent(252)
    player:PrintToPlayer("Would you like to see the additional list of items required to imbue?",0,"Kuhmden")
    player:timer(3000, function(player)
        player:PrintToPlayer("Qutrub Bandage - HP",0x1F,"Kuhmden")
        player:PrintToPlayer("Flan Meat - MP",0x1F,"Kuhmden")
        player:PrintToPlayer("Karakul Meat - Attack",0x1C,"Kuhmden")
        player:PrintToPlayer("Ziz Meat - Ranged Attack",0x1C,"Kuhmden")
        player:PrintToPlayer("Wivre Maul - Accuracy",0x1C,"Kuhmden")
        player:PrintToPlayer("Qiqirn Sandbag - Ranged Accuracy",0x1C,"Kuhmden")
        player:PrintToPlayer("Soulflayer Tentacle - Magic Attack",0x1C,"Kuhmden")
        player:PrintToPlayer("Wamoura Scale - Magic Accuracy",0x1C,"Kuhmden")
    end)
    player:timer(10000, function(player)
        player:PrintToPlayer("Marid Hair - STR",0xF,"Kuhmden")
        player:PrintToPlayer("Puk Wing - DEX",0xF,"Kuhmden")
        player:PrintToPlayer("Apkallu Feather - VIT",0xF,"Kuhmden")
        player:PrintToPlayer("Pephredo Hive Chip - AGI",0xF,"Kuhmden")
        player:PrintToPlayer("Imp Wing - INT",0xF,"Kuhmden")
        player:PrintToPlayer("Lamia Skin - MND",0xF,"Kuhmden")
        player:PrintToPlayer("Merrow Scale - CHR",0xF,"Kuhmden")
    end)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
