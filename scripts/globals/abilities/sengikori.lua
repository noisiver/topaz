-----------------------------------
-- Ability: Sengikori
-- Description: Grants a bonus to skillchains and magic bursts initiated by your next weapon skill.
-- Obtained: SAM Level 77
-- Recast Time: 00:03:00
-- Duration: 0:01:00 or until next Weapon Skill.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local Runes = player:getLocalVar("IgnisRunes")
    if Runes == 0 then
        return tpz.msg.basic.CANNOT_PERFORM_ACTION, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local Runes = player:getLocalVar("IgnisRunes")
    local power = Runes * 3
    local duration = Runes * 30
    player:delStatusEffectSilent(tpz.effect.IGNIS)
    player:delStatusEffectSilent(tpz.effect.IGNIS)
    player:delStatusEffectSilent(tpz.effect.IGNIS)
    player:setLocalVar("IgnisRunes", 0)
    player:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, duration, tpz.effect.INTENSION, power, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
    target:addStatusEffect(tpz.effect.SENGIKORI, 12, 0, 60)
end
