-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Salamander
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    local bufftwo = tpz.effect.BLAZE_SPIKES

    mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 50, 0, 3600)
    mob:getStatusEffect(bufftwo):unsetFlag(tpz.effectFlag.DISPELABLE)
    DespawnMob(mob:getID(), 180)
end

function onMobDeath(mob, player, isKiller)
    local Red = GetMobByID(mob:getID() +1)
    Red:delStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    Red:delStatusEffect(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
    Red:delStatusEffect(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
end
