-----------------------------------
-- Area: Palborough Mines
--  Mob: Copper Quadav
-- Note: PH for Be'Hya Hundredwall
-----------------------------------
local ID = require("scripts/zones/Palborough_Mines/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BEHYA_HUNDREDWALL_PH, 30, 3600) -- 1 hour
end
