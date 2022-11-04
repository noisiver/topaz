-----------------------------------------
-- Spell: Sandspin
-- Deals earth damage to enemies within range. Additional Effect: Accuracy Down
-- Spell cost: 10 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 1
-- Casting Time: 1.5 seconds
-- Recast Time: 9.75 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
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
    local params = {}
    local multi = 2.0
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_damage
    params.attackType = tpz.attackType.MAGICAL
    params.dmgType = tpz.damageType.EARTH
    params.bonus = 0
    params.multiplier = multi
    params.tMultiplier = 1.0
    params.duppercap = 19
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    dmg = BlueMagicalSpell(caster, target, spell, params, INT_BASED)

    local params = {}

    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)

    params.attribute = tpz.mod.INT

    params.skillType = tpz.skill.BLUE_MAGIC

    params.bonus = 0
	params.effect = tpz.effect.ACCURACY_DOWN

    local resist = applyResistance(caster, target, spell, params)
	local bird = (target:getSystem() == 8)
	local aquan = (target:getSystem() == 2)
	-- add correlation bonus
	if bird then
	 	dmg = dmg * 1.25
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif aquan then
		dmg = dmg * 0.75
		params.bonus = -25
	end

    dmg = BlueFinalAdjustments(caster, target, spell, dmg, params)

    if (dmg > 0 and resist >= 0.5) then
        if (target:canGainStatusEffect(tpz.effect.ACCURACY_DOWN)) then
            local typeEffect = tpz.effect.ACCURACY_DOWN
            target:addStatusEffect(typeEffect, 25, 0, getBlueEffectDuration(caster, resist, typeEffect, false)) 
        end
    end
    params.effect = tpz.effect.PETRIFICATION
    BlueTryEnfeeble(caster, target, spell, damage, 1, 0, 8, params)

    return dmg
end
