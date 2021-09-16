-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Wamoura
-- Note: PH for Ignamoth
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.IGNAMOTH_PH, 20, 7200) -- 2 hours
end
