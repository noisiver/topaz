-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Viseclaw
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.UDMGPHYS, -50)
    mob:setMod(tpz.mod.UDMGMAGIC, 100)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 726, 1, tpz.regime.type.GROUNDS)
end
