-----------------------------------
-- Area: Riverne - Site B01
--   NM: Book_Browser_Bokabraq
-- Go! Go! Gobmuffin! map quest
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/quests")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local riverneMapProgress = player:getCharVar("riverneMapQuest")
    if (isKiller or noKiller) then
        local riverneMapQuest = player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.GO_GO_GOBMUFFIN)
        if (riverneMapQuest == QUEST_ACCEPTED and riverneMapProgress < 4) then
            player:setCharVar("riverneMapQuest", riverneMapProgress +1)
        end
    end
end