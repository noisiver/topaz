-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Marsh Sahagin
-- Note: PH for Worr the Clawfisted and Voll the Sharkfinned
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 806, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 807, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 808, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.WORR_THE_CLAWFISTED_PH, 30, math.random(36000, 43200)) -- 21 to 23 hours
    tpz.mob.phOnDespawn(mob, ID.mob.VOLL_THE_SHARKFINNED_PH, 30, math.random(36000, 43200)) -- 21 to 23 hours
end
