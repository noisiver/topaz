-----------------------------------
--
--    tpz.effect.BRAZEN_RUSH
--
-----------------------------------
function onEffectGain(target, effect)
    local jpLevel = target:getJobPointLevel(tpz.jp.BRAZEN_RUSH_EFFECT)

    target:addMod(tpz.mod.ATT, 4 * jpLevel)
    target:addMod(tpz.mod.DOUBLE_ATTACK, effect:getPower())
end

function onEffectTick(target, effect)
    local prevPower = effect:getPower()
    local nextPower = prevPower - 10

    target:delMod(tpz.mod.DOUBLE_ATTACK, prevPower)
    effect:setPower(nextPower)
    target:addMod(tpz.mod.DOUBLE_ATTACK, nextPower)
end

function onEffectLose(target, effect)
    local jpLevel = target:getJobPointLevel(tpz.jp.BRAZEN_RUSH_EFFECT)

    target:delMod(tpz.mod.ATT, 4 * jpLevel)
    target:delMod(tpz.mod.DOUBLE_ATTACK, effect:getPower())
end
