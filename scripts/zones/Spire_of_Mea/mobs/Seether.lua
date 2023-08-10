-----------------------------------
-- Area: Spire of Mea
--  Mob: Seether
-- Playing Host
-- !addkeyitem CENSER_OF_ANIMUS
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
-----------------------------------

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
    mob:addTP(3000)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end