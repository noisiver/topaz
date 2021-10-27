-----------------------------------
-- Area: The Boyahda Tree (153)
--   NM: Beet Leafhopper
-- Note: Popped by qm1
-- Involved in Quest: Shoot First, Ask Questions Later
-- !pos -18 -19.2 -176.4 153
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:addMod(tpz.mod.REGEN, 10) 
	mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.detonator, player)
end
