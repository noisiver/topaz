-----------------------------------
-- Area: Palborough Mines
--  Mob: Veteran Quadav
-- Note: PH for Zi'Ghi Boneeater
-----------------------------------
local ID = require("scripts/zones/Palborough_Mines/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ZI_GHI_BONEEATER_PH, 30, 3600) -- 1 hour
end
