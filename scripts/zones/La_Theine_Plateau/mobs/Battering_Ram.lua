-----------------------------------
-- Area: La Theine Plateau
--  Mob: Battering Ram
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
-----------------------------------
require("scripts/globals/mobs")
require("scripts/quests/tutorial")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.tutorial.onMobDeath(player)
end

function onMobDespawn(mob)
    if not tpz.mob.phOnDespawn(mob, ID.mob.BLOODTEAR_PH, 10, math.random(36000, 43200)) then -- 21-24 hours
        tpz.mob.phOnDespawn(mob, ID.mob.LUMBERING_LAMBERT_PH, 30, 3600) -- changed from 20 min
    end
end
