-----------------------------------------
-- Spell: Bad Breath
-- Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster
-- Spell cost: 212 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 5
-- Stat Bonus: INT+2, MND+2
-- Level: 61
-- Casting Time: 8.75 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Fast Cast
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
    params.bonus = 25
    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    local multi = 2.08
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
    params.attackType = tpz.attackType.BREATH
    params.damageType = tpz.damageType.EARTH
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
    local HP = caster:getHP()
    local damage = (HP / 2) 
	local vermin = (target:getSystem() == 20)
	local beast = (target:getSystem() == 6)
	
	if beast then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 50 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif vermin then
		damage = damage * 0.75
		params.bonus = 0
	end
	-- add convergence bonus
	if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
		local ConvergenceBonus = (1 + caster:getMerit(tpz.merit.CONVERGENCE) / 100)
		damage = damage * ConvergenceBonus
		caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)
	end
	-- add SDT penalty
	    local SDT = target:getMod(tpz.mod.SDT_EARTH)
		if target:isMob() then
			if SDT < 100 then
				damage = damage * (SDT / 100)
			end
		end
	
	damage = damage * resist	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (damage > 0 and resist >= 0.5) then
        local typeEffect = tpz.effect.PARALYSIS
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 20, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.WEIGHT
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 50, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.POISON
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 30, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.SLOW
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 2000, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.SILENCE
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 1, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.BIND
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 1, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end
    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.BLINDNESS
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 30, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    return damage
end
