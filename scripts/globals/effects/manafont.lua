-----------------------------------
--
--     tpz.effect.MANAFONT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MANAFONT_EFFECT) * 3
    target:addMod(tpz.mod.MAGIC_DAMAGE, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MANAFONT_EFFECT) * 3
    target:delMod(tpz.mod.MAGIC_DAMAGE, jpValue)
end
