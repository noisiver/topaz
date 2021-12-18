-----------------------------------
-- Area: Monarch Linn
--  Mob: Razon
-- Fire in the Sky
-- Key item ID: 674
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 15) 
     mob:addMod(tpz.mod.EVA, 15)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobEngaged(mob, target)
end


function onMobInitialize(mob)
end

function onMobFight(mob, target)
    local boom = mob:getLocalVar("boom")

    if mob:getBattleTime() >= 30 and boom == 0  then
        printf("Boom 1");
        mob:useMobAbility(571) -- 650 damage
        mob:setLocalVar("boom", 1)
    elseif mob:getBattleTime() >= 30 and boom == 0  then
        printf("Boom 1 - 0 Dmg");
        mob:useMobAbility(574) -- 0 damage
        mob:setLocalVar("boom", 1)
    elseif mob:getBattleTime() >= 60 and boom == 1  then
        printf("Boom 2");
        mob:useMobAbility(572) -- 750 damage
        mob:setLocalVar("boom", 2)
    elseif mob:getBattleTime() >= 60 and boom == 1  then
        printf("Boom 2 - 0 DMG");
        mob:useMobAbility(574) -- 0 damage
        mob:setLocalVar("boom", 2)
    elseif mob:getBattleTime() >= 90 and boom == 2  then
        printf("Boom 3 - Fail");
        mob:useMobAbility(573) -- 1500 damage
        mob:setLocalVar("boom", 3)
    end
end

function onMagicHit(caster, target, spell)
    local DAY = target:getLocalVar("RNGelement")
    local ELEM = spell:getElement()
    local TP = target:getTP() -- maybe skill: gettp()?
    local elementboom = target:getLocalVar("elementboom")

    if DAY == 0 then
         target:setLocalVar("RNGelement", math.random(1,8))
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 0 then
        printf("2 Hour Cloud");
        target:useMobAbility(624) -- 2 hour "cloud" animation
        target:setLocalVar("elementboom", 1)
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 1 then
        printf("Cast Boom 1");
        target:useMobAbility(571)  -- 650 damage
        target:setLocalVar("elementboom", 2)
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 2 then
        printf("Cast Boom 2");
        target:useMobAbility(572)  -- 750 damage
        target:setLocalVar("elementboom", 3)
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and elementboom == 3 then
        printf("Cast Boom 3");
        target:useMobAbility(573)  -- 1500 damage
    end
    return 1
end