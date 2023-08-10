-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Razorjaw Pugil
-- Note: PH for Sea Hog
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SEA_HOG_PH, 30, 4800) -- 1 hour 20 minutes
end
