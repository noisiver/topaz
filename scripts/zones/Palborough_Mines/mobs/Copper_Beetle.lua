-----------------------------------
-- Area: Palborough Mines
--  Mob: Copper Beetle
-- Note: PH for Bu'Ghi Howlblade
-----------------------------------
local ID = require("scripts/zones/Palborough_Mines/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BU_GHI_HOWLBLADE_PH, 25, 3600) -- 1 hour
end
