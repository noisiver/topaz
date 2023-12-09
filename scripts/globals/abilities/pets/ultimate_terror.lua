---------------------------------------------
-- Ultimate Terror
-- Causes nearby enemies to cower in terror and drains their attributes. Reduced terror effect against NM's.
---------------------------------------------
require("scripts/globals/summon")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    local effect = tpz.effect.TERROR
    local power = 1
    local duration = 30
    local bonus = 0
    local numberdrained = math.random(1, 7)

    -- Reduced Terror duration against NM's'
    if target:isNM() then
        duration = duration * 0.25
    end

    AvatarDrainMultipleAttributes(pet, target, 21, numberdrained, 90, params, 0)
    skill:setMsg(AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus))
    return effect
end