-----------------------------------
-- Area: The Boyahda Tree
--   NM: Agas
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 50)
    mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
    mob:addMod(tpz.mod.DEFP, 35) 
    mob:addMod(tpz.mod.ATTP, 35)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMod(tpz.mod.REGEN, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
	rnd = math.random()

    if (rnd < 0.5) then
        return 196 -- thundaga III
    elseif (rnd < 0.7) then
        return 167 -- thunder IV
    elseif (rnd < 0.9) then
        return 213 -- burst II
    else
        return 274 -- sleepga_II
    end

end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.SEARCHING_FOR_THE_RIGHT_WORDS) == QUEST_ACCEPTED and not player:hasKeyItem(tpz.ki.MOONDROP) then
        player:setCharVar("Searching_AgasKilled", 1)
    end
end
