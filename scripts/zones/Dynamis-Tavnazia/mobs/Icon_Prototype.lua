-----------------------------------
-- Area: Dynamis - Tavnazia
--  Mob: Icon Prototype
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
