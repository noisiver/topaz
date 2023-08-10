-----------------------------------
-- Area: Beaucedine Glacier [S]
--  Mob: Gigas Pelter
-- Note: PH for Becut
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BECUT_PH, 20, 7200) -- 2 hours
end
