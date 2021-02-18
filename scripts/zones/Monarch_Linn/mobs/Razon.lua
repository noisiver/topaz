-----------------------------------
-- Area: Monarch Linn
--  Mob: Razon
-- Fire in the Sky
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobEngaged(mob, target)
end


function onMobInitialize(mob)
end

function onMobFight(mob, target)
    local boom = mob:getLocalVar("boom")

    if mob:getBattleTime() >= 30 and mob:getHPP() > 66 and boom == 0  then
        mob:useMobAbility(571) -- 650 damage
        mob:AnimationSub(1)
        mob:setLocalVar("boom", 1)
    elseif mob:getBattleTime() >= 30 and mob:getHPP() < 66 and boom == 0  then
        mob:useMobAbility(574) -- 0 damage
        mob:AnimationSub(1)
        mob:setLocalVar("boom", 1)
    elseif mob:getBattleTime() >= 60 and mob:getHPP() > 33 and boom == 1  then
        mob:useMobAbility(572) -- 750 damage
        mob:AnimationSub(2)
        mob:setLocalVar("boom", 2)
    elseif mob:getBattleTime() >= 60 and mob:getHPP() < 33 and boom == 1  then
        mob:useMobAbility(574) -- 0 damage
        mob:AnimationSub(2)
        mob:setLocalVar("boom", 2)
    elseif mob:getBattleTime() >= 90 and mob:getHPP() >= 1 and boom == 2  then
        mob:useMobAbility(573) -- 900 damage
        mob:setLocalVar("boom", 3)
    end
end

function onMagicHit(caster, target, spell)
    local DAY = VanadielDayOfTheWeek()
    local ELEM = spell:getElement()
    local TP = target:getTP() -- maybe skill: gettp()?
    local elementboom = mob:getLocalVar("elementboom")

    if (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 0 then
        target:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setLocalVar("elementboom", 1)
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 1 then
        target:useMobAbility(571)  -- 650 damage
        mob:AnimationSub(1)
        mob:setLocalVar("elementboom", 2)
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 2 then
        target:useMobAbility(572)  -- 650 damage
        mob:AnimationSub(1)
        mob:setLocalVar("elementboom", 3)
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 3 then
        target:useMobAbility(573)  -- 900 damage
        mob:AnimationSub(1)
    end
    return 1
end