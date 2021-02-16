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
    mob:setLocalVar("selfDestruct1", os.time() + 30)
    mob:setLocalVar("selfDestruct2", os.time() + 60)
    mob:setLocalVar("selfDestruct3", os.time() + 90)
    mob:SetMobAbilityEnabled(false)
end


function onMobInitialize(mob)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("selfDestruct1") and mob:getHPP() > 66  then
        mob:useMobAbility(4263) -- 500 damage
        mob:AnimationSub(1)
    elseif os.time() > mob:getLocalVar("selfDestruct1") and mob:getHPP() < 66  then
        mob:useMobAbility(4264) -- 0 damage
        mob:AnimationSub(1)
    end
    if os.time() > mob:getLocalVar("selfDestruct2") and mob:getHPP() > 33  then
        mob:useMobAbility(4263) -- 500 damage
        mob:AnimationSub(2)
    elseif os.time() > mob:getLocalVar("selfDestruct2") and mob:getHPP() < 33  then
        mob:useMobAbility(4264) -- 0 damage
        mob:AnimationSub(2)
    end
    if os.time() > mob:getLocalVar("selfDestruct3") and mob:getHPP() >= 1  then
        mob:useMobAbility(256) -- instant KO + fail
    end
end

function onMagicHit(caster, target, spell)
    local DAY = VanadielDayOfTheWeek()
    local ELEM = spell:getElement()
    local TP = target:getTP() -- maybe skill: gettp()?

    if (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) then
        target:useMobAbility(624) -- 2 hour "cloud" animation
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) and TP >= 1000 then
        target:useMobAbility(4263)  -- 500 damage
        mob:AnimationSub(1)
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 256 then
        mob:timer(1000, function(mob)
            mob:getBattlefield():lose()
        end)
    end
end
