-----------------------------------
-- Ability: Hamanoha
-- Description: Lowers accuracy, evasion, magic accuracy, magic evasion and TP gain for demons.
-- Obtained: SAM Level 87
-- Recast Time: 00:05:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local Runes = player:getLocalVar("UndaRunes")
    if Runes == 0 then
        return tpz.msg.basic.CANNOT_PERFORM_ACTION, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local Runes = player:getLocalVar("UndaRunes")
    local power = 1 + (Runes * 3)
    local duration = Runes * 30
    player:delStatusEffectSilent(tpz.effect.UNDA)
    player:delStatusEffectSilent(tpz.effect.UNDA)
    player:delStatusEffectSilent(tpz.effect.UNDA)
    player:setLocalVar("UndaRunes", 0)
    player:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, duration, tpz.effect.GEO_MAGIC_DEF_BOOST, power, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
    local demon = target:getSystem() == 9
	if demon then
        target:addStatusEffect(tpz.effect.HAMANOHA, 12, 0, 180)
    end
end
