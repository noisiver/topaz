-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Magma
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    mob:addStatusEffect(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
    mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
