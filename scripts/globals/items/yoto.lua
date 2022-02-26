-----------------------------------------
-- ID: 16908
-- Item: Yoto
-- Additional Effect: Weakens defense
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 20
    local SDT = target:getMod(tpz.mod.SDT_WIND)
   
   if SDT <= 5 then
        chance = 0
    end
	chance = chance * (SDT / 100)
	chance = utils.clamp(chance, 5, 95)
    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.WIND, 0) < 0.5) then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.DEFENSE_BOOST)
        target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 18.75, 0, 60)
        return tpz.subEffect.DEFENSE_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.DEFENSE_DOWN
    end
end
