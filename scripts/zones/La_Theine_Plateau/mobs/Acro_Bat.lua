-----------------------------------
-- Area: La Theine Plateau
--  Mob: Acro Bat
-----------------------------------
require("scripts/globals/regimes")
require("scripts/quests/tutorial")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 71, 1, tpz.regime.type.FIELDS)
    tpz.tutorial.onMobDeath(player)
end
