-----------------------------------------
-- Spell: Regen V
-- Gradually restores target's HP.
-----------------------------------------
-- Scale down duration based on level
-- Composure increases duration 3x
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local hp = math.ceil(40 * (1 + 0.01 * caster:getMod(tpz.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(tpz.merit.REGEN_EFFECT) -- bonus hp from merits
    hp = hp + caster:getMod(tpz.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts

    local duration = calculateDuration(60 + caster:getMod(tpz.mod.REGEN_DURATION), spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 99, target:getMainLvl())

    -- SCH main while Light Arts being active tripled the duration
    if caster:getMainJob() == tpz.job.SCH and caster:hasStatusEffect(tpz.effect.LIGHT_ARTS) then
        duration = duration * 3
    end

    if target:addStatusEffect(tpz.effect.REGEN, hp, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return tpz.effect.REGEN
end
