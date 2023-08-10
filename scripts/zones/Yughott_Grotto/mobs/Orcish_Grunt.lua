-----------------------------------
-- Area: Yughott Grotto (142)
--  Mob: Orcish Grunt
-- Note: PH for Ashmaker Gotblut
-----------------------------------
local ID = require("scripts/zones/Yughott_Grotto/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ASHMAKER_GOTBLUT_PH, 30, math.random(7200, 10800)) -- 2 to 3 hours
end
