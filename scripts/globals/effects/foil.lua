-----------------------------------
--
--     tpz.effect.FOIL
--     Grants damage reduction to mob TP moves
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.DMGTP, -effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DMGTP, -effect:getSubPower())
end
