-----------------------------------
-- Area: Den of Rancor
--  Mob: Tonberry Imprecator
-- Note: PH for Carmine-tailed Janberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
function onMobFight(mob, target)
    SetDropRate(2438, 4774, 100)
    SetDropRate(2438, 4803, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 798, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 799, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 800, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.CARMINE_TAILED_JANBERRY_PH, 30, 3600) -- 1 hour
end
