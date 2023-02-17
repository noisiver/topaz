-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Earth Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    salvageUtil.setElementalMods(mob)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 15)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 15)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end
function onMobDespawn(mob)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, {chance = 100, power = math.random(200, 250)})
end