-----------------------------------------
-- Spell: Auroral Drape
-- Greatly lowers the accuracy of enemies within range for a brief period of time
-- Spell cost: 24 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+20
-- Level: 74
-- Casting Time: 0.5 seconds
-- Recast Time: 60 seconds
-- Effect Time: About 15 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
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
    local typeEffect = tpz.effect.BLINDNESS
    local dINT = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local params = {}
    params.diff = dINT
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus =  0
    params.effect = typeEffect
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 60 * resist
    local potency = 60

    TryApplyEffect(caster, target, spell, params.effect, potency, 0, duration, resist, 0.5)

    return typeEffect
end
