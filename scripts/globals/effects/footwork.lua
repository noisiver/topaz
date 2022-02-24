-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.MAIN_DMG_RATING, 50)
    target:addMod(tpz.mod.ATTP, 10)
	target:addMod(tpz.mod.KICK_ATTACK_RATE, 100)
    target:addMod(tpz.mod.STORETP, 50)
    target:addMod(tpz.mod.KICK_DMG, effect:getPower())
    target:addMod(tpz.mod.DOUBLE_ATTACK, effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MAIN_DMG_RATING, 50)
    target:delMod(tpz.mod.ATTP, 10)
	target:delMod(tpz.mod.KICK_ATTACK_RATE, 100)
    target:delMod(tpz.mod.STORETP, 50)
    target:delMod(tpz.mod.KICK_DMG, effect:getPower())
    target:delMod(tpz.mod.DOUBLE_ATTACK, effect:getSubPower())
end
