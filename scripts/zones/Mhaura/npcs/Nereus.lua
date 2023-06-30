-----------------------------------
-- Area: Mhaura
--  NPC: Nereus
-- Starts and ends repeteable quest A_POTTER_S_PREFERENCE
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/items")
require("scripts/globals/augments")
-----------------------------------
--    player:startEvent(110) -- standar dialog
--    player:startEvent(115) -- i have enough for now, come later
--    player:startEvent(114) -- get me x as soon as you can
--    player:startEvent(111) -- start quest A Potter's Preference
--    player:startEvent(113) -- quest done!
--    player:startEvent(112) -- repeat quest

local necks =
{
    { tpz.job.WAR, tpz.items.FIGHTERS_TORQUE },
    { tpz.job.MNK, tpz.items.TEMPLE_TORQUE },
    { tpz.job.WHM, tpz.items.HEALERS_TORQUE },
    { tpz.job.BLM, tpz.items.WIZARDS_TORQUE },
    { tpz.job.RDM, tpz.items.WARLOCKS_TORQUE },
    { tpz.job.THF, tpz.items.ROGUES_TORQUE },
    { tpz.job.PLD, tpz.items.GALLANT_TORQUE },
    { tpz.job.DRK, tpz.items.CHAOS_TORQUE },
    { tpz.job.BST, tpz.items.BEAST_TORQUE },
    { tpz.job.BRD, tpz.items.CHORAL_TORQUE },
    { tpz.job.RNG, tpz.items.HUNTERS_TORQUE },
    { tpz.job.SAM, tpz.items.MYOCHIN_SHUSA },
    { tpz.job.NIN, tpz.items.NINJA_SHUSA },
    { tpz.job.DRG, tpz.items.DRACHEN_TORQUE },
    { tpz.job.SMN, tpz.items.EVOKERS_TORQUE },
    { tpz.job.BLU, tpz.items.MAGUS_TORQUE },
    { tpz.job.COR, tpz.items.CORSAIRS_TORQUE },
    { tpz.job.PUP, tpz.items.PUPPETRY_TORQUE },
    { tpz.job.DNC, tpz.items.DANCERS_TORQUE },
    { tpz.job.SCH, tpz.items.SCHOLARS_TORQUE },
}

local augments =
{
    { tpz.augments.ACC, 4 },
    { tpz.augments.ATTK, 9 },
    { tpz.augments.RACC, 4 },
    { tpz.augments.RATTK, 9 },
    { tpz.augments.EVA, 9 },
    { tpz.augments.DEF, 29 },
    { tpz.augments.MACC, 4 },
    { tpz.augments.MATT, 1 },
    { tpz.augments.STR, 2 },
    { tpz.augments.DEX, 2 },
    { tpz.augments.VIT, 2 },
    { tpz.augments.AGI, 2 },
    { tpz.augments.INT, 2 },
    { tpz.augments.MND, 2 },
    { tpz.augments.CHR, 2 },
}

function onTrade(player, npc, trade)
    if player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_POTTER_S_PREFERENCE) == QUEST_ACCEPTED or player:getCharVar("QuestAPotterPrefeRepeat_var") == 1 then
        if npcUtil.tradeHas(trade, 569) then
            player:startEvent(113) -- quest done!
        end
    end
end

function onTrigger(player, npc)
    if player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_POTTER_S_PREFERENCE) == QUEST_AVAILABLE and player:getFameLevel(MHAURA) > 3 then
        player:startEvent(111, 569) -- start quest A Potter's Preference
    elseif player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_POTTER_S_PREFERENCE) == QUEST_ACCEPTED then
        player:startEvent(114, 569) -- get me dish_of_gusgen_clay  as soon as you can
    elseif player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_POTTER_S_PREFERENCE) == QUEST_COMPLETED then
        if player:getCharVar("QuestAPotterPrefeCompDay_var")+7 < VanadielDayOfTheYear() or player:getCharVar("QuestAPotterPrefeCompYear_var") < VanadielYear() then
            -- seven days after copletition, allow to do the quest again
            player:startEvent(112) -- repeat quest
        else
            player:startEvent(115) -- i have enough for now, come later
        end
    else
        player:startEvent(110) --standar dialog
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local neck = GetNeck(player)
    local stat, power = GetAugment()

    if csid == 111 and option == 1 then  --accept quest
        player:addQuest(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_POTTER_S_PREFERENCE)
    elseif csid == 113 then --quest completed
        if (player:getFreeSlotsCount(0) >= 1) then
            player:confirmTrade()
            player:addExp(6500 * EXP_RATE)
            player:addFame(WINDURST, 450)
            player:addGil(GIL_RATE*2160)
            player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*20000)
            player:setCharVar("QuestAPotterPrefeRepeat_var", 0)
            player:setCharVar("QuestAPotterPrefeCompDay_var", VanadielDayOfTheYear())
            player:setCharVar("QuestAPotterPrefeCompYear_var", VanadielYear())
            player:completeQuest(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_POTTER_S_PREFERENCE)
            player:PrintToPlayer("What's this?! Something in the clay...'",0,"Nereus")
            player:addItem(neck, 1, stat, power)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, neck)
        end
    elseif csid == 112 then --repeat quest
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addFame(WINDURST, 50)
            player:setCharVar("QuestAPotterPrefeRepeat_var", 1)
            player:PrintToPlayer("What's this?! Something in the clay...'",0,"Nereus")
            player:addItem(neck, 1, stat, power)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, neck)
        end
    end
end

function GetNeck(player)
    local neck = tpz.items.FIGHTERS_TORQUE

    for _,job in pairs(necks) do
        if (player:getMainJob() == job[1]) then
            neck = job[2]
        end
    end

    return neck
end

function GetAugment()
    local stat
    local power

    for _,augmentData in pairs(augments) do
        stat = augmentData[math.random(#augmentData)][1]
        power = augmentData[math.random(#augmentData)][2]
    end

    return stat, power
end