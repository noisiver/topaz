-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ATTP, 10)
	target:addMod(tpz.mod.MAIN_DMG_RATING, 50)
	target:addMod(tpz.mod.HASTE_MAGIC, -7500)
    target:addMod(tpz.mod.STORETP, 20)
    target:addMod(tpz.mod.KICK_DMG, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATTP, 10)
    target:delMod(tpz.mod.MAIN_DMG_RATING, 50)
	target:delMod(tpz.mod.HASTE_MAGIC, -7500)
    target:delMod(tpz.mod.STORETP, 20)
    target:delMod(tpz.mod.KICK_DMG, effect:getPower())
end
