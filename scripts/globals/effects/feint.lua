-----------------------------------
--
-- tpz.effect.FEINT
--
-----------------------------------

function onEffectGain(target, effect)
    if not target:isPC() then
        local power = math.min(effect:getPower(), target:getStat(tpz.mod.EVA))
        effect:setPower(power)
        target:delMod(tpz.mod.EVA, power)
    end
end

-- restores 10 evasion per tick
function onEffectTick(target, effect)
    if not target:isPC() then
        local subpower = effect:getSubPower()
        local power = effect:getPower()
    
        if subpower > power then
            subpower = power
        end
    
        effect:setPower(power - subpower)
        target:addMod(tpz.mod.EVA, subpower)
    end
end



function onEffectLose(target, effect)
    if not target:isPC() then
        local power = effect:getPower()
        target:addMod(tpz.mod.EVA, power)
    end
end
