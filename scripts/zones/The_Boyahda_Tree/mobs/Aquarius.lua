-----------------------------------
-- Area: The Boyahda Tree
--   NM: Aquarius
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.DEFP, 100)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.LIGHTSLEEP)
    mob:addImmunity(tpz.immunity.POISON)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
    mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 5000)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 358)
end
