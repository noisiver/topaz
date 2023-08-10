-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Mamool_Ja_Lurker
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
