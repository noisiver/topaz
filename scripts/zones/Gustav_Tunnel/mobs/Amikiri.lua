-----------------------------------
-- Area: Gustav Tunnel
--   NM: Amikiri
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ATTP, 25)
     mob:addMod(tpz.mod.ACC, 25) 
     mob:addMod(tpz.mod.EVA, 25)
     mob:setMod(tpz.mod.STORETP, 100)
     mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
     mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 13500)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {chance = 100, power = 50, duration = 20})
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 473)
end
