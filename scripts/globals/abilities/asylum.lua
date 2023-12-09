-----------------------------------
-- Ability: Asylum
-- Description: Grants party members a powerful resistance to enfeebling magic and Dispel effects.
-- Also restores 10% of the WHM's MP if a party member is in range and afflatus Misery is active
-- Obtained: WHM Level 75
-- Recast Time: 00:01:00
-- Duration: 0:01:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local party = player:getParty()

    if player:hasStatusEffect(tpz.effect.AFFLATUS_MISERY) then
        if (party ~= nil) then
            for _,member in ipairs(party) do
                if member:isAlive()
                and player:checkDistance(member) <= 10
                and player:getID() ~= member:getID() then
                    player:addMP((player:getMaxMP()/100)*10)
                    break
                end
            end
        end
    end
    target:addStatusEffect(tpz.effect.ASYLUM, 0, 0, 60)
end
