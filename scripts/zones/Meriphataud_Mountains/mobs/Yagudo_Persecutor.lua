-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Yagudo Persecutor
-- Note: PH for Naa Zeku the Unwaiting
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.NAA_ZEKU_THE_UNWAITING_PH, 20, 3600) -- 1 hour
end
