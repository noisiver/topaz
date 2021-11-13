-----------------------------------------
-- Spell: Maelstrom
-- Deals water damage to enemies within range. Additional effect: STR Down
-- Spell cost: 162 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 5
-- Stat Bonus: Mind +2
-- Level: 61
-- Casting Time: 6 seconds
-- Recast Time: 39 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    local multi = 3.2
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.WATER
    params.multiplier = multi
    params.tMultiplier = 1.5
    params.duppercap = 80
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
	local amorph = (target:getSystem() == 1)
	local bird = (target:getSystem() == 8)
	-- add correlation bonus
	if amorph then
	 	damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif bird then
		damage = damage * 0.75
		params.bonus = -25
	end
	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)

    if (damage > 0 and resist >= 0.5) then
        if (target:canGainStatusEffect(tpz.effect.STR_DOWN)) then
        local typeEffect = tpz.effect.STR_DOWN
        target:addStatusEffect(typeEffect, 20, 0, getBlueEffectDuration(caster, resist, typeEffect, false)) -- https://www.bg-wiki.com/bg/Mind_Blast says 20%
        end
    end

    return damage
end
