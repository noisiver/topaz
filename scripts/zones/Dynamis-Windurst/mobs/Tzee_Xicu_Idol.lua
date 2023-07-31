-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Tzee Xicu Idol
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.REFRESH, 300)
     mob:delImmunity(tpz.immunity.STUN)
end

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
