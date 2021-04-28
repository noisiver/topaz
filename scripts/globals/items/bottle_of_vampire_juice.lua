-----------------------------------------
-- ID: 4512
-- Item: Vampire Juice
-- Item Effect: Restores 600 TP over 180 seconds.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local worked = false
    if (not target:hasStatusEffect(tpz.effect.REGAIN)) then
        target:addStatusEffect(tpz.effect.REGAIN, 1, 3, 180)
        worked = true
    end
    if (not worked) then
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
