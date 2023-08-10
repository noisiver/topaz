-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fallen Mage
-- Note: Place holder Hovering Hotpot
-----------------------------------
local ID = require("scripts/zones/Garlaige_Citadel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 703, 2, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.HOVERING_HOTPOT_PH, 20, 1) -- can repop instantly
end
