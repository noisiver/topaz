-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garharlor_the_Unruly
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
mixins = {
require("scripts/mixins/weapon_break"),
}
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.REFRESH, 400)
	mob:setLocalVar("TwoHourUsed", 0)
end

function onMobFight(mob, target)
	local TwoHourUsed = mob:getLocalVar("TwoHourUsed")
	if mob:getHPP() <= math.random(25, 50) and TwoHourUsed == 0 then
		mob:useMobAbility(2252) -- Eagle eye Shot
		mob:setLocalVar("TwoHourUsed", 1)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	DespawnMob(mob:getID()+1)
	DespawnMob(mob:getID()+2)
end
