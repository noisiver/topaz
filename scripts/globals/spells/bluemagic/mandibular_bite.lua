-----------------------------------------
-- Spell: Mandibular Bite
-- Damage varies with TP
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 44
-- Casting Time: 0.5 seconds
-- Recast Time: 19.25 seconds
-- Skillchain property(ies): Induration (can open Impaction, Compression, or Fragmentation)
-- Combos: Plantoid Killer
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
    params.tpmod = TPMOD_ATTACK
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.SLASHING
    params.scattr = SC_INDURATION
    params.numhits = 1
    params.multiplier = 3.1
    params.tp150 = 3.1
    params.tp300 = 3.1
    params.azuretp = 3.1
    params.duppercap = 45 --guesstimated attack % bonuses
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.atk100 = 1.5; params.atk200 = 1.75; params.atk300 = 2.0

    local damage = BluePhysicalSpell(caster, target, spell, params)
	local plantoid = (target:getSystem() == 17)
	local lizard = (target:getSystem() == 14)
	
	if plantoid then
		damage = damage * 1.25
	elseif lizard then
		damage = damage * 0.75
	end
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
