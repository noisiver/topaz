-----------------------------------
--
--     tpz.effect.MIGHTY_STRIKES
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
target:addMod(tpz.mod.CRITHITRATE, 100)
target:addMod(tpz.mod.ALL_WSDMG_ALL_HITS , 50)
target:addMod(tpz.mod.MATT , -50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
target:addMod(tpz.mod.CRITHITRATE, -100)
target:addMod(tpz.mod.ALL_WSDMG_ALL_HITS , -50)
target:addMod(tpz.mod.MATT , 50)
end
