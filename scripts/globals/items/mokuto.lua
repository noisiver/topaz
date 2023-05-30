-----------------------------------------
-- ID: 16906
-- Item: Mokuto
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 12)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.SILENCE, tpz.magic.ele.WIND, 0)
    local duration = math.floor(30 * resist)
   
    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.SILENCE, 1, 0, duration)
        return tpz.subEffect.SILENCE, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SILENCE
    end
end