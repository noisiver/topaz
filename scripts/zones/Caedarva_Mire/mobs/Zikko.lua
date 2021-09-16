-----------------------------------
-- Area: Caedarva Mire
--   NM: Zikko
-- !pos -608.5 11.3 -186.5 79
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobDeath(mob, player, isKiller))
    tpz.hunts.checkHunt(mob, player, 469)
	if isKiller  then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
