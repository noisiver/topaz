-----------------------------------
-- Ability: Bestial Loyalty
-- Copies your status effects(including negative) to your pet
-- Obtained: Beastmaster Level 23
-- Recast Time: 1:00
-- Duration: Matches duration of buffs on self.
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local pet = player:getPet()
    if not pet then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local pet = player:getPet()
    local effects = player:getStatusEffects()
    for _, effect in ipairs(effects) do
        pet:addStatusEffect(effect:getType(), effect:getPower(), effect:getTick(), math.ceil((effect:getTimeRemaining())/1000)) -- id, power, tick, duration(convert ms to s)
    end
end
