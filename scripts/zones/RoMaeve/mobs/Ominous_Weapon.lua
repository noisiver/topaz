-----------------------------------
-- Area: RoMaeve
--  Mob: Ominous Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 119, 2, tpz.regime.type.FIELDS)
end
