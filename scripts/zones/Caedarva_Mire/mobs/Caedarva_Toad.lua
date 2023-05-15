-----------------------------------
-- Area: Caedarva Mire
--  Mob: Caedarva Toad
-- Involved in Quest: The Wayward Automation
-----------------------------------
require("scripts/globals/quests")

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller)

    local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION)
    local TheWaywardAutomationProgress = player:getCharVar("TheWaywardAutomationProgress")

    if (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 2 and player:getCharVar("TheWaywardAutomationNM") == 0) then
        player:setCharVar("TheWaywardAutomationNM", 1)
    end
end
