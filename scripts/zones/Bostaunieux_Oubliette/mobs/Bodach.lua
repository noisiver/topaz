-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Bodach
-- Note: Popped by qm1
-- Involved in Quest: The Walls of Your Mind
-- !pos 29 16 -140 167
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

function onMobDeath(mob, player, isKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.asuran_fists, player)
end
