-----------------------------------
-- Area: Riverne - Site A01
--  Mob: Flame Drake
-- Note: PH for Aiatar
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.Aiatar_PH, 20, 3600) -- 1 hour
end
