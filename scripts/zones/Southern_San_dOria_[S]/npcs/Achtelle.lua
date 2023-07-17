-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Achtelle
-- !pos 108 2 -11 80
-- DRG job quest NPC
-----------------------------------

function onTrade(player, npc, trade)
    -- Bark Tarantula(Boyahda Tree) drop
    -- Demonic Millstone (Psox'ja) drop
    -- Hypnos Eft drop
end

function onTrigger(player, npc)
--player:startEvent(510);  Event doesnt work but this is her default dialogue, threw in something below til it gets fixed

    player:showText(npc, 13454) -- (Couldn't find default dialogue)  How very good to see you again!
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
