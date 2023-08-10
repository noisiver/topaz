-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Hoarder Hare
-- Note: PH for Teporingo
-----------------------------------
local ID = require("scripts/zones/Dangruf_Wadi/IDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.TEPORINGO_PH, 50, 3600) -- 1 hour
end
