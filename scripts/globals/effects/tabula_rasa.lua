-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
    local regen = effect:getSubPower()
    local helix = effect:getPower()

    target:addMod(tpz.mod.BLACK_MAGIC_COST, -10)
    target:addMod(tpz.mod.BLACK_MAGIC_CAST, -10)
    target:addMod(tpz.mod.BLACK_MAGIC_RECAST, -10)
    target:addMod(tpz.mod.WHITE_MAGIC_COST, -10)
    target:addMod(tpz.mod.WHITE_MAGIC_CAST, -10)
    target:addMod(tpz.mod.WHITE_MAGIC_RECAST, -10)
    target:addMod(tpz.mod.LIGHT_ARTS_REGEN, regen)
    target:addMod(tpz.mod.REGEN_DURATION, 60)
    target:addMod(tpz.mod.HELIX_EFFECT, helix)
    target:addMod(tpz.mod.HELIX_DURATION, 108)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local regen = effect:getSubPower()
    local helix = effect:getPower()

    target:delMod(tpz.mod.BLACK_MAGIC_COST, -10)
    target:delMod(tpz.mod.BLACK_MAGIC_CAST, -10)
    target:delMod(tpz.mod.BLACK_MAGIC_RECAST, -10)
    target:delMod(tpz.mod.WHITE_MAGIC_COST, -10)
    target:delMod(tpz.mod.WHITE_MAGIC_CAST, -10)
    target:delMod(tpz.mod.WHITE_MAGIC_RECAST, -10)
    target:delMod(tpz.mod.LIGHT_ARTS_REGEN, regen)
    target:delMod(tpz.mod.REGEN_DURATION, 60)
    target:delMod(tpz.mod.HELIX_EFFECT, helix)
    target:delMod(tpz.mod.HELIX_DURATION, 108)
end
