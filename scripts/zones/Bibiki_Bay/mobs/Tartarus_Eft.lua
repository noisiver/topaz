-----------------------------------
-- Area: Bibiki Bay
--  Mob: Tartarus Eft
-- Note: PH for Splacknuck
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SPLACKNUCK_PH, 20, 3600) -- 1 hour
end
