-----------------------------------------
-- Spell: Frightful Roar
-- Weakens defense of enemies within range
-- Spell cost: 32 MP
-- Monster Type: Demon
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+2
-- Level: 50
-- Casting Time: 2 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Auto Refresh
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
    params.effect = tpz.effect.DEFENSE_DOWN
    local resist = applyResistanceEffect(caster, target, spell, params)
    local power = 10
	local dragon = (target:getSystem() == 10)
	
	if dragon then
		params.bonus = 50 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	end

    if (resist >= 0.5) then -- Do it!
	    local typeEffect = tpz.effect.DEFENSE_DOWN
        target:addStatusEffect(typeEffect, power, 0, getBlueEffectDuration(caster, resist, typeEffect, false)) -- https://www.bg-wiki.com/bg/Mind_Blast says 20%
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end
