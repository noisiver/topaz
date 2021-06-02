-----------------------------------
-- Area: Gustav Tunnel
--   NM: Baobhan Sith
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")

function onMobSpawn(mob)
     mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
	 mob:setMod(tpz.mod.STUNRESTRAIT, 100)
	 mob:setMod(tpz.mod.BINDRESTRAIT, 100)
     mob:addMod(tpz.mod.DEFP, 35) 
     mob:addMod(tpz.mod.ATTP, 35)
     mob:addMod(tpz.mod.ACC, 35) 
     mob:addMod(tpz.mod.EVA, 35)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 12000)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TERROR, {chance = 25, power = 2, duration = 2})
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 425)
end
