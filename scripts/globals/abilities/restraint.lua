-----------------------------------
-- Ability: Restraint
-- Grants an absorb shield (stoneskin).
-- Obtained: WAR Level 50
-- Recast Time: 1:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)

    -- Power is 10% of HP + VIT * 2
    local power = math.floor(player:getMaxHP() * 0.10)
    local duration = 30

    -- Add vit mod
    power = power + math.floor(player:getStat(tpz.mod.VIT) * 2)

    -- Add stoneskin gear
    power = power + player:getMod(tpz.mod.STONESKIN_BONUS_HP)

    player:addStatusEffect(tpz.effect.RESTRAINT, power, 0, duration)

    return tpz.effect.RESTRAINT
end