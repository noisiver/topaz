-----------------------------------
-- Area: Kuftal Tunnel (174)
--   NM: Kettenkaefer
-- Note: Popped by qm3
-- !pos 204.052 10.25 96.414 174
-- Involved in Quest: The Potential Within
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.DEFP, 200)
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
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.tachi_kasha, player)
end
