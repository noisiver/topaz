-----------------------------------
-- Area: Halvung
--  Mob: Dahak
-----------------------------------
mixins = {require("scripts/mixins/families/dahak")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
