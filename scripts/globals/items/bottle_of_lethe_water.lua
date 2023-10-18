-----------------------------------------
-- ID: 4210
-- Lethe Water
-- Dispels up to 3 positive status effects from target.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effectsDispelled = 0

    if (target:dispelStatusEffect() ~= tpz.effect.NONE) then
        effectsDispelled = effectsDispelled + 1
    end

    if (target:dispelStatusEffect() ~= tpz.effect.NONE) then
        effectsDispelled = effectsDispelled + 1
    end

    if (target:dispelStatusEffect() ~= tpz.effect.NONE) then
        effectsDispelled = effectsDispelled + 1
    end

    target:messagePublic(tpz.msg.basic.EFFECTS_DISAPPEAR, target, effectsDispelled, effectsDispelled)
end

