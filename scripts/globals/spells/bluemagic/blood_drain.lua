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
    params.bonus = 0
    params.multiplier = multi
    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    local multi = 2.0
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_dmg
    params.attackType = tpz.attackType.MAGICAL
    params.dmgType = tpz.damageType.DARK
    params.bonus = 0
    params.multiplier = multi
    params.tMultiplier = 1.0
    params.duppercap = 30
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    dmg = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    dmg = dmg*resist
    dmg = addBonuses(caster, spell, target, dmg)

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
		params.bonus = 25
	elseif amorph then
		dmg = dmg * 0.75
		params.bonus = -25
	end

    dmg = BlueFinalAdjustments(caster, target, spell, dmg, params)
    caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)
  
  if dmg > 0 and resist >= 0.5  then
		dmg = dmg * BLUE_POWER
		caster:addHP(damage)
	end
    caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)

    return dmg
end
