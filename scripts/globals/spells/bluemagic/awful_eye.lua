-----------------------------------------
-- Spell: Awful Eye
-- Lowers Strength of enemies within a fan-shaped area originating from the caster
-- Spell cost: 32 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 46
-- Casting Time: 2.5 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
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

    if (target:hasStatusEffect(tpz.effect.STR_DOWN)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    elseif (target:isFacing(caster)) then
        local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = tpz.mod.INT
        params.skillType = tpz.skill.BLUE_MAGIC
		params.effect = tpz.effect.STR_DOWN
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
		local level = (caster:getMainLvl()  / 5)
		local power = level 
		local family = target:getSystem()

		 if (family == tpz.eco.VERMIN) then
			params.bonus = 25
		elseif (family == tpz.eco.BEAST) then
			params.bonus = -25
		end
		local duration = 60 * resist
		
    if (resist >= 0.5) then -- Do it!
        local typeEffect = tpz.effect.STR_DOWN
        target:addStatusEffect(typeEffect, power, 0, getBlueEffectDuration(caster, resist, typeEffect, false)) 
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return tpz.effect.STR_DOWN
end
