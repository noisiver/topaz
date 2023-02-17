-----------------------------------------
-- Spell: Flying Hip Press
-- Deals wind damage to enemies within range
-- Spell cost: 125 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 58
-- Casting Time: 5.75 seconds
-- Recast Time: 34.5 seconds
-- Magic Bursts On: Detonation, Fragmentation, and Light
-- Combos: Max HP Boost
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
    params.damageType = tpz.damageType.LIGHTNING
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.eco = ECO_NONE

    local damage = BlueBreathSpell(caster, target, spell, params, 1)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    params.effect = tpz.effect.PARALYSIS
    BlueTryEnfeeble(caster, target, spell, damage, 13, 0, 180, params)

    return damage
end
