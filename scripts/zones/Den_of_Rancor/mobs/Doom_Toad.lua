-----------------------------------
-- Area: Den of Rancor
--  Mob: Doom Toad
-- Note: PH for Ogama
-----------------------------------
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 801, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.OGAMA_PH, 30, math.random(36000, 43200)) -- 21 to 23 hours
end
