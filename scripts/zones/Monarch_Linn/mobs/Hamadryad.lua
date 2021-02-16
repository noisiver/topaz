-----------------------------------
-- Area: Monarch Linn
--  Mob: Hamadryad
-- Bad Seed
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local buffone = tpz.effect.PHALANX
local bufftwo = tpz.effect.BLAZE_SPIKES

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 100)
     mob:addStatusEffect(tpz.effect.REGEN, 25, 3, 0)
     mob:addStatusEffect(tpz.effect.PHALANX, 50, 0, 0)
     local startingbuff = mob:getStatusEffect(buffone)
     startingbuff:unsetFlag(tpz.effectFlag.DISPELABLE)
end

function onMobEngaged(mob, target)
end


function onMobInitialize(mob)
end

function onMobFight(mob, target)
    local phalanxTime = mob:getLocalVar("Phalanx")
    local spikesTime = mob:getLocalVar("BlazeSpikes")

    if phalanxTime == 0 then
        mob:setLocalVar("Phalanx", math.random(2, 3)*15)
        return
    end
    if mob:getBattleTime() >= phalanxTime then
        mob:addStatusEffect(tpz.effect.PHALANX, 50, 0, 0)
        local buff1 = mob:getStatusEffect(buffone)
        mob:setLocalVar("Phalanx", mob:getBattleTime() + math.random(2, 3)*15)
        buff1:unsetFlag(tpz.effectFlag.DISPELABLE)
    end
    if spikesTime == 0 then
        mob:setLocalVar("Phalanx", math.random(2, 3)*30)
        return
    end
    if mob:getBattleTime() >= spikesTime then
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 25, 0, 0)
        local buff2 = mob:getStatusEffect(bufftwo)
        mob:setLocalVar("Blazespikes", mob:getBattleTime() + math.random(2, 3)*30)
        buff2:unsetFlag(tpz.effectFlag.DISPELABLE)
    end
end

function onMagicHit(caster, target, spell)
    local DAY = VanadielDayOfTheWeek()
    local ELEM = spell:getElement()
    if (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) then
        target:delStatusEffect(106)
        target:delStatusEffect(249)  
    end
    return 1
end

