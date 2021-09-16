-----------------------------------
-- Area: Mamook
--  Mob: Archaic_Mirror
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller then 
		isKiller:addTreasure(5736, mob)--Linen Coin Purse
	end
end