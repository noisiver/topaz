-----------------------------------------
-- ID: 
-- Item: 
-- Item Effect: 
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")
require("scripts/globals/status")

function onItemCheck(target)
	if target:getSystem() ~= 12 then -- empty
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    -- Can't reapply if target already has the status effect
    if target:hasStatusEffect(tpz.effect.INTIMIDATE) then
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    else
        target:addStatusEffectEx(tpz.effect.DOUBT, tpz.effect.INTIMIDATE, 100, 0, 30)
	    target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.INTIMIDATE)
    end
end