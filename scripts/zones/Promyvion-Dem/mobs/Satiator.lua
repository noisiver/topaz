-----------------------------------
-- Area: Promyvion-Dem
--  MOB: Satiator
-----------------------------------
require("scripts/globals/promyvion")
mixins = {require("scripts/mixins/families/empty")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.REGAIN, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end