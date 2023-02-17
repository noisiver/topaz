-----------------------------------------
-- Spell: Frost Breath
-- Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralysis
-- Spell cost: 136 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 3
-- Stat Bonus: INT-2
-- Level: 66
-- Casting Time: 6.5 seconds
-- Recast Time: 42.75 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Conserve MP
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
    params.diff = 0
    params.attackType = tpz.attackType.BREATH
    params.damageType = tpz.damageType.ICE
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.eco = ECO_LIZARD

    local damage = BlueBreathSpell(caster, target, spell, params, 1.25)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    params.effect = tpz.effect.PARALYSIS
    BlueTryEnfeeble(caster, target, spell, damage, 13, 0, 180, params)

    return damage
end
