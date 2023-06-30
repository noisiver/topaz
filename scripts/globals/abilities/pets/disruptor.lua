---------------------------------------------
-- Disruptor
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
    automaton:addRecast(tpz.recast.ABILITY, skill:getID(), 60)
    local element = tpz.magic.ele.DARK
    local skillType = jobUtil.GetAutoMainSkill(automaton)
    local bonus = 175
    local resist = applyResistanceAbility(automaton, target, element, skillType, bonus)
    local effect = 0
    if resist >= 0.5 then
        effect = target:dispelStatusEffect()
        skill:setMsg(tpz.msg.basic.SKILL_ERASE)
    else
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    end

    return effect
end
