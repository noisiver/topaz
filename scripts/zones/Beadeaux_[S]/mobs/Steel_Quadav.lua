-----------------------------------
-- Area: Beadeaux [S]
--  Mob: Adaman Quadav
-----------------------------------
local ID = require("scripts/zones/Beadeaux_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.QuadavTrashDrops(mob, player, isKiller, noKiller)
end
