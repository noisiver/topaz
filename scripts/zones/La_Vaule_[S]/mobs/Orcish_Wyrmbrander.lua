-----------------------------------
-- Area: La Vaule [S]
--  Mob: Orcish Champion
-- Note: PH for Aa Xalmo the Savage and Zhuu Buxu the Silent
-----------------------------------
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.OrcTrashDrops(mob, player, isKiller, noKiller)
end