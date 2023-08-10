-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamie_No8
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(125) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REGAIN, 250)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 6088) -- Arrow Deluge only
    mob:AnimationSub(12)
end

function onMobEngaged(mob)
    mob:setLocalVar("twohourtime", math.random(45, 60))
end

function onMobFight(mob, target)
    local twohourtime = mob:getLocalVar("twohourtime")
    local battletime = mob:getBattleTime()
    if mob:getHPP() <= 40 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6060) -- Belly Dance only
    end
    if battletime >= twohourtime then
        mob:useMobAbility(1932) -- Eagle Eye Shot
        mob:setLocalVar("twohourtime", battletime + math.random(45, 60))
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
end