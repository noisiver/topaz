-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Plague Chigoe - The Prankster)
-- !pos 460.166 -14.920 256.214 52
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local ThePrankster = player:getQuestStatus(AHT_URHGAN, THE_PRANKSTER)
    local ThePranksterProgress = player:getCharVar("ThePrankster")
    printf("%s %s %s", ThePrankster == QUEST_ACCEPTED, ThePranksterProgress == 3, not GetMobByID(ID.mob.PLAGUE_CHIGOE):isSpawned())
    if ThePranksterProgress == 3 and not GetMobByID(ID.mob.PLAGUE_CHIGOE):isSpawned() then
        player:startEvent(1)
    elseif ThePranksterProgress == 4 then
        player:startEvent(2)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 1) and not GetMobByID(ID.mob.PLAGUE_CHIGOE):isSpawned() then
        npcUtil.popFromQM(player, npc, ID.mob.PLAGUE_CHIGOE, {claim = true, hide = 330})
    elseif (csid == 2) then
        npcUtil.completeQuest(player, AHT_URHGAN, THE_PRANKSTER, {
            ki = tpz.ki.MAP_OF_CAEDARVA_MIRE,  
            var = "ThePrankster", 
        })
    end
end