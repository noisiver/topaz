-----------------------------------
-- Ability: Decoy Shot
-- Description: Diverts enmity when launching a ranged attack from behind a party member.
-- Obtained: RNG Level 95
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    if target:hasStatusEffect(tpz.effect.THIRD_EYE) then
        -- Third Eye and Utsusemi don't stack. Utsusemi removes Third Eye.
        target:delStatusEffectSilent(tpz.effect.THIRD_EYE)
    end

    -- Delete old shadows before applying new
    target:delStatusEffectSilent(tpz.effect.COPY_IMAGE)
    target:addStatusEffectEx(tpz.effect.COPY_IMAGE, tpz.effect.COPY_IMAGE_4, 2, 0, 30, 0, 4)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
end
