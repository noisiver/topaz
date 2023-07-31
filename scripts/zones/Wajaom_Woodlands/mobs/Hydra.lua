-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Hydra
-- !pos -282 -24 -1 51
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 975)
    mob:setMod(tpz.mod.DEF, 630)
    mob:setMod(tpz.mod.EVA, 357) --TODO: Hydra family * 1.15
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REGEN, 100)
    mob:setLocalVar("Raged", 0)
    mob:AnimationSub(0)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onMobFight(mob, target)
	local Raged = mob:getLocalVar("Raged")
    local battletime = mob:getBattleTime()
    local headgrow = mob:getLocalVar("headgrow")
    local broken = mob:AnimationSub()

    if (headgrow < battletime and broken > 0) then
        mob:AnimationSub(broken - 1)
        mob:setLocalVar("headgrow", battletime + 300)
    end

    if broken < 2 then
        mob:setMod(tpz.mod.REGAIN, 100)
    end
    if broken < 1 then
        mob:setMod(tpz.mod.REGEN, 100)
    else
        mob:setMod(tpz.mod.REGEN, 10)
    end

    if mob:getHPP() < 25 and Ranged == 0 then
        mob:setDamage(200)
        mob:setMod(tpz.mod.REGAIN, 100)
        mob:setLocalVar("Raged", 1)
    end
end

function onCriticalHit(mob)

    local rand = math.random(100)
    local battletime = mob:getBattleTime()
    local headgrow = mob:getLocalVar("headgrow")
    local headbreak = mob:getLocalVar("headbreak")
    local broken = mob:AnimationSub()

    if (rand <= 15 and battletime >= headbreak and broken < 3) then
        mob:AnimationSub(broken + 1)
        mob:setLocalVar("headgrow", battletime + math.random(300, 360))
        mob:setLocalVar("headbreak", battletime + 300)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)

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
