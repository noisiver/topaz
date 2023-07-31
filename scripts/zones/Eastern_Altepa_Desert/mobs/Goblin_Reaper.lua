-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Goblin Reaper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 113, 3, tpz.regime.type.FIELDS)
end
