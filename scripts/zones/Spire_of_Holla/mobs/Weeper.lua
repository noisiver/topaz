-----------------------------------
-- Area: Spire of Holla
--  Mob: Cogitator
-- Simulant
-- !addkeyitem CENSER_OF_ABANDONMENT
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMobMod(tpz.mobMod.NO_DROPS)
end

function onMobDeath(mob, player, isKiller)
end