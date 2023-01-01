-----------------------------------------
-- ID: 17758
-- Item: Ruler
-- Additional Effect: Flash
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.FLASH, tpz.magic.ele.LIGHT, 0)
    local duration = math.floor(60 * resist)
   
    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.FLASH, 100, 0, 12)
        return tpz.subEffect.LIGHT_DAMAGE, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.FLASH
    end
end
