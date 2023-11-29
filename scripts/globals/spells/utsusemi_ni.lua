-----------------------------------------
-- Spell: Utsusemi: Ni
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    if target:hasStatusEffect(tpz.effect.THIRD_EYE) then
        -- Third Eye and Utsusemi don't stack. Utsusemi removes Third Eye.
        target:delStatusEffectSilent(tpz.effect.THIRD_EYE)
    end

    -- Get extras shadows
    local numShadows = 3
    local icon = tpz.effect.COPY_IMAGE_3

    if caster:getMainJob() == tpz.job.NIN then
        numShadows = 4 + target:getMod(tpz.mod.UTSUSEMI_BONUS)
        icon = tpz.effect.COPY_IMAGE_4
    end

    -- Delete old shadows before applying new
    target:delStatusEffectSilent(tpz.effect.COPY_IMAGE)
    target:addStatusEffectEx(icon, icon, 2, 0, 900, 0, numShadows)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    return tpz.effect.COPY_IMAGE
end