-----------------------------------
-- Area: Arrapago Reef
--   NM: Zareehkl the Jubilant
-----------------------------------
mixins = {require("scripts/mixins/families/qutrub")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("qutrubBreakChance", 5) -- Wiki implies its weapon is harder to break
end

function onMobDeath(mob, player, isKiller)
	if isKiller  then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
