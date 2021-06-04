-----------------------------------------
-- Spell: MP Drainkiss
-- Steals an enemy's MP. Ineffective against undead
-- Spell cost: 20 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: MP+5
-- Level: 42
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-- Notes:
-- Affected by Blue Magic Skill and Magic Accuracy.
-- Soft cap at 165MP before Magic Bursts / Day and Weather/Elemental Affinity effects.
-- Elemental Affinity and Elemental Obis affect both accuracy and amount of MP drained.
-- Magic Burst affects both accuracy and amount of MP drained.
-- INT increases Magic Accuracy in general, but is not a modifier of this spell.
-- Unlike Magic Hammer, MP drained is not enhanced by Magic Attack Bonus.
-- A positive Monster Correlation (vs Birds) or a negative Monster Correlation (vs Aquans), affects both accuracy and potency.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local multi = 1.0

    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    -- also have small constant to account for 0 dark skill
    local dmg = utils.clamp(20 + 0.5 * caster:getSkillLevel(tpz.skill.BLUE_MAGIC), 0, 100)
    -- get resist multiplier (1x if no resist)
    local params = {}
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.DARK
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 1.0
    params.multiplier = multi
    params.tMultiplier = 1.0
    params.duppercap = 35
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local resist = applyResistance(caster, target, spell, params)
	local bird = (target:getSystem() == 8)
	local aquan = (target:getSystem() == 2)
	
	if bird then
		dmg = dmg * 1.25
	elseif aquan then
		dmg = dmg * 0.75
	end
    -- get the resisted damage
    dmg = dmg*resist
    -- add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
     dmg = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
     dmg = BlueFinalAdjustments(caster, target, spell, dmg, params)
    -- add in final adjustments

    if resist >= 0.5 then
		dmg = dmg * BLUE_POWER
		caster:addMP(damage)
	end

    return dmg
end
