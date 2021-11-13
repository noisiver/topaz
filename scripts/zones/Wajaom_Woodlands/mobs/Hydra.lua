-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Hydra
-- !pos -282 -24 -1 51
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(130)
end

function onMobFight(mob, target)

    local battletime = mob:getBattleTime()
    local headgrow = mob:getLocalVar("headgrow")
    local broken = mob:AnimationSub()

    if (headgrow < battletime and broken > 4) then
        mob:AnimationSub(broken - 1)
        mob:setLocalVar("headgrow", battletime + 300)
    end

end

function onCriticalHit(mob)

    local rand = math.random()
    local battletime = mob:getBattleTime()
    local headgrow = mob:getLocalVar("headgrow")
    local headbreak = mob:getLocalVar("headbreak")
    local broken = mob:AnimationSub()

    if (rand <= 0.15 and battletime >= headbreak and broken < 6) then
        mob:AnimationSub(broken + 1)
        mob:setLocalVar("headgrow", battletime + math.random(120, 240))
        mob:setLocalVar("headbreak", battletime + 300)
    end

end

function onMobDeath(mob, player, isKiller)

    player:addTitle(tpz.title.HYDRA_HEADHUNTER)
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
