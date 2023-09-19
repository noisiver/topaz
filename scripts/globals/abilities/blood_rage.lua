-----------------------------------
-- Ability: Blood Rage
-- Description: Enhances enmity and healing recieved.
-- Note: Generates a high amount of enmity.
-- Obtained: WAR Level 50
-- Recast Time: 00:00:30
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)

    local duration = 30
    local meritValue = player:getMod(tpz.mod.WARCRY_DURATION)
    local jpValue = player:getJobPointLevel(tpz.jp.BLOOD_RAGE_EFFECT)
    local healingrcvd = math.floor(50 * (1 + (player:getMod(tpz.mod.BLOOD_RAGE_POTENCY) / 100)))
    local enmity = 30
    duration = duration + meritValue
    healingrcvd = healingrcvd * (1 + jpValue / 100)

    target:addStatusEffect(tpz.effect.BLOOD_RAGE, healingrcvd, 0, duration, 0, enmity)
end
