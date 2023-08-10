-----------------------------------
-- Area: Mine_Shaft_2716
--  NM: Chekochuk
-- A Century of Hardship BCNM Fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/zones/Mine_Shaft_2716/globals")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobEngaged(mob)
    mob:setLocalVar("recall", math.random(30, 90))
end

function onMobFight(mob, target)
    local recall = mob:getLocalVar("recall")
    if mob:getBattleTime() > recall then
        mob:setLocalVar("recall", recall + math.random(30, 90))
        recallBugbby(mob, target)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
