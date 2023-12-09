-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect) --power=30 initially, subpower=20 for enmity
    target:addMod(tpz.mod.NINJA_TOOL, effect:getPower())
    target:addMod(tpz.mod.ENMITY, effect:getPower())
    target:addMod(tpz.mod.ENSPELL_MACC, effect:getPower())

    local yoninMerits = target:getMerit(tpz.merit.YONIN_EFFECT)
    if yoninMerits ~= 0 then
        target:addMod(tpz.mod.HP, yoninMerits)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.NINJA_TOOL, effect:getPower())
    target:delMod(tpz.mod.ENMITY, effect:getPower())
    target:delMod(tpz.mod.ENSPELL_MACC, effect:getPower())

    local yoninMerits = target:getMerit(tpz.merit.YONIN_EFFECT)
    if yoninMerits ~= 0 then
        target:delMod(tpz.mod.HP, yoninMerits)
    end
end
