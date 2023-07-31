-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Climbpix Highrise
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end


function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 97, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 98, 2, tpz.regime.type.FIELDS)
end
