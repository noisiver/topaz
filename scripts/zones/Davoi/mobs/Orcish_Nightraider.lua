-----------------------------------
-- Area: Davoi
--  Mob: Orcish Nightraider
-- Note: PH for Poisonhand Gnadgad
-----------------------------------
local ID = require("scripts/zones/Davoi/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.POISONHAND_GNADGAD_PH, 30, 3600) -- 1 hour
end
