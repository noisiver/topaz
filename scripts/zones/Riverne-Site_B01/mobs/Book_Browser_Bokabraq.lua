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
end

function onMobDeath(mob, player, isKiller, noKiller)
    local riverneMapProgress = player:getCharVar("riverneMapQuest")
    if (isKiller or noKiller) then
        local riverneMapQuest = player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.GO_GO_GOBMUFFIN)
        if (riverneMapQuest == QUEST_ACCEPTED) then
            player:setCharVar("riverneMapQuest", riverneMapProgress +1)
        end
    end
end