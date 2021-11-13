-----------------------------------
-- Area: Mount Zhayolm
--   NM: Cerberus
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(135)
end

function onMobFight(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(tpz.mod.REGAIN, 10)
    else
        mob:setMod(tpz.mod.REGAIN, 70)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.CERBERUS_MUZZLER)
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end
