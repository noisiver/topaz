-----------------------------------------
-- ID: 
-- Item: Kororito
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 20
    local SDT = target:getMod(tpz.mod.SDT_WATER)
   
   if SDT <= 5 then
        chance = 0
    end
	chance = chance * (SDT / 100)
	chance = utils.clamp(chance, 5, 95)
    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.WATER, 0) < 0.5) then
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.POISON, 15, 3, 60)         -- changed to 15/tick 60s dura
        return tpz.subEffect.POISON, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.POISON
    end
end
