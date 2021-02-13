-----------------------------------
-- Area: Xarcabard
--   NM: Boreal Coeurl
-- Involved in Quests: Atop the Highest Mountains
-- !pos 580 -9 290 112
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if OLDSCHOOL_G2 then
        GetNPCByID(ID.npc.BOREAL_COEURL_QM):showNPC(0)
    end
     mob:setMod(tpz.mod.SLEEPRES, 100)
     mob:setMod(tpz.mod.LULLABYRES, 100)
     mob:setMod(tpz.mod.STUNRES, 100)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:addMod(tpz.mod.delay, -150)
end

function onMobDeath(mob, player, isKiller)
    if OLDSCHOOL_G2 then
        -- show ??? for desired duration
        -- notify people on the quest who need the KI
        GetNPCByID(ID.npc.BOREAL_COEURL_QM):showNPC(FRIGICITE_TIME)
        if
            not player:hasKeyItem(tpz.ki.SQUARE_FRIGICITE) and
            player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED
        then
            player:messageSpecial(ID.text.BLOCKS_OF_ICE)
        end
    end
end
