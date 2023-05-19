-----------------------------------
-- Area: Bastok Markets
--  NPC: Shamarhaan
-- Type: Quest Starter
-- Involved in quest: No Strings Attached
-- !pos -285.382 -13.021 -84.743 235
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    local AchievingTruePower = player:getQuestStatus(BASTOK, tpz.quest.id.bastok.ACHIEVING_TRUE_POWER)
    if AchievingTruePower == QUEST_ACCEPTED and player:getMainLvl() >= 66 and player:getMainJob() == tpz.job.PUP and npcUtil.tradeHasExactly(trade, 2333) then
        player:startEvent(443)
    end
end

function onTrigger(player, npc)
    local NoStringsAttached = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
    local NoStringsAttachedProgress = player:getCharVar("NoStringsAttachedProgress")

    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and NoStringsAttached == QUEST_AVAILABLE) then
        player:startEvent(434) -- initial cs to start the quest, go and see Iruki-Waraki at Whitegate
    elseif (NoStringsAttachedProgress == 1) then
        player:startEvent(435) -- reminder to go see Iruki-Waraki at Whitegate
    elseif player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.PUPPETMASTER_BLUES) == QUEST_ACCEPTED then
        local PuppetmasterBluesProgress = player:getCharVar("PuppetmasterBluesProgress")
        if PuppetmasterBluesProgress == 1 then
            player:startEvent(437)
        elseif PuppetmasterBluesProgress == 2 or PuppetmasterBluesProgress == 3 then
            player:startEvent(438)
        elseif PuppetmasterBluesProgress == 4 then
            player:startEvent(439)
        elseif PuppetmasterBluesProgress == 5 then
            player:startEvent(440)
        end
    elseif player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.PUPPETMASTER_BLUES) == QUEST_COMPLETED and LvL >= 66 and Job == tpz.job.PUP then
        player:startEvent(442)
    elseif player:getMainLvl() >= AF1_QUEST_LEVEL and player:getMainJob() == tpz.job.PUP then
        player:startEvent(436)
    else
        player:startEvent(433)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 434) then
        player:setCharVar("NoStringsAttachedProgress", 1)
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
    elseif csid == 437 then
        player:addKeyItem(tpz.ki.VALKENGS_MEMORY_CHIP)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.VALKENGS_MEMORY_CHIP)
        player:setCharVar("PuppetmasterBluesProgress", 2)
    elseif csid == 439 then
        player:setCharVar("PuppetmasterBluesProgress", 5)
    elseif csid == 442 and player:getQuestStatus(BASTOK, tpz.quest.id.bastok.ACHIEVING_TRUE_POWER) == QUEST_AVAILABLE then
        player:addQuest(BASTOK, tpz.quest.id.bastok.ACHIEVING_TRUE_POWER)
    elseif csid == 443 then
        player:setPos(-660, -9.7, -196, 200, 64) -- Move player to Navukgo Execution Chamber
    end
end
