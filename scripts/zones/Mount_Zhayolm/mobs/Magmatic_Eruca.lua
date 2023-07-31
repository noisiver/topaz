-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Magmatic Eruca
-- Note: Place Holder Energetic Eruca
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
mixins = {require("scripts/mixins/families/eruca")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:AnimationSub(0)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ENERGETIC_ERUCA_PH, 20, 43200) -- 24 hours
end
