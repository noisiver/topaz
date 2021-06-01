-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Mourning Crawler
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.SLASHRES, 1250)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 726, 3, tpz.regime.type.GROUNDS)
end
