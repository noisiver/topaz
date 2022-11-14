-----------------------------------------
-- Spell: Utsusemi: Ichi
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
    local numShadows = 3 + target:getMod(tpz.mod.UTSUSEMI_BONUS)
    local icon = tpz.effect.COPY_IMAGE_3

    if numShadows > 3 then
        icon = tpz.effect.COPY_IMAGE_4
    end

    -- Delete old shadows before applying new
    target:delStatusEffectSilent(tpz.effect.COPY_IMAGE)
    target:addStatusEffectEx(tpz.effect.COPY_IMAGE, icon, 1, 0, 900, 0, numShadows)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    return tpz.effect.COPY_IMAGE
end