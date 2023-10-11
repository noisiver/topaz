-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.ENLIGHT_EFFECT)

    target:addMod(tpz.mod.ENSPELL, tpz.magic.element.LIGHT)
    target:addMod(tpz.mod.ENSPELL_DMG, effect:getPower() + jpValue)
    target:addMod(tpz.mod.ACC, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.ENLIGHT_EFFECT)

    target:setMod(tpz.mod.ENSPELL_DMG, 0)
    target:setMod(tpz.mod.ENSPELL, 0)
    target:delMod(tpz.mod.ACC, jpValue)
end
