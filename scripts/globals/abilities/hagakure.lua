-----------------------------------
-- Ability: Hagakure
-- Grants "Save TP" effect and a TP bonus to your next weapon skill.
-- Obtained: Samurai Level 95
-- Recast Time: 3:00
-- Duration: 1:00 or Next Weaponskill
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/job_util")
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
    if jobUtil.ConsumeIgnisRune(player, tpz.effect.GEO_REGEN, 3) then
        player:delStatusEffectSilent(tpz.effect.HAGAKURE)
        player:addStatusEffect(tpz.effect.HAGAKURE, 1, 0, 60)
    end
end

