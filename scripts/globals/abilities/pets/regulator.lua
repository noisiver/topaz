---------------------------------------------
-- Regulator
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
    local skillType = jobUtil.GetAutoMainSkill(pet)
    local bonus = 175
    local resist = applyResistanceAbility(player, target, element, skillType, bonus)
    local stolen = 0

    if resist >= 0.5 then
        stolen = caster:stealStatusEffect(target)
        if stolen ~= 0 then
            spell:setMsg(tpz.msg.basic.MAGIC_STEAL)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return stolen
end