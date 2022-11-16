-----------------------------------------
-- Spell: Hecatomb Wave
-- Deals wind damage to enemies within a fan-shaped area originating from the caster. Additional effect: Blindness
-- Spell cost: 116 MP
-- Monster Type: Demons
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Detonation, Fragmentation, Light
-- Combos: Max MP Boost
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
    local multi = 2.08
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
      multi = multi + 0.50
    end
    local damage = (caster:getHP() / 2) 
    local params = {}
    params.attackType = tpz.attackType.BREATH
    params.damageType = tpz.damageType.WIND
	params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
	params.attribute = tpz.mod.INT
	params.skillType = tpz.skill.BLUE_MAGIC
	params.bonus = 0
    params.effect = tpz.effect.BLINDNESS
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
	local dragon = (target:getSystem() == 10)
	
	if dragon then
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

    -- Cap damage for BLU mobs
    if caster:isMob() then
        if damage > 300 then
            damage = 300
        end
    end

    if (spell:getMsg() ~= tpz.msg.basic.MAGIC_FAIL and resist >= 0.5) then
        local typeEffect = tpz.effect.BLINDNESS
        target:delStatusEffectSilent(typeEffect)
        target:addStatusEffect(typeEffect, 20, 0, getBlueEffectDuration(caster, resist, typeEffect, false))
    end

    return damage
end
