-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 25.0 + (0.10 * player:getMod(tpz.mod.BOOST_EFFECT))

    if player:hasStatusEffect(tpz.effect.BOOST) then
        local effect = player:getStatusEffect(tpz.effect.BOOST)
        effect:setPower(effect:getPower() + power)
        player:addMod(tpz.mod.ATTP, power)
    else
        player:addStatusEffect(tpz.effect.BOOST, power, 0, 180)
    end
end
