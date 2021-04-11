-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Phorusrhacos
-- Note: Place holder Picolaton
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PICOLATON_PH, 20, 5400) -- 90 minutes
end
