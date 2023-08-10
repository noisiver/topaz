-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Goblin Welldigger
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 5)
end


function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 137, 1, tpz.regime.type.FIELDS)
end
