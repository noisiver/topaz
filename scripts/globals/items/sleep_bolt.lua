-----------------------------------------
-- ID: 18158
-- Item: Sleep Bolt
-- Additional Effect: Sleep
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 95
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.SLEEP_I, tpz.magic.ele.LIGHT, 0)
    local duration = math.floor(30 * resist)

    if resist < 0.5 then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(tpz.effect.SLEEP_I)) then
            target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, duration)
        end
        return tpz.subEffect.SLEEP, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SLEEP_I
    end
end
