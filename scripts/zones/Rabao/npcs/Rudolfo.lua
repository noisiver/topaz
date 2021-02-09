-----------------------------------
-- Area: Rabao
--  NPC: Rudolfo
-- Standard Info NPC
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local ChasingDreams = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)

    if (ChasingDreams == QUEST_AVAILABLE then --and player:getFameLevel(RABAO) >= 4) 
         player:startEvent(125)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
        if (csid == 125) then
          player:addQuest(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)
          player:setCharVar("ChasingDreams", 1)
        end
end
