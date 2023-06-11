-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Peg Powler
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/regimes")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 297)
    tpz.regime.checkRegime(player, mob, 774, 1, tpz.regime.type.GROUNDS)
end
