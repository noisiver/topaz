-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  Mob: Rafflesia
-- Note: PH for Kirtimukha
-----------------------------------
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.KIRTIMUKHA_PH, 5, 3600) -- 1 hour
end
