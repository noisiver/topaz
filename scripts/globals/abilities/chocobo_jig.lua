-----------------------------------
-- Ability: Chocobo jig
-- Increases Movement Speed.
-- Obtained: Dancer Level 55
-- TP Required: 0
-- Recast Time: 1:00
-- Duration: 2:00
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 0
    local scale = 1
    local duration = 180
    local gear = player:getMod(tpz.mod.JIG_DURATION)
    local mob = player:getTarget()
    if mob then
        local enmityList = mob:getEnmityList()
        if enmityList and #enmityList > 0 then
            if #enmityList < 6 then
                power = 30
            elseif #enmityList < 18 then
                power = 30
            else
                power = 30
            end
        end

        -- See if we should apply the effects to the player at the top of the hate list
        if mob:getTarget() == target then
            scale = scale
        end
    end

    target:addStatusEffect(tpz.effect.MAGIC_DEF_BOOST, power, 0, duration + math.floor((180 * gear / 100))
end

