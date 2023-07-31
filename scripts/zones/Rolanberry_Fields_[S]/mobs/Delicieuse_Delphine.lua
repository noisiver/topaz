------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Delicieuse Delphine
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.MOVE, 20)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {chance = 25, power = 25, duration = 30})
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 513)
end
