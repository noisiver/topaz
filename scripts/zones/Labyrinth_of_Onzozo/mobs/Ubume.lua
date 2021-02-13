-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Ubume
-- Involved in Quest: Yomi Okuri
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
    if player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.YOMI_OKURI) == QUEST_ACCEPTED and player:getCharVar("yomiOkuriCS") <= 3 then
        player:setCharVar("yomiOkuriKilledNM", 1)
    end
end
