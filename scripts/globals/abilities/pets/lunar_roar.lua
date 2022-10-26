---------------------------------------------
-- Lunar Roar
-- Dispels two effects from target in AOE.
-- Additional effect: MAB and MACC down.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    local effect = tpz.effect.MAGIC_ATK_DOWN
    local power = 10
    local duration = 180
    local bonus = 0
    local effect2 = tpz.effect.MAGIC_ACC_DOWN
    local dis1 = target:dispelStatusEffect()
    local dis2 = target:dispelStatusEffect()


    if (dis1 ~= tpz.effect.NONE and dis2 ~= tpz.effect.NONE) then
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        return 2
    elseif (dis1 ~= tpz.effect.NONE or dis2 ~= tpz.effect.NONE) then
        -- dispeled only one
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        return 1
    else
        skill:setMsg(tpz.msg.basic.SKILL_ENFEEB) -- no effect
    end
    AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus)
    AvatarStatusEffectBP(pet, target, effect2, power, duration, params, bonus)
    giveAvatarTP(pet)

    return effect
end
