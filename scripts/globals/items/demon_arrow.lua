-----------------------------------------
-- ID: 18159
-- Item: Demon Arrow
-- Additional Effect: 12% Attack Down
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 100
    local SDT = target:getMod(tpz.mod.SDT_WATER)

    if SDT <= 5 then
        chance = 0
    else 
        chance = chance * (SDT / 100)
        chance = utils.clamp(chance, 5, 95)
    end
    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.WATER, 0) < 0.5) then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.ATTACK_BOOST)
        target:addStatusEffect(tpz.effect.ATTACK_DOWN, 12.5, 0, 60)
        return tpz.subEffect.DEFENSE_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.ATTACK_DOWN
    end
end
