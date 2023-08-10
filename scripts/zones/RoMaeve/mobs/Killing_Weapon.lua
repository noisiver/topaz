-----------------------------------
-- Area: RoMaeve
--  Mob: Killing Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 119, 1, tpz.regime.type.FIELDS)
end
