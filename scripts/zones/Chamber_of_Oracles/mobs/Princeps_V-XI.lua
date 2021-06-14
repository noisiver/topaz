-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Princeps V-XI
-- Zilart 6 Fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller)
end
