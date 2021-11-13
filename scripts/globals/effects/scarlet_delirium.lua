-----------------------------------
--
--     tpz.effect.SCARLET_DELIRIUM
--     
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onEffectGain(target, effect)
	target:addMod(tpz.mod.MAIN_DMG_RATING, 10)
    target:addMod(tpz.mod.ATTP, 200)
    target:addMod(tpz.mod.MATT, 200)
    target:addMod(tpz.mod.HPP, -33)
    target:addMod(tpz.mod.DEFP, -75)
    target:addMod(tpz.mod.UDMGPHYS, 100)
    target:addMod(tpz.mod.UDMGMAGIC, 100)
    target:addMod(tpz.mod.UDMGRANGE, 100)
    target:addMod(tpz.mod.REGEN_DOWN, 50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.MAIN_DMG_RATING, 10)
    target:delMod(tpz.mod.ATTP, 200)
    target:delMod(tpz.mod.MATT, 200)
    target:delMod(tpz.mod.HPP, -33)
    target:delMod(tpz.mod.DEFP, -75)
    target:delMod(tpz.mod.UDMGPHYS, 100)
    target:delMod(tpz.mod.UDMGMAGIC, 100)
    target:delMod(tpz.mod.UDMGRANGE, 100)
	target:delMod(tpz.mod.REGEN_DOWN, 50)
end
