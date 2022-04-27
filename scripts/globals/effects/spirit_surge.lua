-----------------------------------
--
-- tpz.effect.SPIRIT_SURGE
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    target:addMod(tpz.mod.CRITHITRATE, effect:getPower())
    target:addMod(tpz.mod.CRIT_DMG_INCREASE, effect:getPower())
    target:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CRITHITRATE, effect:getPower())
    target:delMod(tpz.mod.CRIT_DMG_INCREASE, effect:getPower())
    target:delMod(tpz.mod.ALL_WSDMG_ALL_HITS, effect:getPower())
end
