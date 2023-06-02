-----------------------------------
-- Area: Phomiuna Aqueducts
--  Mob: Minotaur
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/globals/missions")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobSpawn(mob)
    mob:setLocalVar("fomorHateDecrease", 1)
    mob:setLocalVar("fomorHateAdj", 1)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 10)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 30)
end

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.DISTANT_BELIEFS and player:getCharVar("PromathiaStatus") == 0) then
        player:setCharVar("PromathiaStatus", 1)
    end
end
