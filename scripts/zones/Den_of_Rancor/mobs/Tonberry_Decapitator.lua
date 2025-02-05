-----------------------------------
-- Area: Den of Rancor
--   NM: Tonberry Decapitator
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/regimes")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 9000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end


function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 798, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 799, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 800, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(1260, 1440)) -- 21 to 24 minutes
end
