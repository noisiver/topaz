---------------------------------------------
-- Flashbulb
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/job_util")
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(tpz.recast.ABILITY, skill:getID(), 45)
    local skillType = jobUtil.GetAutoMainSkill(automaton)

    local resist = applyResistanceAbility(automaton, target, 7, skillType, 200)
    local duration = 12 * resist

    if resist > 0.0625 then
        if target:addStatusEffect(tpz.effect.FLASH, 300, 3, duration) then
            skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
        else
            skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
        end
    else
        skill:setMsg(tpz.msg.basic.JA_MISS_2)
    end

    return tpz.effect.FLASH
end
