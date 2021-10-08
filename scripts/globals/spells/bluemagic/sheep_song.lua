-----------------------------------------
-- Spell: Sheep Song
-- Puts all enemies within range to sleep
-- Spell cost: 22 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 2
-- Stat Bonus: CHR+1, HP+5
-- Level: 16
-- Casting Time: Casting Time: 3 seconds
-- Recast Time: Recast Time: 60 seconds
-- Duration: 60 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Regen
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local typeEffect = tpz.effect.LULLABY
    local dINT = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))
    local params = {}
    params.diff = nil
    params.attribute = tpz.mod.MND
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = typeEffect
    local resist = applyResistanceEffect(caster, target, spell, params)
	local lizard = (target:getSystem() == 14)
	local plantoid = (target:getSystem() == 17)
	-- add correlation bonus
	if lizard then
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif plantoid then
		params.bonus = -25
	end
    local duration = 60 * resist

    if (resist >= 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect, 1, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end
