-----------------------------------------
-- Spell: Demoralizing  Roar
-- Weakens defense of enemies within range
-- Spell cost: 46 MP
-- Monster Type: Lizard
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: STR-2 VIT+3
-- Level: 71
-- Casting Time: 2.75 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: ???
-- Combos: Auto Double Attack (4)
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
    params.bonus = 25
    params.effect = tpz.effect.ATTACK_DOWN
    local resist = applyResistanceEffect(caster, target, spell, params)
    local power = 20
	local vermin = (target:getSystem() == 20)
	local beast = (target:getSystem() == 6)

	if vermin then
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
    elseif beast then
		params.bonus = -25
	end

    if (resist >= 0.5) then -- Do it!
	    local typeEffect = tpz.effect.ATTACK_DOWN
        target:addStatusEffect(typeEffect, power, 0, getBlueEffectDuration(caster, resist, typeEffect, false)) -- https://www.bg-wiki.com/bg/Mind_Blast says 20%
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end
