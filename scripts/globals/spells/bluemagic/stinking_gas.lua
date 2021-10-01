-----------------------------------------
-- Spell: Stinking Gas
-- Lowers Vitality of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Undead
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 44
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
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
	local typeEffect = tpz.effect.VIT_DOWN
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.VIT_DOWN
    local resist = applyResistance(caster, target, spell, params)
	local level = (caster:getMainLvl()  / 5)
	local power = level 
	local arcana = (target:getSystem() == 3)
	
	if arcana then
		params.bonus = 25
	end
	    local duration = 90 * resist

    if (resist >= 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect, power, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end


    return params.effect
end

