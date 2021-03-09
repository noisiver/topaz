-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Ose
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 30) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 10000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {chance = 50, power = 50})
end

function onMobDeath(mob, player, isKiller)
end
