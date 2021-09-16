-----------------------------------
-- Area: Caedarva Mire
--   NM: Aynu-kaysey
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/families/qutrub")}
-----------------------------------

function onMobDeath(mob, player, isKiller))))
    tpz.hunts.checkHunt(mob, player, 470)
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

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
