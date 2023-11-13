-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garharlor_the_Unruly
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
mixins = {
require("scripts/mixins/weapon_break"),
require("scripts/mixins/job_special")
}
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobEngaged(mob, target)
    for v = 17027467, 17027469 do
        GetMobByID(v):updateEnmity(player)
    end
end

function onMobFight(mob, target)
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
