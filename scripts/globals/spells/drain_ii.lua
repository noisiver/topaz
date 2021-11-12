-----------------------------------------
-- Spell: Drain II
-- Drain functions only on skill level!!
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    if target:isUndead() then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end
    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 165 + caster:getSkillLevel(tpz.skill.DARK_MAGIC)


    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)
    --get the resisted damage
    dmg = dmg*resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    --add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
    --add in final adjustments

    if (dmg < 0) then
        dmg = 0
    end
	
	dmg = dmg * DARK_POWER
	
	if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
		dmg = dmg * 1.5
	end
	--apply SDT penalty
    local SDT = target:getMod(tpz.mod.SDT_DARK)
	if target:isMob() then
		if SDT < 100 then
			dmg = dmg * (SDT / 100)
		end
	end
	
	-- add dmg variance
	dmg = (dmg * math.random(85, 115)) / 100

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    dmg = finalMagicAdjustments(caster, target, spell, dmg)

    local leftOver = (caster:getHP() + dmg) - caster:getMaxHP()

    if (leftOver > 0) then
        caster:addStatusEffect(tpz.effect.MAX_HP_BOOST, (leftOver/caster:getMaxHP())*100, 0, 180)
    end

    caster:addHP(dmg)
    spell:setMsg(tpz.msg.basic.MAGIC_DRAIN_HP) --change msg to 'xxx hp drained from the yyyy.'
	caster:delStatusEffectSilent(tpz.effect.NETHER_VOID)
    return dmg
end
