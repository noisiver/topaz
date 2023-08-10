-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Claret
-- !pos 501 -9 53
-- Spawned with Pectin: !additem 2591
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Claret
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
	mob:setDamage(125)
    mob:setMod(tpz.mod.DEF, 500)
    mob:setMod(tpz.mod.EVA, 320)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:addMod(tpz.mod.REGEN, math.floor(mob:getMaxHP()*.004))
    mob:addMod(tpz.mod.MOVE, 15)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000) -- 5k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 5000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    local HP = mob:getHPP()
    local BaseRegain = 50
    local Regain = (((HP - 100 ) * -10) /4) + BaseRegain
	mob:setMod(tpz.mod.REGAIN, Regain)
    -- "Stick" to target
    if mob:checkDistance(target) > 0 then
        local targetPos = target:getPos()
        local radians = (256 - targetPos.rot) * (math.pi / 128)
        mob:pathTo(targetPos.x + math.cos(radians), targetPos.y, targetPos.z + math.sin(radians))
    end
    -- Poison target
    if mob:checkDistance(target) < 2 then
        if not target:hasStatusEffect(tpz.effect.POISON) then
            target:addStatusEffect(tpz.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
        else
            if target:getStatusEffect(tpz.effect.POISON):getPower() < 100 then
                target:delStatusEffectSilent(tpz.effect.POISON)
                target:addStatusEffect(tpz.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
            end
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 100)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
