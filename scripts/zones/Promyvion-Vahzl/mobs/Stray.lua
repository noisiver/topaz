-----------------------------------
-- Area: Promyvion-Vahzl
--   NM: Stray
-----------------------------------
require("scripts/globals/promyvion")
-----------------------------------
function onMobRoam(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    tpz.promyvion.strayOnRoam(mob)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    tpz.promyvion.strayOnSpawn(mob)
	tpz.promyvion.setEmptyModel(mob)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end