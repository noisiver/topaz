---------------------------------------------
-- Deep Kiss
-- Steal one effect (Including food)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local rng = math.random(2)
    if (target:hasStatusEffect(tpz.effect.FOOD)) and (rng == 1) then
        local FOOD_ID = target:getStatusEffect(tpz.effect.FOOD):getSubType()
        local DURATION = target:getStatusEffect(tpz.effect.FOOD):getDuration()
        mob:addStatusEffect(tpz.effect.FOOD, 0, 0, DURATION, FOOD_ID) -- Gives Colibri the players food.
        target:delStatusEffect(tpz.effect.FOOD)
        skill:setMsg(tpz.msg.basic.SKILL_ERASE)

        return tpz.effect.FOOD
    else
        skill:setMsg(MobDrainStatusEffectMove(mob, target))

        return 1
    end
end
