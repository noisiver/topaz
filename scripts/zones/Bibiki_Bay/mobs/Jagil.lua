-----------------------------------
-- Area: Bibiki Bay
--  Mob: Jagil
-- Note: PH for Serra
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SERRA_PH, 20, 3600) -- 1 hour
end
