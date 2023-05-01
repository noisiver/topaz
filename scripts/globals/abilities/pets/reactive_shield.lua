---------------------------------------------
-- Reactive Shield
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

    local meleeSkill = automaton:getSkillLevel(jobUtil.GetAutoMainSkill(automaton))
    local manueverBonus = 1 + (automaton:getLocalVar("heat_capacitor_manuevers") / 100)
    local MAB = automaton:getMod(tpz.mod.MATT)
	local power = math.floor(((meleeSkill) / 12) * (1 + (MAB / 100)) * manueverBonus)
    local duration = 60

    automaton:addRecast(tpz.recast.ABILITY, skill:getID(), 65)
    -- printf("Power %u", power)

    if target:addStatusEffect(tpz.effect.BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end

    return tpz.effect.BLAZE_SPIKES
end
 