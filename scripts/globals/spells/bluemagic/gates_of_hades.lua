-----------------------------------------
-- Spell: Gates of Hades
-- Deals fire damage to enemies within area of effect. Additional effect: Burn.
-- Spell cost: 36 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 18
-- Casting Time: 3 seconds
-- Recast Time: 19.5 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Magic Attack Bonus
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
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.multiplier = multi
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.FIRE
    params.bonus = 0
    local multi = 4.0
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    params.multiplier = multi
    params.tMultiplier = 1.0
    params.duppercap = 80
    params.str_wsc = 0.2
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
	local lizard = (target:getSystem() == 14)
	local plantoid = (target:getSystem() == 17)

	-- add correlation bonus
	if lizard then
	 	dmg = dmg * 1.25
		params.bonus = params.bonus + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif plantoid then
		dmg = dmg * 0.75
		params.bonus = params.bonus - 25
	end

    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.effect = tpz.effect.BURN
    local resist = applyResistanceEffect(caster, target, spell, params)
    local DOT = 22
    local duration = 90 * resist
    local statDown = 47
    if not target:getStatusEffect(tpz.effect.DROWN) then
        target:delStatusEffectSilent(tpz.effect.FROST)
        target:addStatusEffect(params.effect, DOT, 3, duration, 0, statDown, 0)
    end

    return damage
end
