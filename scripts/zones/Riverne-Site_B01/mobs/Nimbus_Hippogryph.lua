-----------------------------------
-- Area: Riverne - Site B01
--  Mob: Nimbus Hippogryph
-- Note: Place holder Imdugud
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.IMDUGUD_PH, 10, math.random(36000, 43200)) -- 11 to 12 hours
end
