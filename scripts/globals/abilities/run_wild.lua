-----------------------------------
-- Ability: Run Wild
-- Increases nearby allies Movement Speed.
-- Obtained: BST Level 20
-- TP Required: 0
-- Recast Time: 00:30
-- Duration: 5:00
-----------------------------------
require("scripts/globals/pets")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
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
    local duration = 300

	target:addStatusEffect(tpz.effect.QUICKENING, 20, 0, duration)
end

