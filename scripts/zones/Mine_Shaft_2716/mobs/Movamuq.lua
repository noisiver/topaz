-----------------------------------
-- Area: Mine_Shaft_2716
--  NM: Movamuq
-- A Century of Hardship BCNM Fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/zones/Mine_Shaft_2716/globals")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
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
