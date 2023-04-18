---------------------------------------------
-- Reactive Shield
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)

    local skill = automaton:getSkillLevel(tpz.skill.AUTOMATON_MELEE)
    local manueverBonus = (automaton:getLocalVar("heat_capacitor_manuevers") / 100)
    local MAB = automaton:getMod(tpz.mod.MATT)
	local power = math.floor((skill) / 12) * (1 + MAB / 100) * manueverBonus)
    local duration = 60

    automaton:addRecast(tpz.recast.ABILITY, skill:getID(), 65)

    if target:addStatusEffect(tpz.effect.BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end

    return tpz.effect.BLAZE_SPIKES
end
