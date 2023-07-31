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
    mob:setDamage(20)
    mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
    mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:addMod(tpz.mod.GRAVITYRESTRAIT, 100)
    mob:addMod(tpz.mod.BINDRESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17396137)
end

function onMobInitialize(mob)
end

function onAdditionalEffect(mob, target, damage)
end

function onMobDeath(mob, player, isKiller, noKiller)
end