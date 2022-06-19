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
    local damage = (caster:getHP() / 2) 
    local params = {}
    params.attackType = tpz.attackType.BREATH
    params.damageType = tpz.damageType.EARTH
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 25
    params.multiplier = caster:hasStatusEffect(tpz.effect.AZURE_LORE) and 1.25 or 1
    params.tMultiplier = 1
    params.D = damage
    params.duppercap = 9999
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local resist = applyResistance(caster, target, spell, params)
    local damage = BlueMagicalSpell(caster, target, spell, params, nil)
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
	-- add breath damage gear
	local head = caster:getEquipID(tpz.slot.HEAD)
	if head == 16150 or head == 11465 then 
		damage = damage *1.1 -- Saurian Helm and Mirage Keffiyeh
	end 

	damage = damage * resist	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    -- Cap damage for BLU mobs
    if caster:isMob() then
        if damage > 300 then
            damage = 300
        end
    end

    if (damage > 0 and resist >= 0.5) then
        local typeEffect = tpz.effect.PARALYSIS
        target:addStatusEffect(typeEffect, 20, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.WEIGHT
        target:addStatusEffect(typeEffect, 50, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.POISON
        target:addStatusEffect(typeEffect, 30, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.SLOW
        target:addStatusEffect(typeEffect, 2000, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.SILENCE
        target:addStatusEffect(typeEffect, 1, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.BIND
        target:addStatusEffect(typeEffect, 1, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end
    if (damage > 0 and resist >= 0.5) then
    local typeEffect = tpz.effect.BLINDNESS
        target:addStatusEffect(typeEffect, 30, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    return damage
end
