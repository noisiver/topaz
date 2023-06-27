-----------------------------------
-- Ability: Restoring Breath
-- Commands your wyvern to use Healing Breath
-- Obtained: Dragoon Level 30
-- Recast Time: 01:00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pets/wyvern")
-----------------------------------

function onAbilityCheck(player, target, ability)
    -- The wyvern must be present in order to use Restoring Breath
    local breath_heal_range = 13
    local function inBreathRange(target)
        return player:getPet():getZoneID() == target:getZoneID() and player:getPet():checkDistance(player) <= breath_heal_range
    end
    if not inBreathRange(player) then
        return tpz.msg.PET_CANNOT_DO_ACTION, 0
    end
    if (player:getPet() == nil) then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local healingbreath = tpz.jobAbility.HEALING_BREATH

    if player:getMainLvl() >= 80 then healingbreath = tpz.jobAbility.HEALING_BREATH_IV
    elseif player:getMainLvl() >= 40 then healingbreath = tpz.jobAbility.HEALING_BREATH_III
    elseif player:getMainLvl() >= 20 then healingbreath = tpz.jobAbility.HEALING_BREATH_II
    end

    doRestoringBreath(player, healingbreath)
end