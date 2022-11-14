-----------------------------------------
-- Spell: Blood Saber
-- Steals HP from enemies within range. Ineffective against undead
-- Spell cost: 25 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 48
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
    local damage = math.floor((caster:getHP() * .33))
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    local multi = 2.0
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_dmg
    params.attackType = tpz.attackType.BREATH
    params.dmgType = tpz.damageType.DARK
    params.bonus = 0
    params.multiplier = multi
    params.tMultiplier = 1.0
    params.D = damage
    params.duppercap = 9999
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, nil)
    damage = damage*resist
    damage = addBonuses(caster, spell, target, damage)
    damage = adjustForTarget(target, damage, spell:getElement())

    if (damage < 0) then
        damage = 0
    end
	local arcana = (target:getSystem() == 3)
	if arcana then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	end
    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return damage
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
        if damage > 500 then
            damage = 500
        end
    end

    if (target:getHP() < damage) then
        damage = target:getHP()
    end

    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
    caster:addHP(damage)

    return damage
end
