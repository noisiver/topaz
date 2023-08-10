-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Achtelle
-- !pos 108 2 -11 80
-- DRG job quest NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- Bark Tarantula(Boyahda Tree) drop 9906
    -- Demonic Millstone (Psox'ja) drop 9907
    -- Hypnos Eft drop 9908
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.DRG)
end

function onTrigger(player, npc)
--player:startEvent(510);  Event doesnt work but this is her default dialogue, threw in something below til it gets fixed

-- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.DRG)

    player:showText(npc, 13454) -- (Couldn't find default dialogue)  How very good to see you again!
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
