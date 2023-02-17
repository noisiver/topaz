-----------------------------------------
-- Spell: Geist Wall
-- Removes one beneficial magic effect from enemies within range
-- Spell cost: 35 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5, MP+10
-- Level: 46
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
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
    params.bonus = 50
    local resist = applyResistanceEffect(caster, target, spell, params)
    local effect = tpz.effect.NONE
		local family = target:getSystem()

		 if (family == tpz.eco.VERMIN) then
			damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
			params.bonus = 75
		elseif (family == tpz.eco.BEAST) then
			damage = damage * 0.75
			params.bonus =  25
		end

    if (resist >= 0.50) then
        spell:setMsg(tpz.msg.basic.MAGIC_ERASE)
        effect = target:dispelStatusEffect()
        if (effect == tpz.effect.NONE) then
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return effect
end
