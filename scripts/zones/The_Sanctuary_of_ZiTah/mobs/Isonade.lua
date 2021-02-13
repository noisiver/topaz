-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Isonade
-- Involved in Quest: The Sacred Katana
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.THE_SACRED_KATANA) == QUEST_ACCEPTED then
        player:setCharVar("IsonadeKilled", 1)
    end
end
