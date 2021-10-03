-----------------------------------
-- Area: Cape Teriggan
--   NM: Stolas
-- Note: Popped by qm1
-- !pos -151.65 -8.5 191.37 113
-- Involved in Quest: From Saplings Grow
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 100)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 15)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end


function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.empyreal_arrow, player)
end
