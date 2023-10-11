-----------------------------------
--
-- tpz.effect.SPUR
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SPUR_EFFECT) * 3

    target:addMod(tpz.mod.ATTP, effect:getPower())
    target:addMod(tpz.mod.RATTP, effect:getPower())

    target:addPetMod(tpz.mod.ATT, jpValue)
    target:addPetMod(tpz.mod.RATT, jpValue)
    target:addPetMod(tpz.mod.ATTP, effect:getPower())
    target:addPetMod(tpz.mod.RATTP, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SPUR_EFFECT) * 3

    target:delMod(tpz.mod.ATTP, effect:getPower())
    target:delMod(tpz.mod.RATTP, effect:getPower())

    target:delPetMod(tpz.mod.ATT, jpValue)
    target:delPetMod(tpz.mod.RATT, jpValue)
    target:delPetMod(tpz.mod.ATTP, effect:getPower())
    target:delPetMod(tpz.mod.RATTP, effect:getPower())
end

