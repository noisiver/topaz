-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Soulstealer Skullnix
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 30) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 9000)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 298)
    tpz.regime.checkRegime(player, mob, 771, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 772, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 774, 2, tpz.regime.type.GROUNDS)
end
