-----------------------------------
-- Area: RoMaeve
--  Mob: Cursed Puppet
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 121, 1, tpz.regime.type.FIELDS)
end
