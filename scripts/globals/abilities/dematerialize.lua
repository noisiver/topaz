-----------------------------------
-- Ability: Demateralize
-- Increases Chance of parrying and gives an enmity bonus upon a successful parry attempt.
-- Adds 25% to your parry rate.
-- Obtained: PLD Level 61
-- Recast Time: 5:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (not target:isWeaponTwoHanded()) then
        return tpz.msg.basic.NEEDS_2H_WEAPON, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    target:addStatusEffect(tpz.effect.ISSEKIGAN, 25, 0, 60)
end
