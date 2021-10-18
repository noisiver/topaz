-----------------------------------------
-- Spell: Infrasonics
-- Lowers the evasion of enemies within a fan-shaped area originating from the caster
-- Spell cost: 42 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 4
-- Stat Bonus: INT+1
-- Level: 65
-- Casting Time: 5 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Induration, Distortion, Darkness
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.effect = tpz.effect.EVASION_DOWN
    local resist = applyResistance(caster, target, spell, params)
    local power = 20
	local vermin = (target:getSystem() == 20)
	local beast = (target:getSystem() == 6)

	 if vermin then
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
    elseif beast then
		params.bonus = -25
	end

    if (resist >= 0.5) then -- Do it!
        local typeEffect = tpz.effect.EVASION_DOWN
        target:addStatusEffect(typeEffect, power, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        end


    return params.effect
end
