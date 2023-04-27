-----------------------------------------
-- ID: 16938
-- Item: Glorious Sword
-- Additional Effect: Flash
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 25)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.FLASH, tpz.magic.ele.LIGHT, 0)
    local duration = math.floor(12 * resist)
    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.EVASION_BOOST)
        target:addStatusEffect(tpz.effect.FLASH, 200, 3, duration)
        return tpz.subEffect.FLASH, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.FLASH
    end
end
