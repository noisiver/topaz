-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Avatar Idol
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobDeath(mob, player, isKiller, noKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
