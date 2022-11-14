-----------------------------------------
-- Spell: Blind II
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
	local meritBonus = caster:getMerit(tpz.merit.BLIND_II)
    -- Pull base stats.
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.MND) -- blind uses caster INT vs target MND

    -- Base power
    -- Min cap: 15 at -80 dINT
    -- Max cap: 45 + 4(Merits) 
    local basePotency = utils.clamp(math.floor(dINT / 3 * 8 + 45 + (meritBonus - 1)), 15, 45 + (meritBonus - 1))

    local potency = calculatePotency(basePotency, spell:getSkillType(), caster, target)

    -- Duration, including resistance.  Unconfirmed.
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0 + ((meritBonus - 1) * 2)
    params.effect = tpz.effect.BLINDNESS
    local resist = applyResistanceEffect(caster, target, spell, params)
    duration = duration * resist
    duration = math.ceil(duration * tryBuildResistance(tpz.magic.buildcat.BLIND, target))

    TryApplyEffect(caster, target, spell, params.effect, potency, 0, duration, resist, 0.5)

    return params.effect
end
