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
	mob:setDamage(140)
    mob:addMod(tpz.mod.DEFP, 200)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.tachi_kasha, player)
end
