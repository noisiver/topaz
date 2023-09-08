-----------------------------------
--
-- tpz.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = effect:getPower()
    local subPower = effect:getSubPower()
    local jpLevel = target:getJobPointLevel(tpz.jp.BERSERK_EFFECT)
    local jpEffect = jpLevel * 2

    target:addMod(tpz.mod.ATTP, power)
    target:addMod(tpz.mod.RATTP, power)
    target:addMod(tpz.mod.DEFP, -subPower)

    -- Job Point Bonuses
    target:addMod(tpz.mod.ATT, jpEffect)
    target:addMod(tpz.mod.RATT, jpEffect)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
    local subPower = effect:getSubPower()
    local power = effect:getPower()
    local jpLevel = target:getJobPointLevel(tpz.jp.BERSERK_EFFECT)
    local jpEffect = jpLevel * 2

    target:delMod(tpz.mod.ATTP, power)
    target:delMod(tpz.mod.RATTP, power)
    target:delMod(tpz.mod.DEFP, -subPower)

    -- Job Point Bonuses
    target:delMod(tpz.mod.ATT, jpEffect)
    target:delMod(tpz.mod.RATT, jpEffect)
end
