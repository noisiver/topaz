-----------------------------------
-- Area: Konschtat Highlands
--   NM: Tremor Ram
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs")
require("scripts/globals/mobs")
require("scripts/quests/tutorial")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.tutorial.onMobDeath(player)
end

function onMobDespawn(mob)
    -- If Steelflect doesn't pop next, fallback onto Rampaging Ram
    if not tpz.mob.phOnDespawn(mob, ID.mob.STEELFLEECE_PH, 10, math.random(36000, 43200)) then -- 21-24 hours
        tpz.mob.phOnDespawn(mob, ID.mob.RAMPAGING_RAM_PH, 30, 3600) -- changed from 20 min
    end
end
