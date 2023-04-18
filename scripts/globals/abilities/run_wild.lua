-----------------------------------
-- Ability: Run Wild
-- Increases nearby allies Movement Speed.
-- Obtained: BST Level 20
-- TP Required: 0
-- Recast Time: 00:30
-- Duration: 5:00
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local duration = 600

	target:addStatusEffect(tpz.effect.QUICKENING, 30, 0, duration)
end

