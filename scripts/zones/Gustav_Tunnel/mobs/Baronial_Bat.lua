-----------------------------------
-- Area: Gustav Tunnel (212)
--  Mob: Baronial Bat
-- Note: Popped by qm1
-- !pos 56 -1 16 212
-- Involved in Quest: Cloak and Dagger
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.evisceration, player)
end
