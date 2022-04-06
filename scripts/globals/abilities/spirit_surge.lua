-----------------------------------
-- Ability: Spirit Surge
-- Adds your wyvern's strength to your own.
-- Obtained: Dragoon Level 1
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    -- Cannot use with zero spirit power
    local SpiritPower = player:getLocalVar("SpiritPower")
    if SpiritPower == 0 then
        return tpz.msg.basic.CANNOT_PERFORM_ACTION, 0
    end
    -- The wyvern must be present in order to use Spirit Surge
    if (target:getPet() == nil) then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local SpiritPower = player:getLocalVar("SpiritPower")
    local power = SpiritPower * 5
    player:addStatusEffect(tpz.effect.SPIRIT_SURGE, power, 0, 60)
    player:setLocalVar("SpiritPower", 0)
end
