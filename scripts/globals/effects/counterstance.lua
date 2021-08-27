-----------------------------------
-- tpz.effects.COUNTERSTANCE
-- DEF is removed in core as equip swaps can mess this up otherwise!
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = effect:getPower()
    target:addMod(tpz.mod.COUNTER, effect:getPower())
    target:addMod(tpz.mod.ATTP, -power)
    target:addMod(tpz.mod.RATTP, -power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
    target:delMod(tpz.mod.COUNTER, effect:getPower())
    target:delMod(tpz.mod.ATTP, -power)
    target:delMod(tpz.mod.RATTP, -power)
end
