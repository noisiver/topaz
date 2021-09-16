-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Magmatic Eruca
-- Note: Place Holder Energetic Eruca
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
mixins = {require("scripts/mixins/families/eruca")}
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ENERGETIC_ERUCA_PH, 20, 43200) -- 24 hours
end
