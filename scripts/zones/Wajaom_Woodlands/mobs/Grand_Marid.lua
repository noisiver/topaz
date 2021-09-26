-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Grand Marid
-- Note: 
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/marid")}

function onMobDeath(mob, player, isKiller)
	if mob:AnimationSub() >= 1 then
		if math.random(1,100) <= 24 then 
			player:addTreasure(2147, mob) --Marid Tusk
		end
		if mob:AnimationSub() == 2 then
			if math.random(1,100) <= 24 then 
				player:addTreasure(2147, mob) --Marid Tusk
			end
		end
	end

	if isKiller then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	 end
end


