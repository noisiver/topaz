-----------------------------------
--
--     tpz.effect.SCARLET_DELIRIUM
--     
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.ATTP, 200)
    target:addMod(tpz.mod.MATT, 200)
    target:addMod(tpz.mod.ACC, -100)
    target:addMod(tpz.mod.REGEN_DOWN, 50)
    target:addMod(tpz.mod.DEFP, -75)
    target:addMod(tpz.mod.UDMGPHYS, 100)
    target:addMod(tpz.mod.UDMGMAGIC, 100)
    target:addMod(tpz.mod.UDMGRANGE, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
end
