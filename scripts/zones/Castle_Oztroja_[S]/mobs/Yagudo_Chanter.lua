-----------------------------------
-- Area: Castle Oztroja [S]
--  Mob: Yagudo Sentinel
-- Note: PH for Aa Xalmo the Savage and Zhuu Buxu the Silent
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.YagudoTrashDrops(mob, player, isKiller, noKiller)
end