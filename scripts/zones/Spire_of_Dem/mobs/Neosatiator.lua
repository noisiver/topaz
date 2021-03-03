-----------------------------------
-- Area: Spire of Dem
--  Mob: Neosatiator
-- You Are What You Eat
-- !addkeyitem CENSER_OF_ANTIPATHY
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
     tpz.promyvion.setEmptyModel(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller)
    tpz.promyvion.onEmptyDeath(mob)
end