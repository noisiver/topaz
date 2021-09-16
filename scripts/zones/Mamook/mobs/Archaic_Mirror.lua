-----------------------------------
-- Area: Mamook
--  Mob: Archaic_Mirror
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller then 
		killer:addTreasure(5736, mob)--Linen Coin Purse
	end
end