-----------------------------------
--
--     tpz.effect.MANAWELL
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MANAWELL_EFFECT)
    target:addMod(tpz.mod.REFRESH, 400)
    target:addMod(tpz.mod.MAGIC_DAMAGE, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MANAWELL_EFFECT)
    target:delMod(tpz.mod.REFRESH, 400)
    target:delMod(tpz.mod.MAGIC_DAMAGE, jpValue)
end
