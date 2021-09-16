-----------------------------------
-- Area: Arrapago Reef
--  Mob: Archaic_Mirror
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end
