-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Desert Manticore
-- Note: PH for Dahu
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DAHU_PH, 20, 3600) -- 1 hour
end
