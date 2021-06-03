-----------------------------------
-- Area: Castle Zvahl Baileys
--  Mob: Abyssal Demon
-- Note: PH for Marquis Sabnock
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.MARQUIS_SABNOCK_PH, 30, math.random(36000, 43200)) -- 21 to 23 hours
end
