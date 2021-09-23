-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Mamool_Ja_Infiltrator
-----------------------------------

local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
