-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Peg Powler
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 30) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:setMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 9000)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 297)
    tpz.regime.checkRegime(player, mob, 774, 1, tpz.regime.type.GROUNDS)
end
