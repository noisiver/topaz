-----------------------------------------
-- Spell: Blood Drain
-- Steals an enemy's HP. Ineffective against undead
-- Spell cost: 10 MP
-- Monster Type: Giant Bats
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 20
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dmg = 20 + caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
    local multi = 1.0
	
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 1.0
    params.multiplier = multi
    local resist = applyResistance(caster, target, spell, params)
    dmg = dmg*resist
    dmg = addBonuses(caster, spell, target, dmg)
    dmg = adjustForTarget(target, dmg, spell:getElement())
    if (dmg > (caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 20)) then
        dmg = (caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 20)
    end

    if (dmg < 0) then
        dmg = 0
    end

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return dmg
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end
	
	local aquan = (target:getSystem() == 2)
	local amorph = (target:getSystem() == 1)
	
	if aquan then
		dmg = dmg * 1.25
	elseif amorph then
		dmg = dmg * 0.75
	end

    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.DARK
    dmg = BlueFinalAdjustments(caster, target, spell, dmg, params)
  
  if dmg > 0 and resist >= 0.5  then
		dmg = dmg * BLUE_POWER
		caster:addHP(damage)
	end

    return dmg
end
