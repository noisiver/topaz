-----------------------------------
-- Ability: Swordplay
-- Grants +25% attack, +25 accuracy and 25% Parry Rate for 5 minutes.
-- Removes the ability to block.
-- Obtained: PLD level 50
-- Recast Time: 5:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (not target:isWeaponTwoHanded()) then
        return tpz.msg.basic.NEEDS_2H_WEAPON, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    if (target:isWeaponTwoHanded()) then
        target:addStatusEffect(tpz.effect.SWORDPLAY, 1, 0, 300)
    end
end
