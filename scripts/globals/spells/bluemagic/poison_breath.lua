-----------------------------------------
-- Spell: Poison Breath
-- Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison
-- Spell cost: 22 MP
-- Monster Type: Hound
-- Spell Type: Magical (Water)
-- Blue Magic Points: 1
-- Stat Bonus: MND+1
-- Level: 22
-- Casting Time: 3 seconds
-- Recast Time: 19.5 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-- Damage formula is (Current HP)/10 + (Blue Mage level)/1.25
-- Gains a 25% damage boost when used against Arcana monsters.
-- Poison effect is 4/tick
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
    params.damageType = tpz.damageType.WATER
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.eco = ECO_UNDEAD

    local damage = BlueBreathSpell(caster, target, spell, params, 0.25)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.effect = tpz.effect.POISON
    BlueTryEnfeeble(caster, target, spell, damage, 4, 3, 180, params)

    return damage
end
