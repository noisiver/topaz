-----------------------------------------
-- Spell: Hecatomb Wave
-- Deals wind damage to enemies within a fan-shaped area originating from the caster. Additional effect: Blindness
-- Spell cost: 116 MP
-- Monster Type: Demons
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Detonation, Fragmentation, Light
-- Combos: Max MP Boost
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
    params.diff = 0
    params.attackType = tpz.attackType.BREATH
    params.damageType = tpz.damageType.WIND
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.eco = ECO_DEMON

    local damage = BlueBreathSpell(caster, target, spell, params, 1)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.MND)
    params.effect = tpz.effect.BLINDNESS
    BlueTryEnfeeble(caster, target, spell, damage, 20, 0, 180, params)

    return damage
end
