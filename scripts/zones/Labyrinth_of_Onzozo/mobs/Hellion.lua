-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Hellion
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 30) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 15000)
end
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK, {chance = 100, power = 60})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 296)
end
