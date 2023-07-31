-----------------------------------
-- Area: Sealion's Den
--  NPC: Makki-Chebukki
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs");
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addStatusEffectEx(tpz.effect.ALL_MISS, 0, 1, 0, 0)
    mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    mob:addStatusEffectEx(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
    mob:addStatusEffectEx(tpz.effect.MAGIC_SHIELD, 0, 0, 0, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
end

function onMobSpawn(mob)
    mob:setLocalVar("text", 7914)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
