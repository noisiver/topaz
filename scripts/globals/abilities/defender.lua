-----------------------------------
-- Ability: Defender
-- Enhances defense but weakens attacks.
-- Obtained: Warrior Level 25
-- Recast Time: 3:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local defPower = 25
    local dmgTPPower = 0
    local duration = 300 + player:getMod(tpz.mod.DEFENDER_DURATION)
    if player:getMainJob() == tpz.job.WAR then
        defPower = 50
        dmgTPPower = math.floor(33 * (1 + (player:getMod(tpz.mod.DEFENDER_POTENCY) / 100)))
    end
    defPower = math.floor(defPower * (1 + (player:getMod(tpz.mod.DEFENDER_POTENCY) / 100)))

    player:addStatusEffect(tpz.effect.DEFENDER, defPower, 0, duration, 0, dmgTPPower)
end
