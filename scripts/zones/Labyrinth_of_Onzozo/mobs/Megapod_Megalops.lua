-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Megapod Megalops
-- Note: Popped by qm1
-- !pos 115 14.68 164.1 213
-- Involved in Quest: Bugi Soden
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
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
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.blade_ku, player)
end
