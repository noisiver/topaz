-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Iruki-Waraki
--  Involved in quest: No Strings Attached
-- !pos 101.329 -6.999 -29.042 50
-- PUP job quest NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/jsequests")
-----------------------------------
-- Spinner(Mamook) drop 9894
-- Wamoura (Halvung) drop 9895
-- Great Ameretat (Aydeewa Subterrane) drop 9896

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, {{"gil", 10000}}) and player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED) == QUEST_COMPLETED and not player:hasItem(17859) then
        player:confirmTrade()
        npcUtil.giveItem(player, 17859)
    elseif npcUtil.tradeHas(trade, {4161, 5570}) and player:getCharVar("OperationTeatimeProgress") == 1 then -- Chai, Sleeping Potion
        player:startEvent(780)
    end
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.PUP)
end

function onTrigger(player, npc)

    local NoStringsAttached = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
    local NoStringsAttachedProgress = player:getCharVar("NoStringsAttachedProgress")
    local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION)
    local TheWaywardAutomationProgress = player:getCharVar("TheWaywardAutomationProgress")
    local OperationTeatime = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.OPERATION_TEATIME)
    local OperationTeatimeProgress = player:getCharVar("OperationTeatimeProgress")
    local isCurrentlyPuppetmaster = player:getMainJob() == tpz.job.PUP
    local LvL = player:getMainLvl()
    local Job = player:getMainJob()

    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.PUP)

    --Quest: PuppetMaster Blues
    local PuppetmasterBlues = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.PUPPETMASTER_BLUES)
    local OperationTeatime = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.OPERATION_TEATIME)

    if OperationTeatime == QUEST_COMPLETED and not player:needToZone() then
        if PuppetmasterBlues == QUEST_AVAILABLE and isCurrentlyPuppetmaster then
            return player:startEvent(782)
        elseif PuppetmasterBlues == QUEST_ACCEPTED then
            local PuppetmasterBluesProgress = player:getCharVar("PuppetmasterBluesProgress")
            if PuppetmasterBluesProgress <= 4 then
                return player:startEvent(783)
            elseif PuppetmasterBluesProgress == 5 then
                return player:startEvent(784)
            elseif PuppetmasterBluesProgress == 6 then
                return player:startEvent(785)
            elseif PuppetmasterBluesProgress == 7 then
                return player:startEvent(786)
            end
        elseif PuppetmasterBlues == QUEST_COMPLETED then
            return player:startEvent(787)
        end
        return player:startEvent(777)
    end

    -- Quest: No Strings Attached
    if NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 1 then
        player:startEvent(260) -- he tells u to get him an automaton
    elseif NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 2 then
        player:startEvent(261) -- reminder to get an automaton
    elseif NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 6 then
        player:startEvent(266) -- you bring him the automaton
    elseif Job == tpz.job.PUP and LvL < AF1_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED then
        player:startEvent(267) -- asking you how are you doing with your automaton
    -- In case a player completed the quest before unlocking attachments was implemented (no harm in doing this repeatedly)
        player:unlockAttachment(8224) --Harlequin Frame
        player:unlockAttachment(8193) --Harlequin Head
    elseif NoStringsAttached == QUEST_AVAILABLE then
        player:startEvent(259) -- Leave him alone

    --Quest: The Wayward Automation
    elseif Job == tpz.job.PUP and LvL >= AF1_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED and TheWaywardAutomation == QUEST_AVAILABLE then
        player:startEvent(774) -- he tells you to help find his auto
    elseif TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 1 then
        player:startEvent(775) -- reminder about to head to Nashmau
    elseif TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 3 then
        player:startEvent(776) -- tell him you found automation
    elseif Job == tpz.job.PUP and LvL < AF2_QUEST_LEVEL and TheWaywardAutomation == QUEST_COMPLETED then
        player:startEvent(777)
    elseif Job ~= tpz.job.PUP and TheWaywardAutomation == QUEST_COMPLETED then
        player:startEvent(777)
    elseif Job ~= tpz.job.PUP and NoStringsAttached == QUEST_COMPLETED then
        player:startEvent(267) -- asking you how are you doing with your automaton


    --Quest: Operation teatime
    elseif Job == tpz.job.PUP and LvL >= AF2_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED and TheWaywardAutomation == QUEST_COMPLETED and OperationTeatime == QUEST_AVAILABLE then
        player:startEvent(778)
    elseif OperationTeatime == QUEST_ACCEPTED and OperationTeatimeProgress == 1 then
        player:startEvent(779) -- Reminds you to get items
    elseif OperationTeatime == QUEST_ACCEPTED and OperationTeatimeProgress == 2 then
        player:startEvent(781) -- Reminds you to get items
    elseif OperationTeatime == QUEST_COMPLETED then
        player:startEvent(777)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 260 then
        player:setCharVar("NoStringsAttachedProgress", 2)
    elseif csid == 266 and npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED, {item=17859, title=tpz.title.PROUD_AUTOMATON_OWNER, var="NoStringsAttachedProgress"}) then
        player:unlockJob(tpz.job.PUP)
        player:messageSpecial(ID.text.YOU_CAN_BECOME_PUP) -- "You can now become a puppetmaster."
        player:setPetName(tpz.pet.type.AUTOMATON, option+118)
        player:unlockAttachment(8224) --Harlequin Frame
        player:unlockAttachment(8193) --Harlequin Head
    elseif csid == 774 then
        player:setCharVar("TheWaywardAutomationProgress", 1)
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION)
    elseif csid == 776 then
        npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION, {item=17858, var="TheWaywardAutomationProgress"})
        player:needToZone(true)
    elseif csid == 778 then
        player:setCharVar("OperationTeatimeProgress", 1)
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.OPERATION_TEATIME)
    elseif csid == 780 then
        player:setCharVar("OperationTeatimeProgress", 2)
        player:confirmTrade()
    elseif csid == 782 then
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.PUPPETMASTER_BLUES)
        player:setCharVar("PuppetmasterBluesProgress", 1)
    elseif csid == 784 then
        player:setCharVar("PuppetmasterBluesProgress", 6)
    elseif csid == 786 then
        npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.PUPPETMASTER_BLUES, {item=15267, title=tpz.title.PARAGON_OF_PUPPETMASTER_EXCELLENCE, var="PuppetmasterBluesProgress"})
    end
end
