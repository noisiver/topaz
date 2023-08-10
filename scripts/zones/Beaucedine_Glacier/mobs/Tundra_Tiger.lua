-----------------------------------
-- Area: Beaucedine Glacier (111)
--  Mob: Tundra Tiger
-- Note: PH for Nue, Kirata
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 46, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 47, 1, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.KIRATA_PH, 20, 3600) -- 1 hr
    tpz.mob.phOnDespawn(mob, ID.mob.NUE_PH, 20, 3600) -- 1 hr
end
