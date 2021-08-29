-----------------------------------------
-- Spell: Cursed Sphere
-- Deals water damage to enemies within area of effect
-- Spell cost: 36 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Water)
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
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.WATER
    params.multiplier = 1.50
    params.tMultiplier = 1.0
    params.duppercap = 30
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
	local plantoid = (target:getSystem() == 17)
	local lizard = (target:getSystem() == 14)
	
	if plantoid then
		damage = damage * 1.25
		params.bonus = 25
	elseif lizard then
		damage = damage * 0.75
		params.bonus = -25
	end
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
