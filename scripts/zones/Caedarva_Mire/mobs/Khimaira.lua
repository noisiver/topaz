-----------------------------------
-- Area: Caedarva Mire
--   NM: Khimaira
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(140)
    mob:setMod(tpz.mod.ATT, 740)
    mob:setMod(tpz.mod.DEF, 570)
    mob:setMod(tpz.mod.EVA, 358)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:setMod(tpz.mod.UDMGBREATH, -50)
    mob:setMod(tpz.mod.REFRESH, 50)
    mob:AnimationSub(0)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onCriticalHit(mob)
    local rand = math.random(100)
    if rand <= 1 then
        mob:AnimationSub(1)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.KHIMAIRA_CARVER)
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
