-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Da'Shu Knightslayer
-- BCNM mob in Bastok mission 7-2.
-----------------------------------
mixins = {require("scripts/mixins/job_special")}

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
