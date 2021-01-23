-----------------------------------
-- Area:  Gusgen Mines
-- NM:    Aroma Fly
-- Notes: Spawns only from hours 06 to 16.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {power = 20})
end
