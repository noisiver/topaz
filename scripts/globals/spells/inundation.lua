-----------------------------------------
-- Spell: Inundation
-- Grants a bonus to skillchain damage based on the number of weaponskill weapon types used on the target.
-- https://wiki.ffo.jp/html/33524.html
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = dMND
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.INUNDATION
    local resist = 1 -- Never misses
    local duration = 300

    TryApplyEffect(caster, target, spell, params.effect, 0, 0, duration, resist, 1, 0)

    return params.effect
end
