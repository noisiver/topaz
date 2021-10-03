-----------------------------------------
-- Spell: Ram Charge
-- Damage varies with TP
-- Spell cost: 79 MP
-- Monster Type: Beasts
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 4
-- Stat Bonus: HP+5
-- Level: 73
-- Casting Time: 0.5 seconds
-- Recast Time: 34.75 seconds
-- Skillchain Element(s): Fragmentation (can open/close Light with Fusion WSs and spells)
-- Combos: Lizard Killer
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
    params.tpmod = TPMOD_DAMAGE
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.BLUNT
    params.scattr = SC_FRAGMENTATION
    params.numhits = 1
    params.multiplier = 4.0
    params.tp150 = 6.0
    params.tp300 = 6.8
    params.azuretp = 6.8
    params.duppercap = 75
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.2
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	params.attkbonus = 1.5

    local damage = BluePhysicalSpell(caster, target, spell, params)
	local lizard = (target:getSystem() == 14)
	local plantoid = (target:getSystem() == 17)
	-- add correlation bonus
	if lizard then
	 	damage = damage * 1.25
	elseif plantoid then
		damage = damage * 0.75
	end
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
