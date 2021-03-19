-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Magma
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    mob:addStatusEffect(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
    mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
end

function onMobDeath(mob, player, isKiller)
end
