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
require("scripts/globals/mobs")
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
    local numberOfEffects = 0
    local playereEffects = player:getStatusEffects()
    for _, playerEffect in ipairs(playereEffects) do
        local effectFlags = playerEffect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.DISPELABLE) == tpz.effectFlag.DISPELABLE) or (bit.band(effectFlags, tpz.effectFlag.ERASABLE) == tpz.effectFlag.ERASABLE) or
        (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) == tpz.effectFlag.WALTZABLE) then
            local petEffects = pet:getStatusEffects()
            for _, petEffect in ipairs(petEffects) do
                local currentPower = petEffect:getPower()
                local newPower = playerEffect:getPower()
                if (newPower > currentPower) then
                    numberOfEffects = numberOfEffects + 1
                    pet:addStatusEffect(newPower:getType(), newPower:getPower(), newPower:getTick(), math.ceil((newPower:getTimeRemaining())/1000)) -- id, power, tick, duration(convert ms to s)
                end
            end
        end
    end

    -- Display amount of effects copied
    MessageGroup(player, player, numberOfEffects .. " effects copied to " .. pet:getName() .. ".", tpz.msg.textColor.GREEN, 0)
end
