-----------------------------------
-- Area: La Vaule [S]
--  Mob: Orcish Bowshooter
-- Note: PH for Hawkeyed Dnatbat
-----------------------------------
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.OrcTrashDrops(mob, player, isKiller, noKiller)
end

