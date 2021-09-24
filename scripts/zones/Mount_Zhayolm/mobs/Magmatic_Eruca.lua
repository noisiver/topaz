-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Magmatic Eruca
-- Note: Place Holder Energetic Eruca
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
mixins = {require("scripts/mixins/families/eruca")}
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:AnimationSub(0)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ENERGETIC_ERUCA_PH, 20, 43200) -- 24 hours
end
