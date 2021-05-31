-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Snaggletooth Peapuk
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, 24)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 726, 2, tpz.regime.type.GROUNDS)
end
