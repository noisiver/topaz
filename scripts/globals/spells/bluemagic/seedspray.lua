-----------------------------------------
-- Spell: Seedspray
-- Delivers a threefold attack. Additional effect: Weakens defense. Chance of effect varies with TP.
-- Spell cost: 61 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Ranged)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 61
-- Casting Time: 4 seconds
-- Recast Time: 35 seconds
-- Skillchain Element(s): Ice (Primary) and Wind (Secondary) - (can open Impaction, Compression, Fragmentation, Scission or Gravitation can close Induration or Detonation)
-- Combos: Beast Killer
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
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.tpmod = TPMOD_MACC
    params.attackType = tpz.attackType.RANGED
    params.damageType = tpz.damageType.RANGED
    params.scattr = SC_GRAVITATION
    params.numhits = 3
    params.multiplier = 1.36
    params.tp150 = 1.36
    params.tp300 = 1.36
    params.azuretp = 1.36
    params.duppercap = 80 -- D upper >=69
    params.str_wsc = 0.2
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.eco = ECO_VERMIN
	params.attkbonus = 0.9
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.effect = tpz.effect.DEFENSE_DOWN
    BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)

    return damage
end
