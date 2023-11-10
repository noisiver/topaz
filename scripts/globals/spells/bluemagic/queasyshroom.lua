-----------------------------------------
-- Spell: Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP
-- Spell cost: 20 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 8
-- Casting Time: 2 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s): Dark (can open Transfixion or Detonation can close Compression or Gravitation)
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
	spell:setFlag(tpz.magic.spellFlag.WIPE_SHADOWS)
    
	return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_CRITICAL
    params.attackType = tpz.attackType.RANGED
    params.damageType = tpz.damageType.RANGED
    params.scattr = SC_DARK
    params.numhits = 1
    params.multiplier = 1.75
    params.tp150 = 1.75
    params.tp300 = 1.75
    params.azuretp = 1.75
    params.duppercap = 15
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.20
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.eco = ECO_PLANTOID
    params.shadowbehav = BLUPARAM_WIPE_SHADOWS

    local damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.bonus = 30
    params.effect = tpz.effect.POISON
    BlueTryEnfeeble(caster, target, spell, damage, 5, 3, 180, params)
    params.effect = tpz.effect.PLAGUE
    BlueTryEnfeeble(caster, target, spell, damage, 3, 3, 180, params)
	

    return damage
end
