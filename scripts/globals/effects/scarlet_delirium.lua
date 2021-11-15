-----------------------------------
--
--     tpz.effect.SCARLET_DELIRIUM
--     
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onEffectGain(target, effect)
	target:addMod(tpz.mod.MAIN_DMG_RATING, 25)
    target:addMod(tpz.mod.ATTP, 200)
    target:addMod(tpz.mod.MATT, 200)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.MAIN_DMG_RATING, 25)
    target:delMod(tpz.mod.ATTP, 200)
    target:delMod(tpz.mod.MATT, 200)
end
