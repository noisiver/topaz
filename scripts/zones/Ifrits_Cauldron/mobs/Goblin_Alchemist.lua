-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Goblin Alchemist
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 757, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.FORESEER_ORAMIX_PH, 30, 3600) -- 1 hour
end
