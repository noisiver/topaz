-----------------------------------------
-- Spell: Bludgeon
-- Delivers a threefold attack. Accuracy varies with TP
-- Spell cost: 16 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: STR+1
-- Level: 18
-- Casting Time: 0.5 seconds
-- Recast Time: 11.75 seconds
-- Skillchain Element(s): Fire (can open Scission or Fusion can close Liquefaction)
-- Combos: Undead Killer
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
    params.tpmod = TPMOD_ACC
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.BLUNT
    params.scattr = SC_LIQUEFACTION
    params.numhits = 3
    params.multiplier = 0.4
    params.tp150 = 0.4
    params.tp300 = 0.4
    params.azuretp = 0.4
    params.duppercap = 7
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.3
    params.AccTPModifier = true
	params.attkbonus = 1.5
    damage = BluePhysicalSpell(caster, target, spell, params)
	if (target:isUndead()) then
		damage = damage * 1.25
	end
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
