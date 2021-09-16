-----------------------------------
-- Area: Caedarva Mire
--  Mob: Wild Karakul
-- Note: PH for Peallaidh
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller))))
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PEALLAIDH_PH, 20, 3600) -- 1 hour
end
