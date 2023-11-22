-----------------------------------
-- Area: Beadeaux
--  NPC: ???
-- !pos -166.230 -1 -73.685 147
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getQuestStatus(BASTOK, tpz.quest.id.bastok.THE_CURSE_COLLECTOR) == QUEST_ACCEPTED and player:getCharVar("cCollectSilence") == 0) then
        player:setCharVar("cCollectSilence", 1)
    end

    npc:entityAnimationPacket('sils', player)
    player:addStatusEffect(tpz.effect.SILENCE, 0, 0, math.random(420, 840))
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
