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
    local startingbuff = mob:getStatusEffect(buffone)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 100)
    mob:addStatusEffect(tpz.effect.REGEN, 25, 3, 0)
    mob:addStatusEffect(tpz.effect.PHALANX, 50, 0, 0)
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
        printf("Set Phalanx Time");
        return
    elseif mob:getBattleTime() >= phalanxTime then
        mob:addStatusEffect(tpz.effect.PHALANX, 50, 0, 3600)
        local buff1 = mob:getStatusEffect(buffone)
        mob:setLocalVar("Phalanx", mob:getBattleTime() + math.random(2, 3)*15)
        buff1:unsetFlag(tpz.effectFlag.DISPELABLE)
        printf("Add Phalanx Buff");
    end
    if spikesTime == 0 then
        mob:setLocalVar("BlazeSpikes", math.random(2, 3)*30)
        printf("Set Spikes Time");
        return
    elseif mob:getBattleTime() >= spikesTime then
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 25, 0, 3600)
        local buff2 = mob:getStatusEffect(bufftwo)
        mob:setLocalVar("Blazespikes", mob:getBattleTime() + math.random(2, 3)*30)
        buff2:unsetFlag(tpz.effectFlag.DISPELABLE)
        printf("Add Blaze Spikes Buff");
    end
end

function onMagicHit(caster, target, spell)
    local DAY = VanadielDayOfTheWeek()
    local ELEM = spell:getElement()
    if (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) then
        target:delStatusEffect(116) -- Phalanx
        target:delStatusEffect(34) -- Blaze spikes
        printf("Delete Buffs");
    end
    return 1
end

    --eald_narche:delStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
