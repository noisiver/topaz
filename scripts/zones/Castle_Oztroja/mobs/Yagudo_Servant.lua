-----------------------------------
-- Area: Monarch Linn
--  Mob: Guard Hippogryph
-- Beloved of the Atlantes
-- Key item ID: 674
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
     mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:addMod(tpz.mod.GRAVITYRESTRAIT, 100)
     mob:addMod(tpz.mod.BINDRESTRAIT, 100)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
     mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
     mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
     mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17396137)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 20, duration = 5})
end

function onMobDeath(mob, player, isKiller)
end