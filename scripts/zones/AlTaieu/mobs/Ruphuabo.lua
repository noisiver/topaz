-----------------------------------
-- Area: Al'Taieu
--  Mob: Ru'phuabo
-- Jailor of Love Pet version
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
    JoL:setMobMod(tpz.mobMod.NO_MOVE, 0)
    JoL:SetAutoAttackEnabled(true)
    JoL:SetMobAbilityEnabled(true)
    JoL:SetMagicCastingEnabled(true)
end
