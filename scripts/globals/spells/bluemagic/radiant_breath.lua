-----------------------------------------
-- Spell: Radiant Breath
-- Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
-- Spell cost: 116 MP
-- Monster Type: Wyverns
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+1, HP+5
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local multi = 2.90
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.attackType = tpz.attackType.BREATH
    params.damageType = tpz.damageType.LIGHT
    params.multiplier = multi
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0

    local resist = applyResistance(caster, target, spell, params)
    local HP = caster:getHP()
    local damage = (HP / 2) 
	local demon = (target:getSystem() == 9)
	
	if demon then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	end
	-- add convergence bonus
	if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
		local ConvergenceBonus = (1 + caster:getMerit(tpz.merit.CONVERGENCE) / 100)
		damage = damage * ConvergenceBonus
		caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)
	end
	-- add breath damage gear
	local head = caster:getEquipID(tpz.slot.HEAD)
	if head == 16150 or head == 11465 then 
		damage = damage *1.1 -- Saurian Helm and Mirage Keffiyeh
	end 

	damage = damage * resist	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.SLOW
        target:delStatusEffectSilent(typeEffect)
        target:addStatusEffect(typeEffect, 3500, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(tpz.effect.SILENCE)
        target:addStatusEffect(tpz.effect.SILENCE, 25, 0, getBlueEffectDuration(caster, resist, tpz.effect.SILENCE))
    end

    return damage
end
